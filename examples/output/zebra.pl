waterDrinker(zebraPuzzle, norwegian).
why(
  waterDrinker(zebraPuzzle, norwegian),
  proof(
    goal(waterDrinker(zebraPuzzle, norwegian)),
    by(rule("zebra.pl", clause(11))),
    bindings([binding("WaterDrinker", norwegian), binding("_ZebraOwner", japanese)]),
    uses([
      proof(
        goal(zebra(norwegian, japanese)),
        by(rule("zebra.pl", clause(4))),
        bindings([binding("WaterDrinker", norwegian), binding("ZebraOwner", japanese), binding("Houses", [house(yellow, norwegian, fox, water, kools), house(blue, ukrainian, horse, tea, chesterfields), house(red, english, snail, milk, old_gold), house(ivory, spanish, dog, orange_juice, lucky_strike), house(green, japanese, zebra, coffee, parliaments)]), binding("__anon0", house(yellow, norwegian, fox, water, kools)), binding("__anon1", house(blue, ukrainian, horse, tea, chesterfields)), binding("__anon2", house(red, english, snail, milk, old_gold)), binding("__anon3", house(ivory, spanish, dog, orange_juice, lucky_strike)), binding("__anon4", house(green, japanese, zebra, coffee, parliaments)), binding("__anon5", yellow), binding("__anon6", fox), binding("__anon7", water), binding("__anon8", kools), binding("__anon9", red), binding("__anon10", english), binding("__anon11", snail), binding("__anon12", old_gold), binding("__anon13", yellow), binding("__anon14", fox), binding("__anon15", water), binding("__anon16", kools), binding("__anon17", ukrainian), binding("__anon18", horse), binding("__anon19", tea), binding("__anon20", chesterfields), binding("__anon21", spanish), binding("__anon22", dog), binding("__anon23", orange_juice), binding("__anon24", lucky_strike), binding("__anon25", japanese), binding("__anon26", zebra), binding("__anon27", coffee), binding("__anon28", parliaments), binding("__anon29", snail), binding("__anon30", milk), binding("__anon31", old_gold), binding("__anon32", japanese), binding("__anon33", zebra), binding("__anon34", parliaments), binding("__anon35", norwegian), binding("__anon36", fox), binding("__anon37", water), binding("__anon38", ivory), binding("__anon39", orange_juice), binding("__anon40", lucky_strike), binding("__anon41", blue), binding("__anon42", horse), binding("__anon43", chesterfields), binding("__anon44", red), binding("__anon45", english), binding("__anon46", milk), binding("__anon47", blue), binding("__anon48", ukrainian), binding("__anon49", horse), binding("__anon50", tea), binding("__anon51", yellow), binding("__anon52", norwegian), binding("__anon53", water), binding("__anon54", kools), binding("__anon55", yellow), binding("__anon56", norwegian), binding("__anon57", fox), binding("__anon58", water), binding("__anon59", blue), binding("__anon60", ukrainian), binding("__anon61", tea), binding("__anon62", chesterfields), binding("__anon63", ivory), binding("__anon64", spanish), binding("__anon65", dog), binding("__anon66", green), binding("__anon67", zebra), binding("__anon68", coffee), binding("__anon69", yellow), binding("__anon70", fox), binding("__anon71", kools), binding("__anon72", green), binding("__anon73", coffee), binding("__anon74", parliaments)]),
        uses([
          proof(
            goal(eq([__anon0, __anon1, __anon2, __anon3, __anon4], [__anon0, __anon1, __anon2, __anon3, __anon4])),
            by(builtin(eq, 2))
          ),
          proof(
            goal(first([house(__anon5, norwegian, __anon6, __anon7, __anon8), __anon1, __anon2, __anon3, __anon4], house(__anon5, norwegian, __anon6, __anon7, __anon8))),
            by(fact("zebra.pl", clause(5))),
            bindings([binding("X", house(__anon5, norwegian, __anon6, __anon7, __anon8)), binding("__anon75", [__anon1, __anon2, __anon3, __anon4])])
          ),
          proof(
            goal(third([house(__anon5, norwegian, __anon6, __anon7, __anon8), __anon77, house(__anon9, __anon10, __anon11, milk, __anon12), __anon3, __anon4], house(__anon9, __anon10, __anon11, milk, __anon12))),
            by(fact("zebra.pl", clause(6))),
            bindings([binding("__anon76", house(__anon5, norwegian, __anon6, __anon7, __anon8)), binding("X", house(__anon9, __anon10, __anon11, milk, __anon12)), binding("__anon78", [__anon3, __anon4])])
          ),
          proof(
            goal(adjacent(house(__anon13, norwegian, __anon14, __anon15, __anon16), house(blue, __anon17, __anon18, __anon19, __anon20), [house(__anon13, norwegian, __anon14, __anon15, __anon16), house(blue, __anon17, __anon18, __anon19, __anon20), house(__anon9, __anon10, __anon11, milk, __anon12), __anon3, __anon4])),
            by(rule("zebra.pl", clause(7))),
            bindings([binding("A", house(__anon13, norwegian, __anon14, __anon15, __anon16)), binding("B", house(blue, __anon17, __anon18, __anon19, __anon20)), binding("List", [house(__anon13, norwegian, __anon14, __anon15, __anon16), house(blue, __anon17, __anon18, __anon19, __anon20), house(__anon9, __anon10, __anon11, milk, __anon12), __anon3, __anon4])]),
            uses([
              proof(
                goal(next_to(house(__anon13, norwegian, __anon14, __anon15, __anon16), house(blue, __anon17, __anon18, __anon19, __anon20), [house(__anon13, norwegian, __anon14, __anon15, __anon16), house(blue, __anon17, __anon18, __anon19, __anon20), house(__anon9, __anon10, __anon11, milk, __anon12), __anon3, __anon4])),
                by(fact("zebra.pl", clause(9))),
                bindings([binding("X", house(__anon13, norwegian, __anon14, __anon15, __anon16)), binding("Y", house(blue, __anon17, __anon18, __anon19, __anon20)), binding("__anon79", [house(__anon9, __anon10, __anon11, milk, __anon12), __anon3, __anon4])])
              )
            ])
          ),
          proof(
            goal(next_to(house(ivory, __anon21, __anon22, __anon23, __anon24), house(green, __anon25, __anon26, __anon27, __anon28), [house(__anon13, norwegian, __anon14, __anon15, __anon16), house(blue, __anon17, __anon18, __anon19, __anon20), house(__anon9, __anon10, __anon11, milk, __anon12), house(ivory, __anon21, __anon22, __anon23, __anon24), house(green, __anon25, __anon26, __anon27, __anon28)])),
            by(rule("zebra.pl", clause(10))),
            bindings([binding("X", house(ivory, __anon21, __anon22, __anon23, __anon24)), binding("Y", house(green, __anon25, __anon26, __anon27, __anon28)), binding("__anon80", house(__anon13, norwegian, __anon14, __anon15, __anon16)), binding("Zs", [house(blue, __anon17, __anon18, __anon19, __anon20), house(__anon9, __anon10, __anon11, milk, __anon12), house(ivory, __anon21, __anon22, __anon23, __anon24), house(green, __anon25, __anon26, __anon27, __anon28)])]),
            uses([
              proof(
                goal(next_to(house(ivory, __anon21, __anon22, __anon23, __anon24), house(green, __anon25, __anon26, __anon27, __anon28), [house(blue, __anon17, __anon18, __anon19, __anon20), house(__anon9, __anon10, __anon11, milk, __anon12), house(ivory, __anon21, __anon22, __anon23, __anon24), house(green, __anon25, __anon26, __anon27, __anon28)])),
                by(rule("zebra.pl", clause(10))),
                bindings([binding("X", house(ivory, __anon21, __anon22, __anon23, __anon24)), binding("Y", house(green, __anon25, __anon26, __anon27, __anon28)), binding("__anon80", house(blue, __anon17, __anon18, __anon19, __anon20)), binding("Zs", [house(__anon9, __anon10, __anon11, milk, __anon12), house(ivory, __anon21, __anon22, __anon23, __anon24), house(green, __anon25, __anon26, __anon27, __anon28)])]),
                uses([
                  proof(
                    goal(next_to(house(ivory, __anon21, __anon22, __anon23, __anon24), house(green, __anon25, __anon26, __anon27, __anon28), [house(__anon9, __anon10, __anon11, milk, __anon12), house(ivory, __anon21, __anon22, __anon23, __anon24), house(green, __anon25, __anon26, __anon27, __anon28)])),
                    by(rule("zebra.pl", clause(10))),
                    bindings([binding("X", house(ivory, __anon21, __anon22, __anon23, __anon24)), binding("Y", house(green, __anon25, __anon26, __anon27, __anon28)), binding("__anon80", house(__anon9, __anon10, __anon11, milk, __anon12)), binding("Zs", [house(ivory, __anon21, __anon22, __anon23, __anon24), house(green, __anon25, __anon26, __anon27, __anon28)])]),
                    uses([
                      proof(
                        goal(next_to(house(ivory, __anon21, __anon22, __anon23, __anon24), house(green, __anon25, __anon26, __anon27, __anon28), [house(ivory, __anon21, __anon22, __anon23, __anon24), house(green, __anon25, __anon26, __anon27, __anon28)])),
                        by(fact("zebra.pl", clause(9))),
                        bindings([binding("X", house(ivory, __anon21, __anon22, __anon23, __anon24)), binding("Y", house(green, __anon25, __anon26, __anon27, __anon28)), binding("__anon79", [])])
                      )
                    ])
                  )
                ])
              )
            ])
          ),
          proof(
            goal(member(house(red, english, __anon11, milk, __anon12), [house(__anon13, norwegian, __anon14, __anon15, __anon16), house(blue, __anon17, __anon18, __anon19, __anon20), house(red, english, __anon11, milk, __anon12), house(ivory, __anon21, __anon22, __anon23, __anon24), house(green, __anon25, __anon26, __anon27, __anon28)])),
            by(builtin(member, 2))
          ),
          proof(
            goal(member(house(green, __anon25, __anon26, coffee, __anon28), [house(__anon13, norwegian, __anon14, __anon15, __anon16), house(blue, __anon17, __anon18, __anon19, __anon20), house(red, english, __anon11, milk, __anon12), house(ivory, __anon21, __anon22, __anon23, __anon24), house(green, __anon25, __anon26, coffee, __anon28)])),
            by(builtin(member, 2))
          ),
          proof(
            goal(member(house(yellow, norwegian, __anon14, __anon15, kools), [house(yellow, norwegian, __anon14, __anon15, kools), house(blue, __anon17, __anon18, __anon19, __anon20), house(red, english, __anon11, milk, __anon12), house(ivory, __anon21, __anon22, __anon23, __anon24), house(green, __anon25, __anon26, coffee, __anon28)])),
            by(builtin(member, 2))
          ),
          proof(
            goal(member(house(ivory, spanish, dog, __anon23, __anon24), [house(yellow, norwegian, __anon14, __anon15, kools), house(blue, __anon17, __anon18, __anon19, __anon20), house(red, english, __anon11, milk, __anon12), house(ivory, spanish, dog, __anon23, __anon24), house(green, __anon25, __anon26, coffee, __anon28)])),
            by(builtin(member, 2))
          ),
          proof(
            goal(member(house(blue, ukrainian, __anon18, tea, __anon20), [house(yellow, norwegian, __anon14, __anon15, kools), house(blue, ukrainian, __anon18, tea, __anon20), house(red, english, __anon11, milk, __anon12), house(ivory, spanish, dog, __anon23, __anon24), house(green, __anon25, __anon26, coffee, __anon28)])),
            by(builtin(member, 2))
          ),
          proof(
            goal(member(house(red, english, snail, milk, old_gold), [house(yellow, norwegian, __anon14, __anon15, kools), house(blue, ukrainian, __anon18, tea, __anon20), house(red, english, snail, milk, old_gold), house(ivory, spanish, dog, __anon23, __anon24), house(green, __anon25, __anon26, coffee, __anon28)])),
            by(builtin(member, 2))
          ),
          proof(
            goal(adjacent(house(blue, ukrainian, __anon49, tea, chesterfields), house(yellow, norwegian, fox, __anon53, kools), [house(yellow, norwegian, fox, __anon53, kools), house(blue, ukrainian, __anon49, tea, chesterfields), house(red, english, snail, milk, old_gold), house(ivory, spanish, dog, __anon23, __anon24), house(green, __anon25, __anon26, coffee, __anon28)])),
            by(rule("zebra.pl", clause(8))),
            bindings([binding("A", house(blue, ukrainian, __anon49, tea, chesterfields)), binding("B", house(yellow, norwegian, fox, __anon53, kools)), binding("List", [house(yellow, norwegian, fox, __anon53, kools), house(blue, ukrainian, __anon49, tea, chesterfields), house(red, english, snail, milk, old_gold), house(ivory, spanish, dog, __anon23, __anon24), house(green, __anon25, __anon26, coffee, __anon28)])]),
            uses([
              proof(
                goal(next_to(house(yellow, norwegian, fox, __anon53, kools), house(blue, ukrainian, __anon49, tea, chesterfields), [house(yellow, norwegian, fox, __anon53, kools), house(blue, ukrainian, __anon49, tea, chesterfields), house(red, english, snail, milk, old_gold), house(ivory, spanish, dog, __anon23, __anon24), house(green, __anon25, __anon26, coffee, __anon28)])),
                by(fact("zebra.pl", clause(9))),
                bindings([binding("X", house(yellow, norwegian, fox, __anon53, kools)), binding("Y", house(blue, ukrainian, __anon49, tea, chesterfields)), binding("__anon79", [house(red, english, snail, milk, old_gold), house(ivory, spanish, dog, __anon23, __anon24), house(green, __anon25, __anon26, coffee, __anon28)])])
              )
            ])
          ),
          proof(
            goal(adjacent(house(yellow, norwegian, fox, __anon58, kools), house(blue, ukrainian, horse, tea, chesterfields), [house(yellow, norwegian, fox, __anon58, kools), house(blue, ukrainian, horse, tea, chesterfields), house(red, english, snail, milk, old_gold), house(ivory, spanish, dog, __anon23, __anon24), house(green, __anon25, __anon26, coffee, __anon28)])),
            by(rule("zebra.pl", clause(7))),
            bindings([binding("A", house(yellow, norwegian, fox, __anon58, kools)), binding("B", house(blue, ukrainian, horse, tea, chesterfields)), binding("List", [house(yellow, norwegian, fox, __anon58, kools), house(blue, ukrainian, horse, tea, chesterfields), house(red, english, snail, milk, old_gold), house(ivory, spanish, dog, __anon23, __anon24), house(green, __anon25, __anon26, coffee, __anon28)])]),
            uses([
              proof(
                goal(next_to(house(yellow, norwegian, fox, __anon58, kools), house(blue, ukrainian, horse, tea, chesterfields), [house(yellow, norwegian, fox, __anon58, kools), house(blue, ukrainian, horse, tea, chesterfields), house(red, english, snail, milk, old_gold), house(ivory, spanish, dog, __anon23, __anon24), house(green, __anon25, __anon26, coffee, __anon28)])),
                by(fact("zebra.pl", clause(9))),
                bindings([binding("X", house(yellow, norwegian, fox, __anon58, kools)), binding("Y", house(blue, ukrainian, horse, tea, chesterfields)), binding("__anon79", [house(red, english, snail, milk, old_gold), house(ivory, spanish, dog, __anon23, __anon24), house(green, __anon25, __anon26, coffee, __anon28)])])
              )
            ])
          ),
          proof(
            goal(member(house(ivory, spanish, dog, orange_juice, lucky_strike), [house(yellow, norwegian, fox, __anon58, kools), house(blue, ukrainian, horse, tea, chesterfields), house(red, english, snail, milk, old_gold), house(ivory, spanish, dog, orange_juice, lucky_strike), house(green, __anon25, __anon26, coffee, __anon28)])),
            by(builtin(member, 2))
          ),
          proof(
            goal(member(house(green, japanese, __anon26, coffee, parliaments), [house(yellow, norwegian, fox, __anon58, kools), house(blue, ukrainian, horse, tea, chesterfields), house(red, english, snail, milk, old_gold), house(ivory, spanish, dog, orange_juice, lucky_strike), house(green, japanese, __anon26, coffee, parliaments)])),
            by(builtin(member, 2))
          ),
          proof(
            goal(member(house(yellow, norwegian, fox, water, kools), [house(yellow, norwegian, fox, water, kools), house(blue, ukrainian, horse, tea, chesterfields), house(red, english, snail, milk, old_gold), house(ivory, spanish, dog, orange_juice, lucky_strike), house(green, japanese, __anon26, coffee, parliaments)])),
            by(builtin(member, 2))
          ),
          proof(
            goal(member(house(green, japanese, zebra, coffee, parliaments), [house(yellow, norwegian, fox, water, kools), house(blue, ukrainian, horse, tea, chesterfields), house(red, english, snail, milk, old_gold), house(ivory, spanish, dog, orange_juice, lucky_strike), house(green, japanese, zebra, coffee, parliaments)])),
            by(builtin(member, 2))
          )
        ])
      )
    ])
  )
).

zebraOwner(zebraPuzzle, japanese).
why(
  zebraOwner(zebraPuzzle, japanese),
  proof(
    goal(zebraOwner(zebraPuzzle, japanese)),
    by(rule("zebra.pl", clause(12))),
    bindings([binding("ZebraOwner", japanese), binding("_WaterDrinker", norwegian)]),
    uses([
      proof(
        goal(zebra(norwegian, japanese)),
        by(rule("zebra.pl", clause(4))),
        bindings([binding("WaterDrinker", norwegian), binding("ZebraOwner", japanese), binding("Houses", [house(yellow, norwegian, fox, water, kools), house(blue, ukrainian, horse, tea, chesterfields), house(red, english, snail, milk, old_gold), house(ivory, spanish, dog, orange_juice, lucky_strike), house(green, japanese, zebra, coffee, parliaments)]), binding("__anon0", house(yellow, norwegian, fox, water, kools)), binding("__anon1", house(blue, ukrainian, horse, tea, chesterfields)), binding("__anon2", house(red, english, snail, milk, old_gold)), binding("__anon3", house(ivory, spanish, dog, orange_juice, lucky_strike)), binding("__anon4", house(green, japanese, zebra, coffee, parliaments)), binding("__anon5", yellow), binding("__anon6", fox), binding("__anon7", water), binding("__anon8", kools), binding("__anon9", red), binding("__anon10", english), binding("__anon11", snail), binding("__anon12", old_gold), binding("__anon13", yellow), binding("__anon14", fox), binding("__anon15", water), binding("__anon16", kools), binding("__anon17", ukrainian), binding("__anon18", horse), binding("__anon19", tea), binding("__anon20", chesterfields), binding("__anon21", spanish), binding("__anon22", dog), binding("__anon23", orange_juice), binding("__anon24", lucky_strike), binding("__anon25", japanese), binding("__anon26", zebra), binding("__anon27", coffee), binding("__anon28", parliaments), binding("__anon29", snail), binding("__anon30", milk), binding("__anon31", old_gold), binding("__anon32", japanese), binding("__anon33", zebra), binding("__anon34", parliaments), binding("__anon35", norwegian), binding("__anon36", fox), binding("__anon37", water), binding("__anon38", ivory), binding("__anon39", orange_juice), binding("__anon40", lucky_strike), binding("__anon41", blue), binding("__anon42", horse), binding("__anon43", chesterfields), binding("__anon44", red), binding("__anon45", english), binding("__anon46", milk), binding("__anon47", blue), binding("__anon48", ukrainian), binding("__anon49", horse), binding("__anon50", tea), binding("__anon51", yellow), binding("__anon52", norwegian), binding("__anon53", water), binding("__anon54", kools), binding("__anon55", yellow), binding("__anon56", norwegian), binding("__anon57", fox), binding("__anon58", water), binding("__anon59", blue), binding("__anon60", ukrainian), binding("__anon61", tea), binding("__anon62", chesterfields), binding("__anon63", ivory), binding("__anon64", spanish), binding("__anon65", dog), binding("__anon66", green), binding("__anon67", zebra), binding("__anon68", coffee), binding("__anon69", yellow), binding("__anon70", fox), binding("__anon71", kools), binding("__anon72", green), binding("__anon73", coffee), binding("__anon74", parliaments)]),
        uses([
          proof(
            goal(eq([__anon0, __anon1, __anon2, __anon3, __anon4], [__anon0, __anon1, __anon2, __anon3, __anon4])),
            by(builtin(eq, 2))
          ),
          proof(
            goal(first([house(__anon5, norwegian, __anon6, __anon7, __anon8), __anon1, __anon2, __anon3, __anon4], house(__anon5, norwegian, __anon6, __anon7, __anon8))),
            by(fact("zebra.pl", clause(5))),
            bindings([binding("X", house(__anon5, norwegian, __anon6, __anon7, __anon8)), binding("__anon75", [__anon1, __anon2, __anon3, __anon4])])
          ),
          proof(
            goal(third([house(__anon5, norwegian, __anon6, __anon7, __anon8), __anon77, house(__anon9, __anon10, __anon11, milk, __anon12), __anon3, __anon4], house(__anon9, __anon10, __anon11, milk, __anon12))),
            by(fact("zebra.pl", clause(6))),
            bindings([binding("__anon76", house(__anon5, norwegian, __anon6, __anon7, __anon8)), binding("X", house(__anon9, __anon10, __anon11, milk, __anon12)), binding("__anon78", [__anon3, __anon4])])
          ),
          proof(
            goal(adjacent(house(__anon13, norwegian, __anon14, __anon15, __anon16), house(blue, __anon17, __anon18, __anon19, __anon20), [house(__anon13, norwegian, __anon14, __anon15, __anon16), house(blue, __anon17, __anon18, __anon19, __anon20), house(__anon9, __anon10, __anon11, milk, __anon12), __anon3, __anon4])),
            by(rule("zebra.pl", clause(7))),
            bindings([binding("A", house(__anon13, norwegian, __anon14, __anon15, __anon16)), binding("B", house(blue, __anon17, __anon18, __anon19, __anon20)), binding("List", [house(__anon13, norwegian, __anon14, __anon15, __anon16), house(blue, __anon17, __anon18, __anon19, __anon20), house(__anon9, __anon10, __anon11, milk, __anon12), __anon3, __anon4])]),
            uses([
              proof(
                goal(next_to(house(__anon13, norwegian, __anon14, __anon15, __anon16), house(blue, __anon17, __anon18, __anon19, __anon20), [house(__anon13, norwegian, __anon14, __anon15, __anon16), house(blue, __anon17, __anon18, __anon19, __anon20), house(__anon9, __anon10, __anon11, milk, __anon12), __anon3, __anon4])),
                by(fact("zebra.pl", clause(9))),
                bindings([binding("X", house(__anon13, norwegian, __anon14, __anon15, __anon16)), binding("Y", house(blue, __anon17, __anon18, __anon19, __anon20)), binding("__anon79", [house(__anon9, __anon10, __anon11, milk, __anon12), __anon3, __anon4])])
              )
            ])
          ),
          proof(
            goal(next_to(house(ivory, __anon21, __anon22, __anon23, __anon24), house(green, __anon25, __anon26, __anon27, __anon28), [house(__anon13, norwegian, __anon14, __anon15, __anon16), house(blue, __anon17, __anon18, __anon19, __anon20), house(__anon9, __anon10, __anon11, milk, __anon12), house(ivory, __anon21, __anon22, __anon23, __anon24), house(green, __anon25, __anon26, __anon27, __anon28)])),
            by(rule("zebra.pl", clause(10))),
            bindings([binding("X", house(ivory, __anon21, __anon22, __anon23, __anon24)), binding("Y", house(green, __anon25, __anon26, __anon27, __anon28)), binding("__anon80", house(__anon13, norwegian, __anon14, __anon15, __anon16)), binding("Zs", [house(blue, __anon17, __anon18, __anon19, __anon20), house(__anon9, __anon10, __anon11, milk, __anon12), house(ivory, __anon21, __anon22, __anon23, __anon24), house(green, __anon25, __anon26, __anon27, __anon28)])]),
            uses([
              proof(
                goal(next_to(house(ivory, __anon21, __anon22, __anon23, __anon24), house(green, __anon25, __anon26, __anon27, __anon28), [house(blue, __anon17, __anon18, __anon19, __anon20), house(__anon9, __anon10, __anon11, milk, __anon12), house(ivory, __anon21, __anon22, __anon23, __anon24), house(green, __anon25, __anon26, __anon27, __anon28)])),
                by(rule("zebra.pl", clause(10))),
                bindings([binding("X", house(ivory, __anon21, __anon22, __anon23, __anon24)), binding("Y", house(green, __anon25, __anon26, __anon27, __anon28)), binding("__anon80", house(blue, __anon17, __anon18, __anon19, __anon20)), binding("Zs", [house(__anon9, __anon10, __anon11, milk, __anon12), house(ivory, __anon21, __anon22, __anon23, __anon24), house(green, __anon25, __anon26, __anon27, __anon28)])]),
                uses([
                  proof(
                    goal(next_to(house(ivory, __anon21, __anon22, __anon23, __anon24), house(green, __anon25, __anon26, __anon27, __anon28), [house(__anon9, __anon10, __anon11, milk, __anon12), house(ivory, __anon21, __anon22, __anon23, __anon24), house(green, __anon25, __anon26, __anon27, __anon28)])),
                    by(rule("zebra.pl", clause(10))),
                    bindings([binding("X", house(ivory, __anon21, __anon22, __anon23, __anon24)), binding("Y", house(green, __anon25, __anon26, __anon27, __anon28)), binding("__anon80", house(__anon9, __anon10, __anon11, milk, __anon12)), binding("Zs", [house(ivory, __anon21, __anon22, __anon23, __anon24), house(green, __anon25, __anon26, __anon27, __anon28)])]),
                    uses([
                      proof(
                        goal(next_to(house(ivory, __anon21, __anon22, __anon23, __anon24), house(green, __anon25, __anon26, __anon27, __anon28), [house(ivory, __anon21, __anon22, __anon23, __anon24), house(green, __anon25, __anon26, __anon27, __anon28)])),
                        by(fact("zebra.pl", clause(9))),
                        bindings([binding("X", house(ivory, __anon21, __anon22, __anon23, __anon24)), binding("Y", house(green, __anon25, __anon26, __anon27, __anon28)), binding("__anon79", [])])
                      )
                    ])
                  )
                ])
              )
            ])
          ),
          proof(
            goal(member(house(red, english, __anon11, milk, __anon12), [house(__anon13, norwegian, __anon14, __anon15, __anon16), house(blue, __anon17, __anon18, __anon19, __anon20), house(red, english, __anon11, milk, __anon12), house(ivory, __anon21, __anon22, __anon23, __anon24), house(green, __anon25, __anon26, __anon27, __anon28)])),
            by(builtin(member, 2))
          ),
          proof(
            goal(member(house(green, __anon25, __anon26, coffee, __anon28), [house(__anon13, norwegian, __anon14, __anon15, __anon16), house(blue, __anon17, __anon18, __anon19, __anon20), house(red, english, __anon11, milk, __anon12), house(ivory, __anon21, __anon22, __anon23, __anon24), house(green, __anon25, __anon26, coffee, __anon28)])),
            by(builtin(member, 2))
          ),
          proof(
            goal(member(house(yellow, norwegian, __anon14, __anon15, kools), [house(yellow, norwegian, __anon14, __anon15, kools), house(blue, __anon17, __anon18, __anon19, __anon20), house(red, english, __anon11, milk, __anon12), house(ivory, __anon21, __anon22, __anon23, __anon24), house(green, __anon25, __anon26, coffee, __anon28)])),
            by(builtin(member, 2))
          ),
          proof(
            goal(member(house(ivory, spanish, dog, __anon23, __anon24), [house(yellow, norwegian, __anon14, __anon15, kools), house(blue, __anon17, __anon18, __anon19, __anon20), house(red, english, __anon11, milk, __anon12), house(ivory, spanish, dog, __anon23, __anon24), house(green, __anon25, __anon26, coffee, __anon28)])),
            by(builtin(member, 2))
          ),
          proof(
            goal(member(house(blue, ukrainian, __anon18, tea, __anon20), [house(yellow, norwegian, __anon14, __anon15, kools), house(blue, ukrainian, __anon18, tea, __anon20), house(red, english, __anon11, milk, __anon12), house(ivory, spanish, dog, __anon23, __anon24), house(green, __anon25, __anon26, coffee, __anon28)])),
            by(builtin(member, 2))
          ),
          proof(
            goal(member(house(red, english, snail, milk, old_gold), [house(yellow, norwegian, __anon14, __anon15, kools), house(blue, ukrainian, __anon18, tea, __anon20), house(red, english, snail, milk, old_gold), house(ivory, spanish, dog, __anon23, __anon24), house(green, __anon25, __anon26, coffee, __anon28)])),
            by(builtin(member, 2))
          ),
          proof(
            goal(adjacent(house(blue, ukrainian, __anon49, tea, chesterfields), house(yellow, norwegian, fox, __anon53, kools), [house(yellow, norwegian, fox, __anon53, kools), house(blue, ukrainian, __anon49, tea, chesterfields), house(red, english, snail, milk, old_gold), house(ivory, spanish, dog, __anon23, __anon24), house(green, __anon25, __anon26, coffee, __anon28)])),
            by(rule("zebra.pl", clause(8))),
            bindings([binding("A", house(blue, ukrainian, __anon49, tea, chesterfields)), binding("B", house(yellow, norwegian, fox, __anon53, kools)), binding("List", [house(yellow, norwegian, fox, __anon53, kools), house(blue, ukrainian, __anon49, tea, chesterfields), house(red, english, snail, milk, old_gold), house(ivory, spanish, dog, __anon23, __anon24), house(green, __anon25, __anon26, coffee, __anon28)])]),
            uses([
              proof(
                goal(next_to(house(yellow, norwegian, fox, __anon53, kools), house(blue, ukrainian, __anon49, tea, chesterfields), [house(yellow, norwegian, fox, __anon53, kools), house(blue, ukrainian, __anon49, tea, chesterfields), house(red, english, snail, milk, old_gold), house(ivory, spanish, dog, __anon23, __anon24), house(green, __anon25, __anon26, coffee, __anon28)])),
                by(fact("zebra.pl", clause(9))),
                bindings([binding("X", house(yellow, norwegian, fox, __anon53, kools)), binding("Y", house(blue, ukrainian, __anon49, tea, chesterfields)), binding("__anon79", [house(red, english, snail, milk, old_gold), house(ivory, spanish, dog, __anon23, __anon24), house(green, __anon25, __anon26, coffee, __anon28)])])
              )
            ])
          ),
          proof(
            goal(adjacent(house(yellow, norwegian, fox, __anon58, kools), house(blue, ukrainian, horse, tea, chesterfields), [house(yellow, norwegian, fox, __anon58, kools), house(blue, ukrainian, horse, tea, chesterfields), house(red, english, snail, milk, old_gold), house(ivory, spanish, dog, __anon23, __anon24), house(green, __anon25, __anon26, coffee, __anon28)])),
            by(rule("zebra.pl", clause(7))),
            bindings([binding("A", house(yellow, norwegian, fox, __anon58, kools)), binding("B", house(blue, ukrainian, horse, tea, chesterfields)), binding("List", [house(yellow, norwegian, fox, __anon58, kools), house(blue, ukrainian, horse, tea, chesterfields), house(red, english, snail, milk, old_gold), house(ivory, spanish, dog, __anon23, __anon24), house(green, __anon25, __anon26, coffee, __anon28)])]),
            uses([
              proof(
                goal(next_to(house(yellow, norwegian, fox, __anon58, kools), house(blue, ukrainian, horse, tea, chesterfields), [house(yellow, norwegian, fox, __anon58, kools), house(blue, ukrainian, horse, tea, chesterfields), house(red, english, snail, milk, old_gold), house(ivory, spanish, dog, __anon23, __anon24), house(green, __anon25, __anon26, coffee, __anon28)])),
                by(fact("zebra.pl", clause(9))),
                bindings([binding("X", house(yellow, norwegian, fox, __anon58, kools)), binding("Y", house(blue, ukrainian, horse, tea, chesterfields)), binding("__anon79", [house(red, english, snail, milk, old_gold), house(ivory, spanish, dog, __anon23, __anon24), house(green, __anon25, __anon26, coffee, __anon28)])])
              )
            ])
          ),
          proof(
            goal(member(house(ivory, spanish, dog, orange_juice, lucky_strike), [house(yellow, norwegian, fox, __anon58, kools), house(blue, ukrainian, horse, tea, chesterfields), house(red, english, snail, milk, old_gold), house(ivory, spanish, dog, orange_juice, lucky_strike), house(green, __anon25, __anon26, coffee, __anon28)])),
            by(builtin(member, 2))
          ),
          proof(
            goal(member(house(green, japanese, __anon26, coffee, parliaments), [house(yellow, norwegian, fox, __anon58, kools), house(blue, ukrainian, horse, tea, chesterfields), house(red, english, snail, milk, old_gold), house(ivory, spanish, dog, orange_juice, lucky_strike), house(green, japanese, __anon26, coffee, parliaments)])),
            by(builtin(member, 2))
          ),
          proof(
            goal(member(house(yellow, norwegian, fox, water, kools), [house(yellow, norwegian, fox, water, kools), house(blue, ukrainian, horse, tea, chesterfields), house(red, english, snail, milk, old_gold), house(ivory, spanish, dog, orange_juice, lucky_strike), house(green, japanese, __anon26, coffee, parliaments)])),
            by(builtin(member, 2))
          ),
          proof(
            goal(member(house(green, japanese, zebra, coffee, parliaments), [house(yellow, norwegian, fox, water, kools), house(blue, ukrainian, horse, tea, chesterfields), house(red, english, snail, milk, old_gold), house(ivory, spanish, dog, orange_juice, lucky_strike), house(green, japanese, zebra, coffee, parliaments)])),
            by(builtin(member, 2))
          )
        ])
      )
    ])
  )
).

solved(zebraPuzzle, true).
why(
  solved(zebraPuzzle, true),
  proof(
    goal(solved(zebraPuzzle, true)),
    by(rule("zebra.pl", clause(13))),
    uses([
      proof(
        goal(zebra(norwegian, japanese)),
        by(rule("zebra.pl", clause(4))),
        bindings([binding("WaterDrinker", norwegian), binding("ZebraOwner", japanese), binding("Houses", [house(yellow, norwegian, fox, water, kools), house(blue, ukrainian, horse, tea, chesterfields), house(red, english, snail, milk, old_gold), house(ivory, spanish, dog, orange_juice, lucky_strike), house(green, japanese, zebra, coffee, parliaments)]), binding("__anon0", house(yellow, norwegian, fox, water, kools)), binding("__anon1", house(blue, ukrainian, horse, tea, chesterfields)), binding("__anon2", house(red, english, snail, milk, old_gold)), binding("__anon3", house(ivory, spanish, dog, orange_juice, lucky_strike)), binding("__anon4", house(green, japanese, zebra, coffee, parliaments)), binding("__anon5", yellow), binding("__anon6", fox), binding("__anon7", water), binding("__anon8", kools), binding("__anon9", red), binding("__anon10", english), binding("__anon11", snail), binding("__anon12", old_gold), binding("__anon13", yellow), binding("__anon14", fox), binding("__anon15", water), binding("__anon16", kools), binding("__anon17", ukrainian), binding("__anon18", horse), binding("__anon19", tea), binding("__anon20", chesterfields), binding("__anon21", spanish), binding("__anon22", dog), binding("__anon23", orange_juice), binding("__anon24", lucky_strike), binding("__anon25", japanese), binding("__anon26", zebra), binding("__anon27", coffee), binding("__anon28", parliaments), binding("__anon29", snail), binding("__anon30", milk), binding("__anon31", old_gold), binding("__anon32", japanese), binding("__anon33", zebra), binding("__anon34", parliaments), binding("__anon35", norwegian), binding("__anon36", fox), binding("__anon37", water), binding("__anon38", ivory), binding("__anon39", orange_juice), binding("__anon40", lucky_strike), binding("__anon41", blue), binding("__anon42", horse), binding("__anon43", chesterfields), binding("__anon44", red), binding("__anon45", english), binding("__anon46", milk), binding("__anon47", blue), binding("__anon48", ukrainian), binding("__anon49", horse), binding("__anon50", tea), binding("__anon51", yellow), binding("__anon52", norwegian), binding("__anon53", water), binding("__anon54", kools), binding("__anon55", yellow), binding("__anon56", norwegian), binding("__anon57", fox), binding("__anon58", water), binding("__anon59", blue), binding("__anon60", ukrainian), binding("__anon61", tea), binding("__anon62", chesterfields), binding("__anon63", ivory), binding("__anon64", spanish), binding("__anon65", dog), binding("__anon66", green), binding("__anon67", zebra), binding("__anon68", coffee), binding("__anon69", yellow), binding("__anon70", fox), binding("__anon71", kools), binding("__anon72", green), binding("__anon73", coffee), binding("__anon74", parliaments)]),
        uses([
          proof(
            goal(eq([__anon0, __anon1, __anon2, __anon3, __anon4], [__anon0, __anon1, __anon2, __anon3, __anon4])),
            by(builtin(eq, 2))
          ),
          proof(
            goal(first([house(__anon5, norwegian, __anon6, __anon7, __anon8), __anon1, __anon2, __anon3, __anon4], house(__anon5, norwegian, __anon6, __anon7, __anon8))),
            by(fact("zebra.pl", clause(5))),
            bindings([binding("X", house(__anon5, norwegian, __anon6, __anon7, __anon8)), binding("__anon75", [__anon1, __anon2, __anon3, __anon4])])
          ),
          proof(
            goal(third([house(__anon5, norwegian, __anon6, __anon7, __anon8), __anon77, house(__anon9, __anon10, __anon11, milk, __anon12), __anon3, __anon4], house(__anon9, __anon10, __anon11, milk, __anon12))),
            by(fact("zebra.pl", clause(6))),
            bindings([binding("__anon76", house(__anon5, norwegian, __anon6, __anon7, __anon8)), binding("X", house(__anon9, __anon10, __anon11, milk, __anon12)), binding("__anon78", [__anon3, __anon4])])
          ),
          proof(
            goal(adjacent(house(__anon13, norwegian, __anon14, __anon15, __anon16), house(blue, __anon17, __anon18, __anon19, __anon20), [house(__anon13, norwegian, __anon14, __anon15, __anon16), house(blue, __anon17, __anon18, __anon19, __anon20), house(__anon9, __anon10, __anon11, milk, __anon12), __anon3, __anon4])),
            by(rule("zebra.pl", clause(7))),
            bindings([binding("A", house(__anon13, norwegian, __anon14, __anon15, __anon16)), binding("B", house(blue, __anon17, __anon18, __anon19, __anon20)), binding("List", [house(__anon13, norwegian, __anon14, __anon15, __anon16), house(blue, __anon17, __anon18, __anon19, __anon20), house(__anon9, __anon10, __anon11, milk, __anon12), __anon3, __anon4])]),
            uses([
              proof(
                goal(next_to(house(__anon13, norwegian, __anon14, __anon15, __anon16), house(blue, __anon17, __anon18, __anon19, __anon20), [house(__anon13, norwegian, __anon14, __anon15, __anon16), house(blue, __anon17, __anon18, __anon19, __anon20), house(__anon9, __anon10, __anon11, milk, __anon12), __anon3, __anon4])),
                by(fact("zebra.pl", clause(9))),
                bindings([binding("X", house(__anon13, norwegian, __anon14, __anon15, __anon16)), binding("Y", house(blue, __anon17, __anon18, __anon19, __anon20)), binding("__anon79", [house(__anon9, __anon10, __anon11, milk, __anon12), __anon3, __anon4])])
              )
            ])
          ),
          proof(
            goal(next_to(house(ivory, __anon21, __anon22, __anon23, __anon24), house(green, __anon25, __anon26, __anon27, __anon28), [house(__anon13, norwegian, __anon14, __anon15, __anon16), house(blue, __anon17, __anon18, __anon19, __anon20), house(__anon9, __anon10, __anon11, milk, __anon12), house(ivory, __anon21, __anon22, __anon23, __anon24), house(green, __anon25, __anon26, __anon27, __anon28)])),
            by(rule("zebra.pl", clause(10))),
            bindings([binding("X", house(ivory, __anon21, __anon22, __anon23, __anon24)), binding("Y", house(green, __anon25, __anon26, __anon27, __anon28)), binding("__anon80", house(__anon13, norwegian, __anon14, __anon15, __anon16)), binding("Zs", [house(blue, __anon17, __anon18, __anon19, __anon20), house(__anon9, __anon10, __anon11, milk, __anon12), house(ivory, __anon21, __anon22, __anon23, __anon24), house(green, __anon25, __anon26, __anon27, __anon28)])]),
            uses([
              proof(
                goal(next_to(house(ivory, __anon21, __anon22, __anon23, __anon24), house(green, __anon25, __anon26, __anon27, __anon28), [house(blue, __anon17, __anon18, __anon19, __anon20), house(__anon9, __anon10, __anon11, milk, __anon12), house(ivory, __anon21, __anon22, __anon23, __anon24), house(green, __anon25, __anon26, __anon27, __anon28)])),
                by(rule("zebra.pl", clause(10))),
                bindings([binding("X", house(ivory, __anon21, __anon22, __anon23, __anon24)), binding("Y", house(green, __anon25, __anon26, __anon27, __anon28)), binding("__anon80", house(blue, __anon17, __anon18, __anon19, __anon20)), binding("Zs", [house(__anon9, __anon10, __anon11, milk, __anon12), house(ivory, __anon21, __anon22, __anon23, __anon24), house(green, __anon25, __anon26, __anon27, __anon28)])]),
                uses([
                  proof(
                    goal(next_to(house(ivory, __anon21, __anon22, __anon23, __anon24), house(green, __anon25, __anon26, __anon27, __anon28), [house(__anon9, __anon10, __anon11, milk, __anon12), house(ivory, __anon21, __anon22, __anon23, __anon24), house(green, __anon25, __anon26, __anon27, __anon28)])),
                    by(rule("zebra.pl", clause(10))),
                    bindings([binding("X", house(ivory, __anon21, __anon22, __anon23, __anon24)), binding("Y", house(green, __anon25, __anon26, __anon27, __anon28)), binding("__anon80", house(__anon9, __anon10, __anon11, milk, __anon12)), binding("Zs", [house(ivory, __anon21, __anon22, __anon23, __anon24), house(green, __anon25, __anon26, __anon27, __anon28)])]),
                    uses([
                      proof(
                        goal(next_to(house(ivory, __anon21, __anon22, __anon23, __anon24), house(green, __anon25, __anon26, __anon27, __anon28), [house(ivory, __anon21, __anon22, __anon23, __anon24), house(green, __anon25, __anon26, __anon27, __anon28)])),
                        by(fact("zebra.pl", clause(9))),
                        bindings([binding("X", house(ivory, __anon21, __anon22, __anon23, __anon24)), binding("Y", house(green, __anon25, __anon26, __anon27, __anon28)), binding("__anon79", [])])
                      )
                    ])
                  )
                ])
              )
            ])
          ),
          proof(
            goal(member(house(red, english, __anon11, milk, __anon12), [house(__anon13, norwegian, __anon14, __anon15, __anon16), house(blue, __anon17, __anon18, __anon19, __anon20), house(red, english, __anon11, milk, __anon12), house(ivory, __anon21, __anon22, __anon23, __anon24), house(green, __anon25, __anon26, __anon27, __anon28)])),
            by(builtin(member, 2))
          ),
          proof(
            goal(member(house(green, __anon25, __anon26, coffee, __anon28), [house(__anon13, norwegian, __anon14, __anon15, __anon16), house(blue, __anon17, __anon18, __anon19, __anon20), house(red, english, __anon11, milk, __anon12), house(ivory, __anon21, __anon22, __anon23, __anon24), house(green, __anon25, __anon26, coffee, __anon28)])),
            by(builtin(member, 2))
          ),
          proof(
            goal(member(house(yellow, norwegian, __anon14, __anon15, kools), [house(yellow, norwegian, __anon14, __anon15, kools), house(blue, __anon17, __anon18, __anon19, __anon20), house(red, english, __anon11, milk, __anon12), house(ivory, __anon21, __anon22, __anon23, __anon24), house(green, __anon25, __anon26, coffee, __anon28)])),
            by(builtin(member, 2))
          ),
          proof(
            goal(member(house(ivory, spanish, dog, __anon23, __anon24), [house(yellow, norwegian, __anon14, __anon15, kools), house(blue, __anon17, __anon18, __anon19, __anon20), house(red, english, __anon11, milk, __anon12), house(ivory, spanish, dog, __anon23, __anon24), house(green, __anon25, __anon26, coffee, __anon28)])),
            by(builtin(member, 2))
          ),
          proof(
            goal(member(house(blue, ukrainian, __anon18, tea, __anon20), [house(yellow, norwegian, __anon14, __anon15, kools), house(blue, ukrainian, __anon18, tea, __anon20), house(red, english, __anon11, milk, __anon12), house(ivory, spanish, dog, __anon23, __anon24), house(green, __anon25, __anon26, coffee, __anon28)])),
            by(builtin(member, 2))
          ),
          proof(
            goal(member(house(red, english, snail, milk, old_gold), [house(yellow, norwegian, __anon14, __anon15, kools), house(blue, ukrainian, __anon18, tea, __anon20), house(red, english, snail, milk, old_gold), house(ivory, spanish, dog, __anon23, __anon24), house(green, __anon25, __anon26, coffee, __anon28)])),
            by(builtin(member, 2))
          ),
          proof(
            goal(adjacent(house(blue, ukrainian, __anon49, tea, chesterfields), house(yellow, norwegian, fox, __anon53, kools), [house(yellow, norwegian, fox, __anon53, kools), house(blue, ukrainian, __anon49, tea, chesterfields), house(red, english, snail, milk, old_gold), house(ivory, spanish, dog, __anon23, __anon24), house(green, __anon25, __anon26, coffee, __anon28)])),
            by(rule("zebra.pl", clause(8))),
            bindings([binding("A", house(blue, ukrainian, __anon49, tea, chesterfields)), binding("B", house(yellow, norwegian, fox, __anon53, kools)), binding("List", [house(yellow, norwegian, fox, __anon53, kools), house(blue, ukrainian, __anon49, tea, chesterfields), house(red, english, snail, milk, old_gold), house(ivory, spanish, dog, __anon23, __anon24), house(green, __anon25, __anon26, coffee, __anon28)])]),
            uses([
              proof(
                goal(next_to(house(yellow, norwegian, fox, __anon53, kools), house(blue, ukrainian, __anon49, tea, chesterfields), [house(yellow, norwegian, fox, __anon53, kools), house(blue, ukrainian, __anon49, tea, chesterfields), house(red, english, snail, milk, old_gold), house(ivory, spanish, dog, __anon23, __anon24), house(green, __anon25, __anon26, coffee, __anon28)])),
                by(fact("zebra.pl", clause(9))),
                bindings([binding("X", house(yellow, norwegian, fox, __anon53, kools)), binding("Y", house(blue, ukrainian, __anon49, tea, chesterfields)), binding("__anon79", [house(red, english, snail, milk, old_gold), house(ivory, spanish, dog, __anon23, __anon24), house(green, __anon25, __anon26, coffee, __anon28)])])
              )
            ])
          ),
          proof(
            goal(adjacent(house(yellow, norwegian, fox, __anon58, kools), house(blue, ukrainian, horse, tea, chesterfields), [house(yellow, norwegian, fox, __anon58, kools), house(blue, ukrainian, horse, tea, chesterfields), house(red, english, snail, milk, old_gold), house(ivory, spanish, dog, __anon23, __anon24), house(green, __anon25, __anon26, coffee, __anon28)])),
            by(rule("zebra.pl", clause(7))),
            bindings([binding("A", house(yellow, norwegian, fox, __anon58, kools)), binding("B", house(blue, ukrainian, horse, tea, chesterfields)), binding("List", [house(yellow, norwegian, fox, __anon58, kools), house(blue, ukrainian, horse, tea, chesterfields), house(red, english, snail, milk, old_gold), house(ivory, spanish, dog, __anon23, __anon24), house(green, __anon25, __anon26, coffee, __anon28)])]),
            uses([
              proof(
                goal(next_to(house(yellow, norwegian, fox, __anon58, kools), house(blue, ukrainian, horse, tea, chesterfields), [house(yellow, norwegian, fox, __anon58, kools), house(blue, ukrainian, horse, tea, chesterfields), house(red, english, snail, milk, old_gold), house(ivory, spanish, dog, __anon23, __anon24), house(green, __anon25, __anon26, coffee, __anon28)])),
                by(fact("zebra.pl", clause(9))),
                bindings([binding("X", house(yellow, norwegian, fox, __anon58, kools)), binding("Y", house(blue, ukrainian, horse, tea, chesterfields)), binding("__anon79", [house(red, english, snail, milk, old_gold), house(ivory, spanish, dog, __anon23, __anon24), house(green, __anon25, __anon26, coffee, __anon28)])])
              )
            ])
          ),
          proof(
            goal(member(house(ivory, spanish, dog, orange_juice, lucky_strike), [house(yellow, norwegian, fox, __anon58, kools), house(blue, ukrainian, horse, tea, chesterfields), house(red, english, snail, milk, old_gold), house(ivory, spanish, dog, orange_juice, lucky_strike), house(green, __anon25, __anon26, coffee, __anon28)])),
            by(builtin(member, 2))
          ),
          proof(
            goal(member(house(green, japanese, __anon26, coffee, parliaments), [house(yellow, norwegian, fox, __anon58, kools), house(blue, ukrainian, horse, tea, chesterfields), house(red, english, snail, milk, old_gold), house(ivory, spanish, dog, orange_juice, lucky_strike), house(green, japanese, __anon26, coffee, parliaments)])),
            by(builtin(member, 2))
          ),
          proof(
            goal(member(house(yellow, norwegian, fox, water, kools), [house(yellow, norwegian, fox, water, kools), house(blue, ukrainian, horse, tea, chesterfields), house(red, english, snail, milk, old_gold), house(ivory, spanish, dog, orange_juice, lucky_strike), house(green, japanese, __anon26, coffee, parliaments)])),
            by(builtin(member, 2))
          ),
          proof(
            goal(member(house(green, japanese, zebra, coffee, parliaments), [house(yellow, norwegian, fox, water, kools), house(blue, ukrainian, horse, tea, chesterfields), house(red, english, snail, milk, old_gold), house(ivory, spanish, dog, orange_juice, lucky_strike), house(green, japanese, zebra, coffee, parliaments)])),
            by(builtin(member, 2))
          )
        ])
      )
    ])
  )
).

