# EyeProlog — latest Neumerkel conformity

Status: **PASS** — **665/665** discovered upstream cases passed.

This tracked report records the latest upstream inventory successfully checked by EyeProlog.
`npm test` fetches the seven TU Wien sources again and verifies that these discovered counts
still match the live suites. Counts are output from upstream, not hard-coded test constants.

| Suite | Passed | Total |
|---|---:|---:|
| syntax | 366 | 366 |
| number_chars/2 | 78 | 78 |
| variable_names/1 | 75 | 75 |
| dif/2 | 26 | 26 |
| length/2 | 37 | 37 |
| phrase/2,3 | 58 | 58 |
| setup_call_cleanup/3 | 25 | 25 |
| **Total** | **665** | **665** |

## Upstream sources

- [syntax](https://www.complang.tuwien.ac.at/ulrich/iso-prolog/conformity_testing)
- [number_chars](https://www.complang.tuwien.ac.at/ulrich/iso-prolog/number_chars_cont_quad.pl)
- [variable_names](https://www.complang.tuwien.ac.at/ulrich/iso-prolog/variable_names_quad.pl)
- [dif](https://www.complang.tuwien.ac.at/ulrich/iso-prolog/dif)
- [length](https://www.complang.tuwien.ac.at/ulrich/iso-prolog/length_quad.pl)
- [phrase](https://www.complang.tuwien.ac.at/ulrich/iso-prolog/phrase_quad.pl)
- [cleanup](https://www.complang.tuwien.ac.at/ulrich/iso-prolog/cleanup)

Exact fetched bytes, SHA-256 hashes, fetch timestamps, and HTTP validators remain under
Git-ignored `.cache/neumerkel/` for local audit/reproduction and are intentionally not committed.
Refresh this tracked report with `npm run conformance:update:neumerkel` and commit it whenever
the live upstream inventory changes.

