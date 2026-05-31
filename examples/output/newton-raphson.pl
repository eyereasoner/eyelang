findRoot([1, 1.0, 1.0e-15], 1.4142135623730951).
why(
  findRoot([1, 1.0, 1.0e-15], 1.4142135623730951),
  proof(
    goal(findRoot([1, 1.0, 1.0e-15], 1.4142135623730951)), by(rule("newton-raphson.pl", clause(5))),
    bindings([binding("Input", [1, 1.0, 1.0e-15]), binding("Root", 1.4142135623730951)]),
    uses([
      proof(goal(want_root([1, 1.0, 1.0e-15])), by(fact("newton-raphson.pl", clause(2)))),
      proof(
        goal(find_root([1, 1.0, 1.0e-15], 1.4142135623730951)), by(rule("newton-raphson.pl", clause(13))),
        bindings([binding("N", 1), binding("X", 1.0), binding("Tolerance", 1.0e-15), binding("Root", 1.4142135623730951), binding("FX", -1.0), binding("AFX", 1.0), binding("FDX", 2.0), binding("Step", -0.5), binding("NewX", 1.5)]),
        uses([
          proof(
            goal(f(1, 1.0, -1.0)), by(rule("newton-raphson.pl", clause(6))),
            bindings([binding("X", 1.0), binding("Y", -1.0), binding("XX", 1.0)]),
            uses([
              proof(goal(mul(1.0, 1.0, 1.0)), by(builtin(mul, 3))),
              proof(goal(sub(1.0, 2, -1.0)), by(builtin(sub, 3)))
            ])
          ),
          proof(goal(abs(-1.0, 1.0)), by(builtin(abs, 2))),
          proof(goal(ge(1.0, 1.0e-15)), by(builtin(ge, 2))),
          proof(
            goal(fd(1, 1.0, 2.0)), by(rule("newton-raphson.pl", clause(9))),
            bindings([binding("X", 1.0), binding("Y", 2.0)]),
            uses([
              proof(goal(mul(2, 1.0, 2.0)), by(builtin(mul, 3)))
            ])
          ),
          proof(goal(div(-1.0, 2.0, -0.5)), by(builtin(div, 3))),
          proof(goal(sub(1.0, -0.5, 1.5)), by(builtin(sub, 3))),
          proof(
            goal(find_root([1, 1.5, 1.0e-15], 1.4142135623730951)), by(rule("newton-raphson.pl", clause(13))),
            bindings([binding("N", 1), binding("X", 1.5), binding("Tolerance", 1.0e-15), binding("Root", 1.4142135623730951), binding("FX", 0.25), binding("AFX", 0.25), binding("FDX", 3.0), binding("Step", 0.083333333333333329), binding("NewX", 1.4166666666666667)]),
            uses([
              proof(
                goal(f(1, 1.5, 0.25)), by(rule("newton-raphson.pl", clause(6))),
                bindings([binding("X", 1.5), binding("Y", 0.25), binding("XX", 2.25)]),
                uses([
                  proof(goal(mul(1.5, 1.5, 2.25)), by(builtin(mul, 3))),
                  proof(goal(sub(2.25, 2, 0.25)), by(builtin(sub, 3)))
                ])
              ),
              proof(goal(abs(0.25, 0.25)), by(builtin(abs, 2))),
              proof(goal(ge(0.25, 1.0e-15)), by(builtin(ge, 2))),
              proof(
                goal(fd(1, 1.5, 3.0)), by(rule("newton-raphson.pl", clause(9))),
                bindings([binding("X", 1.5), binding("Y", 3.0)]),
                uses([
                  proof(goal(mul(2, 1.5, 3.0)), by(builtin(mul, 3)))
                ])
              ),
              proof(goal(div(0.25, 3.0, 0.083333333333333329)), by(builtin(div, 3))),
              proof(goal(sub(1.5, 0.083333333333333329, 1.4166666666666667)), by(builtin(sub, 3))),
              proof(
                goal(find_root([1, 1.4166666666666667, 1.0e-15], 1.4142135623730951)), by(rule("newton-raphson.pl", clause(13))),
                bindings([binding("N", 1), binding("X", 1.4166666666666667), binding("Tolerance", 1.0e-15), binding("Root", 1.4142135623730951), binding("FX", 0.0069444444444446418), binding("AFX", 0.0069444444444446418), binding("FDX", 2.8333333333333335), binding("Step", 0.0024509803921569321), binding("NewX", 1.4142156862745099)]),
                uses([
                  proof(
                    goal(f(1, 1.4166666666666667, 0.0069444444444446418)), by(rule("newton-raphson.pl", clause(6))),
                    bindings([binding("X", 1.4166666666666667), binding("Y", 0.0069444444444446418), binding("XX", 2.0069444444444446)]),
                    uses([
                      proof(goal(mul(1.4166666666666667, 1.4166666666666667, 2.0069444444444446)), by(builtin(mul, 3))),
                      proof(goal(sub(2.0069444444444446, 2, 0.0069444444444446418)), by(builtin(sub, 3)))
                    ])
                  ),
                  proof(goal(abs(0.0069444444444446418, 0.0069444444444446418)), by(builtin(abs, 2))),
                  proof(goal(ge(0.0069444444444446418, 1.0e-15)), by(builtin(ge, 2))),
                  proof(
                    goal(fd(1, 1.4166666666666667, 2.8333333333333335)), by(rule("newton-raphson.pl", clause(9))),
                    bindings([binding("X", 1.4166666666666667), binding("Y", 2.8333333333333335)]),
                    uses([
                      proof(goal(mul(2, 1.4166666666666667, 2.8333333333333335)), by(builtin(mul, 3)))
                    ])
                  ),
                  proof(goal(div(0.0069444444444446418, 2.8333333333333335, 0.0024509803921569321)), by(builtin(div, 3))),
                  proof(goal(sub(1.4166666666666667, 0.0024509803921569321, 1.4142156862745099)), by(builtin(sub, 3))),
                  proof(
                    goal(find_root([1, 1.4142156862745099, 1.0e-15], 1.4142135623730951)), by(rule("newton-raphson.pl", clause(13))),
                    bindings([binding("N", 1), binding("X", 1.4142156862745099), binding("Tolerance", 1.0e-15), binding("Root", 1.4142135623730951), binding("FX", 0.0000060073048828712672), binding("AFX", 0.0000060073048828712672), binding("FDX", 2.8284313725490198), binding("Step", 0.0000021238998199406212), binding("NewX", 1.4142135623746899)]),
                    uses([
                      proof(
                        goal(f(1, 1.4142156862745099, 0.0000060073048828712672)), by(rule("newton-raphson.pl", clause(6))),
                        bindings([binding("X", 1.4142156862745099), binding("Y", 0.0000060073048828712672), binding("XX", 2.0000060073048829)]),
                        uses([
                          proof(goal(mul(1.4142156862745099, 1.4142156862745099, 2.0000060073048829)), by(builtin(mul, 3))),
                          proof(goal(sub(2.0000060073048829, 2, 0.0000060073048828712672)), by(builtin(sub, 3)))
                        ])
                      ),
                      proof(goal(abs(0.0000060073048828712672, 0.0000060073048828712672)), by(builtin(abs, 2))),
                      proof(goal(ge(0.0000060073048828712672, 1.0e-15)), by(builtin(ge, 2))),
                      proof(
                        goal(fd(1, 1.4142156862745099, 2.8284313725490198)), by(rule("newton-raphson.pl", clause(9))),
                        bindings([binding("X", 1.4142156862745099), binding("Y", 2.8284313725490198)]),
                        uses([
                          proof(goal(mul(2, 1.4142156862745099, 2.8284313725490198)), by(builtin(mul, 3)))
                        ])
                      ),
                      proof(goal(div(0.0000060073048828712672, 2.8284313725490198, 0.0000021238998199406212)), by(builtin(div, 3))),
                      proof(goal(sub(1.4142156862745099, 0.0000021238998199406212, 1.4142135623746899)), by(builtin(sub, 3))),
                      proof(
                        goal(find_root([1, 1.4142135623746899, 1.0e-15], 1.4142135623730951)), by(rule("newton-raphson.pl", clause(13))),
                        bindings([binding("N", 1), binding("X", 1.4142135623746899), binding("Tolerance", 1.0e-15), binding("Root", 1.4142135623730951), binding("FX", 4.510614104447086e-12), binding("AFX", 4.510614104447086e-12), binding("FDX", 2.8284271247493797), binding("Step", 1.5947429102833119e-12), binding("NewX", 1.4142135623730951)]),
                        uses([
                          proof(
                            goal(f(1, 1.4142135623746899, 4.510614104447086e-12)), by(rule("newton-raphson.pl", clause(6))),
                            bindings([binding("X", 1.4142135623746899), binding("Y", 4.510614104447086e-12), binding("XX", 2.0000000000045106)]),
                            uses([
                              proof(goal(mul(1.4142135623746899, 1.4142135623746899, 2.0000000000045106)), by(builtin(mul, 3))),
                              proof(goal(sub(2.0000000000045106, 2, 4.510614104447086e-12)), by(builtin(sub, 3)))
                            ])
                          ),
                          proof(goal(abs(4.510614104447086e-12, 4.510614104447086e-12)), by(builtin(abs, 2))),
                          proof(goal(ge(4.510614104447086e-12, 1.0e-15)), by(builtin(ge, 2))),
                          proof(
                            goal(fd(1, 1.4142135623746899, 2.8284271247493797)), by(rule("newton-raphson.pl", clause(9))),
                            bindings([binding("X", 1.4142135623746899), binding("Y", 2.8284271247493797)]),
                            uses([
                              proof(goal(mul(2, 1.4142135623746899, 2.8284271247493797)), by(builtin(mul, 3)))
                            ])
                          ),
                          proof(goal(div(4.510614104447086e-12, 2.8284271247493797, 1.5947429102833119e-12)), by(builtin(div, 3))),
                          proof(goal(sub(1.4142135623746899, 1.5947429102833119e-12, 1.4142135623730951)), by(builtin(sub, 3))),
                          proof(
                            goal(find_root([1, 1.4142135623730951, 1.0e-15], 1.4142135623730951)), by(rule("newton-raphson.pl", clause(12))),
                            bindings([binding("N", 1), binding("X", 1.4142135623730951), binding("Tolerance", 1.0e-15), binding("FX", 4.4408920985006262e-16), binding("AFX", 4.4408920985006262e-16)]),
                            uses([
                              proof(
                                goal(f(1, 1.4142135623730951, 4.4408920985006262e-16)), by(rule("newton-raphson.pl", clause(6))),
                                bindings([binding("X", 1.4142135623730951), binding("Y", 4.4408920985006262e-16), binding("XX", 2.0000000000000004)]),
                                uses([
                                  proof(goal(mul(1.4142135623730951, 1.4142135623730951, 2.0000000000000004)), by(builtin(mul, 3))),
                                  proof(goal(sub(2.0000000000000004, 2, 4.4408920985006262e-16)), by(builtin(sub, 3)))
                                ])
                              ),
                              proof(goal(abs(4.4408920985006262e-16, 4.4408920985006262e-16)), by(builtin(abs, 2))),
                              proof(goal(lt(4.4408920985006262e-16, 1.0e-15)), by(builtin(lt, 2)))
                            ])
                          )
                        ])
                      )
                    ])
                  )
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

findRoot([2, 2.0, 1.0e-15], 2.7182818284590455).
why(
  findRoot([2, 2.0, 1.0e-15], 2.7182818284590455),
  proof(
    goal(findRoot([2, 2.0, 1.0e-15], 2.7182818284590455)), by(rule("newton-raphson.pl", clause(5))),
    bindings([binding("Input", [2, 2.0, 1.0e-15]), binding("Root", 2.7182818284590455)]),
    uses([
      proof(goal(want_root([2, 2.0, 1.0e-15])), by(fact("newton-raphson.pl", clause(3)))),
      proof(
        goal(find_root([2, 2.0, 1.0e-15], 2.7182818284590455)), by(rule("newton-raphson.pl", clause(13))),
        bindings([binding("N", 2), binding("X", 2.0), binding("Tolerance", 1.0e-15), binding("Root", 2.7182818284590455), binding("FX", -0.30685281944005471), binding("AFX", 0.30685281944005471), binding("FDX", 0.5), binding("Step", -0.61370563888010943), binding("NewX", 2.6137056388801092)]),
        uses([
          proof(
            goal(f(2, 2.0, -0.30685281944005471)), by(rule("newton-raphson.pl", clause(7))),
            bindings([binding("X", 2.0), binding("Y", -0.30685281944005471), binding("LX", 0.69314718055994529)]),
            uses([
              proof(goal(log(2.0, 0.69314718055994529)), by(builtin(log, 2))),
              proof(goal(sub(0.69314718055994529, 1, -0.30685281944005471)), by(builtin(sub, 3)))
            ])
          ),
          proof(goal(abs(-0.30685281944005471, 0.30685281944005471)), by(builtin(abs, 2))),
          proof(goal(ge(0.30685281944005471, 1.0e-15)), by(builtin(ge, 2))),
          proof(
            goal(fd(2, 2.0, 0.5)), by(rule("newton-raphson.pl", clause(10))),
            bindings([binding("X", 2.0), binding("Y", 0.5)]),
            uses([
              proof(goal(div(1, 2.0, 0.5)), by(builtin(div, 3)))
            ])
          ),
          proof(goal(div(-0.30685281944005471, 0.5, -0.61370563888010943)), by(builtin(div, 3))),
          proof(goal(sub(2.0, -0.61370563888010943, 2.6137056388801092)), by(builtin(sub, 3))),
          proof(
            goal(find_root([2, 2.6137056388801092, 1.0e-15], 2.7182818284590455)), by(rule("newton-raphson.pl", clause(13))),
            bindings([binding("N", 2), binding("X", 2.6137056388801092), binding("Tolerance", 1.0e-15), binding("Root", 2.7182818284590455), binding("FX", -0.039231000595620125), binding("AFX", 0.039231000595620125), binding("FDX", 0.38259855475862559), binding("Step", -0.10253828747568125), binding("NewX", 2.7162439263557903)]),
            uses([
              proof(
                goal(f(2, 2.6137056388801092, -0.039231000595620125)), by(rule("newton-raphson.pl", clause(7))),
                bindings([binding("X", 2.6137056388801092), binding("Y", -0.039231000595620125), binding("LX", 0.96076899940437988)]),
                uses([
                  proof(goal(log(2.6137056388801092, 0.96076899940437988)), by(builtin(log, 2))),
                  proof(goal(sub(0.96076899940437988, 1, -0.039231000595620125)), by(builtin(sub, 3)))
                ])
              ),
              proof(goal(abs(-0.039231000595620125, 0.039231000595620125)), by(builtin(abs, 2))),
              proof(goal(ge(0.039231000595620125, 1.0e-15)), by(builtin(ge, 2))),
              proof(
                goal(fd(2, 2.6137056388801092, 0.38259855475862559)), by(rule("newton-raphson.pl", clause(10))),
                bindings([binding("X", 2.6137056388801092), binding("Y", 0.38259855475862559)]),
                uses([
                  proof(goal(div(1, 2.6137056388801092, 0.38259855475862559)), by(builtin(div, 3)))
                ])
              ),
              proof(goal(div(-0.039231000595620125, 0.38259855475862559, -0.10253828747568125)), by(builtin(div, 3))),
              proof(goal(sub(2.6137056388801092, -0.10253828747568125, 2.7162439263557903)), by(builtin(sub, 3))),
              proof(
                goal(find_root([2, 2.7162439263557903, 1.0e-15], 2.7182818284590455)), by(rule("newton-raphson.pl", clause(13))),
                bindings([binding("N", 2), binding("X", 2.7162439263557903), binding("Tolerance", 1.0e-15), binding("Root", 2.7182818284590455), binding("FX", -0.00074998345420362877), binding("AFX", 0.00074998345420362877), binding("FDX", 0.36815544815286), binding("Step", -0.0020371380023479426), binding("NewX", 2.7182810643581381)]),
                uses([
                  proof(
                    goal(f(2, 2.7162439263557903, -0.00074998345420362877)), by(rule("newton-raphson.pl", clause(7))),
                    bindings([binding("X", 2.7162439263557903), binding("Y", -0.00074998345420362877), binding("LX", 0.99925001654579637)]),
                    uses([
                      proof(goal(log(2.7162439263557903, 0.99925001654579637)), by(builtin(log, 2))),
                      proof(goal(sub(0.99925001654579637, 1, -0.00074998345420362877)), by(builtin(sub, 3)))
                    ])
                  ),
                  proof(goal(abs(-0.00074998345420362877, 0.00074998345420362877)), by(builtin(abs, 2))),
                  proof(goal(ge(0.00074998345420362877, 1.0e-15)), by(builtin(ge, 2))),
                  proof(
                    goal(fd(2, 2.7162439263557903, 0.36815544815286)), by(rule("newton-raphson.pl", clause(10))),
                    bindings([binding("X", 2.7162439263557903), binding("Y", 0.36815544815286)]),
                    uses([
                      proof(goal(div(1, 2.7162439263557903, 0.36815544815286)), by(builtin(div, 3)))
                    ])
                  ),
                  proof(goal(div(-0.00074998345420362877, 0.36815544815286, -0.0020371380023479426)), by(builtin(div, 3))),
                  proof(goal(sub(2.7162439263557903, -0.0020371380023479426, 2.7182810643581381)), by(builtin(sub, 3))),
                  proof(
                    goal(find_root([2, 2.7182810643581381, 1.0e-15], 2.7182818284590455)), by(rule("newton-raphson.pl", clause(13))),
                    bindings([binding("N", 2), binding("X", 2.7182810643581381), binding("Tolerance", 1.0e-15), binding("Root", 2.7182818284590455), binding("FX", -2.8109705418888353e-7), binding("AFX", 2.8109705418888353e-7), binding("FDX", 0.36787954458128408), binding("Step", -7.6410079964849558e-7), binding("NewX", 2.7182818284589376)]),
                    uses([
                      proof(
                        goal(f(2, 2.7182810643581381, -2.8109705418888353e-7)), by(rule("newton-raphson.pl", clause(7))),
                        bindings([binding("X", 2.7182810643581381), binding("Y", -2.8109705418888353e-7), binding("LX", 0.99999971890294581)]),
                        uses([
                          proof(goal(log(2.7182810643581381, 0.99999971890294581)), by(builtin(log, 2))),
                          proof(goal(sub(0.99999971890294581, 1, -2.8109705418888353e-7)), by(builtin(sub, 3)))
                        ])
                      ),
                      proof(goal(abs(-2.8109705418888353e-7, 2.8109705418888353e-7)), by(builtin(abs, 2))),
                      proof(goal(ge(2.8109705418888353e-7, 1.0e-15)), by(builtin(ge, 2))),
                      proof(
                        goal(fd(2, 2.7182810643581381, 0.36787954458128408)), by(rule("newton-raphson.pl", clause(10))),
                        bindings([binding("X", 2.7182810643581381), binding("Y", 0.36787954458128408)]),
                        uses([
                          proof(goal(div(1, 2.7182810643581381, 0.36787954458128408)), by(builtin(div, 3)))
                        ])
                      ),
                      proof(goal(div(-2.8109705418888353e-7, 0.36787954458128408, -7.6410079964849558e-7)), by(builtin(div, 3))),
                      proof(goal(sub(2.7182810643581381, -7.6410079964849558e-7, 2.7182818284589376)), by(builtin(sub, 3))),
                      proof(
                        goal(find_root([2, 2.7182818284589376, 1.0e-15], 2.7182818284590455)), by(rule("newton-raphson.pl", clause(13))),
                        bindings([binding("N", 2), binding("X", 2.7182818284589376), binding("Tolerance", 1.0e-15), binding("Root", 2.7182818284590455), binding("FX", -3.9634961979118088e-14), binding("AFX", 3.9634961979118088e-14), binding("FDX", 0.36787944117145688), binding("Step", -1.0773899691949759e-13), binding("NewX", 2.7182818284590455)]),
                        uses([
                          proof(
                            goal(f(2, 2.7182818284589376, -3.9634961979118088e-14)), by(rule("newton-raphson.pl", clause(7))),
                            bindings([binding("X", 2.7182818284589376), binding("Y", -3.9634961979118088e-14), binding("LX", 0.99999999999996037)]),
                            uses([
                              proof(goal(log(2.7182818284589376, 0.99999999999996037)), by(builtin(log, 2))),
                              proof(goal(sub(0.99999999999996037, 1, -3.9634961979118088e-14)), by(builtin(sub, 3)))
                            ])
                          ),
                          proof(goal(abs(-3.9634961979118088e-14, 3.9634961979118088e-14)), by(builtin(abs, 2))),
                          proof(goal(ge(3.9634961979118088e-14, 1.0e-15)), by(builtin(ge, 2))),
                          proof(
                            goal(fd(2, 2.7182818284589376, 0.36787944117145688)), by(rule("newton-raphson.pl", clause(10))),
                            bindings([binding("X", 2.7182818284589376), binding("Y", 0.36787944117145688)]),
                            uses([
                              proof(goal(div(1, 2.7182818284589376, 0.36787944117145688)), by(builtin(div, 3)))
                            ])
                          ),
                          proof(goal(div(-3.9634961979118088e-14, 0.36787944117145688, -1.0773899691949759e-13)), by(builtin(div, 3))),
                          proof(goal(sub(2.7182818284589376, -1.0773899691949759e-13, 2.7182818284590455)), by(builtin(sub, 3))),
                          proof(
                            goal(find_root([2, 2.7182818284590455, 1.0e-15], 2.7182818284590455)), by(rule("newton-raphson.pl", clause(12))),
                            bindings([binding("N", 2), binding("X", 2.7182818284590455), binding("Tolerance", 1.0e-15), binding("FX", 0.0), binding("AFX", 0.0)]),
                            uses([
                              proof(
                                goal(f(2, 2.7182818284590455, 0.0)), by(rule("newton-raphson.pl", clause(7))),
                                bindings([binding("X", 2.7182818284590455), binding("Y", 0.0), binding("LX", 1.0)]),
                                uses([
                                  proof(goal(log(2.7182818284590455, 1.0)), by(builtin(log, 2))),
                                  proof(goal(sub(1.0, 1, 0.0)), by(builtin(sub, 3)))
                                ])
                              ),
                              proof(goal(abs(0.0, 0.0)), by(builtin(abs, 2))),
                              proof(goal(lt(0.0, 1.0e-15)), by(builtin(lt, 2)))
                            ])
                          )
                        ])
                      )
                    ])
                  )
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

findRoot([3, 3.0, 1.0e-15], 3.1415926535897931).
why(
  findRoot([3, 3.0, 1.0e-15], 3.1415926535897931),
  proof(
    goal(findRoot([3, 3.0, 1.0e-15], 3.1415926535897931)), by(rule("newton-raphson.pl", clause(5))),
    bindings([binding("Input", [3, 3.0, 1.0e-15]), binding("Root", 3.1415926535897931)]),
    uses([
      proof(goal(want_root([3, 3.0, 1.0e-15])), by(fact("newton-raphson.pl", clause(4)))),
      proof(
        goal(find_root([3, 3.0, 1.0e-15], 3.1415926535897931)), by(rule("newton-raphson.pl", clause(13))),
        bindings([binding("N", 3), binding("X", 3.0), binding("Tolerance", 1.0e-15), binding("Root", 3.1415926535897931), binding("FX", 0.14112000805986721), binding("AFX", 0.14112000805986721), binding("FDX", -0.98999249660044542), binding("Step", -0.1425465430742778), binding("NewX", 3.1425465430742778)]),
        uses([
          proof(
            goal(f(3, 3.0, 0.14112000805986721)), by(rule("newton-raphson.pl", clause(8))),
            bindings([binding("X", 3.0), binding("Y", 0.14112000805986721)]),
            uses([
              proof(goal(sin(3.0, 0.14112000805986721)), by(builtin(sin, 2)))
            ])
          ),
          proof(goal(abs(0.14112000805986721, 0.14112000805986721)), by(builtin(abs, 2))),
          proof(goal(ge(0.14112000805986721, 1.0e-15)), by(builtin(ge, 2))),
          proof(
            goal(fd(3, 3.0, -0.98999249660044542)), by(rule("newton-raphson.pl", clause(11))),
            bindings([binding("X", 3.0), binding("Y", -0.98999249660044542)]),
            uses([
              proof(goal(cos(3.0, -0.98999249660044542)), by(builtin(cos, 2)))
            ])
          ),
          proof(goal(div(0.14112000805986721, -0.98999249660044542, -0.1425465430742778)), by(builtin(div, 3))),
          proof(goal(sub(3.0, -0.1425465430742778, 3.1425465430742778)), by(builtin(sub, 3))),
          proof(
            goal(find_root([3, 3.1425465430742778, 1.0e-15], 3.1415926535897931)), by(rule("newton-raphson.pl", clause(13))),
            bindings([binding("N", 3), binding("X", 3.1425465430742778), binding("Tolerance", 1.0e-15), binding("Root", 3.1415926535897931), binding("FX", -0.00095388933982644094), binding("AFX", 0.00095388933982644094), binding("FDX", -0.99999954504746014), binding("Step", 0.00095388977380101629), binding("NewX", 3.141592653300477)]),
            uses([
              proof(
                goal(f(3, 3.1425465430742778, -0.00095388933982644094)), by(rule("newton-raphson.pl", clause(8))),
                bindings([binding("X", 3.1425465430742778), binding("Y", -0.00095388933982644094)]),
                uses([
                  proof(goal(sin(3.1425465430742778, -0.00095388933982644094)), by(builtin(sin, 2)))
                ])
              ),
              proof(goal(abs(-0.00095388933982644094, 0.00095388933982644094)), by(builtin(abs, 2))),
              proof(goal(ge(0.00095388933982644094, 1.0e-15)), by(builtin(ge, 2))),
              proof(
                goal(fd(3, 3.1425465430742778, -0.99999954504746014)), by(rule("newton-raphson.pl", clause(11))),
                bindings([binding("X", 3.1425465430742778), binding("Y", -0.99999954504746014)]),
                uses([
                  proof(goal(cos(3.1425465430742778, -0.99999954504746014)), by(builtin(cos, 2)))
                ])
              ),
              proof(goal(div(-0.00095388933982644094, -0.99999954504746014, 0.00095388977380101629)), by(builtin(div, 3))),
              proof(goal(sub(3.1425465430742778, 0.00095388977380101629, 3.141592653300477)), by(builtin(sub, 3))),
              proof(
                goal(find_root([3, 3.141592653300477, 1.0e-15], 3.1415926535897931)), by(rule("newton-raphson.pl", clause(13))),
                bindings([binding("N", 3), binding("X", 3.141592653300477), binding("Tolerance", 1.0e-15), binding("Root", 3.1415926535897931), binding("FX", 2.8931624907621843e-10), binding("AFX", 2.8931624907621843e-10), binding("FDX", -1.0), binding("Step", -2.8931624907621843e-10), binding("NewX", 3.1415926535897931)]),
                uses([
                  proof(
                    goal(f(3, 3.141592653300477, 2.8931624907621843e-10)), by(rule("newton-raphson.pl", clause(8))),
                    bindings([binding("X", 3.141592653300477), binding("Y", 2.8931624907621843e-10)]),
                    uses([
                      proof(goal(sin(3.141592653300477, 2.8931624907621843e-10)), by(builtin(sin, 2)))
                    ])
                  ),
                  proof(goal(abs(2.8931624907621843e-10, 2.8931624907621843e-10)), by(builtin(abs, 2))),
                  proof(goal(ge(2.8931624907621843e-10, 1.0e-15)), by(builtin(ge, 2))),
                  proof(
                    goal(fd(3, 3.141592653300477, -1.0)), by(rule("newton-raphson.pl", clause(11))),
                    bindings([binding("X", 3.141592653300477), binding("Y", -1.0)]),
                    uses([
                      proof(goal(cos(3.141592653300477, -1.0)), by(builtin(cos, 2)))
                    ])
                  ),
                  proof(goal(div(2.8931624907621843e-10, -1.0, -2.8931624907621843e-10)), by(builtin(div, 3))),
                  proof(goal(sub(3.141592653300477, -2.8931624907621843e-10, 3.1415926535897931)), by(builtin(sub, 3))),
                  proof(
                    goal(find_root([3, 3.1415926535897931, 1.0e-15], 3.1415926535897931)), by(rule("newton-raphson.pl", clause(12))),
                    bindings([binding("N", 3), binding("X", 3.1415926535897931), binding("Tolerance", 1.0e-15), binding("FX", 1.2246467991473532e-16), binding("AFX", 1.2246467991473532e-16)]),
                    uses([
                      proof(
                        goal(f(3, 3.1415926535897931, 1.2246467991473532e-16)), by(rule("newton-raphson.pl", clause(8))),
                        bindings([binding("X", 3.1415926535897931), binding("Y", 1.2246467991473532e-16)]),
                        uses([
                          proof(goal(sin(3.1415926535897931, 1.2246467991473532e-16)), by(builtin(sin, 2)))
                        ])
                      ),
                      proof(goal(abs(1.2246467991473532e-16, 1.2246467991473532e-16)), by(builtin(abs, 2))),
                      proof(goal(lt(1.2246467991473532e-16, 1.0e-15)), by(builtin(lt, 2)))
                    ])
                  )
                ])
              )
            ])
          )
        ])
      )
    ])
  )
).

