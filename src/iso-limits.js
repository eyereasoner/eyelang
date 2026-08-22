// ISO/IEC 13211-1 implementation-defined processor limits.
// Keep these values in one place so Prolog flags and all predicates that
// expose representation limits cannot drift apart.

// A finite arity limit keeps the Part 1 max_arity flag truthful. 65,535 is
// comfortably representable by the JavaScript term model while giving source
// parsing and term construction one stable ISO-visible boundary.
export const ISO_MAX_ARITY = 65535;
