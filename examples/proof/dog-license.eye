# Eyelit result format 1
query(1, at(19, 1), [call(must_have(?v0, ?v1))], [binding("person", ?v0), binding("license", ?v1)]).
result(1, complete, 1).
answer(1, [binding("person", alice), binding("license", dogLicense)]).
why(1, [binding("person", alice), binding("license", dogLicense)], 69).
query(2, at(20, 1), [call(dog_count(?v0, ?v1))], [binding("person", ?v0), binding("count", ?v1)]).
result(2, complete, 2).
answer(2, [binding("person", alice), binding("count", 5)]).
why(2, [binding("person", alice), binding("count", 5)], 137).
answer(2, [binding("person", bob), binding("count", 2)]).
why(2, [binding("person", bob), binding("count", 2)], 138).
proof(1, has_dog(alice, dog1), rule(1, at(6, 1)), []).
proof(2, has_dog(alice, dog2), rule(2, at(7, 1)), []).
proof(3, has_dog(alice, dog3), rule(3, at(8, 1)), []).
proof(4, has_dog(alice, dog4), rule(4, at(9, 1)), []).
proof(5, has_dog(alice, dog5), rule(5, at(10, 1)), []).
proof(6, has_dog(bob, dog6), rule(6, at(11, 1)), []).
proof(7, has_dog(bob, dog7), rule(7, at(12, 1)), []).
proof(8, has_dog(alice, dog1), rule(1, at(6, 1)), []).
proof(9, has_dog(alice, dog2), rule(2, at(7, 1)), []).
proof(10, has_dog(alice, dog3), rule(3, at(8, 1)), []).
proof(11, has_dog(alice, dog4), rule(4, at(9, 1)), []).
proof(12, has_dog(alice, dog5), rule(5, at(10, 1)), []).
proof(13, solution([dog1]), query, [uses(8, has_dog(alice, dog1))]).
proof(14, solution([dog2]), query, [uses(9, has_dog(alice, dog2))]).
proof(15, solution([dog3]), query, [uses(10, has_dog(alice, dog3))]).
proof(16, solution([dog4]), query, [uses(11, has_dog(alice, dog4))]).
proof(17, solution([dog5]), query, [uses(12, has_dog(alice, dog5))]).
proof(18, dog_count(alice, 5), rule(8, at(14, 1)), [uses(1, has_dog(alice, dog1)), collected([dog1, dog2, dog3, dog4, dog5], ?v0, [call(has_dog(alice, ?v0))], [13, 14, 15, 16, 17], complete), calculated(5, function("count", [value([dog1, dog2, dog3, dog4, dog5])]))]).
proof(19, has_dog(alice, dog1), rule(1, at(6, 1)), []).
proof(20, has_dog(alice, dog2), rule(2, at(7, 1)), []).
proof(21, has_dog(alice, dog3), rule(3, at(8, 1)), []).
proof(22, has_dog(alice, dog4), rule(4, at(9, 1)), []).
proof(23, has_dog(alice, dog5), rule(5, at(10, 1)), []).
proof(24, solution([dog1]), query, [uses(19, has_dog(alice, dog1))]).
proof(25, solution([dog2]), query, [uses(20, has_dog(alice, dog2))]).
proof(26, solution([dog3]), query, [uses(21, has_dog(alice, dog3))]).
proof(27, solution([dog4]), query, [uses(22, has_dog(alice, dog4))]).
proof(28, solution([dog5]), query, [uses(23, has_dog(alice, dog5))]).
proof(29, has_dog(alice, dog1), rule(1, at(6, 1)), []).
proof(30, has_dog(alice, dog2), rule(2, at(7, 1)), []).
proof(31, has_dog(alice, dog3), rule(3, at(8, 1)), []).
proof(32, has_dog(alice, dog4), rule(4, at(9, 1)), []).
proof(33, has_dog(alice, dog5), rule(5, at(10, 1)), []).
proof(34, solution([dog1]), query, [uses(29, has_dog(alice, dog1))]).
proof(35, solution([dog2]), query, [uses(30, has_dog(alice, dog2))]).
proof(36, solution([dog3]), query, [uses(31, has_dog(alice, dog3))]).
proof(37, solution([dog4]), query, [uses(32, has_dog(alice, dog4))]).
proof(38, solution([dog5]), query, [uses(33, has_dog(alice, dog5))]).
proof(39, has_dog(alice, dog1), rule(1, at(6, 1)), []).
proof(40, has_dog(alice, dog2), rule(2, at(7, 1)), []).
proof(41, has_dog(alice, dog3), rule(3, at(8, 1)), []).
proof(42, has_dog(alice, dog4), rule(4, at(9, 1)), []).
proof(43, has_dog(alice, dog5), rule(5, at(10, 1)), []).
proof(44, solution([dog1]), query, [uses(39, has_dog(alice, dog1))]).
proof(45, solution([dog2]), query, [uses(40, has_dog(alice, dog2))]).
proof(46, solution([dog3]), query, [uses(41, has_dog(alice, dog3))]).
proof(47, solution([dog4]), query, [uses(42, has_dog(alice, dog4))]).
proof(48, solution([dog5]), query, [uses(43, has_dog(alice, dog5))]).
proof(49, has_dog(alice, dog1), rule(1, at(6, 1)), []).
proof(50, has_dog(alice, dog2), rule(2, at(7, 1)), []).
proof(51, has_dog(alice, dog3), rule(3, at(8, 1)), []).
proof(52, has_dog(alice, dog4), rule(4, at(9, 1)), []).
proof(53, has_dog(alice, dog5), rule(5, at(10, 1)), []).
proof(54, solution([dog1]), query, [uses(49, has_dog(alice, dog1))]).
proof(55, solution([dog2]), query, [uses(50, has_dog(alice, dog2))]).
proof(56, solution([dog3]), query, [uses(51, has_dog(alice, dog3))]).
proof(57, solution([dog4]), query, [uses(52, has_dog(alice, dog4))]).
proof(58, solution([dog5]), query, [uses(53, has_dog(alice, dog5))]).
proof(59, has_dog(bob, dog6), rule(6, at(11, 1)), []).
proof(60, has_dog(bob, dog7), rule(7, at(12, 1)), []).
proof(61, solution([dog6]), query, [uses(59, has_dog(bob, dog6))]).
proof(62, solution([dog7]), query, [uses(60, has_dog(bob, dog7))]).
proof(63, dog_count(bob, 2), rule(8, at(14, 1)), [uses(6, has_dog(bob, dog6)), collected([dog6, dog7], ?v0, [call(has_dog(bob, ?v0))], [61, 62], complete), calculated(2, function("count", [value([dog6, dog7])]))]).
proof(64, has_dog(bob, dog6), rule(6, at(11, 1)), []).
proof(65, has_dog(bob, dog7), rule(7, at(12, 1)), []).
proof(66, solution([dog6]), query, [uses(64, has_dog(bob, dog6))]).
proof(67, solution([dog7]), query, [uses(65, has_dog(bob, dog7))]).
proof(68, must_have(alice, dogLicense), rule(9, at(17, 1)), [uses(18, dog_count(alice, 5)), compared(">", 5, 4)]).
proof(69, solution([alice, dogLicense]), query, [uses(68, must_have(alice, dogLicense))]).
proof(70, has_dog(alice, dog1), rule(1, at(6, 1)), []).
proof(71, has_dog(alice, dog2), rule(2, at(7, 1)), []).
proof(72, has_dog(alice, dog3), rule(3, at(8, 1)), []).
proof(73, has_dog(alice, dog4), rule(4, at(9, 1)), []).
proof(74, has_dog(alice, dog5), rule(5, at(10, 1)), []).
proof(75, has_dog(bob, dog6), rule(6, at(11, 1)), []).
proof(76, has_dog(bob, dog7), rule(7, at(12, 1)), []).
proof(77, has_dog(alice, dog1), rule(1, at(6, 1)), []).
proof(78, has_dog(alice, dog2), rule(2, at(7, 1)), []).
proof(79, has_dog(alice, dog3), rule(3, at(8, 1)), []).
proof(80, has_dog(alice, dog4), rule(4, at(9, 1)), []).
proof(81, has_dog(alice, dog5), rule(5, at(10, 1)), []).
proof(82, solution([dog1]), query, [uses(77, has_dog(alice, dog1))]).
proof(83, solution([dog2]), query, [uses(78, has_dog(alice, dog2))]).
proof(84, solution([dog3]), query, [uses(79, has_dog(alice, dog3))]).
proof(85, solution([dog4]), query, [uses(80, has_dog(alice, dog4))]).
proof(86, solution([dog5]), query, [uses(81, has_dog(alice, dog5))]).
proof(87, dog_count(alice, 5), rule(8, at(14, 1)), [uses(70, has_dog(alice, dog1)), collected([dog1, dog2, dog3, dog4, dog5], ?v0, [call(has_dog(alice, ?v0))], [82, 83, 84, 85, 86], complete), calculated(5, function("count", [value([dog1, dog2, dog3, dog4, dog5])]))]).
proof(88, has_dog(alice, dog1), rule(1, at(6, 1)), []).
proof(89, has_dog(alice, dog2), rule(2, at(7, 1)), []).
proof(90, has_dog(alice, dog3), rule(3, at(8, 1)), []).
proof(91, has_dog(alice, dog4), rule(4, at(9, 1)), []).
proof(92, has_dog(alice, dog5), rule(5, at(10, 1)), []).
proof(93, solution([dog1]), query, [uses(88, has_dog(alice, dog1))]).
proof(94, solution([dog2]), query, [uses(89, has_dog(alice, dog2))]).
proof(95, solution([dog3]), query, [uses(90, has_dog(alice, dog3))]).
proof(96, solution([dog4]), query, [uses(91, has_dog(alice, dog4))]).
proof(97, solution([dog5]), query, [uses(92, has_dog(alice, dog5))]).
proof(98, has_dog(alice, dog1), rule(1, at(6, 1)), []).
proof(99, has_dog(alice, dog2), rule(2, at(7, 1)), []).
proof(100, has_dog(alice, dog3), rule(3, at(8, 1)), []).
proof(101, has_dog(alice, dog4), rule(4, at(9, 1)), []).
proof(102, has_dog(alice, dog5), rule(5, at(10, 1)), []).
proof(103, solution([dog1]), query, [uses(98, has_dog(alice, dog1))]).
proof(104, solution([dog2]), query, [uses(99, has_dog(alice, dog2))]).
proof(105, solution([dog3]), query, [uses(100, has_dog(alice, dog3))]).
proof(106, solution([dog4]), query, [uses(101, has_dog(alice, dog4))]).
proof(107, solution([dog5]), query, [uses(102, has_dog(alice, dog5))]).
proof(108, has_dog(alice, dog1), rule(1, at(6, 1)), []).
proof(109, has_dog(alice, dog2), rule(2, at(7, 1)), []).
proof(110, has_dog(alice, dog3), rule(3, at(8, 1)), []).
proof(111, has_dog(alice, dog4), rule(4, at(9, 1)), []).
proof(112, has_dog(alice, dog5), rule(5, at(10, 1)), []).
proof(113, solution([dog1]), query, [uses(108, has_dog(alice, dog1))]).
proof(114, solution([dog2]), query, [uses(109, has_dog(alice, dog2))]).
proof(115, solution([dog3]), query, [uses(110, has_dog(alice, dog3))]).
proof(116, solution([dog4]), query, [uses(111, has_dog(alice, dog4))]).
proof(117, solution([dog5]), query, [uses(112, has_dog(alice, dog5))]).
proof(118, has_dog(alice, dog1), rule(1, at(6, 1)), []).
proof(119, has_dog(alice, dog2), rule(2, at(7, 1)), []).
proof(120, has_dog(alice, dog3), rule(3, at(8, 1)), []).
proof(121, has_dog(alice, dog4), rule(4, at(9, 1)), []).
proof(122, has_dog(alice, dog5), rule(5, at(10, 1)), []).
proof(123, solution([dog1]), query, [uses(118, has_dog(alice, dog1))]).
proof(124, solution([dog2]), query, [uses(119, has_dog(alice, dog2))]).
proof(125, solution([dog3]), query, [uses(120, has_dog(alice, dog3))]).
proof(126, solution([dog4]), query, [uses(121, has_dog(alice, dog4))]).
proof(127, solution([dog5]), query, [uses(122, has_dog(alice, dog5))]).
proof(128, has_dog(bob, dog6), rule(6, at(11, 1)), []).
proof(129, has_dog(bob, dog7), rule(7, at(12, 1)), []).
proof(130, solution([dog6]), query, [uses(128, has_dog(bob, dog6))]).
proof(131, solution([dog7]), query, [uses(129, has_dog(bob, dog7))]).
proof(132, dog_count(bob, 2), rule(8, at(14, 1)), [uses(75, has_dog(bob, dog6)), collected([dog6, dog7], ?v0, [call(has_dog(bob, ?v0))], [130, 131], complete), calculated(2, function("count", [value([dog6, dog7])]))]).
proof(133, has_dog(bob, dog6), rule(6, at(11, 1)), []).
proof(134, has_dog(bob, dog7), rule(7, at(12, 1)), []).
proof(135, solution([dog6]), query, [uses(133, has_dog(bob, dog6))]).
proof(136, solution([dog7]), query, [uses(134, has_dog(bob, dog7))]).
proof(137, solution([alice, 5]), query, [uses(87, dog_count(alice, 5))]).
proof(138, solution([bob, 2]), query, [uses(132, dog_count(bob, 2))]).
