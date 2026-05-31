pow([2, 10], 1024).
why(
  pow([2, 10], 1024),
  proof(
    goal(pow([2, 10], 1024)),
    by(rule("fastpow.pl", clause(14))),
    bindings([binding("Value", 1024)]),
    uses([
      proof(
        goal(pow(2, 10, 1024)),
        by(builtin(pow, 3))
      )
    ])
  )
).

powSlow([2, 10], 1024).
why(
  powSlow([2, 10], 1024),
  proof(
    goal(powSlow([2, 10], 1024)),
    by(rule("fastpow.pl", clause(15))),
    bindings([binding("Value", 1024)]),
    uses([
      proof(
        goal(pow(2, 10, 1024)),
        by(builtin(pow, 3))
      )
    ])
  )
).

powMod1e6([2, 10000], 709376).
why(
  powMod1e6([2, 10000], 709376),
  proof(
    goal(powMod1e6([2, 10000], 709376)),
    by(rule("fastpow.pl", clause(16))),
    bindings([binding("Value", 709376)]),
    uses([
      proof(
        goal(pow_mod(2, 10000, 1000000, 709376)),
        by(rule("fastpow.pl", clause(10))),
        bindings([binding("Base", 2), binding("Exp", 10000), binding("Mod", 1000000), binding("Value", 709376), binding("Half", 5000), binding("HalfValue", 909376), binding("Square", 826964709376)]),
        uses([
          proof(
            goal(gt(10000, 0)),
            by(builtin(gt, 2))
          ),
          proof(
            goal(mod(10000, 2, 0)),
            by(builtin(mod, 3))
          ),
          proof(
            goal(div(10000, 2, 5000)),
            by(builtin(div, 3))
          ),
          proof(
            goal(pow_mod(2, 5000, 1000000, 909376)),
            by(rule("fastpow.pl", clause(10))),
            bindings([binding("Base", 2), binding("Exp", 5000), binding("Mod", 1000000), binding("Value", 909376), binding("Half", 2500), binding("HalfValue", 509376), binding("Square", 259463909376)]),
            uses([
              proof(
                goal(gt(5000, 0)),
                by(builtin(gt, 2))
              ),
              proof(
                goal(mod(5000, 2, 0)),
                by(builtin(mod, 3))
              ),
              proof(
                goal(div(5000, 2, 2500)),
                by(builtin(div, 3))
              ),
              proof(
                goal(pow_mod(2, 2500, 1000000, 509376)),
                by(rule("fastpow.pl", clause(10))),
                bindings([binding("Base", 2), binding("Exp", 2500), binding("Mod", 1000000), binding("Value", 509376), binding("Half", 1250), binding("HalfValue", 690624), binding("Square", 476961509376)]),
                uses([
                  proof(
                    goal(gt(2500, 0)),
                    by(builtin(gt, 2))
                  ),
                  proof(
                    goal(mod(2500, 2, 0)),
                    by(builtin(mod, 3))
                  ),
                  proof(
                    goal(div(2500, 2, 1250)),
                    by(builtin(div, 3))
                  ),
                  proof(
                    goal(pow_mod(2, 1250, 1000000, 690624)),
                    by(rule("fastpow.pl", clause(10))),
                    bindings([binding("Base", 2), binding("Exp", 1250), binding("Mod", 1000000), binding("Value", 690624), binding("Half", 625), binding("HalfValue", 386432), binding("Square", 149329690624)]),
                    uses([
                      proof(
                        goal(gt(1250, 0)),
                        by(builtin(gt, 2))
                      ),
                      proof(
                        goal(mod(1250, 2, 0)),
                        by(builtin(mod, 3))
                      ),
                      proof(
                        goal(div(1250, 2, 625)),
                        by(builtin(div, 3))
                      ),
                      proof(
                        goal(pow_mod(2, 625, 1000000, 386432)),
                        by(rule("fastpow.pl", clause(11))),
                        bindings([binding("Base", 2), binding("Exp", 625), binding("Mod", 1000000), binding("Value", 386432), binding("EvenExp", 624), binding("EvenValue", 193216), binding("Product", 386432)]),
                        uses([
                          proof(
                            goal(gt(625, 0)),
                            by(builtin(gt, 2))
                          ),
                          proof(
                            goal(mod(625, 2, 1)),
                            by(builtin(mod, 3))
                          ),
                          proof(
                            goal(sub(625, 1, 624)),
                            by(builtin(sub, 3))
                          ),
                          proof(
                            goal(pow_mod(2, 624, 1000000, 193216)),
                            by(rule("fastpow.pl", clause(10))),
                            bindings([binding("Base", 2), binding("Exp", 624), binding("Mod", 1000000), binding("Value", 193216), binding("Half", 312), binding("HalfValue", 652096), binding("Square", 425229193216)]),
                            uses([
                              proof(
                                goal(gt(624, 0)),
                                by(builtin(gt, 2))
                              ),
                              proof(
                                goal(mod(624, 2, 0)),
                                by(builtin(mod, 3))
                              ),
                              proof(
                                goal(div(624, 2, 312)),
                                by(builtin(div, 3))
                              ),
                              proof(
                                goal(pow_mod(2, 312, 1000000, 652096)),
                                by(rule("fastpow.pl", clause(10))),
                                bindings([binding("Base", 2), binding("Exp", 312), binding("Mod", 1000000), binding("Value", 652096), binding("Half", 156), binding("HalfValue", 783936), binding("Square", 614555652096)]),
                                uses([
                                  proof(
                                    goal(gt(312, 0)),
                                    by(builtin(gt, 2))
                                  ),
                                  proof(
                                    goal(mod(312, 2, 0)),
                                    by(builtin(mod, 3))
                                  ),
                                  proof(
                                    goal(div(312, 2, 156)),
                                    by(builtin(div, 3))
                                  ),
                                  proof(
                                    goal(pow_mod(2, 156, 1000000, 783936)),
                                    by(rule("fastpow.pl", clause(10))),
                                    bindings([binding("Base", 2), binding("Exp", 156), binding("Mod", 1000000), binding("Value", 783936), binding("Half", 78), binding("HalfValue", 676544), binding("Square", 457711783936)]),
                                    uses([
                                      proof(
                                        goal(gt(156, 0)),
                                        by(builtin(gt, 2))
                                      ),
                                      proof(
                                        goal(mod(156, 2, 0)),
                                        by(builtin(mod, 3))
                                      ),
                                      proof(
                                        goal(div(156, 2, 78)),
                                        by(builtin(div, 3))
                                      ),
                                      proof(
                                        goal(pow_mod(2, 78, 1000000, 676544)),
                                        by(rule("fastpow.pl", clause(10))),
                                        bindings([binding("Base", 2), binding("Exp", 78), binding("Mod", 1000000), binding("Value", 676544), binding("Half", 39), binding("HalfValue", 813888), binding("Square", 662413676544)]),
                                        uses([
                                          proof(
                                            goal(gt(78, 0)),
                                            by(builtin(gt, 2))
                                          ),
                                          proof(
                                            goal(mod(78, 2, 0)),
                                            by(builtin(mod, 3))
                                          ),
                                          proof(
                                            goal(div(78, 2, 39)),
                                            by(builtin(div, 3))
                                          ),
                                          proof(
                                            goal(pow_mod(2, 39, 1000000, 813888)),
                                            by(rule("fastpow.pl", clause(11))),
                                            bindings([binding("Base", 2), binding("Exp", 39), binding("Mod", 1000000), binding("Value", 813888), binding("EvenExp", 38), binding("EvenValue", 906944), binding("Product", 1813888)]),
                                            uses([
                                              proof(
                                                goal(gt(39, 0)),
                                                by(builtin(gt, 2))
                                              ),
                                              proof(
                                                goal(mod(39, 2, 1)),
                                                by(builtin(mod, 3))
                                              ),
                                              proof(
                                                goal(sub(39, 1, 38)),
                                                by(builtin(sub, 3))
                                              ),
                                              proof(
                                                goal(pow_mod(2, 38, 1000000, 906944)),
                                                by(rule("fastpow.pl", clause(10))),
                                                bindings([binding("Base", 2), binding("Exp", 38), binding("Mod", 1000000), binding("Value", 906944), binding("Half", 19), binding("HalfValue", 524288), binding("Square", 274877906944)]),
                                                uses([
                                                  proof(
                                                    goal(gt(38, 0)),
                                                    by(builtin(gt, 2))
                                                  ),
                                                  proof(
                                                    goal(mod(38, 2, 0)),
                                                    by(builtin(mod, 3))
                                                  ),
                                                  proof(
                                                    goal(div(38, 2, 19)),
                                                    by(builtin(div, 3))
                                                  ),
                                                  proof(
                                                    goal(pow_mod(2, 19, 1000000, 524288)),
                                                    by(rule("fastpow.pl", clause(11))),
                                                    bindings([binding("Base", 2), binding("Exp", 19), binding("Mod", 1000000), binding("Value", 524288), binding("EvenExp", 18), binding("EvenValue", 262144), binding("Product", 524288)]),
                                                    uses([
                                                      proof(
                                                        goal(gt(19, 0)),
                                                        by(builtin(gt, 2))
                                                      ),
                                                      proof(
                                                        goal(mod(19, 2, 1)),
                                                        by(builtin(mod, 3))
                                                      ),
                                                      proof(
                                                        goal(sub(19, 1, 18)),
                                                        by(builtin(sub, 3))
                                                      ),
                                                      proof(
                                                        goal(pow_mod(2, 18, 1000000, 262144)),
                                                        by(rule("fastpow.pl", clause(10))),
                                                        bindings([binding("Base", 2), binding("Exp", 18), binding("Mod", 1000000), binding("Value", 262144), binding("Half", 9), binding("HalfValue", 512), binding("Square", 262144)]),
                                                        uses([
                                                          proof(
                                                            goal(gt(18, 0)),
                                                            by(builtin(gt, 2))
                                                          ),
                                                          proof(
                                                            goal(mod(18, 2, 0)),
                                                            by(builtin(mod, 3))
                                                          ),
                                                          proof(
                                                            goal(div(18, 2, 9)),
                                                            by(builtin(div, 3))
                                                          ),
                                                          proof(
                                                            goal(pow_mod(2, 9, 1000000, 512)),
                                                            by(rule("fastpow.pl", clause(11))),
                                                            bindings([binding("Base", 2), binding("Exp", 9), binding("Mod", 1000000), binding("Value", 512), binding("EvenExp", 8), binding("EvenValue", 256), binding("Product", 512)]),
                                                            uses([
                                                              proof(
                                                                goal(gt(9, 0)),
                                                                by(builtin(gt, 2))
                                                              ),
                                                              proof(
                                                                goal(mod(9, 2, 1)),
                                                                by(builtin(mod, 3))
                                                              ),
                                                              proof(
                                                                goal(sub(9, 1, 8)),
                                                                by(builtin(sub, 3))
                                                              ),
                                                              proof(
                                                                goal(pow_mod(2, 8, 1000000, 256)),
                                                                by(rule("fastpow.pl", clause(10))),
                                                                bindings([binding("Base", 2), binding("Exp", 8), binding("Mod", 1000000), binding("Value", 256), binding("Half", 4), binding("HalfValue", 16), binding("Square", 256)]),
                                                                uses([
                                                                  proof(
                                                                    goal(gt(8, 0)),
                                                                    by(builtin(gt, 2))
                                                                  ),
                                                                  proof(
                                                                    goal(mod(8, 2, 0)),
                                                                    by(builtin(mod, 3))
                                                                  ),
                                                                  proof(
                                                                    goal(div(8, 2, 4)),
                                                                    by(builtin(div, 3))
                                                                  ),
                                                                  proof(
                                                                    goal(pow_mod(2, 4, 1000000, 16)),
                                                                    by(rule("fastpow.pl", clause(10))),
                                                                    bindings([binding("Base", 2), binding("Exp", 4), binding("Mod", 1000000), binding("Value", 16), binding("Half", 2), binding("HalfValue", 4), binding("Square", 16)]),
                                                                    uses([
                                                                      proof(
                                                                        goal(gt(4, 0)),
                                                                        by(builtin(gt, 2))
                                                                      ),
                                                                      proof(
                                                                        goal(mod(4, 2, 0)),
                                                                        by(builtin(mod, 3))
                                                                      ),
                                                                      proof(
                                                                        goal(div(4, 2, 2)),
                                                                        by(builtin(div, 3))
                                                                      ),
                                                                      proof(
                                                                        goal(pow_mod(2, 2, 1000000, 4)),
                                                                        by(rule("fastpow.pl", clause(10))),
                                                                        bindings([binding("Base", 2), binding("Exp", 2), binding("Mod", 1000000), binding("Value", 4), binding("Half", 1), binding("HalfValue", 2), binding("Square", 4)]),
                                                                        uses([
                                                                          proof(
                                                                            goal(gt(2, 0)),
                                                                            by(builtin(gt, 2))
                                                                          ),
                                                                          proof(
                                                                            goal(mod(2, 2, 0)),
                                                                            by(builtin(mod, 3))
                                                                          ),
                                                                          proof(
                                                                            goal(div(2, 2, 1)),
                                                                            by(builtin(div, 3))
                                                                          ),
                                                                          proof(
                                                                            goal(pow_mod(2, 1, 1000000, 2)),
                                                                            by(rule("fastpow.pl", clause(11))),
                                                                            bindings([binding("Base", 2), binding("Exp", 1), binding("Mod", 1000000), binding("Value", 2), binding("EvenExp", 0), binding("EvenValue", 1), binding("Product", 2)]),
                                                                            uses([
                                                                              proof(
                                                                                goal(gt(1, 0)),
                                                                                by(builtin(gt, 2))
                                                                              ),
                                                                              proof(
                                                                                goal(mod(1, 2, 1)),
                                                                                by(builtin(mod, 3))
                                                                              ),
                                                                              proof(
                                                                                goal(sub(1, 1, 0)),
                                                                                by(builtin(sub, 3))
                                                                              ),
                                                                              proof(
                                                                                goal(pow_mod(2, 0, 1000000, 1)),
                                                                                by(fact("fastpow.pl", clause(9))),
                                                                                bindings([binding("_Base", 2), binding("_Mod", 1000000)])
                                                                              ),
                                                                              proof(
                                                                                goal(mul(2, 1, 2)),
                                                                                by(builtin(mul, 3))
                                                                              ),
                                                                              proof(
                                                                                goal(mod(2, 1000000, 2)),
                                                                                by(builtin(mod, 3))
                                                                              )
                                                                            ])
                                                                          ),
                                                                          proof(
                                                                            goal(mul(2, 2, 4)),
                                                                            by(builtin(mul, 3))
                                                                          ),
                                                                          proof(
                                                                            goal(mod(4, 1000000, 4)),
                                                                            by(builtin(mod, 3))
                                                                          )
                                                                        ])
                                                                      ),
                                                                      proof(
                                                                        goal(mul(4, 4, 16)),
                                                                        by(builtin(mul, 3))
                                                                      ),
                                                                      proof(
                                                                        goal(mod(16, 1000000, 16)),
                                                                        by(builtin(mod, 3))
                                                                      )
                                                                    ])
                                                                  ),
                                                                  proof(
                                                                    goal(mul(16, 16, 256)),
                                                                    by(builtin(mul, 3))
                                                                  ),
                                                                  proof(
                                                                    goal(mod(256, 1000000, 256)),
                                                                    by(builtin(mod, 3))
                                                                  )
                                                                ])
                                                              ),
                                                              proof(
                                                                goal(mul(2, 256, 512)),
                                                                by(builtin(mul, 3))
                                                              ),
                                                              proof(
                                                                goal(mod(512, 1000000, 512)),
                                                                by(builtin(mod, 3))
                                                              )
                                                            ])
                                                          ),
                                                          proof(
                                                            goal(mul(512, 512, 262144)),
                                                            by(builtin(mul, 3))
                                                          ),
                                                          proof(
                                                            goal(mod(262144, 1000000, 262144)),
                                                            by(builtin(mod, 3))
                                                          )
                                                        ])
                                                      ),
                                                      proof(
                                                        goal(mul(2, 262144, 524288)),
                                                        by(builtin(mul, 3))
                                                      ),
                                                      proof(
                                                        goal(mod(524288, 1000000, 524288)),
                                                        by(builtin(mod, 3))
                                                      )
                                                    ])
                                                  ),
                                                  proof(
                                                    goal(mul(524288, 524288, 274877906944)),
                                                    by(builtin(mul, 3))
                                                  ),
                                                  proof(
                                                    goal(mod(274877906944, 1000000, 906944)),
                                                    by(builtin(mod, 3))
                                                  )
                                                ])
                                              ),
                                              proof(
                                                goal(mul(2, 906944, 1813888)),
                                                by(builtin(mul, 3))
                                              ),
                                              proof(
                                                goal(mod(1813888, 1000000, 813888)),
                                                by(builtin(mod, 3))
                                              )
                                            ])
                                          ),
                                          proof(
                                            goal(mul(813888, 813888, 662413676544)),
                                            by(builtin(mul, 3))
                                          ),
                                          proof(
                                            goal(mod(662413676544, 1000000, 676544)),
                                            by(builtin(mod, 3))
                                          )
                                        ])
                                      ),
                                      proof(
                                        goal(mul(676544, 676544, 457711783936)),
                                        by(builtin(mul, 3))
                                      ),
                                      proof(
                                        goal(mod(457711783936, 1000000, 783936)),
                                        by(builtin(mod, 3))
                                      )
                                    ])
                                  ),
                                  proof(
                                    goal(mul(783936, 783936, 614555652096)),
                                    by(builtin(mul, 3))
                                  ),
                                  proof(
                                    goal(mod(614555652096, 1000000, 652096)),
                                    by(builtin(mod, 3))
                                  )
                                ])
                              ),
                              proof(
                                goal(mul(652096, 652096, 425229193216)),
                                by(builtin(mul, 3))
                              ),
                              proof(
                                goal(mod(425229193216, 1000000, 193216)),
                                by(builtin(mod, 3))
                              )
                            ])
                          ),
                          proof(
                            goal(mul(2, 193216, 386432)),
                            by(builtin(mul, 3))
                          ),
                          proof(
                            goal(mod(386432, 1000000, 386432)),
                            by(builtin(mod, 3))
                          )
                        ])
                      ),
                      proof(
                        goal(mul(386432, 386432, 149329690624)),
                        by(builtin(mul, 3))
                      ),
                      proof(
                        goal(mod(149329690624, 1000000, 690624)),
                        by(builtin(mod, 3))
                      )
                    ])
                  ),
                  proof(
                    goal(mul(690624, 690624, 476961509376)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(mod(476961509376, 1000000, 509376)),
                    by(builtin(mod, 3))
                  )
                ])
              ),
              proof(
                goal(mul(509376, 509376, 259463909376)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(mod(259463909376, 1000000, 909376)),
                by(builtin(mod, 3))
              )
            ])
          ),
          proof(
            goal(mul(909376, 909376, 826964709376)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(mod(826964709376, 1000000, 709376)),
            by(builtin(mod, 3))
          )
        ])
      )
    ])
  )
).

powMod1e6([3, 10000], 200001).
why(
  powMod1e6([3, 10000], 200001),
  proof(
    goal(powMod1e6([3, 10000], 200001)),
    by(rule("fastpow.pl", clause(17))),
    bindings([binding("Value", 200001)]),
    uses([
      proof(
        goal(pow_mod(3, 10000, 1000000, 200001)),
        by(rule("fastpow.pl", clause(10))),
        bindings([binding("Base", 3), binding("Exp", 10000), binding("Mod", 1000000), binding("Value", 200001), binding("Half", 5000), binding("HalfValue", 100001), binding("Square", 10000200001)]),
        uses([
          proof(
            goal(gt(10000, 0)),
            by(builtin(gt, 2))
          ),
          proof(
            goal(mod(10000, 2, 0)),
            by(builtin(mod, 3))
          ),
          proof(
            goal(div(10000, 2, 5000)),
            by(builtin(div, 3))
          ),
          proof(
            goal(pow_mod(3, 5000, 1000000, 100001)),
            by(rule("fastpow.pl", clause(10))),
            bindings([binding("Base", 3), binding("Exp", 5000), binding("Mod", 1000000), binding("Value", 100001), binding("Half", 2500), binding("HalfValue", 50001), binding("Square", 2500100001)]),
            uses([
              proof(
                goal(gt(5000, 0)),
                by(builtin(gt, 2))
              ),
              proof(
                goal(mod(5000, 2, 0)),
                by(builtin(mod, 3))
              ),
              proof(
                goal(div(5000, 2, 2500)),
                by(builtin(div, 3))
              ),
              proof(
                goal(pow_mod(3, 2500, 1000000, 50001)),
                by(rule("fastpow.pl", clause(10))),
                bindings([binding("Base", 3), binding("Exp", 2500), binding("Mod", 1000000), binding("Value", 50001), binding("Half", 1250), binding("HalfValue", 506249), binding("Square", 256288050001)]),
                uses([
                  proof(
                    goal(gt(2500, 0)),
                    by(builtin(gt, 2))
                  ),
                  proof(
                    goal(mod(2500, 2, 0)),
                    by(builtin(mod, 3))
                  ),
                  proof(
                    goal(div(2500, 2, 1250)),
                    by(builtin(div, 3))
                  ),
                  proof(
                    goal(pow_mod(3, 1250, 1000000, 506249)),
                    by(rule("fastpow.pl", clause(10))),
                    bindings([binding("Base", 3), binding("Exp", 1250), binding("Mod", 1000000), binding("Value", 506249), binding("Half", 625), binding("HalfValue", 85443), binding("Square", 7300506249)]),
                    uses([
                      proof(
                        goal(gt(1250, 0)),
                        by(builtin(gt, 2))
                      ),
                      proof(
                        goal(mod(1250, 2, 0)),
                        by(builtin(mod, 3))
                      ),
                      proof(
                        goal(div(1250, 2, 625)),
                        by(builtin(div, 3))
                      ),
                      proof(
                        goal(pow_mod(3, 625, 1000000, 85443)),
                        by(rule("fastpow.pl", clause(11))),
                        bindings([binding("Base", 3), binding("Exp", 625), binding("Mod", 1000000), binding("Value", 85443), binding("EvenExp", 624), binding("EvenValue", 28481), binding("Product", 85443)]),
                        uses([
                          proof(
                            goal(gt(625, 0)),
                            by(builtin(gt, 2))
                          ),
                          proof(
                            goal(mod(625, 2, 1)),
                            by(builtin(mod, 3))
                          ),
                          proof(
                            goal(sub(625, 1, 624)),
                            by(builtin(sub, 3))
                          ),
                          proof(
                            goal(pow_mod(3, 624, 1000000, 28481)),
                            by(rule("fastpow.pl", clause(10))),
                            bindings([binding("Base", 3), binding("Exp", 624), binding("Mod", 1000000), binding("Value", 28481), binding("Half", 312), binding("HalfValue", 137441), binding("Square", 18890028481)]),
                            uses([
                              proof(
                                goal(gt(624, 0)),
                                by(builtin(gt, 2))
                              ),
                              proof(
                                goal(mod(624, 2, 0)),
                                by(builtin(mod, 3))
                              ),
                              proof(
                                goal(div(624, 2, 312)),
                                by(builtin(div, 3))
                              ),
                              proof(
                                goal(pow_mod(3, 312, 1000000, 137441)),
                                by(rule("fastpow.pl", clause(10))),
                                bindings([binding("Base", 3), binding("Exp", 312), binding("Mod", 1000000), binding("Value", 137441), binding("Half", 156), binding("HalfValue", 473521), binding("Square", 224222137441)]),
                                uses([
                                  proof(
                                    goal(gt(312, 0)),
                                    by(builtin(gt, 2))
                                  ),
                                  proof(
                                    goal(mod(312, 2, 0)),
                                    by(builtin(mod, 3))
                                  ),
                                  proof(
                                    goal(div(312, 2, 156)),
                                    by(builtin(div, 3))
                                  ),
                                  proof(
                                    goal(pow_mod(3, 156, 1000000, 473521)),
                                    by(rule("fastpow.pl", clause(10))),
                                    bindings([binding("Base", 3), binding("Exp", 156), binding("Mod", 1000000), binding("Value", 473521), binding("Half", 78), binding("HalfValue", 255289), binding("Square", 65172473521)]),
                                    uses([
                                      proof(
                                        goal(gt(156, 0)),
                                        by(builtin(gt, 2))
                                      ),
                                      proof(
                                        goal(mod(156, 2, 0)),
                                        by(builtin(mod, 3))
                                      ),
                                      proof(
                                        goal(div(156, 2, 78)),
                                        by(builtin(div, 3))
                                      ),
                                      proof(
                                        goal(pow_mod(3, 78, 1000000, 255289)),
                                        by(rule("fastpow.pl", clause(10))),
                                        bindings([binding("Base", 3), binding("Exp", 78), binding("Mod", 1000000), binding("Value", 255289), binding("Half", 39), binding("HalfValue", 976267), binding("Square", 953097255289)]),
                                        uses([
                                          proof(
                                            goal(gt(78, 0)),
                                            by(builtin(gt, 2))
                                          ),
                                          proof(
                                            goal(mod(78, 2, 0)),
                                            by(builtin(mod, 3))
                                          ),
                                          proof(
                                            goal(div(78, 2, 39)),
                                            by(builtin(div, 3))
                                          ),
                                          proof(
                                            goal(pow_mod(3, 39, 1000000, 976267)),
                                            by(rule("fastpow.pl", clause(11))),
                                            bindings([binding("Base", 3), binding("Exp", 39), binding("Mod", 1000000), binding("Value", 976267), binding("EvenExp", 38), binding("EvenValue", 992089), binding("Product", 2976267)]),
                                            uses([
                                              proof(
                                                goal(gt(39, 0)),
                                                by(builtin(gt, 2))
                                              ),
                                              proof(
                                                goal(mod(39, 2, 1)),
                                                by(builtin(mod, 3))
                                              ),
                                              proof(
                                                goal(sub(39, 1, 38)),
                                                by(builtin(sub, 3))
                                              ),
                                              proof(
                                                goal(pow_mod(3, 38, 1000000, 992089)),
                                                by(rule("fastpow.pl", clause(10))),
                                                bindings([binding("Base", 3), binding("Exp", 38), binding("Mod", 1000000), binding("Value", 992089), binding("Half", 19), binding("HalfValue", 261467), binding("Square", 68364992089)]),
                                                uses([
                                                  proof(
                                                    goal(gt(38, 0)),
                                                    by(builtin(gt, 2))
                                                  ),
                                                  proof(
                                                    goal(mod(38, 2, 0)),
                                                    by(builtin(mod, 3))
                                                  ),
                                                  proof(
                                                    goal(div(38, 2, 19)),
                                                    by(builtin(div, 3))
                                                  ),
                                                  proof(
                                                    goal(pow_mod(3, 19, 1000000, 261467)),
                                                    by(rule("fastpow.pl", clause(11))),
                                                    bindings([binding("Base", 3), binding("Exp", 19), binding("Mod", 1000000), binding("Value", 261467), binding("EvenExp", 18), binding("EvenValue", 420489), binding("Product", 1261467)]),
                                                    uses([
                                                      proof(
                                                        goal(gt(19, 0)),
                                                        by(builtin(gt, 2))
                                                      ),
                                                      proof(
                                                        goal(mod(19, 2, 1)),
                                                        by(builtin(mod, 3))
                                                      ),
                                                      proof(
                                                        goal(sub(19, 1, 18)),
                                                        by(builtin(sub, 3))
                                                      ),
                                                      proof(
                                                        goal(pow_mod(3, 18, 1000000, 420489)),
                                                        by(rule("fastpow.pl", clause(10))),
                                                        bindings([binding("Base", 3), binding("Exp", 18), binding("Mod", 1000000), binding("Value", 420489), binding("Half", 9), binding("HalfValue", 19683), binding("Square", 387420489)]),
                                                        uses([
                                                          proof(
                                                            goal(gt(18, 0)),
                                                            by(builtin(gt, 2))
                                                          ),
                                                          proof(
                                                            goal(mod(18, 2, 0)),
                                                            by(builtin(mod, 3))
                                                          ),
                                                          proof(
                                                            goal(div(18, 2, 9)),
                                                            by(builtin(div, 3))
                                                          ),
                                                          proof(
                                                            goal(pow_mod(3, 9, 1000000, 19683)),
                                                            by(rule("fastpow.pl", clause(11))),
                                                            bindings([binding("Base", 3), binding("Exp", 9), binding("Mod", 1000000), binding("Value", 19683), binding("EvenExp", 8), binding("EvenValue", 6561), binding("Product", 19683)]),
                                                            uses([
                                                              proof(
                                                                goal(gt(9, 0)),
                                                                by(builtin(gt, 2))
                                                              ),
                                                              proof(
                                                                goal(mod(9, 2, 1)),
                                                                by(builtin(mod, 3))
                                                              ),
                                                              proof(
                                                                goal(sub(9, 1, 8)),
                                                                by(builtin(sub, 3))
                                                              ),
                                                              proof(
                                                                goal(pow_mod(3, 8, 1000000, 6561)),
                                                                by(rule("fastpow.pl", clause(10))),
                                                                bindings([binding("Base", 3), binding("Exp", 8), binding("Mod", 1000000), binding("Value", 6561), binding("Half", 4), binding("HalfValue", 81), binding("Square", 6561)]),
                                                                uses([
                                                                  proof(
                                                                    goal(gt(8, 0)),
                                                                    by(builtin(gt, 2))
                                                                  ),
                                                                  proof(
                                                                    goal(mod(8, 2, 0)),
                                                                    by(builtin(mod, 3))
                                                                  ),
                                                                  proof(
                                                                    goal(div(8, 2, 4)),
                                                                    by(builtin(div, 3))
                                                                  ),
                                                                  proof(
                                                                    goal(pow_mod(3, 4, 1000000, 81)),
                                                                    by(rule("fastpow.pl", clause(10))),
                                                                    bindings([binding("Base", 3), binding("Exp", 4), binding("Mod", 1000000), binding("Value", 81), binding("Half", 2), binding("HalfValue", 9), binding("Square", 81)]),
                                                                    uses([
                                                                      proof(
                                                                        goal(gt(4, 0)),
                                                                        by(builtin(gt, 2))
                                                                      ),
                                                                      proof(
                                                                        goal(mod(4, 2, 0)),
                                                                        by(builtin(mod, 3))
                                                                      ),
                                                                      proof(
                                                                        goal(div(4, 2, 2)),
                                                                        by(builtin(div, 3))
                                                                      ),
                                                                      proof(
                                                                        goal(pow_mod(3, 2, 1000000, 9)),
                                                                        by(rule("fastpow.pl", clause(10))),
                                                                        bindings([binding("Base", 3), binding("Exp", 2), binding("Mod", 1000000), binding("Value", 9), binding("Half", 1), binding("HalfValue", 3), binding("Square", 9)]),
                                                                        uses([
                                                                          proof(
                                                                            goal(gt(2, 0)),
                                                                            by(builtin(gt, 2))
                                                                          ),
                                                                          proof(
                                                                            goal(mod(2, 2, 0)),
                                                                            by(builtin(mod, 3))
                                                                          ),
                                                                          proof(
                                                                            goal(div(2, 2, 1)),
                                                                            by(builtin(div, 3))
                                                                          ),
                                                                          proof(
                                                                            goal(pow_mod(3, 1, 1000000, 3)),
                                                                            by(rule("fastpow.pl", clause(11))),
                                                                            bindings([binding("Base", 3), binding("Exp", 1), binding("Mod", 1000000), binding("Value", 3), binding("EvenExp", 0), binding("EvenValue", 1), binding("Product", 3)]),
                                                                            uses([
                                                                              proof(
                                                                                goal(gt(1, 0)),
                                                                                by(builtin(gt, 2))
                                                                              ),
                                                                              proof(
                                                                                goal(mod(1, 2, 1)),
                                                                                by(builtin(mod, 3))
                                                                              ),
                                                                              proof(
                                                                                goal(sub(1, 1, 0)),
                                                                                by(builtin(sub, 3))
                                                                              ),
                                                                              proof(
                                                                                goal(pow_mod(3, 0, 1000000, 1)),
                                                                                by(fact("fastpow.pl", clause(9))),
                                                                                bindings([binding("_Base", 3), binding("_Mod", 1000000)])
                                                                              ),
                                                                              proof(
                                                                                goal(mul(3, 1, 3)),
                                                                                by(builtin(mul, 3))
                                                                              ),
                                                                              proof(
                                                                                goal(mod(3, 1000000, 3)),
                                                                                by(builtin(mod, 3))
                                                                              )
                                                                            ])
                                                                          ),
                                                                          proof(
                                                                            goal(mul(3, 3, 9)),
                                                                            by(builtin(mul, 3))
                                                                          ),
                                                                          proof(
                                                                            goal(mod(9, 1000000, 9)),
                                                                            by(builtin(mod, 3))
                                                                          )
                                                                        ])
                                                                      ),
                                                                      proof(
                                                                        goal(mul(9, 9, 81)),
                                                                        by(builtin(mul, 3))
                                                                      ),
                                                                      proof(
                                                                        goal(mod(81, 1000000, 81)),
                                                                        by(builtin(mod, 3))
                                                                      )
                                                                    ])
                                                                  ),
                                                                  proof(
                                                                    goal(mul(81, 81, 6561)),
                                                                    by(builtin(mul, 3))
                                                                  ),
                                                                  proof(
                                                                    goal(mod(6561, 1000000, 6561)),
                                                                    by(builtin(mod, 3))
                                                                  )
                                                                ])
                                                              ),
                                                              proof(
                                                                goal(mul(3, 6561, 19683)),
                                                                by(builtin(mul, 3))
                                                              ),
                                                              proof(
                                                                goal(mod(19683, 1000000, 19683)),
                                                                by(builtin(mod, 3))
                                                              )
                                                            ])
                                                          ),
                                                          proof(
                                                            goal(mul(19683, 19683, 387420489)),
                                                            by(builtin(mul, 3))
                                                          ),
                                                          proof(
                                                            goal(mod(387420489, 1000000, 420489)),
                                                            by(builtin(mod, 3))
                                                          )
                                                        ])
                                                      ),
                                                      proof(
                                                        goal(mul(3, 420489, 1261467)),
                                                        by(builtin(mul, 3))
                                                      ),
                                                      proof(
                                                        goal(mod(1261467, 1000000, 261467)),
                                                        by(builtin(mod, 3))
                                                      )
                                                    ])
                                                  ),
                                                  proof(
                                                    goal(mul(261467, 261467, 68364992089)),
                                                    by(builtin(mul, 3))
                                                  ),
                                                  proof(
                                                    goal(mod(68364992089, 1000000, 992089)),
                                                    by(builtin(mod, 3))
                                                  )
                                                ])
                                              ),
                                              proof(
                                                goal(mul(3, 992089, 2976267)),
                                                by(builtin(mul, 3))
                                              ),
                                              proof(
                                                goal(mod(2976267, 1000000, 976267)),
                                                by(builtin(mod, 3))
                                              )
                                            ])
                                          ),
                                          proof(
                                            goal(mul(976267, 976267, 953097255289)),
                                            by(builtin(mul, 3))
                                          ),
                                          proof(
                                            goal(mod(953097255289, 1000000, 255289)),
                                            by(builtin(mod, 3))
                                          )
                                        ])
                                      ),
                                      proof(
                                        goal(mul(255289, 255289, 65172473521)),
                                        by(builtin(mul, 3))
                                      ),
                                      proof(
                                        goal(mod(65172473521, 1000000, 473521)),
                                        by(builtin(mod, 3))
                                      )
                                    ])
                                  ),
                                  proof(
                                    goal(mul(473521, 473521, 224222137441)),
                                    by(builtin(mul, 3))
                                  ),
                                  proof(
                                    goal(mod(224222137441, 1000000, 137441)),
                                    by(builtin(mod, 3))
                                  )
                                ])
                              ),
                              proof(
                                goal(mul(137441, 137441, 18890028481)),
                                by(builtin(mul, 3))
                              ),
                              proof(
                                goal(mod(18890028481, 1000000, 28481)),
                                by(builtin(mod, 3))
                              )
                            ])
                          ),
                          proof(
                            goal(mul(3, 28481, 85443)),
                            by(builtin(mul, 3))
                          ),
                          proof(
                            goal(mod(85443, 1000000, 85443)),
                            by(builtin(mod, 3))
                          )
                        ])
                      ),
                      proof(
                        goal(mul(85443, 85443, 7300506249)),
                        by(builtin(mul, 3))
                      ),
                      proof(
                        goal(mod(7300506249, 1000000, 506249)),
                        by(builtin(mod, 3))
                      )
                    ])
                  ),
                  proof(
                    goal(mul(506249, 506249, 256288050001)),
                    by(builtin(mul, 3))
                  ),
                  proof(
                    goal(mod(256288050001, 1000000, 50001)),
                    by(builtin(mod, 3))
                  )
                ])
              ),
              proof(
                goal(mul(50001, 50001, 2500100001)),
                by(builtin(mul, 3))
              ),
              proof(
                goal(mod(2500100001, 1000000, 100001)),
                by(builtin(mod, 3))
              )
            ])
          ),
          proof(
            goal(mul(100001, 100001, 10000200001)),
            by(builtin(mul, 3))
          ),
          proof(
            goal(mod(10000200001, 1000000, 200001)),
            by(builtin(mod, 3))
          )
        ])
      )
    ])
  )
).

tower([2, 4], 65536).
why(
  tower([2, 4], 65536),
  proof(
    goal(tower([2, 4], 65536)),
    by(rule("fastpow.pl", clause(18))),
    bindings([binding("Value", 65536)]),
    uses([
      proof(
        goal(tower(2, 4, 65536)),
        by(fact("fastpow.pl", clause(12)))
      )
    ])
  )
).

towerMod1e6([2, 5], 156736).
why(
  towerMod1e6([2, 5], 156736),
  proof(
    goal(towerMod1e6([2, 5], 156736)),
    by(rule("fastpow.pl", clause(19))),
    bindings([binding("Value", 156736)]),
    uses([
      proof(
        goal(tower_mod(2, 5, 1000000, 156736)),
        by(fact("fastpow.pl", clause(13)))
      )
    ])
  )
).

