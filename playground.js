const byId = id => document.getElementById(id);
const editor = byId('program');
const examples = byId('example-select');
const output = byId('output');
const editorStatus = byId('editor-status');
const runStatus = byId('run-status');
const draftKey = 'eyelang.playground.draft.v1';
const previewLimit = 200000;
const shareLimit = 32000;
let worker = null;
let loading = false;
let loadId = 0;
let loadController = null;
let saveTimer;
let initialSource = '';
let filename = 'socrates.eye';
let currentExample = 'socrates';
let fullOutput = '';

byId('serve-hint').hidden = true;

function status(message, state = '') {
  runStatus.textContent = message;
  runStatus.dataset.state = state;
}

function controls() {
  byId('run').disabled = loading || Boolean(worker) || !('Worker' in window);
  byId('stop').disabled = !worker;
  for (const id of ['reset', 'save-program', 'share']) byId(id).disabled = loading;
  editor.disabled = loading;
}

function showOutput(text, error = false) {
  fullOutput = text;
  output.textContent = text.slice(0, previewLimit);
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
    localStorage.setItem(draftKey, JSON.stringify({ source: editor.value, filename, example: currentExample }));
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

function replaceProgram(source, name, example = '') {
  stopRun();
  editor.value = source;
  initialSource = source;
  filename = name.replace(/[^a-z0-9._-]/gi, '-') || 'program.eye';
  if (!filename.endsWith('.eye')) filename += '.eye';
  byId('source-name').textContent = filename;
  examples.value = example;
  currentExample = example;
  byId('share-panel').hidden = true;
  clearOutput();
  saveDraft(`Loaded ${filename}. Edits are saved on this device.`);
}

function clearShareLocation() {
  if (location.hash.startsWith('#program=')) history.replaceState(null, '', location.pathname + location.search);
}

async function loadProgram(read, name, example = '', autoRun = false) {
  clearShareLocation();
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
    replaceProgram(source, name, example);
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

function loadExample(name, autoRun = false) {
  return loadProgram(signal => fetchProgram(`examples/${name}.eye`, signal), `${name}.eye`, name, autoRun);
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
byId('reset').addEventListener('click', () => replaceProgram(initialSource, filename, currentExample));
byId('save-program').addEventListener('click', () => download(editor.value, filename));
byId('save-output').addEventListener('click', () => download(fullOutput, filename.replace(/\.eye$/, '-output.txt')));
byId('copy-output').addEventListener('click', async () => {
  try { await navigator.clipboard.writeText(fullOutput); status('Complete output copied.'); }
  catch { status("Copy isn't available here. Use Save output instead."); }
});
byId('share').addEventListener('click', async () => {
  try {
    const url = new URL(location.href);
    url.hash = `program=${encodeURIComponent(editor.value)}`;
    if (url.href.length > shareLimit) { editorStatus.textContent = 'This program is too large for a share link. Use Save program instead.'; return; }
    byId('share-url').value = url.href;
    byId('share-panel').hidden = false;
    try { await navigator.clipboard.writeText(url.href); editorStatus.textContent = 'Share link copied. Anyone with the link can read this program.'; }
    catch { editorStatus.textContent = 'Copy the link below to share this program.'; byId('share-url').focus(); byId('share-url').select(); }
  } catch { editorStatus.textContent = "Couldn't make a share link. Use Save program instead."; }
});
byId('open-file').addEventListener('change', event => {
  const file = event.target.files[0];
  if (file) loadProgram(() => file.text(), file.name);
  event.target.value = '';
});
byId('url-form').addEventListener('submit', event => {
  event.preventDefault();
  try {
    const url = new URL(byId('program-url').value);
    if (!['http:', 'https:'].includes(url.protocol)) throw new Error('Use an http or https URL.');
    const name = url.pathname.split('/').at(-1) || 'program.eye';
    loadProgram(signal => fetchProgram(url, signal), name);
  } catch (error) { editorStatus.textContent = error.message; }
});

async function initialize() {
  // A shared program wins over the device draft; neither is run automatically.
  if (location.hash.startsWith('#program=')) {
    try { replaceProgram(decodeURIComponent(location.hash.slice(9)), 'shared.eye'); }
    catch { await loadExample('socrates'); editorStatus.textContent = "Couldn't read the shared link. Loaded Socrates instead."; }
  } else {
    let draft;
    try { draft = JSON.parse(localStorage.getItem(draftKey)); } catch { /* Storage can be unavailable. */ }
    if (draft && typeof draft.source === 'string') {
      const example = [...examples.options].some(option => option.value === draft.example) ? draft.example : '';
      replaceProgram(draft.source, typeof draft.filename === 'string' ? draft.filename : 'program.eye', example);
      editorStatus.textContent = 'Your previous program was restored.';
    } else await loadExample('socrates', true);
  }
  controls();
  if (!('Worker' in window)) status('This browser cannot run programs. Try a newer browser.', 'error');
  document.documentElement.dataset.ready = 'true';
}

initialize();
