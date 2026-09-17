# Source: eyeleng/examples/builtin-call-complete.srl (b7c7e46f8297).
numbers([-3.7, 7, 2]).
summary(?absolute, ?root, ?count, ?sorted) if numbers(?values), let ?absolute = abs(-3.7), let ?root = sqrt(9), let ?count = count(?values), sort(?values, ?sorted).
ask summary(?absolute, ?root, ?count, ?sorted).
