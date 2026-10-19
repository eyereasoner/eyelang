import test from 'node:test';
import assert from 'node:assert/strict';
import { readFileSync } from 'node:fs';
import { infer, parse } from '../src/language.js';

const definition = name => readFileSync(new URL(`../examples/${name}.pl`, import.meta.url), 'utf8').split('% Answer and Reason')[0];
const relation = (records, name, arity) => records.filter(record => record.goal.relation === `predicate:${name}/${arity}`).map(record => record.goal.terms);
const number = term => typeof term === 'string' ? Number(term) : term.real;
const solve = (name, extra) => infer(parse(definition(name) + '\n' + extra));
const close = (actual, expected, tolerance = 1.0e-10) => assert.ok(Math.abs(actual - expected) <= tolerance * Math.max(1, Math.abs(expected)), `${actual} != ${expected}`);

test('matrix products match a row-column loop, including integers beyond binary64 precision', () => {
  const matrices = [[1n, 2n, 0n, 1n], [1n, 0n, 3n, 1n], [1n, 0n, 0n, 1n], [0n, 0n, 0n, 0n], [-2n, 3n, 4n, -5n], [9007199254740993n, 1n, -1n, 2n]];
  const input = matrices.map(values => `operand(m(${values.join(',')})).`).join('\n');
  const products = relation(solve('matrix-multiplication', input + '\n?- operand(A), operand(B), multiply(A, B, C).'), 'multiply', 3);
  assert.equal(products.length, matrices.length ** 2);
  for (const [left, right, result] of products) {
    const a = left.args.map(BigInt); const b = right.args.map(BigInt);
    const expected = [0n, 0n, 0n, 0n];
    for (let row = 0; row < 2; row++) for (let col = 0; col < 2; col++) {
      for (let k = 0; k < 2; k++) expected[2 * row + col] += a[2 * row + k] * b[2 * k + col];
    }
    assert.deepEqual(result.args, expected.map(String));
  }
});

test('Hamming decoding corrects every single-bit error for all sixteen payloads', () => {
  const cases = [];
  for (let payload = 0; payload < 16; payload++) {
    const data = [0, 1, 2, 3].map(shift => (payload >> shift) & 1);
    // Encode by XOR-ing the position labels of the set data bits.
    const word = [0, 0, data[0], 0, data[1], data[2], data[3]];
    let parity = 0;
    word.forEach((bit, index) => { if (bit) parity ^= index + 1; });
    for (const position of [1, 2, 4]) word[position - 1] = (parity & position) ? 1 : 0;
    for (let error = 0; error <= 7; error++) {
      const received = [...word];
      if (error) received[error - 1] ^= 1;
      cases.push({ received, word, data, error });
    }
  }
  const queries = cases.map(({ received }) => `?- decode([${received}], Syndrome, Corrected, Data).`).join('\n');
  const decoded = relation(solve('hamming-code', queries), 'decode', 4);
  assert.equal(decoded.length, cases.length);
  for (const [received, syndrome, corrected, data] of decoded) {
    const expected = cases.find(row => row.received.join(',') === received.list.join(','));
    assert.ok(expected);
    assert.equal(Number(syndrome), expected.error);
    assert.deepEqual(corrected.list.map(Number), expected.word);
    assert.deepEqual(data.list.map(Number), expected.data);
  }
});

test('FFT butterflies match a direct DFT, preserve energy, and have conjugate symmetry', () => {
  const inputs = [[0, 1, 2, 3, 4, 5, 6, 7], [1, -1, 1, -1, 1, -1, 1, -1], Array(8).fill(3), [0.25, -2, 7, 0, -3.5, 1, 8, -0.5]];
  for (let index = 0; index < 8; index++) inputs.push(Array.from({ length: 8 }, (_, n) => n === index ? 1 : 0));
  const queries = inputs.map(samples => `?- fft8([${samples}], Bins).`).join('\n');
  const transforms = relation(solve('fft8-numeric', queries), 'fft8', 2);
  assert.equal(transforms.length, inputs.length);
  for (const [samplesTerm, binsTerm] of transforms) {
    const samples = samplesTerm.list.map(number);
    const bins = binsTerm.list.map(bin => bin.args.map(number));
    for (let k = 0; k < 8; k++) {
      const expected = [0, 0];
      for (let n = 0; n < 8; n++) {
        const phase = -2 * Math.PI * k * n / 8;
        expected[0] += samples[n] * Math.cos(phase);
        expected[1] += samples[n] * Math.sin(phase);
      }
      close(bins[k][0], expected[0]); close(bins[k][1], expected[1]);
      close(bins[k][0], bins[(8 - k) % 8][0]); close(bins[k][1], -bins[(8 - k) % 8][1]);
    }
    close(bins.reduce((sum, [r, i]) => sum + r * r + i * i, 0) / 8, samples.reduce((sum, x) => sum + x * x, 0));
  }
});

test('modular powers agree with direct BigInt powers, including negative bases and zero exponents', () => {
  const cases = [];
  for (const base of [-7n, 0n, 2n, 17n, 12345678901234567890n]) {
    for (const exponent of [0n, 1n, 2n, 3n, 30n, 99n, 1000n]) {
      for (const modulus of [1n, 7n, 1009n]) cases.push([base, exponent, modulus]);
    }
  }
  const queries = cases.map(args => `?- pow_mod(${args.join(',')}, Result).`).join('\n');
  const records = relation(solve('modular-exponentiation', queries), 'pow_mod', 4);
  const found = new Set();
  for (const [b, e, m, result] of records) {
    const base = BigInt(b); const exponent = BigInt(e); const modulus = BigInt(m);
    const remainder = base ** exponent % modulus;
    assert.equal(BigInt(result), (remainder + modulus) % modulus);
    found.add([b, e, m].join(','));
  }
  for (const args of cases) assert.ok(found.has(args.join(',')));
  assert.equal(relation(solve('modular-exponentiation', '?- pow_mod(2, -1, 7, X). ?- pow_mod(2, 3, 0, X).'), 'pow_mod', 4).length, 0);
});

test('least squares matches centered covariance and residual-based R squared', () => {
  const datasets = [[[1, 2], [2, 3], [3, 5], [4, 4]], [[-2, 7], [0, 3], [4, -5]], [[0.5, 4], [1.5, 1], [3.5, 2], [5, -1]]];
  const queries = datasets.map(points => `?- regression([${points.map(p => `point(${p})`).join(',')}], Slope, Intercept, R2).`).join('\n');
  const fits = relation(solve('least-squares-regression', queries), 'regression', 4);
  assert.equal(fits.length, datasets.length);
  for (const [pointsTerm, slopeTerm, interceptTerm, r2Term] of fits) {
    const points = pointsTerm.list.map(point => point.args.map(number));
    const meanX = points.reduce((s, [x]) => s + x, 0) / points.length;
    const meanY = points.reduce((s, [, y]) => s + y, 0) / points.length;
    const covariance = points.reduce((s, [x, y]) => s + (x - meanX) * (y - meanY), 0);
    const slope = covariance / points.reduce((s, [x]) => s + (x - meanX) ** 2, 0);
    const intercept = meanY - slope * meanX;
    const residual = points.reduce((s, [x, y]) => s + (y - slope * x - intercept) ** 2, 0);
    const total = points.reduce((s, [, y]) => s + (y - meanY) ** 2, 0);
    close(number(slopeTerm), slope); close(number(interceptTerm), intercept); close(number(r2Term), 1 - residual / total);
  }
  const invalid = '?- regression([], A, B, C). ?- regression([point(1, 2)], A, B, C). ?- regression([point(1, 2), point(1, 3)], A, B, C). ?- regression([point(0, 2), point(1, 2)], A, B, C).';
  const withoutDataset = definition('least-squares-regression').replace(/^dataset\(.*\n/m, '');
  assert.equal(relation(infer(parse(withoutDataset + invalid)), 'regression', 4).length, 0);
});

test('RC cutoff scales inversely with either component and rejects nonpositive components', () => {
  const records = solve('electrical-rc-filter', 'components(double_r, 20000.0, 0.000001). components(double_c, 10000.0, 0.000002). components(zero, 0, 1). components(negative, 1, -1). ?- response(Name, Tau, F).');
  const responses = new Map(relation(records, 'response', 3).map(([id, tau, f]) => [id.atom, [number(tau), number(f)]]));
  assert.equal(responses.size, 3);
  for (const name of ['double_r', 'double_c']) {
    close(responses.get(name)[0], 2 * responses.get('filter1')[0]);
    close(responses.get(name)[1], responses.get('filter1')[1] / 2);
  }
  close(responses.get('filter1')[1], 100 / (2 * Math.PI));
});

test('radioactive activity halves each half-life and conserves the initial activity', () => {
  const input = Array.from({ length: 7 }, (_, n) => `sample(t${n}, 80.0, 8.0, ${n * 8}.0).`).join('\n');
  const records = solve('radioactive-decay', input + '\nsample(half_step, 80.0, 8.0, 4.0). sample(invalid, 80.0, 0, 4). ?- decay(Name, N, Remaining, Decayed).');
  const rows = relation(records, 'decay', 4);
  assert.equal(rows.length, 9);
  for (const [name, count, remaining, decayed] of rows) {
    const n = name.atom === 'demo' ? 2 : name.atom === 'half_step' ? 0.5 : Number(name.atom.slice(1));
    close(number(count), n);
    close(number(remaining), n === 0.5 ? 80 / Math.sqrt(2) : 80 / (2 ** n));
    close(number(remaining) + number(decayed), 80);
  }
});

test('cantilever deflection scales with load, length cubed, and inverse stiffness', () => {
  const input = 'beam(load, 2400.0, 2.5, 200000000000.0, 0.000008, 5.0). beam(length, 1200.0, 5.0, 200000000000.0, 0.000008, 5.0). beam(stiffness, 1200.0, 2.5, 400000000000.0, 0.000008, 5.0).';
  const records = solve('beam-deflection', input + '\n?- deflection_mm(Name, D). ?- within_limit(Name).');
  const values = new Map(relation(records, 'deflection_mm', 2).map(([id, d]) => [id.atom, number(d)]));
  close(values.get('demo'), 3.90625);
  close(values.get('load'), 2 * values.get('demo'));
  close(values.get('length'), 8 * values.get('demo'));
  close(values.get('stiffness'), values.get('demo') / 2);
  assert.deepEqual(relation(records, 'within_limit', 1).map(([id]) => id.atom).sort(), ['demo', 'stiffness']);
});

test('buck ripple obeys inductor volt-seconds and capacitor charge balance', () => {
  const input = 'converter(double_l, 24.0, 5.0, 2.0, 500000.0, 0.000044, 0.000047). converter(double_c, 24.0, 5.0, 2.0, 500000.0, 0.000022, 0.000094). converter(discontinuous, 24.0, 5.0, 0.01, 500000.0, 0.000022, 0.000047).';
  const records = solve('buck-converter-design', input + '\n?- ripple(Name, D, I, Ratio, V).');
  const values = new Map(relation(records, 'ripple', 5).map(([id, ...terms]) => [id.atom, terms.map(number)]));
  assert.equal(values.size, 3, 'The continuous-conduction model excludes the low-load case.');
  const [duty, current, ratio, voltage] = values.get('demo');
  close(duty * 24, 5);
  close(22.0e-6 * current, 5 * (1 - duty) / 500000);
  close(current, ratio * 2);
  close(47.0e-6 * voltage, current / (8 * 500000));
  close(values.get('double_l')[1], current / 2);
  close(values.get('double_c')[3], voltage / 2);
  const strict = definition('buck-converter-design').replace('limits(demo, 0.30, 0.05)', 'limits(demo, 0.10, 0.05)');
  assert.equal(relation(infer(parse(strict + '\n?- within_ripple_limits(Name).')), 'within_ripple_limits', 1).length, 0);
});

test('Hohmann transfer is symmetric under orbit reversal and follows Kepler scaling', () => {
  const input = 'transfer(reverse, 132712440018.0, 227939200.0, 149597870.7). transfer(scaled, 132712440018.0, 598391482.8, 911756800.0). transfer(same, 132712440018.0, 149597870.7, 149597870.7). transfer(invalid, 1, 0, 1).';
  const records = solve('orbital-transfer-design', input + '\n?- hohmann(Name, D1, D2, Days).');
  const values = new Map(relation(records, 'hohmann', 4).map(([id, ...terms]) => [id.atom, terms.map(number)]));
  assert.equal(values.size, 4);
  const [out, arrival, days] = values.get('earth_mars');
  close(values.get('reverse')[0], arrival); close(values.get('reverse')[1], out); close(values.get('reverse')[2], days);
  close(values.get('scaled')[0], out / 2); close(values.get('scaled')[1], arrival / 2); close(values.get('scaled')[2], days * 8);
  close(values.get('same')[0], 0); close(values.get('same')[1], 0);
  // At equal radii the transfer time is half the circular orbital period.
  close(values.get('same')[2], Math.PI * Math.sqrt(149597870.7 ** 3 / 132712440018) / 86400);
});

test('braking gaps use inclusive thresholds and distances follow constant-deceleration kinematics', () => {
  const input = 'scenario(equal, 0, 0.5, 0). scenario(invalid, 10, 0, 50). scenario(double_speed, 27.8, 0.8, 40.0).';
  const records = solve('braking-distance', input + '\n?- gap_status(Name, Status).');
  const rows = relation(records, 'distance', 4);
  assert.equal(rows.length, 6);
  for (const [name, reaction, braking, total] of rows) {
    const r = number(reaction); const b = number(braking); const d = number(total);
    const speed = name.atom === 'equal' ? 0 : ['highway_short_gap', 'double_speed'].includes(name.atom) ? 27.8 : 13.9;
    const mu = name.atom === 'city_wet' ? 0.4 : name.atom === 'city_ice' ? 0.2 : name.atom === 'equal' ? 0.5 : 0.8;
    close(r, speed);
    close(speed ** 2 - 2 * mu * 9.8 * b, 0);
    close(d, r + b);
  }
  const statuses = new Map(relation(records, 'gap_status', 2).map(([id, status]) => [id.atom, status.atom]));
  assert.equal(statuses.size, 6);
  assert.equal(statuses.get('equal'), 'sufficient_in_model');
  assert.equal(statuses.get('double_speed'), 'insufficient_in_model');
});

test('nitrogen budgets conserve mass and classify both ten-percent boundaries inclusively', () => {
  const input = 'field(lower_boundary, 90.0, 0.0, 0.0, 100.0). field(upper_boundary, 110.0, 0.0, 0.0, 100.0). field(all_lost, 20.0, 80.0, 1.0, 100.0). field(invalid, 20.0, 80.0, 1.1, 100.0).';
  const records = solve('field-nitrogen-balance', input + '\n?- status(Field, Status).');
  const budgets = relation(records, 'balance', 7);
  assert.equal(budgets.length, 7);
  const demand = { low_input: 130, balanced_loam: 130, high_input: 160, sandy_high_input: 150, lower_boundary: 100, upper_boundary: 100, all_lost: 100 };
  const expected = new Map();
  for (const [id, ...terms] of budgets) {
    const [total, lost, available, deficit, surplus, index] = terms.map(number);
    close(total, lost + available);
    close(available + deficit - surplus, demand[id.atom]);
    assert.ok(deficit === 0 || surplus === 0);
    close(index, total === 0 ? 0 : surplus * lost / total);
    expected.set(id.atom, available < 0.9 * demand[id.atom] ? 'under' : available > 1.1 * demand[id.atom] ? 'over' : 'balanced');
  }
  const statuses = relation(records, 'status', 2);
  assert.equal(statuses.length, expected.size);
  for (const [id, status] of statuses) assert.equal(status.atom, expected.get(id.atom));
  assert.equal(expected.get('lower_boundary'), 'balanced'); assert.equal(expected.get('upper_boundary'), 'balanced');
});
