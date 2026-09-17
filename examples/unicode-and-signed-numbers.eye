# Source: eyeleng/examples/unicode-and-signed-numbers.srl (b7c7e46f8297).
text(sample, "ABC"). delta(thermo, -12).
unicode_decoded if text(sample, "ABC"). below_zero if delta(thermo, ?d), ?d < 0.
ask unicode_decoded. ask below_zero.
