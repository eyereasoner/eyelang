import { run } from './language.js';

self.onmessage = ({ data }) => {
  const started = performance.now();
  try {
    const answers = run(data.source, { arc: true });
    self.postMessage({
      output: answers.join('\n\n'),
      elapsed: performance.now() - started,
    });
  } catch (error) {
    self.postMessage({ error: error.message, elapsed: performance.now() - started });
  }
};
