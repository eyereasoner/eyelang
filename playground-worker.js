import { run } from './language.js';

self.onmessage = ({ data }) => {
  const started = performance.now();
  try {
    const answers = run(data.source);
    self.postMessage({
      output: answers.length ? answers.join('\n\n') : 'Add a question ending with ? to ask about your program.',
      elapsed: performance.now() - started,
    });
  } catch (error) {
    self.postMessage({ error: error.message, elapsed: performance.now() - started });
  }
};
