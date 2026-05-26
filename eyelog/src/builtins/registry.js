import { arithmeticBuiltins } from './arithmetic.js';
import { coreBuiltins } from './core.js';
import { stringBuiltins } from './strings.js';
import { listBuiltins } from './lists.js';
import { aggregationBuiltins } from './aggregation.js';
import { formulaBuiltins } from './formula.js';
import { controlBuiltins } from './control.js';
import { sudokuBuiltins } from './sudoku.js';

export class BuiltinRegistry {
  constructor() {
    this.defs = new Map();
  }
  add(name, arity, handler, options = {}) {
    this.defs.set(`${name}/${arity}`, {
      name,
      arity,
      handler,
      deterministic: options.deterministic ?? false,
    });
    return this;
  }
  get(name, arity) {
    return this.defs.get(`${name}/${arity}`) ?? null;
  }
}

export function createDefaultRegistry() {
  const registry = new BuiltinRegistry();
  for (const mod of [coreBuiltins, arithmeticBuiltins, stringBuiltins, listBuiltins, aggregationBuiltins, formulaBuiltins, controlBuiltins, sudokuBuiltins]) {
    mod.register(registry);
  }
  return registry;
}
