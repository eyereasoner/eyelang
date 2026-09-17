# Eyelang result format 1
query(1, at(56, 1), [call(project_finish(?v0))], [binding("finish", ?v0)]).
result(1, complete, 1).
answer(1, [binding("finish", 23)]).
why(1, [binding("finish", 23)], 301).
query(2, at(57, 1), [call(critical_task(?v0))], [binding("task", ?v0)]).
result(2, complete, 7).
answer(2, [binding("task", launch)]).
why(2, [binding("task", launch)], 627).
answer(2, [binding("task", security_review)]).
why(2, [binding("task", security_review)], 633).
answer(2, [binding("task", integration)]).
why(2, [binding("task", integration)], 641).
answer(2, [binding("task", backend)]).
why(2, [binding("task", backend)], 650).
answer(2, [binding("task", database)]).
why(2, [binding("task", database)], 657).
answer(2, [binding("task", architecture)]).
why(2, [binding("task", architecture)], 662).
answer(2, [binding("task", requirements)]).
why(2, [binding("task", requirements)], 665).
query(3, at(58, 1), [call(schedule(?v0, ?v1, ?v2))], [binding("task", ?v0), binding("start", ?v1), binding("finish", ?v2)]).
result(3, complete, 11).
answer(3, [binding("task", requirements), binding("start", 0), binding("finish", 2)]).
why(3, [binding("task", requirements), binding("start", 0), binding("finish", 2)], 943).
answer(3, [binding("task", architecture), binding("start", 2), binding("finish", 5)]).
why(3, [binding("task", architecture), binding("start", 2), binding("finish", 5)], 944).
answer(3, [binding("task", api_design), binding("start", 2), binding("finish", 4)]).
why(3, [binding("task", api_design), binding("start", 2), binding("finish", 4)], 945).
answer(3, [binding("task", database), binding("start", 5), binding("finish", 9)]).
why(3, [binding("task", database), binding("start", 5), binding("finish", 9)], 946).
answer(3, [binding("task", backend), binding("start", 9), binding("finish", 15)]).
why(3, [binding("task", backend), binding("start", 9), binding("finish", 15)], 947).
answer(3, [binding("task", frontend), binding("start", 4), binding("finish", 9)]).
why(3, [binding("task", frontend), binding("start", 4), binding("finish", 9)], 948).
answer(3, [binding("task", auth), binding("start", 5), binding("finish", 8)]).
why(3, [binding("task", auth), binding("start", 5), binding("finish", 8)], 949).
answer(3, [binding("task", integration), binding("start", 15), binding("finish", 19)]).
why(3, [binding("task", integration), binding("start", 15), binding("finish", 19)], 950).
answer(3, [binding("task", security_review), binding("start", 19), binding("finish", 22)]).
why(3, [binding("task", security_review), binding("start", 19), binding("finish", 22)], 951).
answer(3, [binding("task", load_test), binding("start", 19), binding("finish", 21)]).
why(3, [binding("task", load_test), binding("start", 19), binding("finish", 21)], 952).
answer(3, [binding("task", launch), binding("start", 22), binding("finish", 23)]).
why(3, [binding("task", launch), binding("start", 22), binding("finish", 23)], 953).
proof(1, task(requirements, 2), rule(1, at(6, 1)), []).
proof(2, task(architecture, 3), rule(2, at(7, 1)), []).
proof(3, task(api_design, 2), rule(3, at(8, 1)), []).
proof(4, task(database, 4), rule(4, at(9, 1)), []).
proof(5, task(backend, 6), rule(5, at(10, 1)), []).
proof(6, task(frontend, 5), rule(6, at(11, 1)), []).
proof(7, task(auth, 3), rule(7, at(12, 1)), []).
proof(8, task(integration, 4), rule(8, at(13, 1)), []).
proof(9, task(security_review, 3), rule(9, at(14, 1)), []).
proof(10, task(load_test, 2), rule(10, at(15, 1)), []).
proof(11, task(launch, 1), rule(11, at(16, 1)), []).
proof(12, task(requirements, 2), rule(1, at(6, 1)), []).
proof(13, duration_path(requirements, [requirements], 2), rule(27, at(34, 1)), [uses(12, task(requirements, 2)), absent(has_predecessor(requirements), complete)]).
proof(14, solution([2]), query, [uses(13, duration_path(requirements, [requirements], 2))]).
proof(15, finish_time(requirements, 2), rule(29, at(41, 1)), [uses(1, task(requirements, 2)), collected([2], ?v0, [call(duration_path(requirements, ?v1, ?v0))], [14], complete), calculated(2, function("max", [value([2])]))]).
proof(16, task(architecture, 3), rule(2, at(7, 1)), []).
proof(17, depends(architecture, requirements), rule(12, at(18, 1)), []).
proof(18, has_predecessor(architecture), rule(26, at(33, 1)), [uses(17, depends(architecture, requirements))]).
proof(19, solution([]), query, [uses(18, has_predecessor(architecture))]).
proof(20, depends(architecture, requirements), rule(12, at(18, 1)), []).
proof(21, task(requirements, 2), rule(1, at(6, 1)), []).
proof(22, duration_path(requirements, [requirements], 2), rule(27, at(34, 1)), [uses(21, task(requirements, 2)), absent(has_predecessor(requirements), complete)]).
proof(23, duration_path(architecture, [architecture, requirements], 5), rule(28, at(36, 1)), [uses(16, task(architecture, 3)), uses(20, depends(architecture, requirements)), uses(22, duration_path(requirements, [requirements], 2)), calculated(5, binary("+", value(2), value(3)))]).
proof(24, solution([5]), query, [uses(23, duration_path(architecture, [architecture, requirements], 5))]).
proof(25, finish_time(architecture, 5), rule(29, at(41, 1)), [uses(2, task(architecture, 3)), collected([5], ?v0, [call(duration_path(architecture, ?v1, ?v0))], [24], complete), calculated(5, function("max", [value([5])]))]).
proof(26, task(api_design, 2), rule(3, at(8, 1)), []).
proof(27, depends(api_design, requirements), rule(13, at(19, 1)), []).
proof(28, has_predecessor(api_design), rule(26, at(33, 1)), [uses(27, depends(api_design, requirements))]).
proof(29, solution([]), query, [uses(28, has_predecessor(api_design))]).
proof(30, depends(api_design, requirements), rule(13, at(19, 1)), []).
proof(31, task(requirements, 2), rule(1, at(6, 1)), []).
proof(32, duration_path(requirements, [requirements], 2), rule(27, at(34, 1)), [uses(31, task(requirements, 2)), absent(has_predecessor(requirements), complete)]).
proof(33, duration_path(api_design, [api_design, requirements], 4), rule(28, at(36, 1)), [uses(26, task(api_design, 2)), uses(30, depends(api_design, requirements)), uses(32, duration_path(requirements, [requirements], 2)), calculated(4, binary("+", value(2), value(2)))]).
proof(34, solution([4]), query, [uses(33, duration_path(api_design, [api_design, requirements], 4))]).
proof(35, finish_time(api_design, 4), rule(29, at(41, 1)), [uses(3, task(api_design, 2)), collected([4], ?v0, [call(duration_path(api_design, ?v1, ?v0))], [34], complete), calculated(4, function("max", [value([4])]))]).
proof(36, task(database, 4), rule(4, at(9, 1)), []).
proof(37, depends(database, architecture), rule(14, at(20, 1)), []).
proof(38, has_predecessor(database), rule(26, at(33, 1)), [uses(37, depends(database, architecture))]).
proof(39, solution([]), query, [uses(38, has_predecessor(database))]).
proof(40, depends(database, architecture), rule(14, at(20, 1)), []).
proof(41, task(architecture, 3), rule(2, at(7, 1)), []).
proof(42, depends(architecture, requirements), rule(12, at(18, 1)), []).
proof(43, task(requirements, 2), rule(1, at(6, 1)), []).
proof(44, duration_path(requirements, [requirements], 2), rule(27, at(34, 1)), [uses(43, task(requirements, 2)), absent(has_predecessor(requirements), complete)]).
proof(45, duration_path(architecture, [architecture, requirements], 5), rule(28, at(36, 1)), [uses(41, task(architecture, 3)), uses(42, depends(architecture, requirements)), uses(44, duration_path(requirements, [requirements], 2)), calculated(5, binary("+", value(2), value(3)))]).
proof(46, duration_path(database, [database, architecture, requirements], 9), rule(28, at(36, 1)), [uses(36, task(database, 4)), uses(40, depends(database, architecture)), uses(45, duration_path(architecture, [architecture, requirements], 5)), calculated(9, binary("+", value(5), value(4)))]).
proof(47, solution([9]), query, [uses(46, duration_path(database, [database, architecture, requirements], 9))]).
proof(48, finish_time(database, 9), rule(29, at(41, 1)), [uses(4, task(database, 4)), collected([9], ?v0, [call(duration_path(database, ?v1, ?v0))], [47], complete), calculated(9, function("max", [value([9])]))]).
proof(49, task(backend, 6), rule(5, at(10, 1)), []).
proof(50, depends(backend, api_design), rule(15, at(21, 1)), []).
proof(51, depends(backend, database), rule(16, at(22, 1)), []).
proof(52, has_predecessor(backend), rule(26, at(33, 1)), [uses(50, depends(backend, api_design))]).
proof(53, solution([]), query, [uses(52, has_predecessor(backend))]).
proof(54, depends(backend, api_design), rule(15, at(21, 1)), []).
proof(55, depends(backend, database), rule(16, at(22, 1)), []).
proof(56, task(api_design, 2), rule(3, at(8, 1)), []).
proof(57, task(database, 4), rule(4, at(9, 1)), []).
proof(58, depends(api_design, requirements), rule(13, at(19, 1)), []).
proof(59, depends(database, architecture), rule(14, at(20, 1)), []).
proof(60, task(requirements, 2), rule(1, at(6, 1)), []).
proof(61, task(architecture, 3), rule(2, at(7, 1)), []).
proof(62, duration_path(requirements, [requirements], 2), rule(27, at(34, 1)), [uses(60, task(requirements, 2)), absent(has_predecessor(requirements), complete)]).
proof(63, duration_path(api_design, [api_design, requirements], 4), rule(28, at(36, 1)), [uses(56, task(api_design, 2)), uses(58, depends(api_design, requirements)), uses(62, duration_path(requirements, [requirements], 2)), calculated(4, binary("+", value(2), value(2)))]).
proof(64, depends(architecture, requirements), rule(12, at(18, 1)), []).
proof(65, duration_path(backend, [backend, api_design, requirements], 10), rule(28, at(36, 1)), [uses(49, task(backend, 6)), uses(54, depends(backend, api_design)), uses(63, duration_path(api_design, [api_design, requirements], 4)), calculated(10, binary("+", value(4), value(6)))]).
proof(66, duration_path(architecture, [architecture, requirements], 5), rule(28, at(36, 1)), [uses(61, task(architecture, 3)), uses(64, depends(architecture, requirements)), uses(62, duration_path(requirements, [requirements], 2)), calculated(5, binary("+", value(2), value(3)))]).
proof(67, solution([10]), query, [uses(65, duration_path(backend, [backend, api_design, requirements], 10))]).
proof(68, duration_path(database, [database, architecture, requirements], 9), rule(28, at(36, 1)), [uses(57, task(database, 4)), uses(59, depends(database, architecture)), uses(66, duration_path(architecture, [architecture, requirements], 5)), calculated(9, binary("+", value(5), value(4)))]).
proof(69, duration_path(backend, [backend, database, architecture, requirements], 15), rule(28, at(36, 1)), [uses(49, task(backend, 6)), uses(55, depends(backend, database)), uses(68, duration_path(database, [database, architecture, requirements], 9)), calculated(15, binary("+", value(9), value(6)))]).
proof(70, solution([15]), query, [uses(69, duration_path(backend, [backend, database, architecture, requirements], 15))]).
proof(71, finish_time(backend, 15), rule(29, at(41, 1)), [uses(5, task(backend, 6)), collected([10, 15], ?v0, [call(duration_path(backend, ?v1, ?v0))], [67, 70], complete), calculated(15, function("max", [value([10, 15])]))]).
proof(72, task(frontend, 5), rule(6, at(11, 1)), []).
proof(73, depends(frontend, api_design), rule(17, at(23, 1)), []).
proof(74, has_predecessor(frontend), rule(26, at(33, 1)), [uses(73, depends(frontend, api_design))]).
proof(75, solution([]), query, [uses(74, has_predecessor(frontend))]).
proof(76, depends(frontend, api_design), rule(17, at(23, 1)), []).
proof(77, task(api_design, 2), rule(3, at(8, 1)), []).
proof(78, depends(api_design, requirements), rule(13, at(19, 1)), []).
proof(79, task(requirements, 2), rule(1, at(6, 1)), []).
proof(80, duration_path(requirements, [requirements], 2), rule(27, at(34, 1)), [uses(79, task(requirements, 2)), absent(has_predecessor(requirements), complete)]).
proof(81, duration_path(api_design, [api_design, requirements], 4), rule(28, at(36, 1)), [uses(77, task(api_design, 2)), uses(78, depends(api_design, requirements)), uses(80, duration_path(requirements, [requirements], 2)), calculated(4, binary("+", value(2), value(2)))]).
proof(82, duration_path(frontend, [frontend, api_design, requirements], 9), rule(28, at(36, 1)), [uses(72, task(frontend, 5)), uses(76, depends(frontend, api_design)), uses(81, duration_path(api_design, [api_design, requirements], 4)), calculated(9, binary("+", value(4), value(5)))]).
proof(83, solution([9]), query, [uses(82, duration_path(frontend, [frontend, api_design, requirements], 9))]).
proof(84, finish_time(frontend, 9), rule(29, at(41, 1)), [uses(6, task(frontend, 5)), collected([9], ?v0, [call(duration_path(frontend, ?v1, ?v0))], [83], complete), calculated(9, function("max", [value([9])]))]).
proof(85, task(auth, 3), rule(7, at(12, 1)), []).
proof(86, depends(auth, architecture), rule(18, at(24, 1)), []).
proof(87, has_predecessor(auth), rule(26, at(33, 1)), [uses(86, depends(auth, architecture))]).
proof(88, solution([]), query, [uses(87, has_predecessor(auth))]).
proof(89, depends(auth, architecture), rule(18, at(24, 1)), []).
proof(90, task(architecture, 3), rule(2, at(7, 1)), []).
proof(91, depends(architecture, requirements), rule(12, at(18, 1)), []).
proof(92, task(requirements, 2), rule(1, at(6, 1)), []).
proof(93, duration_path(requirements, [requirements], 2), rule(27, at(34, 1)), [uses(92, task(requirements, 2)), absent(has_predecessor(requirements), complete)]).
proof(94, duration_path(architecture, [architecture, requirements], 5), rule(28, at(36, 1)), [uses(90, task(architecture, 3)), uses(91, depends(architecture, requirements)), uses(93, duration_path(requirements, [requirements], 2)), calculated(5, binary("+", value(2), value(3)))]).
proof(95, duration_path(auth, [auth, architecture, requirements], 8), rule(28, at(36, 1)), [uses(85, task(auth, 3)), uses(89, depends(auth, architecture)), uses(94, duration_path(architecture, [architecture, requirements], 5)), calculated(8, binary("+", value(5), value(3)))]).
proof(96, solution([8]), query, [uses(95, duration_path(auth, [auth, architecture, requirements], 8))]).
proof(97, finish_time(auth, 8), rule(29, at(41, 1)), [uses(7, task(auth, 3)), collected([8], ?v0, [call(duration_path(auth, ?v1, ?v0))], [96], complete), calculated(8, function("max", [value([8])]))]).
proof(98, task(integration, 4), rule(8, at(13, 1)), []).
proof(99, depends(integration, backend), rule(19, at(25, 1)), []).
proof(100, depends(integration, frontend), rule(20, at(26, 1)), []).
proof(101, depends(integration, auth), rule(21, at(27, 1)), []).
proof(102, has_predecessor(integration), rule(26, at(33, 1)), [uses(99, depends(integration, backend))]).
proof(103, solution([]), query, [uses(102, has_predecessor(integration))]).
proof(104, depends(integration, backend), rule(19, at(25, 1)), []).
proof(105, depends(integration, frontend), rule(20, at(26, 1)), []).
proof(106, depends(integration, auth), rule(21, at(27, 1)), []).
proof(107, task(backend, 6), rule(5, at(10, 1)), []).
proof(108, task(frontend, 5), rule(6, at(11, 1)), []).
proof(109, task(auth, 3), rule(7, at(12, 1)), []).
proof(110, depends(backend, api_design), rule(15, at(21, 1)), []).
proof(111, depends(backend, database), rule(16, at(22, 1)), []).
proof(112, depends(frontend, api_design), rule(17, at(23, 1)), []).
proof(113, depends(auth, architecture), rule(18, at(24, 1)), []).
proof(114, task(api_design, 2), rule(3, at(8, 1)), []).
proof(115, task(database, 4), rule(4, at(9, 1)), []).
proof(116, task(architecture, 3), rule(2, at(7, 1)), []).
proof(117, depends(api_design, requirements), rule(13, at(19, 1)), []).
proof(118, depends(database, architecture), rule(14, at(20, 1)), []).
proof(119, depends(architecture, requirements), rule(12, at(18, 1)), []).
proof(120, task(requirements, 2), rule(1, at(6, 1)), []).
proof(121, duration_path(requirements, [requirements], 2), rule(27, at(34, 1)), [uses(120, task(requirements, 2)), absent(has_predecessor(requirements), complete)]).
proof(122, duration_path(api_design, [api_design, requirements], 4), rule(28, at(36, 1)), [uses(114, task(api_design, 2)), uses(117, depends(api_design, requirements)), uses(121, duration_path(requirements, [requirements], 2)), calculated(4, binary("+", value(2), value(2)))]).
proof(123, duration_path(architecture, [architecture, requirements], 5), rule(28, at(36, 1)), [uses(116, task(architecture, 3)), uses(119, depends(architecture, requirements)), uses(121, duration_path(requirements, [requirements], 2)), calculated(5, binary("+", value(2), value(3)))]).
proof(124, duration_path(backend, [backend, api_design, requirements], 10), rule(28, at(36, 1)), [uses(107, task(backend, 6)), uses(110, depends(backend, api_design)), uses(122, duration_path(api_design, [api_design, requirements], 4)), calculated(10, binary("+", value(4), value(6)))]).
proof(125, duration_path(frontend, [frontend, api_design, requirements], 9), rule(28, at(36, 1)), [uses(108, task(frontend, 5)), uses(112, depends(frontend, api_design)), uses(122, duration_path(api_design, [api_design, requirements], 4)), calculated(9, binary("+", value(4), value(5)))]).
proof(126, duration_path(auth, [auth, architecture, requirements], 8), rule(28, at(36, 1)), [uses(109, task(auth, 3)), uses(113, depends(auth, architecture)), uses(123, duration_path(architecture, [architecture, requirements], 5)), calculated(8, binary("+", value(5), value(3)))]).
proof(127, duration_path(database, [database, architecture, requirements], 9), rule(28, at(36, 1)), [uses(115, task(database, 4)), uses(118, depends(database, architecture)), uses(123, duration_path(architecture, [architecture, requirements], 5)), calculated(9, binary("+", value(5), value(4)))]).
proof(128, duration_path(integration, [integration, backend, api_design, requirements], 14), rule(28, at(36, 1)), [uses(98, task(integration, 4)), uses(104, depends(integration, backend)), uses(124, duration_path(backend, [backend, api_design, requirements], 10)), calculated(14, binary("+", value(10), value(4)))]).
proof(129, duration_path(integration, [integration, frontend, api_design, requirements], 13), rule(28, at(36, 1)), [uses(98, task(integration, 4)), uses(105, depends(integration, frontend)), uses(125, duration_path(frontend, [frontend, api_design, requirements], 9)), calculated(13, binary("+", value(9), value(4)))]).
proof(130, duration_path(integration, [integration, auth, architecture, requirements], 12), rule(28, at(36, 1)), [uses(98, task(integration, 4)), uses(106, depends(integration, auth)), uses(126, duration_path(auth, [auth, architecture, requirements], 8)), calculated(12, binary("+", value(8), value(4)))]).
proof(131, duration_path(backend, [backend, database, architecture, requirements], 15), rule(28, at(36, 1)), [uses(107, task(backend, 6)), uses(111, depends(backend, database)), uses(127, duration_path(database, [database, architecture, requirements], 9)), calculated(15, binary("+", value(9), value(6)))]).
proof(132, solution([14]), query, [uses(128, duration_path(integration, [integration, backend, api_design, requirements], 14))]).
proof(133, solution([13]), query, [uses(129, duration_path(integration, [integration, frontend, api_design, requirements], 13))]).
proof(134, solution([12]), query, [uses(130, duration_path(integration, [integration, auth, architecture, requirements], 12))]).
proof(135, duration_path(integration, [integration, backend, database, architecture, requirements], 19), rule(28, at(36, 1)), [uses(98, task(integration, 4)), uses(104, depends(integration, backend)), uses(131, duration_path(backend, [backend, database, architecture, requirements], 15)), calculated(19, binary("+", value(15), value(4)))]).
proof(136, solution([19]), query, [uses(135, duration_path(integration, [integration, backend, database, architecture, requirements], 19))]).
proof(137, finish_time(integration, 19), rule(29, at(41, 1)), [uses(8, task(integration, 4)), collected([12, 13, 14, 19], ?v0, [call(duration_path(integration, ?v1, ?v0))], [132, 133, 134, 136], complete), calculated(19, function("max", [value([12, 13, 14, 19])]))]).
proof(138, task(security_review, 3), rule(9, at(14, 1)), []).
proof(139, depends(security_review, integration), rule(22, at(28, 1)), []).
proof(140, has_predecessor(security_review), rule(26, at(33, 1)), [uses(139, depends(security_review, integration))]).
proof(141, solution([]), query, [uses(140, has_predecessor(security_review))]).
proof(142, depends(security_review, integration), rule(22, at(28, 1)), []).
proof(143, task(integration, 4), rule(8, at(13, 1)), []).
proof(144, depends(integration, backend), rule(19, at(25, 1)), []).
proof(145, depends(integration, frontend), rule(20, at(26, 1)), []).
proof(146, depends(integration, auth), rule(21, at(27, 1)), []).
proof(147, task(backend, 6), rule(5, at(10, 1)), []).
proof(148, task(frontend, 5), rule(6, at(11, 1)), []).
proof(149, task(auth, 3), rule(7, at(12, 1)), []).
proof(150, depends(backend, api_design), rule(15, at(21, 1)), []).
proof(151, depends(backend, database), rule(16, at(22, 1)), []).
proof(152, depends(frontend, api_design), rule(17, at(23, 1)), []).
proof(153, depends(auth, architecture), rule(18, at(24, 1)), []).
proof(154, task(api_design, 2), rule(3, at(8, 1)), []).
proof(155, task(database, 4), rule(4, at(9, 1)), []).
proof(156, task(architecture, 3), rule(2, at(7, 1)), []).
proof(157, depends(api_design, requirements), rule(13, at(19, 1)), []).
proof(158, depends(database, architecture), rule(14, at(20, 1)), []).
proof(159, depends(architecture, requirements), rule(12, at(18, 1)), []).
proof(160, task(requirements, 2), rule(1, at(6, 1)), []).
proof(161, duration_path(requirements, [requirements], 2), rule(27, at(34, 1)), [uses(160, task(requirements, 2)), absent(has_predecessor(requirements), complete)]).
proof(162, duration_path(api_design, [api_design, requirements], 4), rule(28, at(36, 1)), [uses(154, task(api_design, 2)), uses(157, depends(api_design, requirements)), uses(161, duration_path(requirements, [requirements], 2)), calculated(4, binary("+", value(2), value(2)))]).
proof(163, duration_path(architecture, [architecture, requirements], 5), rule(28, at(36, 1)), [uses(156, task(architecture, 3)), uses(159, depends(architecture, requirements)), uses(161, duration_path(requirements, [requirements], 2)), calculated(5, binary("+", value(2), value(3)))]).
proof(164, duration_path(backend, [backend, api_design, requirements], 10), rule(28, at(36, 1)), [uses(147, task(backend, 6)), uses(150, depends(backend, api_design)), uses(162, duration_path(api_design, [api_design, requirements], 4)), calculated(10, binary("+", value(4), value(6)))]).
proof(165, duration_path(frontend, [frontend, api_design, requirements], 9), rule(28, at(36, 1)), [uses(148, task(frontend, 5)), uses(152, depends(frontend, api_design)), uses(162, duration_path(api_design, [api_design, requirements], 4)), calculated(9, binary("+", value(4), value(5)))]).
proof(166, duration_path(auth, [auth, architecture, requirements], 8), rule(28, at(36, 1)), [uses(149, task(auth, 3)), uses(153, depends(auth, architecture)), uses(163, duration_path(architecture, [architecture, requirements], 5)), calculated(8, binary("+", value(5), value(3)))]).
proof(167, duration_path(database, [database, architecture, requirements], 9), rule(28, at(36, 1)), [uses(155, task(database, 4)), uses(158, depends(database, architecture)), uses(163, duration_path(architecture, [architecture, requirements], 5)), calculated(9, binary("+", value(5), value(4)))]).
proof(168, duration_path(integration, [integration, backend, api_design, requirements], 14), rule(28, at(36, 1)), [uses(143, task(integration, 4)), uses(144, depends(integration, backend)), uses(164, duration_path(backend, [backend, api_design, requirements], 10)), calculated(14, binary("+", value(10), value(4)))]).
proof(169, duration_path(integration, [integration, frontend, api_design, requirements], 13), rule(28, at(36, 1)), [uses(143, task(integration, 4)), uses(145, depends(integration, frontend)), uses(165, duration_path(frontend, [frontend, api_design, requirements], 9)), calculated(13, binary("+", value(9), value(4)))]).
proof(170, duration_path(integration, [integration, auth, architecture, requirements], 12), rule(28, at(36, 1)), [uses(143, task(integration, 4)), uses(146, depends(integration, auth)), uses(166, duration_path(auth, [auth, architecture, requirements], 8)), calculated(12, binary("+", value(8), value(4)))]).
proof(171, duration_path(backend, [backend, database, architecture, requirements], 15), rule(28, at(36, 1)), [uses(147, task(backend, 6)), uses(151, depends(backend, database)), uses(167, duration_path(database, [database, architecture, requirements], 9)), calculated(15, binary("+", value(9), value(6)))]).
proof(172, duration_path(security_review, [security_review, integration, backend, api_design, requirements], 17), rule(28, at(36, 1)), [uses(138, task(security_review, 3)), uses(142, depends(security_review, integration)), uses(168, duration_path(integration, [integration, backend, api_design, requirements], 14)), calculated(17, binary("+", value(14), value(3)))]).
proof(173, duration_path(security_review, [security_review, integration, frontend, api_design, requirements], 16), rule(28, at(36, 1)), [uses(138, task(security_review, 3)), uses(142, depends(security_review, integration)), uses(169, duration_path(integration, [integration, frontend, api_design, requirements], 13)), calculated(16, binary("+", value(13), value(3)))]).
proof(174, duration_path(security_review, [security_review, integration, auth, architecture, requirements], 15), rule(28, at(36, 1)), [uses(138, task(security_review, 3)), uses(142, depends(security_review, integration)), uses(170, duration_path(integration, [integration, auth, architecture, requirements], 12)), calculated(15, binary("+", value(12), value(3)))]).
proof(175, duration_path(integration, [integration, backend, database, architecture, requirements], 19), rule(28, at(36, 1)), [uses(143, task(integration, 4)), uses(144, depends(integration, backend)), uses(171, duration_path(backend, [backend, database, architecture, requirements], 15)), calculated(19, binary("+", value(15), value(4)))]).
proof(176, solution([17]), query, [uses(172, duration_path(security_review, [security_review, integration, backend, api_design, requirements], 17))]).
proof(177, solution([16]), query, [uses(173, duration_path(security_review, [security_review, integration, frontend, api_design, requirements], 16))]).
proof(178, solution([15]), query, [uses(174, duration_path(security_review, [security_review, integration, auth, architecture, requirements], 15))]).
proof(179, duration_path(security_review, [security_review, integration, backend, database, architecture, requirements], 22), rule(28, at(36, 1)), [uses(138, task(security_review, 3)), uses(142, depends(security_review, integration)), uses(175, duration_path(integration, [integration, backend, database, architecture, requirements], 19)), calculated(22, binary("+", value(19), value(3)))]).
proof(180, solution([22]), query, [uses(179, duration_path(security_review, [security_review, integration, backend, database, architecture, requirements], 22))]).
proof(181, finish_time(security_review, 22), rule(29, at(41, 1)), [uses(9, task(security_review, 3)), collected([15, 16, 17, 22], ?v0, [call(duration_path(security_review, ?v1, ?v0))], [176, 177, 178, 180], complete), calculated(22, function("max", [value([15, 16, 17, 22])]))]).
proof(182, task(load_test, 2), rule(10, at(15, 1)), []).
proof(183, depends(load_test, integration), rule(23, at(29, 1)), []).
proof(184, has_predecessor(load_test), rule(26, at(33, 1)), [uses(183, depends(load_test, integration))]).
proof(185, solution([]), query, [uses(184, has_predecessor(load_test))]).
proof(186, depends(load_test, integration), rule(23, at(29, 1)), []).
proof(187, task(integration, 4), rule(8, at(13, 1)), []).
proof(188, depends(integration, backend), rule(19, at(25, 1)), []).
proof(189, depends(integration, frontend), rule(20, at(26, 1)), []).
proof(190, depends(integration, auth), rule(21, at(27, 1)), []).
proof(191, task(backend, 6), rule(5, at(10, 1)), []).
proof(192, task(frontend, 5), rule(6, at(11, 1)), []).
proof(193, task(auth, 3), rule(7, at(12, 1)), []).
proof(194, depends(backend, api_design), rule(15, at(21, 1)), []).
proof(195, depends(backend, database), rule(16, at(22, 1)), []).
proof(196, depends(frontend, api_design), rule(17, at(23, 1)), []).
proof(197, depends(auth, architecture), rule(18, at(24, 1)), []).
proof(198, task(api_design, 2), rule(3, at(8, 1)), []).
proof(199, task(database, 4), rule(4, at(9, 1)), []).
proof(200, task(architecture, 3), rule(2, at(7, 1)), []).
proof(201, depends(api_design, requirements), rule(13, at(19, 1)), []).
proof(202, depends(database, architecture), rule(14, at(20, 1)), []).
proof(203, depends(architecture, requirements), rule(12, at(18, 1)), []).
proof(204, task(requirements, 2), rule(1, at(6, 1)), []).
proof(205, duration_path(requirements, [requirements], 2), rule(27, at(34, 1)), [uses(204, task(requirements, 2)), absent(has_predecessor(requirements), complete)]).
proof(206, duration_path(api_design, [api_design, requirements], 4), rule(28, at(36, 1)), [uses(198, task(api_design, 2)), uses(201, depends(api_design, requirements)), uses(205, duration_path(requirements, [requirements], 2)), calculated(4, binary("+", value(2), value(2)))]).
proof(207, duration_path(architecture, [architecture, requirements], 5), rule(28, at(36, 1)), [uses(200, task(architecture, 3)), uses(203, depends(architecture, requirements)), uses(205, duration_path(requirements, [requirements], 2)), calculated(5, binary("+", value(2), value(3)))]).
proof(208, duration_path(backend, [backend, api_design, requirements], 10), rule(28, at(36, 1)), [uses(191, task(backend, 6)), uses(194, depends(backend, api_design)), uses(206, duration_path(api_design, [api_design, requirements], 4)), calculated(10, binary("+", value(4), value(6)))]).
proof(209, duration_path(frontend, [frontend, api_design, requirements], 9), rule(28, at(36, 1)), [uses(192, task(frontend, 5)), uses(196, depends(frontend, api_design)), uses(206, duration_path(api_design, [api_design, requirements], 4)), calculated(9, binary("+", value(4), value(5)))]).
proof(210, duration_path(auth, [auth, architecture, requirements], 8), rule(28, at(36, 1)), [uses(193, task(auth, 3)), uses(197, depends(auth, architecture)), uses(207, duration_path(architecture, [architecture, requirements], 5)), calculated(8, binary("+", value(5), value(3)))]).
proof(211, duration_path(database, [database, architecture, requirements], 9), rule(28, at(36, 1)), [uses(199, task(database, 4)), uses(202, depends(database, architecture)), uses(207, duration_path(architecture, [architecture, requirements], 5)), calculated(9, binary("+", value(5), value(4)))]).
proof(212, duration_path(integration, [integration, backend, api_design, requirements], 14), rule(28, at(36, 1)), [uses(187, task(integration, 4)), uses(188, depends(integration, backend)), uses(208, duration_path(backend, [backend, api_design, requirements], 10)), calculated(14, binary("+", value(10), value(4)))]).
proof(213, duration_path(integration, [integration, frontend, api_design, requirements], 13), rule(28, at(36, 1)), [uses(187, task(integration, 4)), uses(189, depends(integration, frontend)), uses(209, duration_path(frontend, [frontend, api_design, requirements], 9)), calculated(13, binary("+", value(9), value(4)))]).
proof(214, duration_path(integration, [integration, auth, architecture, requirements], 12), rule(28, at(36, 1)), [uses(187, task(integration, 4)), uses(190, depends(integration, auth)), uses(210, duration_path(auth, [auth, architecture, requirements], 8)), calculated(12, binary("+", value(8), value(4)))]).
proof(215, duration_path(backend, [backend, database, architecture, requirements], 15), rule(28, at(36, 1)), [uses(191, task(backend, 6)), uses(195, depends(backend, database)), uses(211, duration_path(database, [database, architecture, requirements], 9)), calculated(15, binary("+", value(9), value(6)))]).
proof(216, duration_path(load_test, [load_test, integration, backend, api_design, requirements], 16), rule(28, at(36, 1)), [uses(182, task(load_test, 2)), uses(186, depends(load_test, integration)), uses(212, duration_path(integration, [integration, backend, api_design, requirements], 14)), calculated(16, binary("+", value(14), value(2)))]).
proof(217, duration_path(load_test, [load_test, integration, frontend, api_design, requirements], 15), rule(28, at(36, 1)), [uses(182, task(load_test, 2)), uses(186, depends(load_test, integration)), uses(213, duration_path(integration, [integration, frontend, api_design, requirements], 13)), calculated(15, binary("+", value(13), value(2)))]).
proof(218, duration_path(load_test, [load_test, integration, auth, architecture, requirements], 14), rule(28, at(36, 1)), [uses(182, task(load_test, 2)), uses(186, depends(load_test, integration)), uses(214, duration_path(integration, [integration, auth, architecture, requirements], 12)), calculated(14, binary("+", value(12), value(2)))]).
proof(219, duration_path(integration, [integration, backend, database, architecture, requirements], 19), rule(28, at(36, 1)), [uses(187, task(integration, 4)), uses(188, depends(integration, backend)), uses(215, duration_path(backend, [backend, database, architecture, requirements], 15)), calculated(19, binary("+", value(15), value(4)))]).
proof(220, solution([16]), query, [uses(216, duration_path(load_test, [load_test, integration, backend, api_design, requirements], 16))]).
proof(221, solution([15]), query, [uses(217, duration_path(load_test, [load_test, integration, frontend, api_design, requirements], 15))]).
proof(222, solution([14]), query, [uses(218, duration_path(load_test, [load_test, integration, auth, architecture, requirements], 14))]).
proof(223, duration_path(load_test, [load_test, integration, backend, database, architecture, requirements], 21), rule(28, at(36, 1)), [uses(182, task(load_test, 2)), uses(186, depends(load_test, integration)), uses(219, duration_path(integration, [integration, backend, database, architecture, requirements], 19)), calculated(21, binary("+", value(19), value(2)))]).
proof(224, solution([21]), query, [uses(223, duration_path(load_test, [load_test, integration, backend, database, architecture, requirements], 21))]).
proof(225, finish_time(load_test, 21), rule(29, at(41, 1)), [uses(10, task(load_test, 2)), collected([14, 15, 16, 21], ?v0, [call(duration_path(load_test, ?v1, ?v0))], [220, 221, 222, 224], complete), calculated(21, function("max", [value([14, 15, 16, 21])]))]).
proof(226, task(launch, 1), rule(11, at(16, 1)), []).
proof(227, depends(launch, security_review), rule(24, at(30, 1)), []).
proof(228, depends(launch, load_test), rule(25, at(31, 1)), []).
proof(229, has_predecessor(launch), rule(26, at(33, 1)), [uses(227, depends(launch, security_review))]).
proof(230, solution([]), query, [uses(229, has_predecessor(launch))]).
proof(231, depends(launch, security_review), rule(24, at(30, 1)), []).
proof(232, depends(launch, load_test), rule(25, at(31, 1)), []).
proof(233, task(security_review, 3), rule(9, at(14, 1)), []).
proof(234, task(load_test, 2), rule(10, at(15, 1)), []).
proof(235, depends(security_review, integration), rule(22, at(28, 1)), []).
proof(236, depends(load_test, integration), rule(23, at(29, 1)), []).
proof(237, task(integration, 4), rule(8, at(13, 1)), []).
proof(238, depends(integration, backend), rule(19, at(25, 1)), []).
proof(239, depends(integration, frontend), rule(20, at(26, 1)), []).
proof(240, depends(integration, auth), rule(21, at(27, 1)), []).
proof(241, task(backend, 6), rule(5, at(10, 1)), []).
proof(242, task(frontend, 5), rule(6, at(11, 1)), []).
proof(243, task(auth, 3), rule(7, at(12, 1)), []).
proof(244, depends(backend, api_design), rule(15, at(21, 1)), []).
proof(245, depends(backend, database), rule(16, at(22, 1)), []).
proof(246, depends(frontend, api_design), rule(17, at(23, 1)), []).
proof(247, depends(auth, architecture), rule(18, at(24, 1)), []).
proof(248, task(api_design, 2), rule(3, at(8, 1)), []).
proof(249, task(database, 4), rule(4, at(9, 1)), []).
proof(250, task(architecture, 3), rule(2, at(7, 1)), []).
proof(251, depends(api_design, requirements), rule(13, at(19, 1)), []).
proof(252, depends(database, architecture), rule(14, at(20, 1)), []).
proof(253, depends(architecture, requirements), rule(12, at(18, 1)), []).
proof(254, task(requirements, 2), rule(1, at(6, 1)), []).
proof(255, duration_path(requirements, [requirements], 2), rule(27, at(34, 1)), [uses(254, task(requirements, 2)), absent(has_predecessor(requirements), complete)]).
proof(256, duration_path(api_design, [api_design, requirements], 4), rule(28, at(36, 1)), [uses(248, task(api_design, 2)), uses(251, depends(api_design, requirements)), uses(255, duration_path(requirements, [requirements], 2)), calculated(4, binary("+", value(2), value(2)))]).
proof(257, duration_path(architecture, [architecture, requirements], 5), rule(28, at(36, 1)), [uses(250, task(architecture, 3)), uses(253, depends(architecture, requirements)), uses(255, duration_path(requirements, [requirements], 2)), calculated(5, binary("+", value(2), value(3)))]).
proof(258, duration_path(backend, [backend, api_design, requirements], 10), rule(28, at(36, 1)), [uses(241, task(backend, 6)), uses(244, depends(backend, api_design)), uses(256, duration_path(api_design, [api_design, requirements], 4)), calculated(10, binary("+", value(4), value(6)))]).
proof(259, duration_path(frontend, [frontend, api_design, requirements], 9), rule(28, at(36, 1)), [uses(242, task(frontend, 5)), uses(246, depends(frontend, api_design)), uses(256, duration_path(api_design, [api_design, requirements], 4)), calculated(9, binary("+", value(4), value(5)))]).
proof(260, duration_path(auth, [auth, architecture, requirements], 8), rule(28, at(36, 1)), [uses(243, task(auth, 3)), uses(247, depends(auth, architecture)), uses(257, duration_path(architecture, [architecture, requirements], 5)), calculated(8, binary("+", value(5), value(3)))]).
proof(261, duration_path(database, [database, architecture, requirements], 9), rule(28, at(36, 1)), [uses(249, task(database, 4)), uses(252, depends(database, architecture)), uses(257, duration_path(architecture, [architecture, requirements], 5)), calculated(9, binary("+", value(5), value(4)))]).
proof(262, duration_path(integration, [integration, backend, api_design, requirements], 14), rule(28, at(36, 1)), [uses(237, task(integration, 4)), uses(238, depends(integration, backend)), uses(258, duration_path(backend, [backend, api_design, requirements], 10)), calculated(14, binary("+", value(10), value(4)))]).
proof(263, duration_path(integration, [integration, frontend, api_design, requirements], 13), rule(28, at(36, 1)), [uses(237, task(integration, 4)), uses(239, depends(integration, frontend)), uses(259, duration_path(frontend, [frontend, api_design, requirements], 9)), calculated(13, binary("+", value(9), value(4)))]).
proof(264, duration_path(integration, [integration, auth, architecture, requirements], 12), rule(28, at(36, 1)), [uses(237, task(integration, 4)), uses(240, depends(integration, auth)), uses(260, duration_path(auth, [auth, architecture, requirements], 8)), calculated(12, binary("+", value(8), value(4)))]).
proof(265, duration_path(backend, [backend, database, architecture, requirements], 15), rule(28, at(36, 1)), [uses(241, task(backend, 6)), uses(245, depends(backend, database)), uses(261, duration_path(database, [database, architecture, requirements], 9)), calculated(15, binary("+", value(9), value(6)))]).
proof(266, duration_path(security_review, [security_review, integration, backend, api_design, requirements], 17), rule(28, at(36, 1)), [uses(233, task(security_review, 3)), uses(235, depends(security_review, integration)), uses(262, duration_path(integration, [integration, backend, api_design, requirements], 14)), calculated(17, binary("+", value(14), value(3)))]).
proof(267, duration_path(security_review, [security_review, integration, frontend, api_design, requirements], 16), rule(28, at(36, 1)), [uses(233, task(security_review, 3)), uses(235, depends(security_review, integration)), uses(263, duration_path(integration, [integration, frontend, api_design, requirements], 13)), calculated(16, binary("+", value(13), value(3)))]).
proof(268, duration_path(security_review, [security_review, integration, auth, architecture, requirements], 15), rule(28, at(36, 1)), [uses(233, task(security_review, 3)), uses(235, depends(security_review, integration)), uses(264, duration_path(integration, [integration, auth, architecture, requirements], 12)), calculated(15, binary("+", value(12), value(3)))]).
proof(269, duration_path(load_test, [load_test, integration, backend, api_design, requirements], 16), rule(28, at(36, 1)), [uses(234, task(load_test, 2)), uses(236, depends(load_test, integration)), uses(262, duration_path(integration, [integration, backend, api_design, requirements], 14)), calculated(16, binary("+", value(14), value(2)))]).
proof(270, duration_path(load_test, [load_test, integration, frontend, api_design, requirements], 15), rule(28, at(36, 1)), [uses(234, task(load_test, 2)), uses(236, depends(load_test, integration)), uses(263, duration_path(integration, [integration, frontend, api_design, requirements], 13)), calculated(15, binary("+", value(13), value(2)))]).
proof(271, duration_path(load_test, [load_test, integration, auth, architecture, requirements], 14), rule(28, at(36, 1)), [uses(234, task(load_test, 2)), uses(236, depends(load_test, integration)), uses(264, duration_path(integration, [integration, auth, architecture, requirements], 12)), calculated(14, binary("+", value(12), value(2)))]).
proof(272, duration_path(integration, [integration, backend, database, architecture, requirements], 19), rule(28, at(36, 1)), [uses(237, task(integration, 4)), uses(238, depends(integration, backend)), uses(265, duration_path(backend, [backend, database, architecture, requirements], 15)), calculated(19, binary("+", value(15), value(4)))]).
proof(273, duration_path(launch, [launch, security_review, integration, backend, api_design, requirements], 18), rule(28, at(36, 1)), [uses(226, task(launch, 1)), uses(231, depends(launch, security_review)), uses(266, duration_path(security_review, [security_review, integration, backend, api_design, requirements], 17)), calculated(18, binary("+", value(17), value(1)))]).
proof(274, duration_path(launch, [launch, security_review, integration, frontend, api_design, requirements], 17), rule(28, at(36, 1)), [uses(226, task(launch, 1)), uses(231, depends(launch, security_review)), uses(267, duration_path(security_review, [security_review, integration, frontend, api_design, requirements], 16)), calculated(17, binary("+", value(16), value(1)))]).
proof(275, duration_path(launch, [launch, security_review, integration, auth, architecture, requirements], 16), rule(28, at(36, 1)), [uses(226, task(launch, 1)), uses(231, depends(launch, security_review)), uses(268, duration_path(security_review, [security_review, integration, auth, architecture, requirements], 15)), calculated(16, binary("+", value(15), value(1)))]).
proof(276, duration_path(launch, [launch, load_test, integration, backend, api_design, requirements], 17), rule(28, at(36, 1)), [uses(226, task(launch, 1)), uses(232, depends(launch, load_test)), uses(269, duration_path(load_test, [load_test, integration, backend, api_design, requirements], 16)), calculated(17, binary("+", value(16), value(1)))]).
proof(277, duration_path(launch, [launch, load_test, integration, frontend, api_design, requirements], 16), rule(28, at(36, 1)), [uses(226, task(launch, 1)), uses(232, depends(launch, load_test)), uses(270, duration_path(load_test, [load_test, integration, frontend, api_design, requirements], 15)), calculated(16, binary("+", value(15), value(1)))]).
proof(278, duration_path(launch, [launch, load_test, integration, auth, architecture, requirements], 15), rule(28, at(36, 1)), [uses(226, task(launch, 1)), uses(232, depends(launch, load_test)), uses(271, duration_path(load_test, [load_test, integration, auth, architecture, requirements], 14)), calculated(15, binary("+", value(14), value(1)))]).
proof(279, duration_path(security_review, [security_review, integration, backend, database, architecture, requirements], 22), rule(28, at(36, 1)), [uses(233, task(security_review, 3)), uses(235, depends(security_review, integration)), uses(272, duration_path(integration, [integration, backend, database, architecture, requirements], 19)), calculated(22, binary("+", value(19), value(3)))]).
proof(280, duration_path(load_test, [load_test, integration, backend, database, architecture, requirements], 21), rule(28, at(36, 1)), [uses(234, task(load_test, 2)), uses(236, depends(load_test, integration)), uses(272, duration_path(integration, [integration, backend, database, architecture, requirements], 19)), calculated(21, binary("+", value(19), value(2)))]).
proof(281, solution([18]), query, [uses(273, duration_path(launch, [launch, security_review, integration, backend, api_design, requirements], 18))]).
proof(282, solution([17]), query, [uses(274, duration_path(launch, [launch, security_review, integration, frontend, api_design, requirements], 17))]).
proof(283, solution([16]), query, [uses(275, duration_path(launch, [launch, security_review, integration, auth, architecture, requirements], 16))]).
proof(284, solution([15]), query, [uses(278, duration_path(launch, [launch, load_test, integration, auth, architecture, requirements], 15))]).
proof(285, duration_path(launch, [launch, security_review, integration, backend, database, architecture, requirements], 23), rule(28, at(36, 1)), [uses(226, task(launch, 1)), uses(231, depends(launch, security_review)), uses(279, duration_path(security_review, [security_review, integration, backend, database, architecture, requirements], 22)), calculated(23, binary("+", value(22), value(1)))]).
proof(286, duration_path(launch, [launch, load_test, integration, backend, database, architecture, requirements], 22), rule(28, at(36, 1)), [uses(226, task(launch, 1)), uses(232, depends(launch, load_test)), uses(280, duration_path(load_test, [load_test, integration, backend, database, architecture, requirements], 21)), calculated(22, binary("+", value(21), value(1)))]).
proof(287, solution([23]), query, [uses(285, duration_path(launch, [launch, security_review, integration, backend, database, architecture, requirements], 23))]).
proof(288, solution([22]), query, [uses(286, duration_path(launch, [launch, load_test, integration, backend, database, architecture, requirements], 22))]).
proof(289, finish_time(launch, 23), rule(29, at(41, 1)), [uses(11, task(launch, 1)), collected([15, 16, 17, 18, 22, 23], ?v0, [call(duration_path(launch, ?v1, ?v0))], [281, 282, 283, 284, 287, 288], complete), calculated(23, function("max", [value([15, 16, 17, 18, 22, 23])]))]).
proof(290, solution([2]), query, [uses(15, finish_time(requirements, 2))]).
proof(291, solution([5]), query, [uses(25, finish_time(architecture, 5))]).
proof(292, solution([4]), query, [uses(35, finish_time(api_design, 4))]).
proof(293, solution([9]), query, [uses(48, finish_time(database, 9))]).
proof(294, solution([15]), query, [uses(71, finish_time(backend, 15))]).
proof(295, solution([8]), query, [uses(97, finish_time(auth, 8))]).
proof(296, solution([19]), query, [uses(137, finish_time(integration, 19))]).
proof(297, solution([22]), query, [uses(181, finish_time(security_review, 22))]).
proof(298, solution([21]), query, [uses(225, finish_time(load_test, 21))]).
proof(299, solution([23]), query, [uses(289, finish_time(launch, 23))]).
proof(300, project_finish(23), rule(31, at(47, 1)), [collected([15, 19, 2, 21, 22, 23, 4, 5, 8, 9], ?v0, [call(finish_time(?v1, ?v0))], [290, 291, 292, 293, 294, 295, 296, 297, 298, 299], complete), calculated(23, function("max", [value([15, 19, 2, 21, 22, 23, 4, 5, 8, 9])]))]).
proof(301, solution([23]), query, [uses(300, project_finish(23))]).
proof(302, task(requirements, 2), rule(1, at(6, 1)), []).
proof(303, task(architecture, 3), rule(2, at(7, 1)), []).
proof(304, task(api_design, 2), rule(3, at(8, 1)), []).
proof(305, task(database, 4), rule(4, at(9, 1)), []).
proof(306, task(backend, 6), rule(5, at(10, 1)), []).
proof(307, task(frontend, 5), rule(6, at(11, 1)), []).
proof(308, task(auth, 3), rule(7, at(12, 1)), []).
proof(309, task(integration, 4), rule(8, at(13, 1)), []).
proof(310, task(security_review, 3), rule(9, at(14, 1)), []).
proof(311, task(load_test, 2), rule(10, at(15, 1)), []).
proof(312, task(launch, 1), rule(11, at(16, 1)), []).
proof(313, task(requirements, 2), rule(1, at(6, 1)), []).
proof(314, duration_path(requirements, [requirements], 2), rule(27, at(34, 1)), [uses(313, task(requirements, 2)), absent(has_predecessor(requirements), complete)]).
proof(315, solution([2]), query, [uses(314, duration_path(requirements, [requirements], 2))]).
proof(316, finish_time(requirements, 2), rule(29, at(41, 1)), [uses(302, task(requirements, 2)), collected([2], ?v0, [call(duration_path(requirements, ?v1, ?v0))], [315], complete), calculated(2, function("max", [value([2])]))]).
proof(317, task(architecture, 3), rule(2, at(7, 1)), []).
proof(318, depends(architecture, requirements), rule(12, at(18, 1)), []).
proof(319, task(requirements, 2), rule(1, at(6, 1)), []).
proof(320, duration_path(requirements, [requirements], 2), rule(27, at(34, 1)), [uses(319, task(requirements, 2)), absent(has_predecessor(requirements), complete)]).
proof(321, duration_path(architecture, [architecture, requirements], 5), rule(28, at(36, 1)), [uses(317, task(architecture, 3)), uses(318, depends(architecture, requirements)), uses(320, duration_path(requirements, [requirements], 2)), calculated(5, binary("+", value(2), value(3)))]).
proof(322, solution([5]), query, [uses(321, duration_path(architecture, [architecture, requirements], 5))]).
proof(323, finish_time(architecture, 5), rule(29, at(41, 1)), [uses(303, task(architecture, 3)), collected([5], ?v0, [call(duration_path(architecture, ?v1, ?v0))], [322], complete), calculated(5, function("max", [value([5])]))]).
proof(324, task(api_design, 2), rule(3, at(8, 1)), []).
proof(325, depends(api_design, requirements), rule(13, at(19, 1)), []).
proof(326, task(requirements, 2), rule(1, at(6, 1)), []).
proof(327, duration_path(requirements, [requirements], 2), rule(27, at(34, 1)), [uses(326, task(requirements, 2)), absent(has_predecessor(requirements), complete)]).
proof(328, duration_path(api_design, [api_design, requirements], 4), rule(28, at(36, 1)), [uses(324, task(api_design, 2)), uses(325, depends(api_design, requirements)), uses(327, duration_path(requirements, [requirements], 2)), calculated(4, binary("+", value(2), value(2)))]).
proof(329, solution([4]), query, [uses(328, duration_path(api_design, [api_design, requirements], 4))]).
proof(330, finish_time(api_design, 4), rule(29, at(41, 1)), [uses(304, task(api_design, 2)), collected([4], ?v0, [call(duration_path(api_design, ?v1, ?v0))], [329], complete), calculated(4, function("max", [value([4])]))]).
proof(331, task(database, 4), rule(4, at(9, 1)), []).
proof(332, depends(database, architecture), rule(14, at(20, 1)), []).
proof(333, task(architecture, 3), rule(2, at(7, 1)), []).
proof(334, depends(architecture, requirements), rule(12, at(18, 1)), []).
proof(335, task(requirements, 2), rule(1, at(6, 1)), []).
proof(336, duration_path(requirements, [requirements], 2), rule(27, at(34, 1)), [uses(335, task(requirements, 2)), absent(has_predecessor(requirements), complete)]).
proof(337, duration_path(architecture, [architecture, requirements], 5), rule(28, at(36, 1)), [uses(333, task(architecture, 3)), uses(334, depends(architecture, requirements)), uses(336, duration_path(requirements, [requirements], 2)), calculated(5, binary("+", value(2), value(3)))]).
proof(338, duration_path(database, [database, architecture, requirements], 9), rule(28, at(36, 1)), [uses(331, task(database, 4)), uses(332, depends(database, architecture)), uses(337, duration_path(architecture, [architecture, requirements], 5)), calculated(9, binary("+", value(5), value(4)))]).
proof(339, solution([9]), query, [uses(338, duration_path(database, [database, architecture, requirements], 9))]).
proof(340, finish_time(database, 9), rule(29, at(41, 1)), [uses(305, task(database, 4)), collected([9], ?v0, [call(duration_path(database, ?v1, ?v0))], [339], complete), calculated(9, function("max", [value([9])]))]).
proof(341, task(backend, 6), rule(5, at(10, 1)), []).
proof(342, depends(backend, api_design), rule(15, at(21, 1)), []).
proof(343, depends(backend, database), rule(16, at(22, 1)), []).
proof(344, task(api_design, 2), rule(3, at(8, 1)), []).
proof(345, task(database, 4), rule(4, at(9, 1)), []).
proof(346, depends(api_design, requirements), rule(13, at(19, 1)), []).
proof(347, depends(database, architecture), rule(14, at(20, 1)), []).
proof(348, task(requirements, 2), rule(1, at(6, 1)), []).
proof(349, task(architecture, 3), rule(2, at(7, 1)), []).
proof(350, duration_path(requirements, [requirements], 2), rule(27, at(34, 1)), [uses(348, task(requirements, 2)), absent(has_predecessor(requirements), complete)]).
proof(351, duration_path(api_design, [api_design, requirements], 4), rule(28, at(36, 1)), [uses(344, task(api_design, 2)), uses(346, depends(api_design, requirements)), uses(350, duration_path(requirements, [requirements], 2)), calculated(4, binary("+", value(2), value(2)))]).
proof(352, depends(architecture, requirements), rule(12, at(18, 1)), []).
proof(353, duration_path(backend, [backend, api_design, requirements], 10), rule(28, at(36, 1)), [uses(341, task(backend, 6)), uses(342, depends(backend, api_design)), uses(351, duration_path(api_design, [api_design, requirements], 4)), calculated(10, binary("+", value(4), value(6)))]).
proof(354, duration_path(architecture, [architecture, requirements], 5), rule(28, at(36, 1)), [uses(349, task(architecture, 3)), uses(352, depends(architecture, requirements)), uses(350, duration_path(requirements, [requirements], 2)), calculated(5, binary("+", value(2), value(3)))]).
proof(355, solution([10]), query, [uses(353, duration_path(backend, [backend, api_design, requirements], 10))]).
proof(356, duration_path(database, [database, architecture, requirements], 9), rule(28, at(36, 1)), [uses(345, task(database, 4)), uses(347, depends(database, architecture)), uses(354, duration_path(architecture, [architecture, requirements], 5)), calculated(9, binary("+", value(5), value(4)))]).
proof(357, duration_path(backend, [backend, database, architecture, requirements], 15), rule(28, at(36, 1)), [uses(341, task(backend, 6)), uses(343, depends(backend, database)), uses(356, duration_path(database, [database, architecture, requirements], 9)), calculated(15, binary("+", value(9), value(6)))]).
proof(358, solution([15]), query, [uses(357, duration_path(backend, [backend, database, architecture, requirements], 15))]).
proof(359, finish_time(backend, 15), rule(29, at(41, 1)), [uses(306, task(backend, 6)), collected([10, 15], ?v0, [call(duration_path(backend, ?v1, ?v0))], [355, 358], complete), calculated(15, function("max", [value([10, 15])]))]).
proof(360, task(frontend, 5), rule(6, at(11, 1)), []).
proof(361, depends(frontend, api_design), rule(17, at(23, 1)), []).
proof(362, task(api_design, 2), rule(3, at(8, 1)), []).
proof(363, depends(api_design, requirements), rule(13, at(19, 1)), []).
proof(364, task(requirements, 2), rule(1, at(6, 1)), []).
proof(365, duration_path(requirements, [requirements], 2), rule(27, at(34, 1)), [uses(364, task(requirements, 2)), absent(has_predecessor(requirements), complete)]).
proof(366, duration_path(api_design, [api_design, requirements], 4), rule(28, at(36, 1)), [uses(362, task(api_design, 2)), uses(363, depends(api_design, requirements)), uses(365, duration_path(requirements, [requirements], 2)), calculated(4, binary("+", value(2), value(2)))]).
proof(367, duration_path(frontend, [frontend, api_design, requirements], 9), rule(28, at(36, 1)), [uses(360, task(frontend, 5)), uses(361, depends(frontend, api_design)), uses(366, duration_path(api_design, [api_design, requirements], 4)), calculated(9, binary("+", value(4), value(5)))]).
proof(368, solution([9]), query, [uses(367, duration_path(frontend, [frontend, api_design, requirements], 9))]).
proof(369, finish_time(frontend, 9), rule(29, at(41, 1)), [uses(307, task(frontend, 5)), collected([9], ?v0, [call(duration_path(frontend, ?v1, ?v0))], [368], complete), calculated(9, function("max", [value([9])]))]).
proof(370, task(auth, 3), rule(7, at(12, 1)), []).
proof(371, depends(auth, architecture), rule(18, at(24, 1)), []).
proof(372, task(architecture, 3), rule(2, at(7, 1)), []).
proof(373, depends(architecture, requirements), rule(12, at(18, 1)), []).
proof(374, task(requirements, 2), rule(1, at(6, 1)), []).
proof(375, duration_path(requirements, [requirements], 2), rule(27, at(34, 1)), [uses(374, task(requirements, 2)), absent(has_predecessor(requirements), complete)]).
proof(376, duration_path(architecture, [architecture, requirements], 5), rule(28, at(36, 1)), [uses(372, task(architecture, 3)), uses(373, depends(architecture, requirements)), uses(375, duration_path(requirements, [requirements], 2)), calculated(5, binary("+", value(2), value(3)))]).
proof(377, duration_path(auth, [auth, architecture, requirements], 8), rule(28, at(36, 1)), [uses(370, task(auth, 3)), uses(371, depends(auth, architecture)), uses(376, duration_path(architecture, [architecture, requirements], 5)), calculated(8, binary("+", value(5), value(3)))]).
proof(378, solution([8]), query, [uses(377, duration_path(auth, [auth, architecture, requirements], 8))]).
proof(379, finish_time(auth, 8), rule(29, at(41, 1)), [uses(308, task(auth, 3)), collected([8], ?v0, [call(duration_path(auth, ?v1, ?v0))], [378], complete), calculated(8, function("max", [value([8])]))]).
proof(380, task(integration, 4), rule(8, at(13, 1)), []).
proof(381, depends(integration, backend), rule(19, at(25, 1)), []).
proof(382, depends(integration, frontend), rule(20, at(26, 1)), []).
proof(383, depends(integration, auth), rule(21, at(27, 1)), []).
proof(384, task(backend, 6), rule(5, at(10, 1)), []).
proof(385, task(frontend, 5), rule(6, at(11, 1)), []).
proof(386, task(auth, 3), rule(7, at(12, 1)), []).
proof(387, depends(backend, api_design), rule(15, at(21, 1)), []).
proof(388, depends(backend, database), rule(16, at(22, 1)), []).
proof(389, depends(frontend, api_design), rule(17, at(23, 1)), []).
proof(390, depends(auth, architecture), rule(18, at(24, 1)), []).
proof(391, task(api_design, 2), rule(3, at(8, 1)), []).
proof(392, task(database, 4), rule(4, at(9, 1)), []).
proof(393, task(architecture, 3), rule(2, at(7, 1)), []).
proof(394, depends(api_design, requirements), rule(13, at(19, 1)), []).
proof(395, depends(database, architecture), rule(14, at(20, 1)), []).
proof(396, depends(architecture, requirements), rule(12, at(18, 1)), []).
proof(397, task(requirements, 2), rule(1, at(6, 1)), []).
proof(398, duration_path(requirements, [requirements], 2), rule(27, at(34, 1)), [uses(397, task(requirements, 2)), absent(has_predecessor(requirements), complete)]).
proof(399, duration_path(api_design, [api_design, requirements], 4), rule(28, at(36, 1)), [uses(391, task(api_design, 2)), uses(394, depends(api_design, requirements)), uses(398, duration_path(requirements, [requirements], 2)), calculated(4, binary("+", value(2), value(2)))]).
proof(400, duration_path(architecture, [architecture, requirements], 5), rule(28, at(36, 1)), [uses(393, task(architecture, 3)), uses(396, depends(architecture, requirements)), uses(398, duration_path(requirements, [requirements], 2)), calculated(5, binary("+", value(2), value(3)))]).
proof(401, duration_path(backend, [backend, api_design, requirements], 10), rule(28, at(36, 1)), [uses(384, task(backend, 6)), uses(387, depends(backend, api_design)), uses(399, duration_path(api_design, [api_design, requirements], 4)), calculated(10, binary("+", value(4), value(6)))]).
proof(402, duration_path(frontend, [frontend, api_design, requirements], 9), rule(28, at(36, 1)), [uses(385, task(frontend, 5)), uses(389, depends(frontend, api_design)), uses(399, duration_path(api_design, [api_design, requirements], 4)), calculated(9, binary("+", value(4), value(5)))]).
proof(403, duration_path(auth, [auth, architecture, requirements], 8), rule(28, at(36, 1)), [uses(386, task(auth, 3)), uses(390, depends(auth, architecture)), uses(400, duration_path(architecture, [architecture, requirements], 5)), calculated(8, binary("+", value(5), value(3)))]).
proof(404, duration_path(database, [database, architecture, requirements], 9), rule(28, at(36, 1)), [uses(392, task(database, 4)), uses(395, depends(database, architecture)), uses(400, duration_path(architecture, [architecture, requirements], 5)), calculated(9, binary("+", value(5), value(4)))]).
proof(405, duration_path(integration, [integration, backend, api_design, requirements], 14), rule(28, at(36, 1)), [uses(380, task(integration, 4)), uses(381, depends(integration, backend)), uses(401, duration_path(backend, [backend, api_design, requirements], 10)), calculated(14, binary("+", value(10), value(4)))]).
proof(406, duration_path(integration, [integration, frontend, api_design, requirements], 13), rule(28, at(36, 1)), [uses(380, task(integration, 4)), uses(382, depends(integration, frontend)), uses(402, duration_path(frontend, [frontend, api_design, requirements], 9)), calculated(13, binary("+", value(9), value(4)))]).
proof(407, duration_path(integration, [integration, auth, architecture, requirements], 12), rule(28, at(36, 1)), [uses(380, task(integration, 4)), uses(383, depends(integration, auth)), uses(403, duration_path(auth, [auth, architecture, requirements], 8)), calculated(12, binary("+", value(8), value(4)))]).
proof(408, duration_path(backend, [backend, database, architecture, requirements], 15), rule(28, at(36, 1)), [uses(384, task(backend, 6)), uses(388, depends(backend, database)), uses(404, duration_path(database, [database, architecture, requirements], 9)), calculated(15, binary("+", value(9), value(6)))]).
proof(409, solution([14]), query, [uses(405, duration_path(integration, [integration, backend, api_design, requirements], 14))]).
proof(410, solution([13]), query, [uses(406, duration_path(integration, [integration, frontend, api_design, requirements], 13))]).
proof(411, solution([12]), query, [uses(407, duration_path(integration, [integration, auth, architecture, requirements], 12))]).
proof(412, duration_path(integration, [integration, backend, database, architecture, requirements], 19), rule(28, at(36, 1)), [uses(380, task(integration, 4)), uses(381, depends(integration, backend)), uses(408, duration_path(backend, [backend, database, architecture, requirements], 15)), calculated(19, binary("+", value(15), value(4)))]).
proof(413, solution([19]), query, [uses(412, duration_path(integration, [integration, backend, database, architecture, requirements], 19))]).
proof(414, finish_time(integration, 19), rule(29, at(41, 1)), [uses(309, task(integration, 4)), collected([12, 13, 14, 19], ?v0, [call(duration_path(integration, ?v1, ?v0))], [409, 410, 411, 413], complete), calculated(19, function("max", [value([12, 13, 14, 19])]))]).
proof(415, task(security_review, 3), rule(9, at(14, 1)), []).
proof(416, depends(security_review, integration), rule(22, at(28, 1)), []).
proof(417, task(integration, 4), rule(8, at(13, 1)), []).
proof(418, depends(integration, backend), rule(19, at(25, 1)), []).
proof(419, depends(integration, frontend), rule(20, at(26, 1)), []).
proof(420, depends(integration, auth), rule(21, at(27, 1)), []).
proof(421, task(backend, 6), rule(5, at(10, 1)), []).
proof(422, task(frontend, 5), rule(6, at(11, 1)), []).
proof(423, task(auth, 3), rule(7, at(12, 1)), []).
proof(424, depends(backend, api_design), rule(15, at(21, 1)), []).
proof(425, depends(backend, database), rule(16, at(22, 1)), []).
proof(426, depends(frontend, api_design), rule(17, at(23, 1)), []).
proof(427, depends(auth, architecture), rule(18, at(24, 1)), []).
proof(428, task(api_design, 2), rule(3, at(8, 1)), []).
proof(429, task(database, 4), rule(4, at(9, 1)), []).
proof(430, task(architecture, 3), rule(2, at(7, 1)), []).
proof(431, depends(api_design, requirements), rule(13, at(19, 1)), []).
proof(432, depends(database, architecture), rule(14, at(20, 1)), []).
proof(433, depends(architecture, requirements), rule(12, at(18, 1)), []).
proof(434, task(requirements, 2), rule(1, at(6, 1)), []).
proof(435, duration_path(requirements, [requirements], 2), rule(27, at(34, 1)), [uses(434, task(requirements, 2)), absent(has_predecessor(requirements), complete)]).
proof(436, duration_path(api_design, [api_design, requirements], 4), rule(28, at(36, 1)), [uses(428, task(api_design, 2)), uses(431, depends(api_design, requirements)), uses(435, duration_path(requirements, [requirements], 2)), calculated(4, binary("+", value(2), value(2)))]).
proof(437, duration_path(architecture, [architecture, requirements], 5), rule(28, at(36, 1)), [uses(430, task(architecture, 3)), uses(433, depends(architecture, requirements)), uses(435, duration_path(requirements, [requirements], 2)), calculated(5, binary("+", value(2), value(3)))]).
proof(438, duration_path(backend, [backend, api_design, requirements], 10), rule(28, at(36, 1)), [uses(421, task(backend, 6)), uses(424, depends(backend, api_design)), uses(436, duration_path(api_design, [api_design, requirements], 4)), calculated(10, binary("+", value(4), value(6)))]).
proof(439, duration_path(frontend, [frontend, api_design, requirements], 9), rule(28, at(36, 1)), [uses(422, task(frontend, 5)), uses(426, depends(frontend, api_design)), uses(436, duration_path(api_design, [api_design, requirements], 4)), calculated(9, binary("+", value(4), value(5)))]).
proof(440, duration_path(auth, [auth, architecture, requirements], 8), rule(28, at(36, 1)), [uses(423, task(auth, 3)), uses(427, depends(auth, architecture)), uses(437, duration_path(architecture, [architecture, requirements], 5)), calculated(8, binary("+", value(5), value(3)))]).
proof(441, duration_path(database, [database, architecture, requirements], 9), rule(28, at(36, 1)), [uses(429, task(database, 4)), uses(432, depends(database, architecture)), uses(437, duration_path(architecture, [architecture, requirements], 5)), calculated(9, binary("+", value(5), value(4)))]).
proof(442, duration_path(integration, [integration, backend, api_design, requirements], 14), rule(28, at(36, 1)), [uses(417, task(integration, 4)), uses(418, depends(integration, backend)), uses(438, duration_path(backend, [backend, api_design, requirements], 10)), calculated(14, binary("+", value(10), value(4)))]).
proof(443, duration_path(integration, [integration, frontend, api_design, requirements], 13), rule(28, at(36, 1)), [uses(417, task(integration, 4)), uses(419, depends(integration, frontend)), uses(439, duration_path(frontend, [frontend, api_design, requirements], 9)), calculated(13, binary("+", value(9), value(4)))]).
proof(444, duration_path(integration, [integration, auth, architecture, requirements], 12), rule(28, at(36, 1)), [uses(417, task(integration, 4)), uses(420, depends(integration, auth)), uses(440, duration_path(auth, [auth, architecture, requirements], 8)), calculated(12, binary("+", value(8), value(4)))]).
proof(445, duration_path(backend, [backend, database, architecture, requirements], 15), rule(28, at(36, 1)), [uses(421, task(backend, 6)), uses(425, depends(backend, database)), uses(441, duration_path(database, [database, architecture, requirements], 9)), calculated(15, binary("+", value(9), value(6)))]).
proof(446, duration_path(security_review, [security_review, integration, backend, api_design, requirements], 17), rule(28, at(36, 1)), [uses(415, task(security_review, 3)), uses(416, depends(security_review, integration)), uses(442, duration_path(integration, [integration, backend, api_design, requirements], 14)), calculated(17, binary("+", value(14), value(3)))]).
proof(447, duration_path(security_review, [security_review, integration, frontend, api_design, requirements], 16), rule(28, at(36, 1)), [uses(415, task(security_review, 3)), uses(416, depends(security_review, integration)), uses(443, duration_path(integration, [integration, frontend, api_design, requirements], 13)), calculated(16, binary("+", value(13), value(3)))]).
proof(448, duration_path(security_review, [security_review, integration, auth, architecture, requirements], 15), rule(28, at(36, 1)), [uses(415, task(security_review, 3)), uses(416, depends(security_review, integration)), uses(444, duration_path(integration, [integration, auth, architecture, requirements], 12)), calculated(15, binary("+", value(12), value(3)))]).
proof(449, duration_path(integration, [integration, backend, database, architecture, requirements], 19), rule(28, at(36, 1)), [uses(417, task(integration, 4)), uses(418, depends(integration, backend)), uses(445, duration_path(backend, [backend, database, architecture, requirements], 15)), calculated(19, binary("+", value(15), value(4)))]).
proof(450, solution([17]), query, [uses(446, duration_path(security_review, [security_review, integration, backend, api_design, requirements], 17))]).
proof(451, solution([16]), query, [uses(447, duration_path(security_review, [security_review, integration, frontend, api_design, requirements], 16))]).
proof(452, solution([15]), query, [uses(448, duration_path(security_review, [security_review, integration, auth, architecture, requirements], 15))]).
proof(453, duration_path(security_review, [security_review, integration, backend, database, architecture, requirements], 22), rule(28, at(36, 1)), [uses(415, task(security_review, 3)), uses(416, depends(security_review, integration)), uses(449, duration_path(integration, [integration, backend, database, architecture, requirements], 19)), calculated(22, binary("+", value(19), value(3)))]).
proof(454, solution([22]), query, [uses(453, duration_path(security_review, [security_review, integration, backend, database, architecture, requirements], 22))]).
proof(455, finish_time(security_review, 22), rule(29, at(41, 1)), [uses(310, task(security_review, 3)), collected([15, 16, 17, 22], ?v0, [call(duration_path(security_review, ?v1, ?v0))], [450, 451, 452, 454], complete), calculated(22, function("max", [value([15, 16, 17, 22])]))]).
proof(456, task(load_test, 2), rule(10, at(15, 1)), []).
proof(457, depends(load_test, integration), rule(23, at(29, 1)), []).
proof(458, task(integration, 4), rule(8, at(13, 1)), []).
proof(459, depends(integration, backend), rule(19, at(25, 1)), []).
proof(460, depends(integration, frontend), rule(20, at(26, 1)), []).
proof(461, depends(integration, auth), rule(21, at(27, 1)), []).
proof(462, task(backend, 6), rule(5, at(10, 1)), []).
proof(463, task(frontend, 5), rule(6, at(11, 1)), []).
proof(464, task(auth, 3), rule(7, at(12, 1)), []).
proof(465, depends(backend, api_design), rule(15, at(21, 1)), []).
proof(466, depends(backend, database), rule(16, at(22, 1)), []).
proof(467, depends(frontend, api_design), rule(17, at(23, 1)), []).
proof(468, depends(auth, architecture), rule(18, at(24, 1)), []).
proof(469, task(api_design, 2), rule(3, at(8, 1)), []).
proof(470, task(database, 4), rule(4, at(9, 1)), []).
proof(471, task(architecture, 3), rule(2, at(7, 1)), []).
proof(472, depends(api_design, requirements), rule(13, at(19, 1)), []).
proof(473, depends(database, architecture), rule(14, at(20, 1)), []).
proof(474, depends(architecture, requirements), rule(12, at(18, 1)), []).
proof(475, task(requirements, 2), rule(1, at(6, 1)), []).
proof(476, duration_path(requirements, [requirements], 2), rule(27, at(34, 1)), [uses(475, task(requirements, 2)), absent(has_predecessor(requirements), complete)]).
proof(477, duration_path(api_design, [api_design, requirements], 4), rule(28, at(36, 1)), [uses(469, task(api_design, 2)), uses(472, depends(api_design, requirements)), uses(476, duration_path(requirements, [requirements], 2)), calculated(4, binary("+", value(2), value(2)))]).
proof(478, duration_path(architecture, [architecture, requirements], 5), rule(28, at(36, 1)), [uses(471, task(architecture, 3)), uses(474, depends(architecture, requirements)), uses(476, duration_path(requirements, [requirements], 2)), calculated(5, binary("+", value(2), value(3)))]).
proof(479, duration_path(backend, [backend, api_design, requirements], 10), rule(28, at(36, 1)), [uses(462, task(backend, 6)), uses(465, depends(backend, api_design)), uses(477, duration_path(api_design, [api_design, requirements], 4)), calculated(10, binary("+", value(4), value(6)))]).
proof(480, duration_path(frontend, [frontend, api_design, requirements], 9), rule(28, at(36, 1)), [uses(463, task(frontend, 5)), uses(467, depends(frontend, api_design)), uses(477, duration_path(api_design, [api_design, requirements], 4)), calculated(9, binary("+", value(4), value(5)))]).
proof(481, duration_path(auth, [auth, architecture, requirements], 8), rule(28, at(36, 1)), [uses(464, task(auth, 3)), uses(468, depends(auth, architecture)), uses(478, duration_path(architecture, [architecture, requirements], 5)), calculated(8, binary("+", value(5), value(3)))]).
proof(482, duration_path(database, [database, architecture, requirements], 9), rule(28, at(36, 1)), [uses(470, task(database, 4)), uses(473, depends(database, architecture)), uses(478, duration_path(architecture, [architecture, requirements], 5)), calculated(9, binary("+", value(5), value(4)))]).
proof(483, duration_path(integration, [integration, backend, api_design, requirements], 14), rule(28, at(36, 1)), [uses(458, task(integration, 4)), uses(459, depends(integration, backend)), uses(479, duration_path(backend, [backend, api_design, requirements], 10)), calculated(14, binary("+", value(10), value(4)))]).
proof(484, duration_path(integration, [integration, frontend, api_design, requirements], 13), rule(28, at(36, 1)), [uses(458, task(integration, 4)), uses(460, depends(integration, frontend)), uses(480, duration_path(frontend, [frontend, api_design, requirements], 9)), calculated(13, binary("+", value(9), value(4)))]).
proof(485, duration_path(integration, [integration, auth, architecture, requirements], 12), rule(28, at(36, 1)), [uses(458, task(integration, 4)), uses(461, depends(integration, auth)), uses(481, duration_path(auth, [auth, architecture, requirements], 8)), calculated(12, binary("+", value(8), value(4)))]).
proof(486, duration_path(backend, [backend, database, architecture, requirements], 15), rule(28, at(36, 1)), [uses(462, task(backend, 6)), uses(466, depends(backend, database)), uses(482, duration_path(database, [database, architecture, requirements], 9)), calculated(15, binary("+", value(9), value(6)))]).
proof(487, duration_path(load_test, [load_test, integration, backend, api_design, requirements], 16), rule(28, at(36, 1)), [uses(456, task(load_test, 2)), uses(457, depends(load_test, integration)), uses(483, duration_path(integration, [integration, backend, api_design, requirements], 14)), calculated(16, binary("+", value(14), value(2)))]).
proof(488, duration_path(load_test, [load_test, integration, frontend, api_design, requirements], 15), rule(28, at(36, 1)), [uses(456, task(load_test, 2)), uses(457, depends(load_test, integration)), uses(484, duration_path(integration, [integration, frontend, api_design, requirements], 13)), calculated(15, binary("+", value(13), value(2)))]).
proof(489, duration_path(load_test, [load_test, integration, auth, architecture, requirements], 14), rule(28, at(36, 1)), [uses(456, task(load_test, 2)), uses(457, depends(load_test, integration)), uses(485, duration_path(integration, [integration, auth, architecture, requirements], 12)), calculated(14, binary("+", value(12), value(2)))]).
proof(490, duration_path(integration, [integration, backend, database, architecture, requirements], 19), rule(28, at(36, 1)), [uses(458, task(integration, 4)), uses(459, depends(integration, backend)), uses(486, duration_path(backend, [backend, database, architecture, requirements], 15)), calculated(19, binary("+", value(15), value(4)))]).
proof(491, solution([16]), query, [uses(487, duration_path(load_test, [load_test, integration, backend, api_design, requirements], 16))]).
proof(492, solution([15]), query, [uses(488, duration_path(load_test, [load_test, integration, frontend, api_design, requirements], 15))]).
proof(493, solution([14]), query, [uses(489, duration_path(load_test, [load_test, integration, auth, architecture, requirements], 14))]).
proof(494, duration_path(load_test, [load_test, integration, backend, database, architecture, requirements], 21), rule(28, at(36, 1)), [uses(456, task(load_test, 2)), uses(457, depends(load_test, integration)), uses(490, duration_path(integration, [integration, backend, database, architecture, requirements], 19)), calculated(21, binary("+", value(19), value(2)))]).
proof(495, solution([21]), query, [uses(494, duration_path(load_test, [load_test, integration, backend, database, architecture, requirements], 21))]).
proof(496, finish_time(load_test, 21), rule(29, at(41, 1)), [uses(311, task(load_test, 2)), collected([14, 15, 16, 21], ?v0, [call(duration_path(load_test, ?v1, ?v0))], [491, 492, 493, 495], complete), calculated(21, function("max", [value([14, 15, 16, 21])]))]).
proof(497, task(launch, 1), rule(11, at(16, 1)), []).
proof(498, depends(launch, security_review), rule(24, at(30, 1)), []).
proof(499, depends(launch, load_test), rule(25, at(31, 1)), []).
proof(500, task(security_review, 3), rule(9, at(14, 1)), []).
proof(501, task(load_test, 2), rule(10, at(15, 1)), []).
proof(502, depends(security_review, integration), rule(22, at(28, 1)), []).
proof(503, depends(load_test, integration), rule(23, at(29, 1)), []).
proof(504, task(integration, 4), rule(8, at(13, 1)), []).
proof(505, depends(integration, backend), rule(19, at(25, 1)), []).
proof(506, depends(integration, frontend), rule(20, at(26, 1)), []).
proof(507, depends(integration, auth), rule(21, at(27, 1)), []).
proof(508, task(backend, 6), rule(5, at(10, 1)), []).
proof(509, task(frontend, 5), rule(6, at(11, 1)), []).
proof(510, task(auth, 3), rule(7, at(12, 1)), []).
proof(511, depends(backend, api_design), rule(15, at(21, 1)), []).
proof(512, depends(backend, database), rule(16, at(22, 1)), []).
proof(513, depends(frontend, api_design), rule(17, at(23, 1)), []).
proof(514, depends(auth, architecture), rule(18, at(24, 1)), []).
proof(515, task(api_design, 2), rule(3, at(8, 1)), []).
proof(516, task(database, 4), rule(4, at(9, 1)), []).
proof(517, task(architecture, 3), rule(2, at(7, 1)), []).
proof(518, depends(api_design, requirements), rule(13, at(19, 1)), []).
proof(519, depends(database, architecture), rule(14, at(20, 1)), []).
proof(520, depends(architecture, requirements), rule(12, at(18, 1)), []).
proof(521, task(requirements, 2), rule(1, at(6, 1)), []).
proof(522, duration_path(requirements, [requirements], 2), rule(27, at(34, 1)), [uses(521, task(requirements, 2)), absent(has_predecessor(requirements), complete)]).
proof(523, duration_path(api_design, [api_design, requirements], 4), rule(28, at(36, 1)), [uses(515, task(api_design, 2)), uses(518, depends(api_design, requirements)), uses(522, duration_path(requirements, [requirements], 2)), calculated(4, binary("+", value(2), value(2)))]).
proof(524, duration_path(architecture, [architecture, requirements], 5), rule(28, at(36, 1)), [uses(517, task(architecture, 3)), uses(520, depends(architecture, requirements)), uses(522, duration_path(requirements, [requirements], 2)), calculated(5, binary("+", value(2), value(3)))]).
proof(525, duration_path(backend, [backend, api_design, requirements], 10), rule(28, at(36, 1)), [uses(508, task(backend, 6)), uses(511, depends(backend, api_design)), uses(523, duration_path(api_design, [api_design, requirements], 4)), calculated(10, binary("+", value(4), value(6)))]).
proof(526, duration_path(frontend, [frontend, api_design, requirements], 9), rule(28, at(36, 1)), [uses(509, task(frontend, 5)), uses(513, depends(frontend, api_design)), uses(523, duration_path(api_design, [api_design, requirements], 4)), calculated(9, binary("+", value(4), value(5)))]).
proof(527, duration_path(auth, [auth, architecture, requirements], 8), rule(28, at(36, 1)), [uses(510, task(auth, 3)), uses(514, depends(auth, architecture)), uses(524, duration_path(architecture, [architecture, requirements], 5)), calculated(8, binary("+", value(5), value(3)))]).
proof(528, duration_path(database, [database, architecture, requirements], 9), rule(28, at(36, 1)), [uses(516, task(database, 4)), uses(519, depends(database, architecture)), uses(524, duration_path(architecture, [architecture, requirements], 5)), calculated(9, binary("+", value(5), value(4)))]).
proof(529, duration_path(integration, [integration, backend, api_design, requirements], 14), rule(28, at(36, 1)), [uses(504, task(integration, 4)), uses(505, depends(integration, backend)), uses(525, duration_path(backend, [backend, api_design, requirements], 10)), calculated(14, binary("+", value(10), value(4)))]).
proof(530, duration_path(integration, [integration, frontend, api_design, requirements], 13), rule(28, at(36, 1)), [uses(504, task(integration, 4)), uses(506, depends(integration, frontend)), uses(526, duration_path(frontend, [frontend, api_design, requirements], 9)), calculated(13, binary("+", value(9), value(4)))]).
proof(531, duration_path(integration, [integration, auth, architecture, requirements], 12), rule(28, at(36, 1)), [uses(504, task(integration, 4)), uses(507, depends(integration, auth)), uses(527, duration_path(auth, [auth, architecture, requirements], 8)), calculated(12, binary("+", value(8), value(4)))]).
proof(532, duration_path(backend, [backend, database, architecture, requirements], 15), rule(28, at(36, 1)), [uses(508, task(backend, 6)), uses(512, depends(backend, database)), uses(528, duration_path(database, [database, architecture, requirements], 9)), calculated(15, binary("+", value(9), value(6)))]).
proof(533, duration_path(security_review, [security_review, integration, backend, api_design, requirements], 17), rule(28, at(36, 1)), [uses(500, task(security_review, 3)), uses(502, depends(security_review, integration)), uses(529, duration_path(integration, [integration, backend, api_design, requirements], 14)), calculated(17, binary("+", value(14), value(3)))]).
proof(534, duration_path(security_review, [security_review, integration, frontend, api_design, requirements], 16), rule(28, at(36, 1)), [uses(500, task(security_review, 3)), uses(502, depends(security_review, integration)), uses(530, duration_path(integration, [integration, frontend, api_design, requirements], 13)), calculated(16, binary("+", value(13), value(3)))]).
proof(535, duration_path(security_review, [security_review, integration, auth, architecture, requirements], 15), rule(28, at(36, 1)), [uses(500, task(security_review, 3)), uses(502, depends(security_review, integration)), uses(531, duration_path(integration, [integration, auth, architecture, requirements], 12)), calculated(15, binary("+", value(12), value(3)))]).
proof(536, duration_path(load_test, [load_test, integration, backend, api_design, requirements], 16), rule(28, at(36, 1)), [uses(501, task(load_test, 2)), uses(503, depends(load_test, integration)), uses(529, duration_path(integration, [integration, backend, api_design, requirements], 14)), calculated(16, binary("+", value(14), value(2)))]).
proof(537, duration_path(load_test, [load_test, integration, frontend, api_design, requirements], 15), rule(28, at(36, 1)), [uses(501, task(load_test, 2)), uses(503, depends(load_test, integration)), uses(530, duration_path(integration, [integration, frontend, api_design, requirements], 13)), calculated(15, binary("+", value(13), value(2)))]).
proof(538, duration_path(load_test, [load_test, integration, auth, architecture, requirements], 14), rule(28, at(36, 1)), [uses(501, task(load_test, 2)), uses(503, depends(load_test, integration)), uses(531, duration_path(integration, [integration, auth, architecture, requirements], 12)), calculated(14, binary("+", value(12), value(2)))]).
proof(539, duration_path(integration, [integration, backend, database, architecture, requirements], 19), rule(28, at(36, 1)), [uses(504, task(integration, 4)), uses(505, depends(integration, backend)), uses(532, duration_path(backend, [backend, database, architecture, requirements], 15)), calculated(19, binary("+", value(15), value(4)))]).
proof(540, duration_path(launch, [launch, security_review, integration, backend, api_design, requirements], 18), rule(28, at(36, 1)), [uses(497, task(launch, 1)), uses(498, depends(launch, security_review)), uses(533, duration_path(security_review, [security_review, integration, backend, api_design, requirements], 17)), calculated(18, binary("+", value(17), value(1)))]).
proof(541, duration_path(launch, [launch, security_review, integration, frontend, api_design, requirements], 17), rule(28, at(36, 1)), [uses(497, task(launch, 1)), uses(498, depends(launch, security_review)), uses(534, duration_path(security_review, [security_review, integration, frontend, api_design, requirements], 16)), calculated(17, binary("+", value(16), value(1)))]).
proof(542, duration_path(launch, [launch, security_review, integration, auth, architecture, requirements], 16), rule(28, at(36, 1)), [uses(497, task(launch, 1)), uses(498, depends(launch, security_review)), uses(535, duration_path(security_review, [security_review, integration, auth, architecture, requirements], 15)), calculated(16, binary("+", value(15), value(1)))]).
proof(543, duration_path(launch, [launch, load_test, integration, backend, api_design, requirements], 17), rule(28, at(36, 1)), [uses(497, task(launch, 1)), uses(499, depends(launch, load_test)), uses(536, duration_path(load_test, [load_test, integration, backend, api_design, requirements], 16)), calculated(17, binary("+", value(16), value(1)))]).
proof(544, duration_path(launch, [launch, load_test, integration, frontend, api_design, requirements], 16), rule(28, at(36, 1)), [uses(497, task(launch, 1)), uses(499, depends(launch, load_test)), uses(537, duration_path(load_test, [load_test, integration, frontend, api_design, requirements], 15)), calculated(16, binary("+", value(15), value(1)))]).
proof(545, duration_path(launch, [launch, load_test, integration, auth, architecture, requirements], 15), rule(28, at(36, 1)), [uses(497, task(launch, 1)), uses(499, depends(launch, load_test)), uses(538, duration_path(load_test, [load_test, integration, auth, architecture, requirements], 14)), calculated(15, binary("+", value(14), value(1)))]).
proof(546, duration_path(security_review, [security_review, integration, backend, database, architecture, requirements], 22), rule(28, at(36, 1)), [uses(500, task(security_review, 3)), uses(502, depends(security_review, integration)), uses(539, duration_path(integration, [integration, backend, database, architecture, requirements], 19)), calculated(22, binary("+", value(19), value(3)))]).
proof(547, duration_path(load_test, [load_test, integration, backend, database, architecture, requirements], 21), rule(28, at(36, 1)), [uses(501, task(load_test, 2)), uses(503, depends(load_test, integration)), uses(539, duration_path(integration, [integration, backend, database, architecture, requirements], 19)), calculated(21, binary("+", value(19), value(2)))]).
proof(548, solution([18]), query, [uses(540, duration_path(launch, [launch, security_review, integration, backend, api_design, requirements], 18))]).
proof(549, solution([17]), query, [uses(541, duration_path(launch, [launch, security_review, integration, frontend, api_design, requirements], 17))]).
proof(550, solution([16]), query, [uses(542, duration_path(launch, [launch, security_review, integration, auth, architecture, requirements], 16))]).
proof(551, solution([15]), query, [uses(545, duration_path(launch, [launch, load_test, integration, auth, architecture, requirements], 15))]).
proof(552, duration_path(launch, [launch, security_review, integration, backend, database, architecture, requirements], 23), rule(28, at(36, 1)), [uses(497, task(launch, 1)), uses(498, depends(launch, security_review)), uses(546, duration_path(security_review, [security_review, integration, backend, database, architecture, requirements], 22)), calculated(23, binary("+", value(22), value(1)))]).
proof(553, duration_path(launch, [launch, load_test, integration, backend, database, architecture, requirements], 22), rule(28, at(36, 1)), [uses(497, task(launch, 1)), uses(499, depends(launch, load_test)), uses(547, duration_path(load_test, [load_test, integration, backend, database, architecture, requirements], 21)), calculated(22, binary("+", value(21), value(1)))]).
proof(554, solution([23]), query, [uses(552, duration_path(launch, [launch, security_review, integration, backend, database, architecture, requirements], 23))]).
proof(555, solution([22]), query, [uses(553, duration_path(launch, [launch, load_test, integration, backend, database, architecture, requirements], 22))]).
proof(556, finish_time(launch, 23), rule(29, at(41, 1)), [uses(312, task(launch, 1)), collected([15, 16, 17, 18, 22, 23], ?v0, [call(duration_path(launch, ?v1, ?v0))], [548, 549, 550, 551, 554, 555], complete), calculated(23, function("max", [value([15, 16, 17, 18, 22, 23])]))]).
proof(557, solution([2]), query, [uses(316, finish_time(requirements, 2))]).
proof(558, solution([5]), query, [uses(323, finish_time(architecture, 5))]).
proof(559, solution([4]), query, [uses(330, finish_time(api_design, 4))]).
proof(560, solution([9]), query, [uses(340, finish_time(database, 9))]).
proof(561, solution([15]), query, [uses(359, finish_time(backend, 15))]).
proof(562, solution([8]), query, [uses(379, finish_time(auth, 8))]).
proof(563, solution([19]), query, [uses(414, finish_time(integration, 19))]).
proof(564, solution([22]), query, [uses(455, finish_time(security_review, 22))]).
proof(565, solution([21]), query, [uses(496, finish_time(load_test, 21))]).
proof(566, solution([23]), query, [uses(556, finish_time(launch, 23))]).
proof(567, project_finish(23), rule(31, at(47, 1)), [collected([15, 19, 2, 21, 22, 23, 4, 5, 8, 9], ?v0, [call(finish_time(?v1, ?v0))], [557, 558, 559, 560, 561, 562, 563, 564, 565, 566], complete), calculated(23, function("max", [value([15, 19, 2, 21, 22, 23, 4, 5, 8, 9])]))]).
proof(568, task(requirements, 2), rule(1, at(6, 1)), []).
proof(569, task(architecture, 3), rule(2, at(7, 1)), []).
proof(570, task(api_design, 2), rule(3, at(8, 1)), []).
proof(571, task(database, 4), rule(4, at(9, 1)), []).
proof(572, task(backend, 6), rule(5, at(10, 1)), []).
proof(573, task(frontend, 5), rule(6, at(11, 1)), []).
proof(574, task(auth, 3), rule(7, at(12, 1)), []).
proof(575, task(integration, 4), rule(8, at(13, 1)), []).
proof(576, task(security_review, 3), rule(9, at(14, 1)), []).
proof(577, task(load_test, 2), rule(10, at(15, 1)), []).
proof(578, task(launch, 1), rule(11, at(16, 1)), []).
proof(579, depends(architecture, requirements), rule(12, at(18, 1)), []).
proof(580, depends(api_design, requirements), rule(13, at(19, 1)), []).
proof(581, depends(database, architecture), rule(14, at(20, 1)), []).
proof(582, depends(backend, api_design), rule(15, at(21, 1)), []).
proof(583, depends(backend, database), rule(16, at(22, 1)), []).
proof(584, depends(frontend, api_design), rule(17, at(23, 1)), []).
proof(585, depends(auth, architecture), rule(18, at(24, 1)), []).
proof(586, depends(integration, backend), rule(19, at(25, 1)), []).
proof(587, depends(integration, frontend), rule(20, at(26, 1)), []).
proof(588, depends(integration, auth), rule(21, at(27, 1)), []).
proof(589, depends(security_review, integration), rule(22, at(28, 1)), []).
proof(590, depends(load_test, integration), rule(23, at(29, 1)), []).
proof(591, depends(launch, security_review), rule(24, at(30, 1)), []).
proof(592, depends(launch, load_test), rule(25, at(31, 1)), []).
proof(593, task(requirements, 2), rule(1, at(6, 1)), []).
proof(594, task(architecture, 3), rule(2, at(7, 1)), []).
proof(595, task(api_design, 2), rule(3, at(8, 1)), []).
proof(596, task(database, 4), rule(4, at(9, 1)), []).
proof(597, task(backend, 6), rule(5, at(10, 1)), []).
proof(598, task(frontend, 5), rule(6, at(11, 1)), []).
proof(599, task(auth, 3), rule(7, at(12, 1)), []).
proof(600, task(integration, 4), rule(8, at(13, 1)), []).
proof(601, task(security_review, 3), rule(9, at(14, 1)), []).
proof(602, task(load_test, 2), rule(10, at(15, 1)), []).
proof(603, duration_path(requirements, [requirements], 2), rule(27, at(34, 1)), [uses(593, task(requirements, 2)), absent(has_predecessor(requirements), complete)]).
proof(604, duration_path(architecture, [architecture, requirements], 5), rule(28, at(36, 1)), [uses(594, task(architecture, 3)), uses(579, depends(architecture, requirements)), uses(603, duration_path(requirements, [requirements], 2)), calculated(5, binary("+", value(2), value(3)))]).
proof(605, duration_path(api_design, [api_design, requirements], 4), rule(28, at(36, 1)), [uses(595, task(api_design, 2)), uses(580, depends(api_design, requirements)), uses(603, duration_path(requirements, [requirements], 2)), calculated(4, binary("+", value(2), value(2)))]).
proof(606, duration_path(database, [database, architecture, requirements], 9), rule(28, at(36, 1)), [uses(596, task(database, 4)), uses(581, depends(database, architecture)), uses(604, duration_path(architecture, [architecture, requirements], 5)), calculated(9, binary("+", value(5), value(4)))]).
proof(607, duration_path(backend, [backend, api_design, requirements], 10), rule(28, at(36, 1)), [uses(597, task(backend, 6)), uses(582, depends(backend, api_design)), uses(605, duration_path(api_design, [api_design, requirements], 4)), calculated(10, binary("+", value(4), value(6)))]).
proof(608, duration_path(backend, [backend, database, architecture, requirements], 15), rule(28, at(36, 1)), [uses(597, task(backend, 6)), uses(583, depends(backend, database)), uses(606, duration_path(database, [database, architecture, requirements], 9)), calculated(15, binary("+", value(9), value(6)))]).
proof(609, duration_path(frontend, [frontend, api_design, requirements], 9), rule(28, at(36, 1)), [uses(598, task(frontend, 5)), uses(584, depends(frontend, api_design)), uses(605, duration_path(api_design, [api_design, requirements], 4)), calculated(9, binary("+", value(4), value(5)))]).
proof(610, duration_path(auth, [auth, architecture, requirements], 8), rule(28, at(36, 1)), [uses(599, task(auth, 3)), uses(585, depends(auth, architecture)), uses(604, duration_path(architecture, [architecture, requirements], 5)), calculated(8, binary("+", value(5), value(3)))]).
proof(611, duration_path(integration, [integration, backend, api_design, requirements], 14), rule(28, at(36, 1)), [uses(600, task(integration, 4)), uses(586, depends(integration, backend)), uses(607, duration_path(backend, [backend, api_design, requirements], 10)), calculated(14, binary("+", value(10), value(4)))]).
proof(612, duration_path(integration, [integration, backend, database, architecture, requirements], 19), rule(28, at(36, 1)), [uses(600, task(integration, 4)), uses(586, depends(integration, backend)), uses(608, duration_path(backend, [backend, database, architecture, requirements], 15)), calculated(19, binary("+", value(15), value(4)))]).
proof(613, duration_path(integration, [integration, frontend, api_design, requirements], 13), rule(28, at(36, 1)), [uses(600, task(integration, 4)), uses(587, depends(integration, frontend)), uses(609, duration_path(frontend, [frontend, api_design, requirements], 9)), calculated(13, binary("+", value(9), value(4)))]).
proof(614, duration_path(integration, [integration, auth, architecture, requirements], 12), rule(28, at(36, 1)), [uses(600, task(integration, 4)), uses(588, depends(integration, auth)), uses(610, duration_path(auth, [auth, architecture, requirements], 8)), calculated(12, binary("+", value(8), value(4)))]).
proof(615, duration_path(security_review, [security_review, integration, backend, api_design, requirements], 17), rule(28, at(36, 1)), [uses(601, task(security_review, 3)), uses(589, depends(security_review, integration)), uses(611, duration_path(integration, [integration, backend, api_design, requirements], 14)), calculated(17, binary("+", value(14), value(3)))]).
proof(616, duration_path(security_review, [security_review, integration, backend, database, architecture, requirements], 22), rule(28, at(36, 1)), [uses(601, task(security_review, 3)), uses(589, depends(security_review, integration)), uses(612, duration_path(integration, [integration, backend, database, architecture, requirements], 19)), calculated(22, binary("+", value(19), value(3)))]).
proof(617, duration_path(security_review, [security_review, integration, frontend, api_design, requirements], 16), rule(28, at(36, 1)), [uses(601, task(security_review, 3)), uses(589, depends(security_review, integration)), uses(613, duration_path(integration, [integration, frontend, api_design, requirements], 13)), calculated(16, binary("+", value(13), value(3)))]).
proof(618, duration_path(security_review, [security_review, integration, auth, architecture, requirements], 15), rule(28, at(36, 1)), [uses(601, task(security_review, 3)), uses(589, depends(security_review, integration)), uses(614, duration_path(integration, [integration, auth, architecture, requirements], 12)), calculated(15, binary("+", value(12), value(3)))]).
proof(619, duration_path(load_test, [load_test, integration, backend, api_design, requirements], 16), rule(28, at(36, 1)), [uses(602, task(load_test, 2)), uses(590, depends(load_test, integration)), uses(611, duration_path(integration, [integration, backend, api_design, requirements], 14)), calculated(16, binary("+", value(14), value(2)))]).
proof(620, duration_path(load_test, [load_test, integration, backend, database, architecture, requirements], 21), rule(28, at(36, 1)), [uses(602, task(load_test, 2)), uses(590, depends(load_test, integration)), uses(612, duration_path(integration, [integration, backend, database, architecture, requirements], 19)), calculated(21, binary("+", value(19), value(2)))]).
proof(621, duration_path(load_test, [load_test, integration, frontend, api_design, requirements], 15), rule(28, at(36, 1)), [uses(602, task(load_test, 2)), uses(590, depends(load_test, integration)), uses(613, duration_path(integration, [integration, frontend, api_design, requirements], 13)), calculated(15, binary("+", value(13), value(2)))]).
proof(622, duration_path(load_test, [load_test, integration, auth, architecture, requirements], 14), rule(28, at(36, 1)), [uses(602, task(load_test, 2)), uses(590, depends(load_test, integration)), uses(614, duration_path(integration, [integration, auth, architecture, requirements], 12)), calculated(14, binary("+", value(12), value(2)))]).
proof(623, duration_path(launch, [launch, security_review, integration, backend, database, architecture, requirements], 23), rule(28, at(36, 1)), [uses(578, task(launch, 1)), uses(591, depends(launch, security_review)), uses(616, duration_path(security_review, [security_review, integration, backend, database, architecture, requirements], 22)), calculated(23, binary("+", value(22), value(1)))]).
proof(624, member(launch, [launch, security_review, integration, backend, database, architecture, requirements]), rule(32, at(51, 1)), []).
proof(625, critical_task(launch), rule(34, at(53, 1)), [uses(567, project_finish(23)), uses(623, duration_path(launch, [launch, security_review, integration, backend, database, architecture, requirements], 23)), uses(624, member(launch, [launch, security_review, integration, backend, database, architecture, requirements]))]).
proof(626, member(security_review, [security_review, integration, backend, database, architecture, requirements]), rule(32, at(51, 1)), []).
proof(627, solution([launch]), query, [uses(625, critical_task(launch))]).
proof(628, member(security_review, [launch, security_review, integration, backend, database, architecture, requirements]), rule(33, at(52, 1)), [uses(626, member(security_review, [security_review, integration, backend, database, architecture, requirements]))]).
proof(629, member(integration, [integration, backend, database, architecture, requirements]), rule(32, at(51, 1)), []).
proof(630, critical_task(security_review), rule(34, at(53, 1)), [uses(567, project_finish(23)), uses(623, duration_path(launch, [launch, security_review, integration, backend, database, architecture, requirements], 23)), uses(628, member(security_review, [launch, security_review, integration, backend, database, architecture, requirements]))]).
proof(631, member(integration, [security_review, integration, backend, database, architecture, requirements]), rule(33, at(52, 1)), [uses(629, member(integration, [integration, backend, database, architecture, requirements]))]).
proof(632, member(backend, [backend, database, architecture, requirements]), rule(32, at(51, 1)), []).
proof(633, solution([security_review]), query, [uses(630, critical_task(security_review))]).
proof(634, member(integration, [launch, security_review, integration, backend, database, architecture, requirements]), rule(33, at(52, 1)), [uses(631, member(integration, [security_review, integration, backend, database, architecture, requirements]))]).
proof(635, member(backend, [integration, backend, database, architecture, requirements]), rule(33, at(52, 1)), [uses(632, member(backend, [backend, database, architecture, requirements]))]).
proof(636, member(database, [database, architecture, requirements]), rule(32, at(51, 1)), []).
proof(637, critical_task(integration), rule(34, at(53, 1)), [uses(567, project_finish(23)), uses(623, duration_path(launch, [launch, security_review, integration, backend, database, architecture, requirements], 23)), uses(634, member(integration, [launch, security_review, integration, backend, database, architecture, requirements]))]).
proof(638, member(backend, [security_review, integration, backend, database, architecture, requirements]), rule(33, at(52, 1)), [uses(635, member(backend, [integration, backend, database, architecture, requirements]))]).
proof(639, member(database, [backend, database, architecture, requirements]), rule(33, at(52, 1)), [uses(636, member(database, [database, architecture, requirements]))]).
proof(640, member(architecture, [architecture, requirements]), rule(32, at(51, 1)), []).
proof(641, solution([integration]), query, [uses(637, critical_task(integration))]).
proof(642, member(backend, [launch, security_review, integration, backend, database, architecture, requirements]), rule(33, at(52, 1)), [uses(638, member(backend, [security_review, integration, backend, database, architecture, requirements]))]).
proof(643, member(database, [integration, backend, database, architecture, requirements]), rule(33, at(52, 1)), [uses(639, member(database, [backend, database, architecture, requirements]))]).
proof(644, member(architecture, [database, architecture, requirements]), rule(33, at(52, 1)), [uses(640, member(architecture, [architecture, requirements]))]).
proof(645, member(requirements, [requirements]), rule(32, at(51, 1)), []).
proof(646, critical_task(backend), rule(34, at(53, 1)), [uses(567, project_finish(23)), uses(623, duration_path(launch, [launch, security_review, integration, backend, database, architecture, requirements], 23)), uses(642, member(backend, [launch, security_review, integration, backend, database, architecture, requirements]))]).
proof(647, member(database, [security_review, integration, backend, database, architecture, requirements]), rule(33, at(52, 1)), [uses(643, member(database, [integration, backend, database, architecture, requirements]))]).
proof(648, member(architecture, [backend, database, architecture, requirements]), rule(33, at(52, 1)), [uses(644, member(architecture, [database, architecture, requirements]))]).
proof(649, member(requirements, [architecture, requirements]), rule(33, at(52, 1)), [uses(645, member(requirements, [requirements]))]).
proof(650, solution([backend]), query, [uses(646, critical_task(backend))]).
proof(651, member(database, [launch, security_review, integration, backend, database, architecture, requirements]), rule(33, at(52, 1)), [uses(647, member(database, [security_review, integration, backend, database, architecture, requirements]))]).
proof(652, member(architecture, [integration, backend, database, architecture, requirements]), rule(33, at(52, 1)), [uses(648, member(architecture, [backend, database, architecture, requirements]))]).
proof(653, member(requirements, [database, architecture, requirements]), rule(33, at(52, 1)), [uses(649, member(requirements, [architecture, requirements]))]).
proof(654, critical_task(database), rule(34, at(53, 1)), [uses(567, project_finish(23)), uses(623, duration_path(launch, [launch, security_review, integration, backend, database, architecture, requirements], 23)), uses(651, member(database, [launch, security_review, integration, backend, database, architecture, requirements]))]).
proof(655, member(architecture, [security_review, integration, backend, database, architecture, requirements]), rule(33, at(52, 1)), [uses(652, member(architecture, [integration, backend, database, architecture, requirements]))]).
proof(656, member(requirements, [backend, database, architecture, requirements]), rule(33, at(52, 1)), [uses(653, member(requirements, [database, architecture, requirements]))]).
proof(657, solution([database]), query, [uses(654, critical_task(database))]).
proof(658, member(architecture, [launch, security_review, integration, backend, database, architecture, requirements]), rule(33, at(52, 1)), [uses(655, member(architecture, [security_review, integration, backend, database, architecture, requirements]))]).
proof(659, member(requirements, [integration, backend, database, architecture, requirements]), rule(33, at(52, 1)), [uses(656, member(requirements, [backend, database, architecture, requirements]))]).
proof(660, critical_task(architecture), rule(34, at(53, 1)), [uses(567, project_finish(23)), uses(623, duration_path(launch, [launch, security_review, integration, backend, database, architecture, requirements], 23)), uses(658, member(architecture, [launch, security_review, integration, backend, database, architecture, requirements]))]).
proof(661, member(requirements, [security_review, integration, backend, database, architecture, requirements]), rule(33, at(52, 1)), [uses(659, member(requirements, [integration, backend, database, architecture, requirements]))]).
proof(662, solution([architecture]), query, [uses(660, critical_task(architecture))]).
proof(663, member(requirements, [launch, security_review, integration, backend, database, architecture, requirements]), rule(33, at(52, 1)), [uses(661, member(requirements, [security_review, integration, backend, database, architecture, requirements]))]).
proof(664, critical_task(requirements), rule(34, at(53, 1)), [uses(567, project_finish(23)), uses(623, duration_path(launch, [launch, security_review, integration, backend, database, architecture, requirements], 23)), uses(663, member(requirements, [launch, security_review, integration, backend, database, architecture, requirements]))]).
proof(665, solution([requirements]), query, [uses(664, critical_task(requirements))]).
proof(666, task(requirements, 2), rule(1, at(6, 1)), []).
proof(667, task(architecture, 3), rule(2, at(7, 1)), []).
proof(668, task(api_design, 2), rule(3, at(8, 1)), []).
proof(669, task(database, 4), rule(4, at(9, 1)), []).
proof(670, task(backend, 6), rule(5, at(10, 1)), []).
proof(671, task(frontend, 5), rule(6, at(11, 1)), []).
proof(672, task(auth, 3), rule(7, at(12, 1)), []).
proof(673, task(integration, 4), rule(8, at(13, 1)), []).
proof(674, task(security_review, 3), rule(9, at(14, 1)), []).
proof(675, task(load_test, 2), rule(10, at(15, 1)), []).
proof(676, task(launch, 1), rule(11, at(16, 1)), []).
proof(677, task(requirements, 2), rule(1, at(6, 1)), []).
proof(678, task(architecture, 3), rule(2, at(7, 1)), []).
proof(679, task(api_design, 2), rule(3, at(8, 1)), []).
proof(680, task(database, 4), rule(4, at(9, 1)), []).
proof(681, task(backend, 6), rule(5, at(10, 1)), []).
proof(682, task(frontend, 5), rule(6, at(11, 1)), []).
proof(683, task(auth, 3), rule(7, at(12, 1)), []).
proof(684, task(integration, 4), rule(8, at(13, 1)), []).
proof(685, task(security_review, 3), rule(9, at(14, 1)), []).
proof(686, task(load_test, 2), rule(10, at(15, 1)), []).
proof(687, task(launch, 1), rule(11, at(16, 1)), []).
proof(688, task(requirements, 2), rule(1, at(6, 1)), []).
proof(689, duration_path(requirements, [requirements], 2), rule(27, at(34, 1)), [uses(688, task(requirements, 2)), absent(has_predecessor(requirements), complete)]).
proof(690, solution([2]), query, [uses(689, duration_path(requirements, [requirements], 2))]).
proof(691, finish_time(requirements, 2), rule(29, at(41, 1)), [uses(677, task(requirements, 2)), collected([2], ?v0, [call(duration_path(requirements, ?v1, ?v0))], [690], complete), calculated(2, function("max", [value([2])]))]).
proof(692, task(architecture, 3), rule(2, at(7, 1)), []).
proof(693, depends(architecture, requirements), rule(12, at(18, 1)), []).
proof(694, task(requirements, 2), rule(1, at(6, 1)), []).
proof(695, duration_path(requirements, [requirements], 2), rule(27, at(34, 1)), [uses(694, task(requirements, 2)), absent(has_predecessor(requirements), complete)]).
proof(696, duration_path(architecture, [architecture, requirements], 5), rule(28, at(36, 1)), [uses(692, task(architecture, 3)), uses(693, depends(architecture, requirements)), uses(695, duration_path(requirements, [requirements], 2)), calculated(5, binary("+", value(2), value(3)))]).
proof(697, solution([5]), query, [uses(696, duration_path(architecture, [architecture, requirements], 5))]).
proof(698, finish_time(architecture, 5), rule(29, at(41, 1)), [uses(678, task(architecture, 3)), collected([5], ?v0, [call(duration_path(architecture, ?v1, ?v0))], [697], complete), calculated(5, function("max", [value([5])]))]).
proof(699, task(api_design, 2), rule(3, at(8, 1)), []).
proof(700, depends(api_design, requirements), rule(13, at(19, 1)), []).
proof(701, task(requirements, 2), rule(1, at(6, 1)), []).
proof(702, duration_path(requirements, [requirements], 2), rule(27, at(34, 1)), [uses(701, task(requirements, 2)), absent(has_predecessor(requirements), complete)]).
proof(703, duration_path(api_design, [api_design, requirements], 4), rule(28, at(36, 1)), [uses(699, task(api_design, 2)), uses(700, depends(api_design, requirements)), uses(702, duration_path(requirements, [requirements], 2)), calculated(4, binary("+", value(2), value(2)))]).
proof(704, solution([4]), query, [uses(703, duration_path(api_design, [api_design, requirements], 4))]).
proof(705, finish_time(api_design, 4), rule(29, at(41, 1)), [uses(679, task(api_design, 2)), collected([4], ?v0, [call(duration_path(api_design, ?v1, ?v0))], [704], complete), calculated(4, function("max", [value([4])]))]).
proof(706, task(database, 4), rule(4, at(9, 1)), []).
proof(707, depends(database, architecture), rule(14, at(20, 1)), []).
proof(708, task(architecture, 3), rule(2, at(7, 1)), []).
proof(709, depends(architecture, requirements), rule(12, at(18, 1)), []).
proof(710, task(requirements, 2), rule(1, at(6, 1)), []).
proof(711, duration_path(requirements, [requirements], 2), rule(27, at(34, 1)), [uses(710, task(requirements, 2)), absent(has_predecessor(requirements), complete)]).
proof(712, duration_path(architecture, [architecture, requirements], 5), rule(28, at(36, 1)), [uses(708, task(architecture, 3)), uses(709, depends(architecture, requirements)), uses(711, duration_path(requirements, [requirements], 2)), calculated(5, binary("+", value(2), value(3)))]).
proof(713, duration_path(database, [database, architecture, requirements], 9), rule(28, at(36, 1)), [uses(706, task(database, 4)), uses(707, depends(database, architecture)), uses(712, duration_path(architecture, [architecture, requirements], 5)), calculated(9, binary("+", value(5), value(4)))]).
proof(714, solution([9]), query, [uses(713, duration_path(database, [database, architecture, requirements], 9))]).
proof(715, finish_time(database, 9), rule(29, at(41, 1)), [uses(680, task(database, 4)), collected([9], ?v0, [call(duration_path(database, ?v1, ?v0))], [714], complete), calculated(9, function("max", [value([9])]))]).
proof(716, task(backend, 6), rule(5, at(10, 1)), []).
proof(717, depends(backend, api_design), rule(15, at(21, 1)), []).
proof(718, depends(backend, database), rule(16, at(22, 1)), []).
proof(719, task(api_design, 2), rule(3, at(8, 1)), []).
proof(720, task(database, 4), rule(4, at(9, 1)), []).
proof(721, depends(api_design, requirements), rule(13, at(19, 1)), []).
proof(722, depends(database, architecture), rule(14, at(20, 1)), []).
proof(723, task(requirements, 2), rule(1, at(6, 1)), []).
proof(724, task(architecture, 3), rule(2, at(7, 1)), []).
proof(725, duration_path(requirements, [requirements], 2), rule(27, at(34, 1)), [uses(723, task(requirements, 2)), absent(has_predecessor(requirements), complete)]).
proof(726, duration_path(api_design, [api_design, requirements], 4), rule(28, at(36, 1)), [uses(719, task(api_design, 2)), uses(721, depends(api_design, requirements)), uses(725, duration_path(requirements, [requirements], 2)), calculated(4, binary("+", value(2), value(2)))]).
proof(727, depends(architecture, requirements), rule(12, at(18, 1)), []).
proof(728, duration_path(backend, [backend, api_design, requirements], 10), rule(28, at(36, 1)), [uses(716, task(backend, 6)), uses(717, depends(backend, api_design)), uses(726, duration_path(api_design, [api_design, requirements], 4)), calculated(10, binary("+", value(4), value(6)))]).
proof(729, duration_path(architecture, [architecture, requirements], 5), rule(28, at(36, 1)), [uses(724, task(architecture, 3)), uses(727, depends(architecture, requirements)), uses(725, duration_path(requirements, [requirements], 2)), calculated(5, binary("+", value(2), value(3)))]).
proof(730, solution([10]), query, [uses(728, duration_path(backend, [backend, api_design, requirements], 10))]).
proof(731, duration_path(database, [database, architecture, requirements], 9), rule(28, at(36, 1)), [uses(720, task(database, 4)), uses(722, depends(database, architecture)), uses(729, duration_path(architecture, [architecture, requirements], 5)), calculated(9, binary("+", value(5), value(4)))]).
proof(732, duration_path(backend, [backend, database, architecture, requirements], 15), rule(28, at(36, 1)), [uses(716, task(backend, 6)), uses(718, depends(backend, database)), uses(731, duration_path(database, [database, architecture, requirements], 9)), calculated(15, binary("+", value(9), value(6)))]).
proof(733, solution([15]), query, [uses(732, duration_path(backend, [backend, database, architecture, requirements], 15))]).
proof(734, finish_time(backend, 15), rule(29, at(41, 1)), [uses(681, task(backend, 6)), collected([10, 15], ?v0, [call(duration_path(backend, ?v1, ?v0))], [730, 733], complete), calculated(15, function("max", [value([10, 15])]))]).
proof(735, task(frontend, 5), rule(6, at(11, 1)), []).
proof(736, depends(frontend, api_design), rule(17, at(23, 1)), []).
proof(737, task(api_design, 2), rule(3, at(8, 1)), []).
proof(738, depends(api_design, requirements), rule(13, at(19, 1)), []).
proof(739, task(requirements, 2), rule(1, at(6, 1)), []).
proof(740, duration_path(requirements, [requirements], 2), rule(27, at(34, 1)), [uses(739, task(requirements, 2)), absent(has_predecessor(requirements), complete)]).
proof(741, duration_path(api_design, [api_design, requirements], 4), rule(28, at(36, 1)), [uses(737, task(api_design, 2)), uses(738, depends(api_design, requirements)), uses(740, duration_path(requirements, [requirements], 2)), calculated(4, binary("+", value(2), value(2)))]).
proof(742, duration_path(frontend, [frontend, api_design, requirements], 9), rule(28, at(36, 1)), [uses(735, task(frontend, 5)), uses(736, depends(frontend, api_design)), uses(741, duration_path(api_design, [api_design, requirements], 4)), calculated(9, binary("+", value(4), value(5)))]).
proof(743, solution([9]), query, [uses(742, duration_path(frontend, [frontend, api_design, requirements], 9))]).
proof(744, finish_time(frontend, 9), rule(29, at(41, 1)), [uses(682, task(frontend, 5)), collected([9], ?v0, [call(duration_path(frontend, ?v1, ?v0))], [743], complete), calculated(9, function("max", [value([9])]))]).
proof(745, task(auth, 3), rule(7, at(12, 1)), []).
proof(746, depends(auth, architecture), rule(18, at(24, 1)), []).
proof(747, task(architecture, 3), rule(2, at(7, 1)), []).
proof(748, depends(architecture, requirements), rule(12, at(18, 1)), []).
proof(749, task(requirements, 2), rule(1, at(6, 1)), []).
proof(750, duration_path(requirements, [requirements], 2), rule(27, at(34, 1)), [uses(749, task(requirements, 2)), absent(has_predecessor(requirements), complete)]).
proof(751, duration_path(architecture, [architecture, requirements], 5), rule(28, at(36, 1)), [uses(747, task(architecture, 3)), uses(748, depends(architecture, requirements)), uses(750, duration_path(requirements, [requirements], 2)), calculated(5, binary("+", value(2), value(3)))]).
proof(752, duration_path(auth, [auth, architecture, requirements], 8), rule(28, at(36, 1)), [uses(745, task(auth, 3)), uses(746, depends(auth, architecture)), uses(751, duration_path(architecture, [architecture, requirements], 5)), calculated(8, binary("+", value(5), value(3)))]).
proof(753, solution([8]), query, [uses(752, duration_path(auth, [auth, architecture, requirements], 8))]).
proof(754, finish_time(auth, 8), rule(29, at(41, 1)), [uses(683, task(auth, 3)), collected([8], ?v0, [call(duration_path(auth, ?v1, ?v0))], [753], complete), calculated(8, function("max", [value([8])]))]).
proof(755, task(integration, 4), rule(8, at(13, 1)), []).
proof(756, depends(integration, backend), rule(19, at(25, 1)), []).
proof(757, depends(integration, frontend), rule(20, at(26, 1)), []).
proof(758, depends(integration, auth), rule(21, at(27, 1)), []).
proof(759, task(backend, 6), rule(5, at(10, 1)), []).
proof(760, task(frontend, 5), rule(6, at(11, 1)), []).
proof(761, task(auth, 3), rule(7, at(12, 1)), []).
proof(762, depends(backend, api_design), rule(15, at(21, 1)), []).
proof(763, depends(backend, database), rule(16, at(22, 1)), []).
proof(764, depends(frontend, api_design), rule(17, at(23, 1)), []).
proof(765, depends(auth, architecture), rule(18, at(24, 1)), []).
proof(766, task(api_design, 2), rule(3, at(8, 1)), []).
proof(767, task(database, 4), rule(4, at(9, 1)), []).
proof(768, task(architecture, 3), rule(2, at(7, 1)), []).
proof(769, depends(api_design, requirements), rule(13, at(19, 1)), []).
proof(770, depends(database, architecture), rule(14, at(20, 1)), []).
proof(771, depends(architecture, requirements), rule(12, at(18, 1)), []).
proof(772, task(requirements, 2), rule(1, at(6, 1)), []).
proof(773, duration_path(requirements, [requirements], 2), rule(27, at(34, 1)), [uses(772, task(requirements, 2)), absent(has_predecessor(requirements), complete)]).
proof(774, duration_path(api_design, [api_design, requirements], 4), rule(28, at(36, 1)), [uses(766, task(api_design, 2)), uses(769, depends(api_design, requirements)), uses(773, duration_path(requirements, [requirements], 2)), calculated(4, binary("+", value(2), value(2)))]).
proof(775, duration_path(architecture, [architecture, requirements], 5), rule(28, at(36, 1)), [uses(768, task(architecture, 3)), uses(771, depends(architecture, requirements)), uses(773, duration_path(requirements, [requirements], 2)), calculated(5, binary("+", value(2), value(3)))]).
proof(776, duration_path(backend, [backend, api_design, requirements], 10), rule(28, at(36, 1)), [uses(759, task(backend, 6)), uses(762, depends(backend, api_design)), uses(774, duration_path(api_design, [api_design, requirements], 4)), calculated(10, binary("+", value(4), value(6)))]).
proof(777, duration_path(frontend, [frontend, api_design, requirements], 9), rule(28, at(36, 1)), [uses(760, task(frontend, 5)), uses(764, depends(frontend, api_design)), uses(774, duration_path(api_design, [api_design, requirements], 4)), calculated(9, binary("+", value(4), value(5)))]).
proof(778, duration_path(auth, [auth, architecture, requirements], 8), rule(28, at(36, 1)), [uses(761, task(auth, 3)), uses(765, depends(auth, architecture)), uses(775, duration_path(architecture, [architecture, requirements], 5)), calculated(8, binary("+", value(5), value(3)))]).
proof(779, duration_path(database, [database, architecture, requirements], 9), rule(28, at(36, 1)), [uses(767, task(database, 4)), uses(770, depends(database, architecture)), uses(775, duration_path(architecture, [architecture, requirements], 5)), calculated(9, binary("+", value(5), value(4)))]).
proof(780, duration_path(integration, [integration, backend, api_design, requirements], 14), rule(28, at(36, 1)), [uses(755, task(integration, 4)), uses(756, depends(integration, backend)), uses(776, duration_path(backend, [backend, api_design, requirements], 10)), calculated(14, binary("+", value(10), value(4)))]).
proof(781, duration_path(integration, [integration, frontend, api_design, requirements], 13), rule(28, at(36, 1)), [uses(755, task(integration, 4)), uses(757, depends(integration, frontend)), uses(777, duration_path(frontend, [frontend, api_design, requirements], 9)), calculated(13, binary("+", value(9), value(4)))]).
proof(782, duration_path(integration, [integration, auth, architecture, requirements], 12), rule(28, at(36, 1)), [uses(755, task(integration, 4)), uses(758, depends(integration, auth)), uses(778, duration_path(auth, [auth, architecture, requirements], 8)), calculated(12, binary("+", value(8), value(4)))]).
proof(783, duration_path(backend, [backend, database, architecture, requirements], 15), rule(28, at(36, 1)), [uses(759, task(backend, 6)), uses(763, depends(backend, database)), uses(779, duration_path(database, [database, architecture, requirements], 9)), calculated(15, binary("+", value(9), value(6)))]).
proof(784, solution([14]), query, [uses(780, duration_path(integration, [integration, backend, api_design, requirements], 14))]).
proof(785, solution([13]), query, [uses(781, duration_path(integration, [integration, frontend, api_design, requirements], 13))]).
proof(786, solution([12]), query, [uses(782, duration_path(integration, [integration, auth, architecture, requirements], 12))]).
proof(787, duration_path(integration, [integration, backend, database, architecture, requirements], 19), rule(28, at(36, 1)), [uses(755, task(integration, 4)), uses(756, depends(integration, backend)), uses(783, duration_path(backend, [backend, database, architecture, requirements], 15)), calculated(19, binary("+", value(15), value(4)))]).
proof(788, solution([19]), query, [uses(787, duration_path(integration, [integration, backend, database, architecture, requirements], 19))]).
proof(789, finish_time(integration, 19), rule(29, at(41, 1)), [uses(684, task(integration, 4)), collected([12, 13, 14, 19], ?v0, [call(duration_path(integration, ?v1, ?v0))], [784, 785, 786, 788], complete), calculated(19, function("max", [value([12, 13, 14, 19])]))]).
proof(790, task(security_review, 3), rule(9, at(14, 1)), []).
proof(791, depends(security_review, integration), rule(22, at(28, 1)), []).
proof(792, task(integration, 4), rule(8, at(13, 1)), []).
proof(793, depends(integration, backend), rule(19, at(25, 1)), []).
proof(794, depends(integration, frontend), rule(20, at(26, 1)), []).
proof(795, depends(integration, auth), rule(21, at(27, 1)), []).
proof(796, task(backend, 6), rule(5, at(10, 1)), []).
proof(797, task(frontend, 5), rule(6, at(11, 1)), []).
proof(798, task(auth, 3), rule(7, at(12, 1)), []).
proof(799, depends(backend, api_design), rule(15, at(21, 1)), []).
proof(800, depends(backend, database), rule(16, at(22, 1)), []).
proof(801, depends(frontend, api_design), rule(17, at(23, 1)), []).
proof(802, depends(auth, architecture), rule(18, at(24, 1)), []).
proof(803, task(api_design, 2), rule(3, at(8, 1)), []).
proof(804, task(database, 4), rule(4, at(9, 1)), []).
proof(805, task(architecture, 3), rule(2, at(7, 1)), []).
proof(806, depends(api_design, requirements), rule(13, at(19, 1)), []).
proof(807, depends(database, architecture), rule(14, at(20, 1)), []).
proof(808, depends(architecture, requirements), rule(12, at(18, 1)), []).
proof(809, task(requirements, 2), rule(1, at(6, 1)), []).
proof(810, duration_path(requirements, [requirements], 2), rule(27, at(34, 1)), [uses(809, task(requirements, 2)), absent(has_predecessor(requirements), complete)]).
proof(811, duration_path(api_design, [api_design, requirements], 4), rule(28, at(36, 1)), [uses(803, task(api_design, 2)), uses(806, depends(api_design, requirements)), uses(810, duration_path(requirements, [requirements], 2)), calculated(4, binary("+", value(2), value(2)))]).
proof(812, duration_path(architecture, [architecture, requirements], 5), rule(28, at(36, 1)), [uses(805, task(architecture, 3)), uses(808, depends(architecture, requirements)), uses(810, duration_path(requirements, [requirements], 2)), calculated(5, binary("+", value(2), value(3)))]).
proof(813, duration_path(backend, [backend, api_design, requirements], 10), rule(28, at(36, 1)), [uses(796, task(backend, 6)), uses(799, depends(backend, api_design)), uses(811, duration_path(api_design, [api_design, requirements], 4)), calculated(10, binary("+", value(4), value(6)))]).
proof(814, duration_path(frontend, [frontend, api_design, requirements], 9), rule(28, at(36, 1)), [uses(797, task(frontend, 5)), uses(801, depends(frontend, api_design)), uses(811, duration_path(api_design, [api_design, requirements], 4)), calculated(9, binary("+", value(4), value(5)))]).
proof(815, duration_path(auth, [auth, architecture, requirements], 8), rule(28, at(36, 1)), [uses(798, task(auth, 3)), uses(802, depends(auth, architecture)), uses(812, duration_path(architecture, [architecture, requirements], 5)), calculated(8, binary("+", value(5), value(3)))]).
proof(816, duration_path(database, [database, architecture, requirements], 9), rule(28, at(36, 1)), [uses(804, task(database, 4)), uses(807, depends(database, architecture)), uses(812, duration_path(architecture, [architecture, requirements], 5)), calculated(9, binary("+", value(5), value(4)))]).
proof(817, duration_path(integration, [integration, backend, api_design, requirements], 14), rule(28, at(36, 1)), [uses(792, task(integration, 4)), uses(793, depends(integration, backend)), uses(813, duration_path(backend, [backend, api_design, requirements], 10)), calculated(14, binary("+", value(10), value(4)))]).
proof(818, duration_path(integration, [integration, frontend, api_design, requirements], 13), rule(28, at(36, 1)), [uses(792, task(integration, 4)), uses(794, depends(integration, frontend)), uses(814, duration_path(frontend, [frontend, api_design, requirements], 9)), calculated(13, binary("+", value(9), value(4)))]).
proof(819, duration_path(integration, [integration, auth, architecture, requirements], 12), rule(28, at(36, 1)), [uses(792, task(integration, 4)), uses(795, depends(integration, auth)), uses(815, duration_path(auth, [auth, architecture, requirements], 8)), calculated(12, binary("+", value(8), value(4)))]).
proof(820, duration_path(backend, [backend, database, architecture, requirements], 15), rule(28, at(36, 1)), [uses(796, task(backend, 6)), uses(800, depends(backend, database)), uses(816, duration_path(database, [database, architecture, requirements], 9)), calculated(15, binary("+", value(9), value(6)))]).
proof(821, duration_path(security_review, [security_review, integration, backend, api_design, requirements], 17), rule(28, at(36, 1)), [uses(790, task(security_review, 3)), uses(791, depends(security_review, integration)), uses(817, duration_path(integration, [integration, backend, api_design, requirements], 14)), calculated(17, binary("+", value(14), value(3)))]).
proof(822, duration_path(security_review, [security_review, integration, frontend, api_design, requirements], 16), rule(28, at(36, 1)), [uses(790, task(security_review, 3)), uses(791, depends(security_review, integration)), uses(818, duration_path(integration, [integration, frontend, api_design, requirements], 13)), calculated(16, binary("+", value(13), value(3)))]).
proof(823, duration_path(security_review, [security_review, integration, auth, architecture, requirements], 15), rule(28, at(36, 1)), [uses(790, task(security_review, 3)), uses(791, depends(security_review, integration)), uses(819, duration_path(integration, [integration, auth, architecture, requirements], 12)), calculated(15, binary("+", value(12), value(3)))]).
proof(824, duration_path(integration, [integration, backend, database, architecture, requirements], 19), rule(28, at(36, 1)), [uses(792, task(integration, 4)), uses(793, depends(integration, backend)), uses(820, duration_path(backend, [backend, database, architecture, requirements], 15)), calculated(19, binary("+", value(15), value(4)))]).
proof(825, solution([17]), query, [uses(821, duration_path(security_review, [security_review, integration, backend, api_design, requirements], 17))]).
proof(826, solution([16]), query, [uses(822, duration_path(security_review, [security_review, integration, frontend, api_design, requirements], 16))]).
proof(827, solution([15]), query, [uses(823, duration_path(security_review, [security_review, integration, auth, architecture, requirements], 15))]).
proof(828, duration_path(security_review, [security_review, integration, backend, database, architecture, requirements], 22), rule(28, at(36, 1)), [uses(790, task(security_review, 3)), uses(791, depends(security_review, integration)), uses(824, duration_path(integration, [integration, backend, database, architecture, requirements], 19)), calculated(22, binary("+", value(19), value(3)))]).
proof(829, solution([22]), query, [uses(828, duration_path(security_review, [security_review, integration, backend, database, architecture, requirements], 22))]).
proof(830, finish_time(security_review, 22), rule(29, at(41, 1)), [uses(685, task(security_review, 3)), collected([15, 16, 17, 22], ?v0, [call(duration_path(security_review, ?v1, ?v0))], [825, 826, 827, 829], complete), calculated(22, function("max", [value([15, 16, 17, 22])]))]).
proof(831, task(load_test, 2), rule(10, at(15, 1)), []).
proof(832, depends(load_test, integration), rule(23, at(29, 1)), []).
proof(833, task(integration, 4), rule(8, at(13, 1)), []).
proof(834, depends(integration, backend), rule(19, at(25, 1)), []).
proof(835, depends(integration, frontend), rule(20, at(26, 1)), []).
proof(836, depends(integration, auth), rule(21, at(27, 1)), []).
proof(837, task(backend, 6), rule(5, at(10, 1)), []).
proof(838, task(frontend, 5), rule(6, at(11, 1)), []).
proof(839, task(auth, 3), rule(7, at(12, 1)), []).
proof(840, depends(backend, api_design), rule(15, at(21, 1)), []).
proof(841, depends(backend, database), rule(16, at(22, 1)), []).
proof(842, depends(frontend, api_design), rule(17, at(23, 1)), []).
proof(843, depends(auth, architecture), rule(18, at(24, 1)), []).
proof(844, task(api_design, 2), rule(3, at(8, 1)), []).
proof(845, task(database, 4), rule(4, at(9, 1)), []).
proof(846, task(architecture, 3), rule(2, at(7, 1)), []).
proof(847, depends(api_design, requirements), rule(13, at(19, 1)), []).
proof(848, depends(database, architecture), rule(14, at(20, 1)), []).
proof(849, depends(architecture, requirements), rule(12, at(18, 1)), []).
proof(850, task(requirements, 2), rule(1, at(6, 1)), []).
proof(851, duration_path(requirements, [requirements], 2), rule(27, at(34, 1)), [uses(850, task(requirements, 2)), absent(has_predecessor(requirements), complete)]).
proof(852, duration_path(api_design, [api_design, requirements], 4), rule(28, at(36, 1)), [uses(844, task(api_design, 2)), uses(847, depends(api_design, requirements)), uses(851, duration_path(requirements, [requirements], 2)), calculated(4, binary("+", value(2), value(2)))]).
proof(853, duration_path(architecture, [architecture, requirements], 5), rule(28, at(36, 1)), [uses(846, task(architecture, 3)), uses(849, depends(architecture, requirements)), uses(851, duration_path(requirements, [requirements], 2)), calculated(5, binary("+", value(2), value(3)))]).
proof(854, duration_path(backend, [backend, api_design, requirements], 10), rule(28, at(36, 1)), [uses(837, task(backend, 6)), uses(840, depends(backend, api_design)), uses(852, duration_path(api_design, [api_design, requirements], 4)), calculated(10, binary("+", value(4), value(6)))]).
proof(855, duration_path(frontend, [frontend, api_design, requirements], 9), rule(28, at(36, 1)), [uses(838, task(frontend, 5)), uses(842, depends(frontend, api_design)), uses(852, duration_path(api_design, [api_design, requirements], 4)), calculated(9, binary("+", value(4), value(5)))]).
proof(856, duration_path(auth, [auth, architecture, requirements], 8), rule(28, at(36, 1)), [uses(839, task(auth, 3)), uses(843, depends(auth, architecture)), uses(853, duration_path(architecture, [architecture, requirements], 5)), calculated(8, binary("+", value(5), value(3)))]).
proof(857, duration_path(database, [database, architecture, requirements], 9), rule(28, at(36, 1)), [uses(845, task(database, 4)), uses(848, depends(database, architecture)), uses(853, duration_path(architecture, [architecture, requirements], 5)), calculated(9, binary("+", value(5), value(4)))]).
proof(858, duration_path(integration, [integration, backend, api_design, requirements], 14), rule(28, at(36, 1)), [uses(833, task(integration, 4)), uses(834, depends(integration, backend)), uses(854, duration_path(backend, [backend, api_design, requirements], 10)), calculated(14, binary("+", value(10), value(4)))]).
proof(859, duration_path(integration, [integration, frontend, api_design, requirements], 13), rule(28, at(36, 1)), [uses(833, task(integration, 4)), uses(835, depends(integration, frontend)), uses(855, duration_path(frontend, [frontend, api_design, requirements], 9)), calculated(13, binary("+", value(9), value(4)))]).
proof(860, duration_path(integration, [integration, auth, architecture, requirements], 12), rule(28, at(36, 1)), [uses(833, task(integration, 4)), uses(836, depends(integration, auth)), uses(856, duration_path(auth, [auth, architecture, requirements], 8)), calculated(12, binary("+", value(8), value(4)))]).
proof(861, duration_path(backend, [backend, database, architecture, requirements], 15), rule(28, at(36, 1)), [uses(837, task(backend, 6)), uses(841, depends(backend, database)), uses(857, duration_path(database, [database, architecture, requirements], 9)), calculated(15, binary("+", value(9), value(6)))]).
proof(862, duration_path(load_test, [load_test, integration, backend, api_design, requirements], 16), rule(28, at(36, 1)), [uses(831, task(load_test, 2)), uses(832, depends(load_test, integration)), uses(858, duration_path(integration, [integration, backend, api_design, requirements], 14)), calculated(16, binary("+", value(14), value(2)))]).
proof(863, duration_path(load_test, [load_test, integration, frontend, api_design, requirements], 15), rule(28, at(36, 1)), [uses(831, task(load_test, 2)), uses(832, depends(load_test, integration)), uses(859, duration_path(integration, [integration, frontend, api_design, requirements], 13)), calculated(15, binary("+", value(13), value(2)))]).
proof(864, duration_path(load_test, [load_test, integration, auth, architecture, requirements], 14), rule(28, at(36, 1)), [uses(831, task(load_test, 2)), uses(832, depends(load_test, integration)), uses(860, duration_path(integration, [integration, auth, architecture, requirements], 12)), calculated(14, binary("+", value(12), value(2)))]).
proof(865, duration_path(integration, [integration, backend, database, architecture, requirements], 19), rule(28, at(36, 1)), [uses(833, task(integration, 4)), uses(834, depends(integration, backend)), uses(861, duration_path(backend, [backend, database, architecture, requirements], 15)), calculated(19, binary("+", value(15), value(4)))]).
proof(866, solution([16]), query, [uses(862, duration_path(load_test, [load_test, integration, backend, api_design, requirements], 16))]).
proof(867, solution([15]), query, [uses(863, duration_path(load_test, [load_test, integration, frontend, api_design, requirements], 15))]).
proof(868, solution([14]), query, [uses(864, duration_path(load_test, [load_test, integration, auth, architecture, requirements], 14))]).
proof(869, duration_path(load_test, [load_test, integration, backend, database, architecture, requirements], 21), rule(28, at(36, 1)), [uses(831, task(load_test, 2)), uses(832, depends(load_test, integration)), uses(865, duration_path(integration, [integration, backend, database, architecture, requirements], 19)), calculated(21, binary("+", value(19), value(2)))]).
proof(870, solution([21]), query, [uses(869, duration_path(load_test, [load_test, integration, backend, database, architecture, requirements], 21))]).
proof(871, finish_time(load_test, 21), rule(29, at(41, 1)), [uses(686, task(load_test, 2)), collected([14, 15, 16, 21], ?v0, [call(duration_path(load_test, ?v1, ?v0))], [866, 867, 868, 870], complete), calculated(21, function("max", [value([14, 15, 16, 21])]))]).
proof(872, task(launch, 1), rule(11, at(16, 1)), []).
proof(873, depends(launch, security_review), rule(24, at(30, 1)), []).
proof(874, depends(launch, load_test), rule(25, at(31, 1)), []).
proof(875, task(security_review, 3), rule(9, at(14, 1)), []).
proof(876, task(load_test, 2), rule(10, at(15, 1)), []).
proof(877, depends(security_review, integration), rule(22, at(28, 1)), []).
proof(878, depends(load_test, integration), rule(23, at(29, 1)), []).
proof(879, task(integration, 4), rule(8, at(13, 1)), []).
proof(880, depends(integration, backend), rule(19, at(25, 1)), []).
proof(881, depends(integration, frontend), rule(20, at(26, 1)), []).
proof(882, depends(integration, auth), rule(21, at(27, 1)), []).
proof(883, task(backend, 6), rule(5, at(10, 1)), []).
proof(884, task(frontend, 5), rule(6, at(11, 1)), []).
proof(885, task(auth, 3), rule(7, at(12, 1)), []).
proof(886, depends(backend, api_design), rule(15, at(21, 1)), []).
proof(887, depends(backend, database), rule(16, at(22, 1)), []).
proof(888, depends(frontend, api_design), rule(17, at(23, 1)), []).
proof(889, depends(auth, architecture), rule(18, at(24, 1)), []).
proof(890, task(api_design, 2), rule(3, at(8, 1)), []).
proof(891, task(database, 4), rule(4, at(9, 1)), []).
proof(892, task(architecture, 3), rule(2, at(7, 1)), []).
proof(893, depends(api_design, requirements), rule(13, at(19, 1)), []).
proof(894, depends(database, architecture), rule(14, at(20, 1)), []).
proof(895, depends(architecture, requirements), rule(12, at(18, 1)), []).
proof(896, task(requirements, 2), rule(1, at(6, 1)), []).
proof(897, duration_path(requirements, [requirements], 2), rule(27, at(34, 1)), [uses(896, task(requirements, 2)), absent(has_predecessor(requirements), complete)]).
proof(898, duration_path(api_design, [api_design, requirements], 4), rule(28, at(36, 1)), [uses(890, task(api_design, 2)), uses(893, depends(api_design, requirements)), uses(897, duration_path(requirements, [requirements], 2)), calculated(4, binary("+", value(2), value(2)))]).
proof(899, duration_path(architecture, [architecture, requirements], 5), rule(28, at(36, 1)), [uses(892, task(architecture, 3)), uses(895, depends(architecture, requirements)), uses(897, duration_path(requirements, [requirements], 2)), calculated(5, binary("+", value(2), value(3)))]).
proof(900, duration_path(backend, [backend, api_design, requirements], 10), rule(28, at(36, 1)), [uses(883, task(backend, 6)), uses(886, depends(backend, api_design)), uses(898, duration_path(api_design, [api_design, requirements], 4)), calculated(10, binary("+", value(4), value(6)))]).
proof(901, duration_path(frontend, [frontend, api_design, requirements], 9), rule(28, at(36, 1)), [uses(884, task(frontend, 5)), uses(888, depends(frontend, api_design)), uses(898, duration_path(api_design, [api_design, requirements], 4)), calculated(9, binary("+", value(4), value(5)))]).
proof(902, duration_path(auth, [auth, architecture, requirements], 8), rule(28, at(36, 1)), [uses(885, task(auth, 3)), uses(889, depends(auth, architecture)), uses(899, duration_path(architecture, [architecture, requirements], 5)), calculated(8, binary("+", value(5), value(3)))]).
proof(903, duration_path(database, [database, architecture, requirements], 9), rule(28, at(36, 1)), [uses(891, task(database, 4)), uses(894, depends(database, architecture)), uses(899, duration_path(architecture, [architecture, requirements], 5)), calculated(9, binary("+", value(5), value(4)))]).
proof(904, duration_path(integration, [integration, backend, api_design, requirements], 14), rule(28, at(36, 1)), [uses(879, task(integration, 4)), uses(880, depends(integration, backend)), uses(900, duration_path(backend, [backend, api_design, requirements], 10)), calculated(14, binary("+", value(10), value(4)))]).
proof(905, duration_path(integration, [integration, frontend, api_design, requirements], 13), rule(28, at(36, 1)), [uses(879, task(integration, 4)), uses(881, depends(integration, frontend)), uses(901, duration_path(frontend, [frontend, api_design, requirements], 9)), calculated(13, binary("+", value(9), value(4)))]).
proof(906, duration_path(integration, [integration, auth, architecture, requirements], 12), rule(28, at(36, 1)), [uses(879, task(integration, 4)), uses(882, depends(integration, auth)), uses(902, duration_path(auth, [auth, architecture, requirements], 8)), calculated(12, binary("+", value(8), value(4)))]).
proof(907, duration_path(backend, [backend, database, architecture, requirements], 15), rule(28, at(36, 1)), [uses(883, task(backend, 6)), uses(887, depends(backend, database)), uses(903, duration_path(database, [database, architecture, requirements], 9)), calculated(15, binary("+", value(9), value(6)))]).
proof(908, duration_path(security_review, [security_review, integration, backend, api_design, requirements], 17), rule(28, at(36, 1)), [uses(875, task(security_review, 3)), uses(877, depends(security_review, integration)), uses(904, duration_path(integration, [integration, backend, api_design, requirements], 14)), calculated(17, binary("+", value(14), value(3)))]).
proof(909, duration_path(security_review, [security_review, integration, frontend, api_design, requirements], 16), rule(28, at(36, 1)), [uses(875, task(security_review, 3)), uses(877, depends(security_review, integration)), uses(905, duration_path(integration, [integration, frontend, api_design, requirements], 13)), calculated(16, binary("+", value(13), value(3)))]).
proof(910, duration_path(security_review, [security_review, integration, auth, architecture, requirements], 15), rule(28, at(36, 1)), [uses(875, task(security_review, 3)), uses(877, depends(security_review, integration)), uses(906, duration_path(integration, [integration, auth, architecture, requirements], 12)), calculated(15, binary("+", value(12), value(3)))]).
proof(911, duration_path(load_test, [load_test, integration, backend, api_design, requirements], 16), rule(28, at(36, 1)), [uses(876, task(load_test, 2)), uses(878, depends(load_test, integration)), uses(904, duration_path(integration, [integration, backend, api_design, requirements], 14)), calculated(16, binary("+", value(14), value(2)))]).
proof(912, duration_path(load_test, [load_test, integration, frontend, api_design, requirements], 15), rule(28, at(36, 1)), [uses(876, task(load_test, 2)), uses(878, depends(load_test, integration)), uses(905, duration_path(integration, [integration, frontend, api_design, requirements], 13)), calculated(15, binary("+", value(13), value(2)))]).
proof(913, duration_path(load_test, [load_test, integration, auth, architecture, requirements], 14), rule(28, at(36, 1)), [uses(876, task(load_test, 2)), uses(878, depends(load_test, integration)), uses(906, duration_path(integration, [integration, auth, architecture, requirements], 12)), calculated(14, binary("+", value(12), value(2)))]).
proof(914, duration_path(integration, [integration, backend, database, architecture, requirements], 19), rule(28, at(36, 1)), [uses(879, task(integration, 4)), uses(880, depends(integration, backend)), uses(907, duration_path(backend, [backend, database, architecture, requirements], 15)), calculated(19, binary("+", value(15), value(4)))]).
proof(915, duration_path(launch, [launch, security_review, integration, backend, api_design, requirements], 18), rule(28, at(36, 1)), [uses(872, task(launch, 1)), uses(873, depends(launch, security_review)), uses(908, duration_path(security_review, [security_review, integration, backend, api_design, requirements], 17)), calculated(18, binary("+", value(17), value(1)))]).
proof(916, duration_path(launch, [launch, security_review, integration, frontend, api_design, requirements], 17), rule(28, at(36, 1)), [uses(872, task(launch, 1)), uses(873, depends(launch, security_review)), uses(909, duration_path(security_review, [security_review, integration, frontend, api_design, requirements], 16)), calculated(17, binary("+", value(16), value(1)))]).
proof(917, duration_path(launch, [launch, security_review, integration, auth, architecture, requirements], 16), rule(28, at(36, 1)), [uses(872, task(launch, 1)), uses(873, depends(launch, security_review)), uses(910, duration_path(security_review, [security_review, integration, auth, architecture, requirements], 15)), calculated(16, binary("+", value(15), value(1)))]).
proof(918, duration_path(launch, [launch, load_test, integration, backend, api_design, requirements], 17), rule(28, at(36, 1)), [uses(872, task(launch, 1)), uses(874, depends(launch, load_test)), uses(911, duration_path(load_test, [load_test, integration, backend, api_design, requirements], 16)), calculated(17, binary("+", value(16), value(1)))]).
proof(919, duration_path(launch, [launch, load_test, integration, frontend, api_design, requirements], 16), rule(28, at(36, 1)), [uses(872, task(launch, 1)), uses(874, depends(launch, load_test)), uses(912, duration_path(load_test, [load_test, integration, frontend, api_design, requirements], 15)), calculated(16, binary("+", value(15), value(1)))]).
proof(920, duration_path(launch, [launch, load_test, integration, auth, architecture, requirements], 15), rule(28, at(36, 1)), [uses(872, task(launch, 1)), uses(874, depends(launch, load_test)), uses(913, duration_path(load_test, [load_test, integration, auth, architecture, requirements], 14)), calculated(15, binary("+", value(14), value(1)))]).
proof(921, duration_path(security_review, [security_review, integration, backend, database, architecture, requirements], 22), rule(28, at(36, 1)), [uses(875, task(security_review, 3)), uses(877, depends(security_review, integration)), uses(914, duration_path(integration, [integration, backend, database, architecture, requirements], 19)), calculated(22, binary("+", value(19), value(3)))]).
proof(922, duration_path(load_test, [load_test, integration, backend, database, architecture, requirements], 21), rule(28, at(36, 1)), [uses(876, task(load_test, 2)), uses(878, depends(load_test, integration)), uses(914, duration_path(integration, [integration, backend, database, architecture, requirements], 19)), calculated(21, binary("+", value(19), value(2)))]).
proof(923, solution([18]), query, [uses(915, duration_path(launch, [launch, security_review, integration, backend, api_design, requirements], 18))]).
proof(924, solution([17]), query, [uses(916, duration_path(launch, [launch, security_review, integration, frontend, api_design, requirements], 17))]).
proof(925, solution([16]), query, [uses(917, duration_path(launch, [launch, security_review, integration, auth, architecture, requirements], 16))]).
proof(926, solution([15]), query, [uses(920, duration_path(launch, [launch, load_test, integration, auth, architecture, requirements], 15))]).
proof(927, duration_path(launch, [launch, security_review, integration, backend, database, architecture, requirements], 23), rule(28, at(36, 1)), [uses(872, task(launch, 1)), uses(873, depends(launch, security_review)), uses(921, duration_path(security_review, [security_review, integration, backend, database, architecture, requirements], 22)), calculated(23, binary("+", value(22), value(1)))]).
proof(928, duration_path(launch, [launch, load_test, integration, backend, database, architecture, requirements], 22), rule(28, at(36, 1)), [uses(872, task(launch, 1)), uses(874, depends(launch, load_test)), uses(922, duration_path(load_test, [load_test, integration, backend, database, architecture, requirements], 21)), calculated(22, binary("+", value(21), value(1)))]).
proof(929, solution([23]), query, [uses(927, duration_path(launch, [launch, security_review, integration, backend, database, architecture, requirements], 23))]).
proof(930, solution([22]), query, [uses(928, duration_path(launch, [launch, load_test, integration, backend, database, architecture, requirements], 22))]).
proof(931, finish_time(launch, 23), rule(29, at(41, 1)), [uses(687, task(launch, 1)), collected([15, 16, 17, 18, 22, 23], ?v0, [call(duration_path(launch, ?v1, ?v0))], [923, 924, 925, 926, 929, 930], complete), calculated(23, function("max", [value([15, 16, 17, 18, 22, 23])]))]).
proof(932, schedule(requirements, 0, 2), rule(30, at(45, 1)), [uses(666, task(requirements, 2)), uses(691, finish_time(requirements, 2)), calculated(0, binary("-", value(2), value(2)))]).
proof(933, schedule(architecture, 2, 5), rule(30, at(45, 1)), [uses(667, task(architecture, 3)), uses(698, finish_time(architecture, 5)), calculated(2, binary("-", value(5), value(3)))]).
proof(934, schedule(api_design, 2, 4), rule(30, at(45, 1)), [uses(668, task(api_design, 2)), uses(705, finish_time(api_design, 4)), calculated(2, binary("-", value(4), value(2)))]).
proof(935, schedule(database, 5, 9), rule(30, at(45, 1)), [uses(669, task(database, 4)), uses(715, finish_time(database, 9)), calculated(5, binary("-", value(9), value(4)))]).
proof(936, schedule(backend, 9, 15), rule(30, at(45, 1)), [uses(670, task(backend, 6)), uses(734, finish_time(backend, 15)), calculated(9, binary("-", value(15), value(6)))]).
proof(937, schedule(frontend, 4, 9), rule(30, at(45, 1)), [uses(671, task(frontend, 5)), uses(744, finish_time(frontend, 9)), calculated(4, binary("-", value(9), value(5)))]).
proof(938, schedule(auth, 5, 8), rule(30, at(45, 1)), [uses(672, task(auth, 3)), uses(754, finish_time(auth, 8)), calculated(5, binary("-", value(8), value(3)))]).
proof(939, schedule(integration, 15, 19), rule(30, at(45, 1)), [uses(673, task(integration, 4)), uses(789, finish_time(integration, 19)), calculated(15, binary("-", value(19), value(4)))]).
proof(940, schedule(security_review, 19, 22), rule(30, at(45, 1)), [uses(674, task(security_review, 3)), uses(830, finish_time(security_review, 22)), calculated(19, binary("-", value(22), value(3)))]).
proof(941, schedule(load_test, 19, 21), rule(30, at(45, 1)), [uses(675, task(load_test, 2)), uses(871, finish_time(load_test, 21)), calculated(19, binary("-", value(21), value(2)))]).
proof(942, schedule(launch, 22, 23), rule(30, at(45, 1)), [uses(676, task(launch, 1)), uses(931, finish_time(launch, 23)), calculated(22, binary("-", value(23), value(1)))]).
proof(943, solution([requirements, 0, 2]), query, [uses(932, schedule(requirements, 0, 2))]).
proof(944, solution([architecture, 2, 5]), query, [uses(933, schedule(architecture, 2, 5))]).
proof(945, solution([api_design, 2, 4]), query, [uses(934, schedule(api_design, 2, 4))]).
proof(946, solution([database, 5, 9]), query, [uses(935, schedule(database, 5, 9))]).
proof(947, solution([backend, 9, 15]), query, [uses(936, schedule(backend, 9, 15))]).
proof(948, solution([frontend, 4, 9]), query, [uses(937, schedule(frontend, 4, 9))]).
proof(949, solution([auth, 5, 8]), query, [uses(938, schedule(auth, 5, 8))]).
proof(950, solution([integration, 15, 19]), query, [uses(939, schedule(integration, 15, 19))]).
proof(951, solution([security_review, 19, 22]), query, [uses(940, schedule(security_review, 19, 22))]).
proof(952, solution([load_test, 19, 21]), query, [uses(941, schedule(load_test, 19, 21))]).
proof(953, solution([launch, 22, 23]), query, [uses(942, schedule(launch, 22, 23))]).
