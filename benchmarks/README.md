# Performance measurements

Run `npm run benchmark` with Node.js 18 or later. Each workload runs three
times in fresh child processes. The report separates parsing, inference with
assertion validation, and complete ARC rendering. It does not write goldens.

```sh
npm run benchmark
npm run benchmark -- --case path-discovery --runs 5
npm run benchmark -- --case mixed --size 1000 --runs 3
npm run benchmark -- --case mixed --size 5000 --runs 3 --json
```

The application workloads are the bundled service-log correlation,
record-quality audit, critical-path schedule, weighted interval schedule, and
path-discovery examples. Path discovery retains the full graph of 7,698
airports and 37,274 flights. Source files and their assertions run unchanged.

The generated `mixed` workload combines text decoding, tabled decimal parsing,
term decomposition and construction, numeric tests, a join, completed negation,
and aggregation. `--size` controls its number of input rows; it does not resize
the bundled examples. Built-in assertions check the resulting count and sum
against totals calculated independently while generating the input.

Times are median wall-clock milliseconds over the requested runs. Reading
or generating the source and child-process startup occur before the timed
phases. Rendering includes joining the complete ARC transcript; printing,
copying, and saving that transcript are not measured. Each child uses the same
completed inference records for rendering, without rerunning inference.

Memory is the operating system's cumulative resident-set high-water mark,
reported in MiB. `Infer peak MiB` is sampled after inference, and
`Full peak MiB` after rendering; the report takes the maximum across runs.
These figures include the Node.js runtime, source, parsed program, inference
tables, and retained evidence. The second includes rendered output as well.
They are process measurements, not separate allocations for individual phases.
The full peak may equal the inference peak if rendering does not exceed the
previous high-water mark.

Use the same Node.js version and machine to compare changes. Garbage collection,
CPU contention, and operating-system caches affect results. Fresh processes
isolate retained heaps but do not provide an empty filesystem cache. These
measurements describe the supplied finite inputs; they do not establish
complexity or performance guarantees for arbitrary programs. No timing or
memory threshold is part of `npm test`.
