import { highlight } from './playground-highlight.js';

const byId = id => document.getElementById(id);
const editor = byId('program');
const editorColors = byId('program-colors');
const examples = byId('example-select');
const output = byId('output');
const editorStatus = byId('editor-status');
const runStatus = byId('run-status');
const draftKey = 'eyeon.playground.draft.v2';
const previewLimit = 200000;
const shareLimit = 1900;
let worker = null;
let loading = false;
let loadId = 0;
let loadController = null;
let saveTimer;
let initialSource = '';
let filename = 'socrates.pl';
let currentExample = 'socrates';
let fullOutput = '';
let sourceReference = null;
let sharing = false;
let coloringScheduled = false;

byId('serve-hint').hidden = true;
byId('program-highlight').hidden = false;
editor.classList.toggle('syntax-colored', true);

function colorProgram() {
  const source = editor.value;
  const lineHeight = parseFloat(window.getComputedStyle(editor).lineHeight);
  const firstLine = Math.max(0, Math.floor(editor.scrollTop / lineHeight) - 3);
  let start = 0;
  let line = 0;
  while (line < firstLine) {
    const next = source.indexOf('\n', start);
    if (next < 0) break;
    start = next + 1;
    line++;
  }
  let end = start;
  const count = Math.ceil(editor.clientHeight / lineHeight) + 7;
  for (let row = 0; row < count; row++) {
    const next = source.indexOf('\n', end);
    if (next < 0) { end = source.length; break; }
    end = next + 1;
  }
  editorColors.innerHTML = highlight(source, { start, end }) + (source[end - 1] === '\n' ? ' ' : '');
  editorColors.style.transform = `translate(${-editor.scrollLeft}px, ${line * lineHeight - editor.scrollTop}px)`;
}

function scheduleColoring() {
  if (coloringScheduled) return;
  coloringScheduled = true;
  window.requestAnimationFrame(() => { coloringScheduled = false; colorProgram(); });
}

editor.addEventListener('scroll', scheduleColoring);
window.addEventListener('resize', scheduleColoring);
if ('ResizeObserver' in window) new window.ResizeObserver(scheduleColoring).observe(editor);

function status(message, state = '') {
  runStatus.textContent = message;
  runStatus.dataset.state = state;
}

function controls() {
  byId('run').disabled = loading || Boolean(worker) || !('Worker' in window);
  byId('stop').disabled = !worker;
  for (const id of ['reset', 'save-program', 'share']) byId(id).disabled = loading;
  for (const id of ['share', 'create-gist', 'gist-link']) byId(id).disabled = loading || sharing;
  editor.disabled = loading;
}

function showOutput(text, error = false) {
  fullOutput = text;
  const preview = text.slice(0, previewLimit);
  if (error) output.textContent = preview;
  else output.innerHTML = highlight(preview, { arc: true });
  output.classList.toggle('error', error);
  byId('output-size').textContent = `${text.length.toLocaleString()} characters`;
  const note = byId('preview-note');
  note.hidden = text.length <= previewLimit;
  note.textContent = `Showing the first ${previewLimit.toLocaleString()} characters. Copy or save output for the complete result.`;
  byId('copy-output').disabled = !text;
  byId('save-output').disabled = !text;
}

function clearOutput() {
  fullOutput = '';
  output.textContent = 'Your answers will appear here.';
  output.classList.remove('error');
  byId('output-size').textContent = '';
  byId('preview-note').hidden = true;
  byId('copy-output').disabled = true;
  byId('save-output').disabled = true;
  status('Ready when you are.');
}

function saveDraft(message = 'Edits saved on this device.') {
  clearTimeout(saveTimer);
  try {
    const reference = sourceReference?.source === editor.value ? { ...sourceReference, source: undefined } : null;
    localStorage.setItem(draftKey, JSON.stringify({ source: editor.value, filename, example: currentExample, reference }));
    editorStatus.textContent = message;
  } catch {
    editorStatus.textContent = 'Automatic saving is unavailable. Use Save program to keep your edits.';
  }
}

function stopRun(message = 'Stopped. You can edit your program and run again.') {
  if (!worker) return;
  worker.terminate();
  worker = null;
  output.removeAttribute('aria-busy');
  if (!fullOutput) output.textContent = 'Run stopped.';
  controls();
  status(message);
}

function replaceProgram(source, name, example = '', reference = null) {
  stopRun();
  editor.value = source;
  colorProgram();
  initialSource = source;
  filename = name.replace(/[^a-z0-9._-]/gi, '-') || 'program.pl';
  if (!filename.endsWith('.pl')) filename += '.pl';
  byId('source-name').textContent = filename;
  examples.value = example;
  currentExample = example;
  sourceReference = reference ? { ...reference, source } : null;
  byId('share-panel').hidden = true;
  byId('gist-panel').hidden = true;
  clearOutput();
  saveDraft(`Loaded ${filename}. Edits are saved on this device.`);
}

function clearShareLocation() {
  const params = new URLSearchParams(location.hash.slice(1));
  if (['program', 'example', 'url', 'gist'].some(key => params.has(key))) {
    history.replaceState(null, '', location.pathname + location.search);
  }
}

async function loadProgram(read, name, { example = '', autoRun = false, reference = null, keepShareLocation = false } = {}) {
  if (!keepShareLocation) clearShareLocation();
  clearTimeout(saveTimer);
  loadController?.abort();
  loadController = new AbortController();
  const id = ++loadId;
  stopRun();
  loading = true;
  controls();
  editorStatus.textContent = `Loading ${name}…`;
  let loaded = false;
  try {
    const source = await read(loadController.signal);
    if (id !== loadId) return;
    replaceProgram(source, name, example, reference);
    loaded = true;
  } catch (error) {
    if (id === loadId && error.name !== 'AbortError') {
      examples.value = currentExample;
      editorStatus.textContent = `Couldn't load the program: ${error.message}`;
    }
  } finally {
    if (id === loadId) { loading = false; controls(); }
  }
  if (loaded && autoRun) runProgram();
}

async function fetchProgram(url, signal) {
  const response = await fetch(url, { signal });
  if (!response.ok) throw new Error(`HTTP ${response.status}. Check the URL and try again.`);
  return response.text();
}

function loadExample(name, autoRun = false, keepShareLocation = false) {
  if (![...examples.options].some(option => option.value === name && name)) throw new Error('Choose an example from the list.');
  return loadProgram(signal => fetchProgram(`examples/${name}.pl`, signal), `${name}.pl`, {
    example: name, autoRun, keepShareLocation, reference: { kind: 'example', name },
  });
}

function programUrl(value) {
  const url = new URL(value);
  if (!['http:', 'https:'].includes(url.protocol)) throw new Error('Use an http or https URL.');
  return url;
}

function gistId(value) {
  let id = value.trim();
  if (!/^[a-f\d]{5,64}$/i.test(id)) {
    const url = new URL(id);
    if (url.protocol !== 'https:' || url.hostname !== 'gist.github.com') throw new Error('Use a GitHub Gist URL or ID.');
    id = url.pathname.split('/').filter(Boolean).at(-1);
  }
  if (!/^[a-f\d]{5,64}$/i.test(id)) throw new Error('Use a GitHub Gist URL or ID.');
  return id;
}

async function fetchGist(id, signal) {
  const response = await fetch(`https://api.github.com/gists/${id}`, { signal });
  if (!response.ok) throw new Error(`HTTP ${response.status}. Check the Gist and try again.`);
  const gist = await response.json();
  const files = gist.files || {};
  const file = files['program.pl'] || Object.values(files).find(file => file.filename?.endsWith('.pl'));
  if (!file) throw new Error('This Gist needs a .pl program file.');
  if (file.truncated) {
    const raw = programUrl(file.raw_url);
    if (raw.protocol !== 'https:' || raw.hostname !== 'gist.githubusercontent.com') throw new Error('The Gist has an invalid program URL.');
    return fetchProgram(raw.href, signal);
  }
  if (typeof file.content !== 'string') throw new Error('The Gist program is missing.');
  return file.content;
}

function shareUrl(key, value) {
  const url = new URL(location.href);
  url.search = '';
  url.hash = `${key}=${encodeURIComponent(value)}`;
  return url.href;
}

function buildShareLink() {
  if (sourceReference?.source === editor.value) {
    const { kind, name, url, id } = sourceReference;
    const link = kind === 'example' ? shareUrl('example', name)
      : kind === 'url' ? shareUrl('url', url)
      : kind === 'gist' ? shareUrl('gist', id) : null;
    if (link && link.length <= shareLimit) return link;
  }
  const link = shareUrl('program', editor.value);
  return link.length <= shareLimit ? link : null;
}

async function showShareLink(link, message = 'Share link copied. Anyone with the link can read this program.') {
  byId('share-url').value = link;
  byId('share-panel').hidden = false;
  try { await navigator.clipboard.writeText(link); editorStatus.textContent = message; }
  catch { editorStatus.textContent = 'Copy the link below to share this program.'; byId('share-url').focus(); byId('share-url').select(); }
}

async function createGistShare(reason = '') {
  const source = editor.value;
  const token = window.prompt(`${reason ? `${reason}\n\n` : ''}Optional GitHub token with permission to create gists. It is sent only to api.github.com and is never saved. Leave blank to copy your program and open GitHub Gist. Anyone with the link can read the program.`);
  if (token === null) { editorStatus.textContent = 'Gist share cancelled.'; return; }
  if (!token.trim()) {
    byId('gist-panel').hidden = false;
    byId('gist-url').value = '';
    window.open('https://gist.github.com/', '_blank', 'noopener');
    try { await navigator.clipboard.writeText(source); editorStatus.textContent = 'Program copied. Paste it into a Gist named program.pl, then paste the Gist URL below.'; }
    catch { editorStatus.textContent = 'Copy your program into a Gist named program.pl, then paste the Gist URL below.'; }
    return;
  }
  sharing = true;
  controls();
  editorStatus.textContent = 'Creating GitHub Gist…';
  try {
    const response = await fetch('https://api.github.com/gists', {
      method: 'POST',
      headers: { Accept: 'application/vnd.github+json', Authorization: `Bearer ${token.trim()}`, 'Content-Type': 'application/json' },
      body: JSON.stringify({ description: 'eyeon playground share', public: false, files: { 'program.pl': { content: source } } }),
    });
    if (!response.ok) throw new Error(`GitHub returned HTTP ${response.status}. Check the token's Gist permission and try again.`);
    const id = gistId((await response.json()).id || '');
    if (editor.value === source) {
      sourceReference = { kind: 'gist', id, source };
      saveDraft();
    }
    await showShareLink(shareUrl('gist', id), 'Gist share link copied. Anyone with the link can read the program.');
  } catch (error) { editorStatus.textContent = `Couldn't create the Gist: ${error.message} You can also leave the token blank to use GitHub's website.`; }
  finally { sharing = false; controls(); }
}

function highlightError(message) {
  const match = /^Line (\d+):/.exec(message);
  if (!match) return;
  const lines = editor.value.split('\n');
  const line = Number(match[1]) - 1;
  const start = lines.slice(0, line).reduce((sum, text) => sum + text.length + 1, 0);
  editor.focus();
  editor.setSelectionRange(start, start + (lines[line]?.length ?? 0));
}

function runProgram() {
  if (loading || worker) return;
  if (!editor.value.trim()) { status('Write a program first. Try choosing an example.'); editor.focus(); return; }
  saveDraft();
  clearOutput();
  status('Thinking… You can stop this run at any time.');
  output.textContent = 'Working out the answers…';
  output.setAttribute('aria-busy', 'true');
  try {
    const active = new Worker(new URL('./playground-worker.js', import.meta.url), { type: 'module' });
    worker = active;
    controls();
    const finish = () => {
      active.terminate();
      worker = null;
      output.removeAttribute('aria-busy');
      controls();
    };
    active.onmessage = ({ data }) => {
      if (worker !== active) return;
      finish();
      if (data.error) {
        showOutput(data.error, true);
        status('The program needs a change. See the error above.', 'error');
        highlightError(data.error);
      } else {
        showOutput(data.output);
        status(`Finished in ${(data.elapsed / 1000).toFixed(2)} seconds.`, 'success');
      }
    };
    active.onerror = event => {
      if (worker !== active) return;
      event.preventDefault();
      finish();
      showOutput(event.message || "Couldn't run this program. Reload the page and try again.", true);
      status('The run could not finish.', 'error');
    };
    active.postMessage({ source: editor.value });
  } catch (error) {
    stopRun();
    output.removeAttribute('aria-busy');
    showOutput(error.message, true);
    status('The run could not start.', 'error');
  }
}

function download(text, name) {
  const url = URL.createObjectURL(new Blob([text], { type: 'text/plain;charset=utf-8' }));
  const link = document.createElement('a');
  link.href = url;
  link.download = name;
  document.body.append(link);
  link.click();
  link.remove();
  setTimeout(() => URL.revokeObjectURL(url), 1000);
}

byId('run').addEventListener('click', runProgram);
byId('stop').addEventListener('click', () => stopRun());
editor.addEventListener('keydown', event => {
  if ((event.ctrlKey || event.metaKey) && event.key === 'Enter') { event.preventDefault(); runProgram(); }
});
editor.addEventListener('input', () => {
  scheduleColoring();
  clearShareLocation();
  stopRun();
  status('Program changed. Run it to update the output.');
  byId('share-panel').hidden = true;
  editorStatus.textContent = 'Saving edits…';
  clearTimeout(saveTimer);
  saveTimer = setTimeout(() => saveDraft(), 300);
});
window.addEventListener('pagehide', () => { saveDraft(); stopRun(); });
examples.addEventListener('change', () => {
  if (examples.value) loadExample(examples.value);
  else {
    loadController?.abort();
    loadId++;
    loading = false;
    currentExample = '';
    controls();
    saveDraft();
  }
});
byId('reset').addEventListener('click', () => replaceProgram(initialSource, filename, currentExample,
  sourceReference?.source === initialSource ? sourceReference : null));
byId('save-program').addEventListener('click', () => download(editor.value, filename));
byId('save-output').addEventListener('click', () => download(fullOutput, filename.replace(/\.pl$/, '-output.txt')));
byId('copy-output').addEventListener('click', async () => {
  try { await navigator.clipboard.writeText(fullOutput); status('Complete output copied.'); }
  catch { status("Copy isn't available here. Use Save output instead."); }
});
byId('share').addEventListener('click', async () => {
  try {
    const link = buildShareLink();
    if (link) await showShareLink(link);
    else await createGistShare('This program is too large for a short inline link. Share it with a Gist instead.');
  } catch { editorStatus.textContent = "Couldn't make a share link. Use Save program instead."; }
});
byId('create-gist').addEventListener('click', () => createGistShare());
byId('gist-form').addEventListener('submit', async event => {
  event.preventDefault();
  try { await showShareLink(shareUrl('gist', gistId(byId('gist-url').value))); }
  catch { editorStatus.textContent = 'Use a GitHub Gist URL or ID.'; }
});
byId('open-file').addEventListener('change', event => {
  const file = event.target.files[0];
  if (file) loadProgram(() => file.text(), file.name);
  event.target.value = '';
});
byId('url-form').addEventListener('submit', event => {
  event.preventDefault();
  try {
    const url = programUrl(byId('program-url').value);
    const name = url.pathname.split('/').at(-1) || 'program.pl';
    loadProgram(signal => fetchProgram(url.href, signal), name, { reference: { kind: 'url', url: url.href } });
  } catch (error) { editorStatus.textContent = error.message; }
});

async function initialize() {
  const params = new URLSearchParams(location.hash.slice(1));
  if (['program', 'example', 'url', 'gist'].some(key => params.has(key))) {
    try {
      if (location.hash.startsWith('#program=')) replaceProgram(decodeURIComponent(location.hash.slice(9)), 'shared.pl');
      else if (params.has('example')) await loadExample(params.get('example'), false, true);
      else if (params.has('gist')) {
        const id = gistId(params.get('gist'));
        await loadProgram(signal => fetchGist(id, signal), 'gist.pl', { reference: { kind: 'gist', id }, keepShareLocation: true });
      } else {
        const url = programUrl(params.get('url'));
        await loadProgram(signal => fetchProgram(url.href, signal), url.pathname.split('/').at(-1) || 'program.pl', {
          reference: { kind: 'url', url: url.href }, keepShareLocation: true,
        });
      }
    } catch { await loadExample('socrates'); editorStatus.textContent = "Couldn't read the shared link. Loaded Socrates instead."; }
  } else {
    let draft;
    try { draft = JSON.parse(localStorage.getItem(draftKey)); } catch {}
    if (draft && typeof draft.source === 'string') {
      const example = [...examples.options].some(option => option.value === draft.example) ? draft.example : '';
      let reference = null;
      try {
        if (draft.reference?.kind === 'example' && draft.reference.name === example && example) reference = { kind: 'example', name: example };
        else if (draft.reference?.kind === 'url') reference = { kind: 'url', url: programUrl(draft.reference.url).href };
        else if (draft.reference?.kind === 'gist') reference = { kind: 'gist', id: gistId(draft.reference.id) };
      } catch { /* An invalid draft reference can still have usable program text. */ }
      replaceProgram(draft.source, typeof draft.filename === 'string' ? draft.filename : 'program.pl', example, reference);
      editorStatus.textContent = 'Your previous program was restored.';
    } else await loadExample('socrates', true);
  }
  controls();
  if (!('Worker' in window)) status('This browser cannot run programs. Try a newer browser.', 'error');
  document.documentElement.dataset.ready = 'true';
}

initialize();
