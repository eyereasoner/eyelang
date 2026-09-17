# Eyelang result format 1
query(1, at(19, 1), [call(score(?v0, ?v1))], [binding("disease", ?v0), binding("score", ?v1)]).
result(1, complete, 4).
answer(1, [binding("disease", COVID19), binding("score", 0.0015470000000000002)]).
why(1, [binding("disease", COVID19), binding("score", 0.0015470000000000002)], 9).
answer(1, [binding("disease", Influenza), binding("score", 0.00004800000000000001)]).
why(1, [binding("disease", Influenza), binding("score", 0.00004800000000000001)], 10).
answer(1, [binding("disease", AllergicRhinitis), binding("score", 7.500000000000003e-7)]).
why(1, [binding("disease", AllergicRhinitis), binding("score", 7.500000000000003e-7)], 11).
answer(1, [binding("disease", BacterialPneumonia), binding("score", 0.00004787999999999999)]).
why(1, [binding("disease", BacterialPneumonia), binding("score", 0.00004787999999999999)], 12).
query(2, at(20, 1), [call(screened_in(?v0))], [binding("disease", ?v0)]).
result(2, complete, 1).
answer(2, [binding("disease", COVID19)]).
why(2, [binding("disease", COVID19)], 22).
query(3, at(21, 1), [call(rank(?v0, ?v1))], [binding("disease", ?v0), binding("rank", ?v1)]).
result(3, complete, 4).
answer(3, [binding("disease", COVID19), binding("rank", "high")]).
why(3, [binding("disease", COVID19), binding("rank", "high")], 35).
answer(3, [binding("disease", Influenza), binding("rank", "low")]).
why(3, [binding("disease", Influenza), binding("rank", "low")], 36).
answer(3, [binding("disease", AllergicRhinitis), binding("rank", "low")]).
why(3, [binding("disease", AllergicRhinitis), binding("rank", "low")], 37).
answer(3, [binding("disease", BacterialPneumonia), binding("rank", "low")]).
why(3, [binding("disease", BacterialPneumonia), binding("rank", "low")], 38).
proof(1, model(COVID19, 0.05, 0.7, 0.65, 0.4, 0.85, 0.2), rule(1, at(6, 1)), []).
proof(2, model(Influenza, 0.03, 0.8, 0.5, 0.05, 0.8, 0.1), rule(2, at(7, 1)), []).
proof(3, model(AllergicRhinitis, 0.1, 0.05, 0.15, 0.1, 0.2, 0.05), rule(3, at(8, 1)), []).
proof(4, model(BacterialPneumonia, 0.01, 0.7, 0.6, 0.02, 0.95, 0.6), rule(4, at(9, 1)), []).
proof(5, score(COVID19, 0.0015470000000000002), rule(5, at(11, 1)), [uses(1, model(COVID19, 0.05, 0.7, 0.65, 0.4, 0.85, 0.2)), calculated(0.0015470000000000002, binary("*", binary("*", binary("*", binary("*", binary("*", value(0.05), value(0.7)), value(0.65)), value(0.4)), value(0.85)), value(0.2)))]).
proof(6, score(Influenza, 0.00004800000000000001), rule(5, at(11, 1)), [uses(2, model(Influenza, 0.03, 0.8, 0.5, 0.05, 0.8, 0.1)), calculated(0.00004800000000000001, binary("*", binary("*", binary("*", binary("*", binary("*", value(0.03), value(0.8)), value(0.5)), value(0.05)), value(0.8)), value(0.1)))]).
proof(7, score(AllergicRhinitis, 7.500000000000003e-7), rule(5, at(11, 1)), [uses(3, model(AllergicRhinitis, 0.1, 0.05, 0.15, 0.1, 0.2, 0.05)), calculated(7.500000000000003e-7, binary("*", binary("*", binary("*", binary("*", binary("*", value(0.1), value(0.05)), value(0.15)), value(0.1)), value(0.2)), value(0.05)))]).
proof(8, score(BacterialPneumonia, 0.00004787999999999999), rule(5, at(11, 1)), [uses(4, model(BacterialPneumonia, 0.01, 0.7, 0.6, 0.02, 0.95, 0.6)), calculated(0.00004787999999999999, binary("*", binary("*", binary("*", binary("*", binary("*", value(0.01), value(0.7)), value(0.6)), value(0.02)), value(0.95)), value(0.6)))]).
proof(9, solution([COVID19, 0.0015470000000000002]), query, [uses(5, score(COVID19, 0.0015470000000000002))]).
proof(10, solution([Influenza, 0.00004800000000000001]), query, [uses(6, score(Influenza, 0.00004800000000000001))]).
proof(11, solution([AllergicRhinitis, 7.500000000000003e-7]), query, [uses(7, score(AllergicRhinitis, 7.500000000000003e-7))]).
proof(12, solution([BacterialPneumonia, 0.00004787999999999999]), query, [uses(8, score(BacterialPneumonia, 0.00004787999999999999))]).
proof(13, model(COVID19, 0.05, 0.7, 0.65, 0.4, 0.85, 0.2), rule(1, at(6, 1)), []).
proof(14, model(Influenza, 0.03, 0.8, 0.5, 0.05, 0.8, 0.1), rule(2, at(7, 1)), []).
proof(15, model(AllergicRhinitis, 0.1, 0.05, 0.15, 0.1, 0.2, 0.05), rule(3, at(8, 1)), []).
proof(16, model(BacterialPneumonia, 0.01, 0.7, 0.6, 0.02, 0.95, 0.6), rule(4, at(9, 1)), []).
proof(17, score(COVID19, 0.0015470000000000002), rule(5, at(11, 1)), [uses(13, model(COVID19, 0.05, 0.7, 0.65, 0.4, 0.85, 0.2)), calculated(0.0015470000000000002, binary("*", binary("*", binary("*", binary("*", binary("*", value(0.05), value(0.7)), value(0.65)), value(0.4)), value(0.85)), value(0.2)))]).
proof(18, score(Influenza, 0.00004800000000000001), rule(5, at(11, 1)), [uses(14, model(Influenza, 0.03, 0.8, 0.5, 0.05, 0.8, 0.1)), calculated(0.00004800000000000001, binary("*", binary("*", binary("*", binary("*", binary("*", value(0.03), value(0.8)), value(0.5)), value(0.05)), value(0.8)), value(0.1)))]).
proof(19, score(AllergicRhinitis, 7.500000000000003e-7), rule(5, at(11, 1)), [uses(15, model(AllergicRhinitis, 0.1, 0.05, 0.15, 0.1, 0.2, 0.05)), calculated(7.500000000000003e-7, binary("*", binary("*", binary("*", binary("*", binary("*", value(0.1), value(0.05)), value(0.15)), value(0.1)), value(0.2)), value(0.05)))]).
proof(20, score(BacterialPneumonia, 0.00004787999999999999), rule(5, at(11, 1)), [uses(16, model(BacterialPneumonia, 0.01, 0.7, 0.6, 0.02, 0.95, 0.6)), calculated(0.00004787999999999999, binary("*", binary("*", binary("*", binary("*", binary("*", value(0.01), value(0.7)), value(0.6)), value(0.02)), value(0.95)), value(0.6)))]).
proof(21, screened_in(COVID19), rule(6, at(14, 1)), [uses(17, score(COVID19, 0.0015470000000000002)), compared(">=", 0.0015470000000000002, 0.001)]).
proof(22, solution([COVID19]), query, [uses(21, screened_in(COVID19))]).
proof(23, model(COVID19, 0.05, 0.7, 0.65, 0.4, 0.85, 0.2), rule(1, at(6, 1)), []).
proof(24, model(Influenza, 0.03, 0.8, 0.5, 0.05, 0.8, 0.1), rule(2, at(7, 1)), []).
proof(25, model(AllergicRhinitis, 0.1, 0.05, 0.15, 0.1, 0.2, 0.05), rule(3, at(8, 1)), []).
proof(26, model(BacterialPneumonia, 0.01, 0.7, 0.6, 0.02, 0.95, 0.6), rule(4, at(9, 1)), []).
proof(27, score(COVID19, 0.0015470000000000002), rule(5, at(11, 1)), [uses(23, model(COVID19, 0.05, 0.7, 0.65, 0.4, 0.85, 0.2)), calculated(0.0015470000000000002, binary("*", binary("*", binary("*", binary("*", binary("*", value(0.05), value(0.7)), value(0.65)), value(0.4)), value(0.85)), value(0.2)))]).
proof(28, score(Influenza, 0.00004800000000000001), rule(5, at(11, 1)), [uses(24, model(Influenza, 0.03, 0.8, 0.5, 0.05, 0.8, 0.1)), calculated(0.00004800000000000001, binary("*", binary("*", binary("*", binary("*", binary("*", value(0.03), value(0.8)), value(0.5)), value(0.05)), value(0.8)), value(0.1)))]).
proof(29, score(AllergicRhinitis, 7.500000000000003e-7), rule(5, at(11, 1)), [uses(25, model(AllergicRhinitis, 0.1, 0.05, 0.15, 0.1, 0.2, 0.05)), calculated(7.500000000000003e-7, binary("*", binary("*", binary("*", binary("*", binary("*", value(0.1), value(0.05)), value(0.15)), value(0.1)), value(0.2)), value(0.05)))]).
proof(30, score(BacterialPneumonia, 0.00004787999999999999), rule(5, at(11, 1)), [uses(26, model(BacterialPneumonia, 0.01, 0.7, 0.6, 0.02, 0.95, 0.6)), calculated(0.00004787999999999999, binary("*", binary("*", binary("*", binary("*", binary("*", value(0.01), value(0.7)), value(0.6)), value(0.02)), value(0.95)), value(0.6)))]).
proof(31, rank(COVID19, "high"), rule(7, at(15, 1)), [uses(27, score(COVID19, 0.0015470000000000002)), compared(">=", 0.0015470000000000002, 0.0015)]).
proof(32, rank(Influenza, "low"), rule(9, at(17, 1)), [uses(28, score(Influenza, 0.00004800000000000001)), compared("<", 0.00004800000000000001, 0.0005)]).
proof(33, rank(AllergicRhinitis, "low"), rule(9, at(17, 1)), [uses(29, score(AllergicRhinitis, 7.500000000000003e-7)), compared("<", 7.500000000000003e-7, 0.0005)]).
proof(34, rank(BacterialPneumonia, "low"), rule(9, at(17, 1)), [uses(30, score(BacterialPneumonia, 0.00004787999999999999)), compared("<", 0.00004787999999999999, 0.0005)]).
proof(35, solution([COVID19, "high"]), query, [uses(31, rank(COVID19, "high"))]).
proof(36, solution([Influenza, "low"]), query, [uses(32, rank(Influenza, "low"))]).
proof(37, solution([AllergicRhinitis, "low"]), query, [uses(33, rank(AllergicRhinitis, "low"))]).
proof(38, solution([BacterialPneumonia, "low"]), query, [uses(34, rank(BacterialPneumonia, "low"))]).
