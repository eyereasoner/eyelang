shortestPath(dijkstra_findall_sort, [a, c, b, d, e, f]).
why(
  shortestPath(dijkstra_findall_sort, [a, c, b, d, e, f]),
  proof(
    goal(shortestPath(dijkstra_findall_sort, [a, c, b, d, e, f])), by(rule("dijkstra-findall-sort.pl", clause(17))),
    bindings([binding("Path", [a, c, b, d, e, f]), binding("_Cost", 13)]),
    uses([
      proof(
        goal(once(dijkstra(a, f, [a, c, b, d, e, f], 13))), by(builtin(once, 1)),
        uses([
          proof(
            goal(dijkstra(a, f, [a, c, b, d, e, f], 13)), by(rule("dijkstra-findall-sort.pl", clause(14))),
            bindings([binding("Start", a), binding("Goal", f), binding("Path", [a, c, b, d, e, f]), binding("Cost", 13), binding("RevPath", [f, e, d, b, c, a])]),
            uses([
              proof(
                goal(dijkstra_queue([[0, a]], f, [], [f, e, d, b, c, a], 13)), by(rule("dijkstra-findall-sort.pl", clause(16))),
                bindings([binding("Cost", 0), binding("Node", a), binding("Path", []), binding("Queue", []), binding("Goal", f), binding("Visited", []), binding("ResultPath", [f, e, d, b, c, a]), binding("ResultCost", 13), binding("Neighbors", [[4, b, a], [2, c, a]]), binding("NewQueue", [[4, b, a], [2, c, a]]), binding("SortedQueue", [[2, c, a], [4, b, a]])]),
                uses([
                  proof(goal(findall([NewCost, Neighbor, a], (edge(a, Neighbor, Weight), not(member(Neighbor, [])), add(0, Weight, NewCost)), [[4, b, a], [2, c, a]])), by(builtin(findall, 3))),
                  proof(goal(append([], [[4, b, a], [2, c, a]], [[4, b, a], [2, c, a]])), by(builtin(append, 3))),
                  proof(goal(sort([[4, b, a], [2, c, a]], [[2, c, a], [4, b, a]])), by(builtin(sort, 2))),
                  proof(
                    goal(dijkstra_queue([[2, c, a], [4, b, a]], f, [a], [f, e, d, b, c, a], 13)), by(rule("dijkstra-findall-sort.pl", clause(16))),
                    bindings([binding("Cost", 2), binding("Node", c), binding("Path", [a]), binding("Queue", [[4, b, a]]), binding("Goal", f), binding("Visited", [a]), binding("ResultPath", [f, e, d, b, c, a]), binding("ResultCost", 13), binding("Neighbors", [[10, d, c, a], [12, e, c, a], [3, b, c, a]]), binding("NewQueue", [[4, b, a], [10, d, c, a], [12, e, c, a], [3, b, c, a]]), binding("SortedQueue", [[3, b, c, a], [4, b, a], [10, d, c, a], [12, e, c, a]])]),
                    uses([
                      proof(goal(findall([NewCost, Neighbor, c, a], (edge(c, Neighbor, Weight), not(member(Neighbor, [a])), add(2, Weight, NewCost)), [[10, d, c, a], [12, e, c, a], [3, b, c, a]])), by(builtin(findall, 3))),
                      proof(goal(append([[4, b, a]], [[10, d, c, a], [12, e, c, a], [3, b, c, a]], [[4, b, a], [10, d, c, a], [12, e, c, a], [3, b, c, a]])), by(builtin(append, 3))),
                      proof(goal(sort([[4, b, a], [10, d, c, a], [12, e, c, a], [3, b, c, a]], [[3, b, c, a], [4, b, a], [10, d, c, a], [12, e, c, a]])), by(builtin(sort, 2))),
                      proof(
                        goal(dijkstra_queue([[3, b, c, a], [4, b, a], [10, d, c, a], [12, e, c, a]], f, [c, a], [f, e, d, b, c, a], 13)), by(rule("dijkstra-findall-sort.pl", clause(16))),
                        bindings([binding("Cost", 3), binding("Node", b), binding("Path", [c, a]), binding("Queue", [[4, b, a], [10, d, c, a], [12, e, c, a]]), binding("Goal", f), binding("Visited", [c, a]), binding("ResultPath", [f, e, d, b, c, a]), binding("ResultCost", 13), binding("Neighbors", [[8, d, b, c, a]]), binding("NewQueue", [[4, b, a], [10, d, c, a], [12, e, c, a], [8, d, b, c, a]]), binding("SortedQueue", [[4, b, a], [8, d, b, c, a], [10, d, c, a], [12, e, c, a]])]),
                        uses([
                          proof(goal(findall([NewCost, Neighbor, b, c, a], (edge(b, Neighbor, Weight), not(member(Neighbor, [c, a])), add(3, Weight, NewCost)), [[8, d, b, c, a]])), by(builtin(findall, 3))),
                          proof(goal(append([[4, b, a], [10, d, c, a], [12, e, c, a]], [[8, d, b, c, a]], [[4, b, a], [10, d, c, a], [12, e, c, a], [8, d, b, c, a]])), by(builtin(append, 3))),
                          proof(goal(sort([[4, b, a], [10, d, c, a], [12, e, c, a], [8, d, b, c, a]], [[4, b, a], [8, d, b, c, a], [10, d, c, a], [12, e, c, a]])), by(builtin(sort, 2))),
                          proof(
                            goal(dijkstra_queue([[4, b, a], [8, d, b, c, a], [10, d, c, a], [12, e, c, a]], f, [b, c, a], [f, e, d, b, c, a], 13)), by(rule("dijkstra-findall-sort.pl", clause(16))),
                            bindings([binding("Cost", 4), binding("Node", b), binding("Path", [a]), binding("Queue", [[8, d, b, c, a], [10, d, c, a], [12, e, c, a]]), binding("Goal", f), binding("Visited", [b, c, a]), binding("ResultPath", [f, e, d, b, c, a]), binding("ResultCost", 13), binding("Neighbors", [[9, d, b, a]]), binding("NewQueue", [[8, d, b, c, a], [10, d, c, a], [12, e, c, a], [9, d, b, a]]), binding("SortedQueue", [[8, d, b, c, a], [9, d, b, a], [10, d, c, a], [12, e, c, a]])]),
                            uses([
                              proof(goal(findall([NewCost, Neighbor, b, a], (edge(b, Neighbor, Weight), not(member(Neighbor, [b, c, a])), add(4, Weight, NewCost)), [[9, d, b, a]])), by(builtin(findall, 3))),
                              proof(goal(append([[8, d, b, c, a], [10, d, c, a], [12, e, c, a]], [[9, d, b, a]], [[8, d, b, c, a], [10, d, c, a], [12, e, c, a], [9, d, b, a]])), by(builtin(append, 3))),
                              proof(goal(sort([[8, d, b, c, a], [10, d, c, a], [12, e, c, a], [9, d, b, a]], [[8, d, b, c, a], [9, d, b, a], [10, d, c, a], [12, e, c, a]])), by(builtin(sort, 2))),
                              proof(
                                goal(dijkstra_queue([[8, d, b, c, a], [9, d, b, a], [10, d, c, a], [12, e, c, a]], f, [b, b, c, a], [f, e, d, b, c, a], 13)), by(rule("dijkstra-findall-sort.pl", clause(16))),
                                bindings([binding("Cost", 8), binding("Node", d), binding("Path", [b, c, a]), binding("Queue", [[9, d, b, a], [10, d, c, a], [12, e, c, a]]), binding("Goal", f), binding("Visited", [b, b, c, a]), binding("ResultPath", [f, e, d, b, c, a]), binding("ResultCost", 13), binding("Neighbors", [[10, e, d, b, c, a], [14, f, d, b, c, a]]), binding("NewQueue", [[9, d, b, a], [10, d, c, a], [12, e, c, a], [10, e, d, b, c, a], [14, f, d, b, c, a]]), binding("SortedQueue", [[9, d, b, a], [10, d, c, a], [10, e, d, b, c, a], [12, e, c, a], [14, f, d, b, c, a]])]),
                                uses([
                                  proof(goal(findall([NewCost, Neighbor, d, b, c, a], (edge(d, Neighbor, Weight), not(member(Neighbor, [b, b, c, a])), add(8, Weight, NewCost)), [[10, e, d, b, c, a], [14, f, d, b, c, a]])), by(builtin(findall, 3))),
                                  proof(goal(append([[9, d, b, a], [10, d, c, a], [12, e, c, a]], [[10, e, d, b, c, a], [14, f, d, b, c, a]], [[9, d, b, a], [10, d, c, a], [12, e, c, a], [10, e, d, b, c, a], [14, f, d, b, c, a]])), by(builtin(append, 3))),
                                  proof(goal(sort([[9, d, b, a], [10, d, c, a], [12, e, c, a], [10, e, d, b, c, a], [14, f, d, b, c, a]], [[9, d, b, a], [10, d, c, a], [10, e, d, b, c, a], [12, e, c, a], [14, f, d, b, c, a]])), by(builtin(sort, 2))),
                                  proof(
                                    goal(dijkstra_queue([[9, d, b, a], [10, d, c, a], [10, e, d, b, c, a], [12, e, c, a], [14, f, d, b, c, a]], f, [d, b, b, c, a], [f, e, d, b, c, a], 13)), by(rule("dijkstra-findall-sort.pl", clause(16))),
                                    bindings([binding("Cost", 9), binding("Node", d), binding("Path", [b, a]), binding("Queue", [[10, d, c, a], [10, e, d, b, c, a], [12, e, c, a], [14, f, d, b, c, a]]), binding("Goal", f), binding("Visited", [d, b, b, c, a]), binding("ResultPath", [f, e, d, b, c, a]), binding("ResultCost", 13), binding("Neighbors", [[11, e, d, b, a], [15, f, d, b, a]]), binding("NewQueue", [[10, d, c, a], [10, e, d, b, c, a], [12, e, c, a], [14, f, d, b, c, a], [11, e, d, b, a], [15, f, d, b, a]]), binding("SortedQueue", [[10, d, c, a], [10, e, d, b, c, a], [11, e, d, b, a], [12, e, c, a], [14, f, d, b, c, a], [15, f, d, b, a]])]),
                                    uses([
                                      proof(goal(findall([NewCost, Neighbor, d, b, a], (edge(d, Neighbor, Weight), not(member(Neighbor, [d, b, b, c, a])), add(9, Weight, NewCost)), [[11, e, d, b, a], [15, f, d, b, a]])), by(builtin(findall, 3))),
                                      proof(goal(append([[10, d, c, a], [10, e, d, b, c, a], [12, e, c, a], [14, f, d, b, c, a]], [[11, e, d, b, a], [15, f, d, b, a]], [[10, d, c, a], [10, e, d, b, c, a], [12, e, c, a], [14, f, d, b, c, a], [11, e, d, b, a], [15, f, d, b, a]])), by(builtin(append, 3))),
                                      proof(goal(sort([[10, d, c, a], [10, e, d, b, c, a], [12, e, c, a], [14, f, d, b, c, a], [11, e, d, b, a], [15, f, d, b, a]], [[10, d, c, a], [10, e, d, b, c, a], [11, e, d, b, a], [12, e, c, a], [14, f, d, b, c, a], [15, f, d, b, a]])), by(builtin(sort, 2))),
                                      proof(
                                        goal(dijkstra_queue([[10, d, c, a], [10, e, d, b, c, a], [11, e, d, b, a], [12, e, c, a], [14, f, d, b, c, a], [15, f, d, b, a]], f, [d, d, b, b, c, a], [f, e, d, b, c, a], 13)), by(rule("dijkstra-findall-sort.pl", clause(16))),
                                        bindings([binding("Cost", 10), binding("Node", d), binding("Path", [c, a]), binding("Queue", [[10, e, d, b, c, a], [11, e, d, b, a], [12, e, c, a], [14, f, d, b, c, a], [15, f, d, b, a]]), binding("Goal", f), binding("Visited", [d, d, b, b, c, a]), binding("ResultPath", [f, e, d, b, c, a]), binding("ResultCost", 13), binding("Neighbors", [[12, e, d, c, a], [16, f, d, c, a]]), binding("NewQueue", [[10, e, d, b, c, a], [11, e, d, b, a], [12, e, c, a], [14, f, d, b, c, a], [15, f, d, b, a], [12, e, d, c, a], [16, f, d, c, a]]), binding("SortedQueue", [[10, e, d, b, c, a], [11, e, d, b, a], [12, e, c, a], [12, e, d, c, a], [14, f, d, b, c, a], [15, f, d, b, a], [16, f, d, c, a]])]),
                                        uses([
                                          proof(goal(findall([NewCost, Neighbor, d, c, a], (edge(d, Neighbor, Weight), not(member(Neighbor, [d, d, b, b, c, a])), add(10, Weight, NewCost)), [[12, e, d, c, a], [16, f, d, c, a]])), by(builtin(findall, 3))),
                                          proof(goal(append([[10, e, d, b, c, a], [11, e, d, b, a], [12, e, c, a], [14, f, d, b, c, a], [15, f, d, b, a]], [[12, e, d, c, a], [16, f, d, c, a]], [[10, e, d, b, c, a], [11, e, d, b, a], [12, e, c, a], [14, f, d, b, c, a], [15, f, d, b, a], [12, e, d, c, a], [16, f, d, c, a]])), by(builtin(append, 3))),
                                          proof(goal(sort([[10, e, d, b, c, a], [11, e, d, b, a], [12, e, c, a], [14, f, d, b, c, a], [15, f, d, b, a], [12, e, d, c, a], [16, f, d, c, a]], [[10, e, d, b, c, a], [11, e, d, b, a], [12, e, c, a], [12, e, d, c, a], [14, f, d, b, c, a], [15, f, d, b, a], [16, f, d, c, a]])), by(builtin(sort, 2))),
                                          proof(
                                            goal(dijkstra_queue([[10, e, d, b, c, a], [11, e, d, b, a], [12, e, c, a], [12, e, d, c, a], [14, f, d, b, c, a], [15, f, d, b, a], [16, f, d, c, a]], f, [d, d, d, b, b, c, a], [f, e, d, b, c, a], 13)), by(rule("dijkstra-findall-sort.pl", clause(16))),
                                            bindings([binding("Cost", 10), binding("Node", e), binding("Path", [d, b, c, a]), binding("Queue", [[11, e, d, b, a], [12, e, c, a], [12, e, d, c, a], [14, f, d, b, c, a], [15, f, d, b, a], [16, f, d, c, a]]), binding("Goal", f), binding("Visited", [d, d, d, b, b, c, a]), binding("ResultPath", [f, e, d, b, c, a]), binding("ResultCost", 13), binding("Neighbors", [[13, f, e, d, b, c, a]]), binding("NewQueue", [[11, e, d, b, a], [12, e, c, a], [12, e, d, c, a], [14, f, d, b, c, a], [15, f, d, b, a], [16, f, d, c, a], [13, f, e, d, b, c, a]]), binding("SortedQueue", [[11, e, d, b, a], [12, e, c, a], [12, e, d, c, a], [13, f, e, d, b, c, a], [14, f, d, b, c, a], [15, f, d, b, a], [16, f, d, c, a]])]),
                                            uses([
                                              proof(goal(findall([NewCost, Neighbor, e, d, b, c, a], (edge(e, Neighbor, Weight), not(member(Neighbor, [d, d, d, b, b, c, a])), add(10, Weight, NewCost)), [[13, f, e, d, b, c, a]])), by(builtin(findall, 3))),
                                              proof(goal(append([[11, e, d, b, a], [12, e, c, a], [12, e, d, c, a], [14, f, d, b, c, a], [15, f, d, b, a], [16, f, d, c, a]], [[13, f, e, d, b, c, a]], [[11, e, d, b, a], [12, e, c, a], [12, e, d, c, a], [14, f, d, b, c, a], [15, f, d, b, a], [16, f, d, c, a], [13, f, e, d, b, c, a]])), by(builtin(append, 3))),
                                              proof(goal(sort([[11, e, d, b, a], [12, e, c, a], [12, e, d, c, a], [14, f, d, b, c, a], [15, f, d, b, a], [16, f, d, c, a], [13, f, e, d, b, c, a]], [[11, e, d, b, a], [12, e, c, a], [12, e, d, c, a], [13, f, e, d, b, c, a], [14, f, d, b, c, a], [15, f, d, b, a], [16, f, d, c, a]])), by(builtin(sort, 2))),
                                              proof(
                                                goal(dijkstra_queue([[11, e, d, b, a], [12, e, c, a], [12, e, d, c, a], [13, f, e, d, b, c, a], [14, f, d, b, c, a], [15, f, d, b, a], [16, f, d, c, a]], f, [e, d, d, d, b, b, c, a], [f, e, d, b, c, a], 13)), by(rule("dijkstra-findall-sort.pl", clause(16))),
                                                bindings([binding("Cost", 11), binding("Node", e), binding("Path", [d, b, a]), binding("Queue", [[12, e, c, a], [12, e, d, c, a], [13, f, e, d, b, c, a], [14, f, d, b, c, a], [15, f, d, b, a], [16, f, d, c, a]]), binding("Goal", f), binding("Visited", [e, d, d, d, b, b, c, a]), binding("ResultPath", [f, e, d, b, c, a]), binding("ResultCost", 13), binding("Neighbors", [[14, f, e, d, b, a]]), binding("NewQueue", [[12, e, c, a], [12, e, d, c, a], [13, f, e, d, b, c, a], [14, f, d, b, c, a], [15, f, d, b, a], [16, f, d, c, a], [14, f, e, d, b, a]]), binding("SortedQueue", [[12, e, c, a], [12, e, d, c, a], [13, f, e, d, b, c, a], [14, f, d, b, c, a], [14, f, e, d, b, a], [15, f, d, b, a], [16, f, d, c, a]])]),
                                                uses([
                                                  proof(goal(findall([NewCost, Neighbor, e, d, b, a], (edge(e, Neighbor, Weight), not(member(Neighbor, [e, d, d, d, b, b, c, a])), add(11, Weight, NewCost)), [[14, f, e, d, b, a]])), by(builtin(findall, 3))),
                                                  proof(goal(append([[12, e, c, a], [12, e, d, c, a], [13, f, e, d, b, c, a], [14, f, d, b, c, a], [15, f, d, b, a], [16, f, d, c, a]], [[14, f, e, d, b, a]], [[12, e, c, a], [12, e, d, c, a], [13, f, e, d, b, c, a], [14, f, d, b, c, a], [15, f, d, b, a], [16, f, d, c, a], [14, f, e, d, b, a]])), by(builtin(append, 3))),
                                                  proof(goal(sort([[12, e, c, a], [12, e, d, c, a], [13, f, e, d, b, c, a], [14, f, d, b, c, a], [15, f, d, b, a], [16, f, d, c, a], [14, f, e, d, b, a]], [[12, e, c, a], [12, e, d, c, a], [13, f, e, d, b, c, a], [14, f, d, b, c, a], [14, f, e, d, b, a], [15, f, d, b, a], [16, f, d, c, a]])), by(builtin(sort, 2))),
                                                  proof(
                                                    goal(dijkstra_queue([[12, e, c, a], [12, e, d, c, a], [13, f, e, d, b, c, a], [14, f, d, b, c, a], [14, f, e, d, b, a], [15, f, d, b, a], [16, f, d, c, a]], f, [e, e, d, d, d, b, b, c, a], [f, e, d, b, c, a], 13)), by(rule("dijkstra-findall-sort.pl", clause(16))),
                                                    bindings([binding("Cost", 12), binding("Node", e), binding("Path", [c, a]), binding("Queue", [[12, e, d, c, a], [13, f, e, d, b, c, a], [14, f, d, b, c, a], [14, f, e, d, b, a], [15, f, d, b, a], [16, f, d, c, a]]), binding("Goal", f), binding("Visited", [e, e, d, d, d, b, b, c, a]), binding("ResultPath", [f, e, d, b, c, a]), binding("ResultCost", 13), binding("Neighbors", [[15, f, e, c, a]]), binding("NewQueue", [[12, e, d, c, a], [13, f, e, d, b, c, a], [14, f, d, b, c, a], [14, f, e, d, b, a], [15, f, d, b, a], [16, f, d, c, a], [15, f, e, c, a]]), binding("SortedQueue", [[12, e, d, c, a], [13, f, e, d, b, c, a], [14, f, d, b, c, a], [14, f, e, d, b, a], [15, f, d, b, a], [15, f, e, c, a], [16, f, d, c, a]])]),
                                                    uses([
                                                      proof(goal(findall([NewCost, Neighbor, e, c, a], (edge(e, Neighbor, Weight), not(member(Neighbor, [e, e, d, d, d, b, b, c, a])), add(12, Weight, NewCost)), [[15, f, e, c, a]])), by(builtin(findall, 3))),
                                                      proof(goal(append([[12, e, d, c, a], [13, f, e, d, b, c, a], [14, f, d, b, c, a], [14, f, e, d, b, a], [15, f, d, b, a], [16, f, d, c, a]], [[15, f, e, c, a]], [[12, e, d, c, a], [13, f, e, d, b, c, a], [14, f, d, b, c, a], [14, f, e, d, b, a], [15, f, d, b, a], [16, f, d, c, a], [15, f, e, c, a]])), by(builtin(append, 3))),
                                                      proof(goal(sort([[12, e, d, c, a], [13, f, e, d, b, c, a], [14, f, d, b, c, a], [14, f, e, d, b, a], [15, f, d, b, a], [16, f, d, c, a], [15, f, e, c, a]], [[12, e, d, c, a], [13, f, e, d, b, c, a], [14, f, d, b, c, a], [14, f, e, d, b, a], [15, f, d, b, a], [15, f, e, c, a], [16, f, d, c, a]])), by(builtin(sort, 2))),
                                                      proof(
                                                        goal(dijkstra_queue([[12, e, d, c, a], [13, f, e, d, b, c, a], [14, f, d, b, c, a], [14, f, e, d, b, a], [15, f, d, b, a], [15, f, e, c, a], [16, f, d, c, a]], f, [e, e, e, d, d, d, b, b, c, a], [f, e, d, b, c, a], 13)), by(rule("dijkstra-findall-sort.pl", clause(16))),
                                                        bindings([binding("Cost", 12), binding("Node", e), binding("Path", [d, c, a]), binding("Queue", [[13, f, e, d, b, c, a], [14, f, d, b, c, a], [14, f, e, d, b, a], [15, f, d, b, a], [15, f, e, c, a], [16, f, d, c, a]]), binding("Goal", f), binding("Visited", [e, e, e, d, d, d, b, b, c, a]), binding("ResultPath", [f, e, d, b, c, a]), binding("ResultCost", 13), binding("Neighbors", [[15, f, e, d, c, a]]), binding("NewQueue", [[13, f, e, d, b, c, a], [14, f, d, b, c, a], [14, f, e, d, b, a], [15, f, d, b, a], [15, f, e, c, a], [16, f, d, c, a], [15, f, e, d, c, a]]), binding("SortedQueue", [[13, f, e, d, b, c, a], [14, f, d, b, c, a], [14, f, e, d, b, a], [15, f, d, b, a], [15, f, e, c, a], [15, f, e, d, c, a], [16, f, d, c, a]])]),
                                                        uses([
                                                          proof(goal(findall([NewCost, Neighbor, e, d, c, a], (edge(e, Neighbor, Weight), not(member(Neighbor, [e, e, e, d, d, d, b, b, c, a])), add(12, Weight, NewCost)), [[15, f, e, d, c, a]])), by(builtin(findall, 3))),
                                                          proof(goal(append([[13, f, e, d, b, c, a], [14, f, d, b, c, a], [14, f, e, d, b, a], [15, f, d, b, a], [15, f, e, c, a], [16, f, d, c, a]], [[15, f, e, d, c, a]], [[13, f, e, d, b, c, a], [14, f, d, b, c, a], [14, f, e, d, b, a], [15, f, d, b, a], [15, f, e, c, a], [16, f, d, c, a], [15, f, e, d, c, a]])), by(builtin(append, 3))),
                                                          proof(goal(sort([[13, f, e, d, b, c, a], [14, f, d, b, c, a], [14, f, e, d, b, a], [15, f, d, b, a], [15, f, e, c, a], [16, f, d, c, a], [15, f, e, d, c, a]], [[13, f, e, d, b, c, a], [14, f, d, b, c, a], [14, f, e, d, b, a], [15, f, d, b, a], [15, f, e, c, a], [15, f, e, d, c, a], [16, f, d, c, a]])), by(builtin(sort, 2))),
                                                          proof(
                                                            goal(dijkstra_queue([[13, f, e, d, b, c, a], [14, f, d, b, c, a], [14, f, e, d, b, a], [15, f, d, b, a], [15, f, e, c, a], [15, f, e, d, c, a], [16, f, d, c, a]], f, [e, e, e, e, d, d, d, b, b, c, a], [f, e, d, b, c, a], 13)), by(fact("dijkstra-findall-sort.pl", clause(15))),
                                                            bindings([binding("Cost", 13), binding("Goal", f), binding("Path", [e, d, b, c, a]), binding("_Queue", [[14, f, d, b, c, a], [14, f, e, d, b, a], [15, f, d, b, a], [15, f, e, c, a], [15, f, e, d, c, a], [16, f, d, c, a]]), binding("_Visited", [e, e, e, e, d, d, d, b, b, c, a])])
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
                                ])
                              )
                            ])
                          )
                        ])
                      )
                    ])
                  )
                ])
              ),
              proof(goal(reverse([f, e, d, b, c, a], [a, c, b, d, e, f])), by(builtin(reverse, 2)))
            ])
          )
        ])
      )
    ])
  )
).

cost(dijkstra_findall_sort, 13).
why(
  cost(dijkstra_findall_sort, 13),
  proof(
    goal(cost(dijkstra_findall_sort, 13)), by(rule("dijkstra-findall-sort.pl", clause(18))),
    bindings([binding("Cost", 13), binding("_Path", [a, c, b, d, e, f])]),
    uses([
      proof(
        goal(once(dijkstra(a, f, [a, c, b, d, e, f], 13))), by(builtin(once, 1)),
        uses([
          proof(
            goal(dijkstra(a, f, [a, c, b, d, e, f], 13)), by(rule("dijkstra-findall-sort.pl", clause(14))),
            bindings([binding("Start", a), binding("Goal", f), binding("Path", [a, c, b, d, e, f]), binding("Cost", 13), binding("RevPath", [f, e, d, b, c, a])]),
            uses([
              proof(
                goal(dijkstra_queue([[0, a]], f, [], [f, e, d, b, c, a], 13)), by(rule("dijkstra-findall-sort.pl", clause(16))),
                bindings([binding("Cost", 0), binding("Node", a), binding("Path", []), binding("Queue", []), binding("Goal", f), binding("Visited", []), binding("ResultPath", [f, e, d, b, c, a]), binding("ResultCost", 13), binding("Neighbors", [[4, b, a], [2, c, a]]), binding("NewQueue", [[4, b, a], [2, c, a]]), binding("SortedQueue", [[2, c, a], [4, b, a]])]),
                uses([
                  proof(goal(findall([NewCost, Neighbor, a], (edge(a, Neighbor, Weight), not(member(Neighbor, [])), add(0, Weight, NewCost)), [[4, b, a], [2, c, a]])), by(builtin(findall, 3))),
                  proof(goal(append([], [[4, b, a], [2, c, a]], [[4, b, a], [2, c, a]])), by(builtin(append, 3))),
                  proof(goal(sort([[4, b, a], [2, c, a]], [[2, c, a], [4, b, a]])), by(builtin(sort, 2))),
                  proof(
                    goal(dijkstra_queue([[2, c, a], [4, b, a]], f, [a], [f, e, d, b, c, a], 13)), by(rule("dijkstra-findall-sort.pl", clause(16))),
                    bindings([binding("Cost", 2), binding("Node", c), binding("Path", [a]), binding("Queue", [[4, b, a]]), binding("Goal", f), binding("Visited", [a]), binding("ResultPath", [f, e, d, b, c, a]), binding("ResultCost", 13), binding("Neighbors", [[10, d, c, a], [12, e, c, a], [3, b, c, a]]), binding("NewQueue", [[4, b, a], [10, d, c, a], [12, e, c, a], [3, b, c, a]]), binding("SortedQueue", [[3, b, c, a], [4, b, a], [10, d, c, a], [12, e, c, a]])]),
                    uses([
                      proof(goal(findall([NewCost, Neighbor, c, a], (edge(c, Neighbor, Weight), not(member(Neighbor, [a])), add(2, Weight, NewCost)), [[10, d, c, a], [12, e, c, a], [3, b, c, a]])), by(builtin(findall, 3))),
                      proof(goal(append([[4, b, a]], [[10, d, c, a], [12, e, c, a], [3, b, c, a]], [[4, b, a], [10, d, c, a], [12, e, c, a], [3, b, c, a]])), by(builtin(append, 3))),
                      proof(goal(sort([[4, b, a], [10, d, c, a], [12, e, c, a], [3, b, c, a]], [[3, b, c, a], [4, b, a], [10, d, c, a], [12, e, c, a]])), by(builtin(sort, 2))),
                      proof(
                        goal(dijkstra_queue([[3, b, c, a], [4, b, a], [10, d, c, a], [12, e, c, a]], f, [c, a], [f, e, d, b, c, a], 13)), by(rule("dijkstra-findall-sort.pl", clause(16))),
                        bindings([binding("Cost", 3), binding("Node", b), binding("Path", [c, a]), binding("Queue", [[4, b, a], [10, d, c, a], [12, e, c, a]]), binding("Goal", f), binding("Visited", [c, a]), binding("ResultPath", [f, e, d, b, c, a]), binding("ResultCost", 13), binding("Neighbors", [[8, d, b, c, a]]), binding("NewQueue", [[4, b, a], [10, d, c, a], [12, e, c, a], [8, d, b, c, a]]), binding("SortedQueue", [[4, b, a], [8, d, b, c, a], [10, d, c, a], [12, e, c, a]])]),
                        uses([
                          proof(goal(findall([NewCost, Neighbor, b, c, a], (edge(b, Neighbor, Weight), not(member(Neighbor, [c, a])), add(3, Weight, NewCost)), [[8, d, b, c, a]])), by(builtin(findall, 3))),
                          proof(goal(append([[4, b, a], [10, d, c, a], [12, e, c, a]], [[8, d, b, c, a]], [[4, b, a], [10, d, c, a], [12, e, c, a], [8, d, b, c, a]])), by(builtin(append, 3))),
                          proof(goal(sort([[4, b, a], [10, d, c, a], [12, e, c, a], [8, d, b, c, a]], [[4, b, a], [8, d, b, c, a], [10, d, c, a], [12, e, c, a]])), by(builtin(sort, 2))),
                          proof(
                            goal(dijkstra_queue([[4, b, a], [8, d, b, c, a], [10, d, c, a], [12, e, c, a]], f, [b, c, a], [f, e, d, b, c, a], 13)), by(rule("dijkstra-findall-sort.pl", clause(16))),
                            bindings([binding("Cost", 4), binding("Node", b), binding("Path", [a]), binding("Queue", [[8, d, b, c, a], [10, d, c, a], [12, e, c, a]]), binding("Goal", f), binding("Visited", [b, c, a]), binding("ResultPath", [f, e, d, b, c, a]), binding("ResultCost", 13), binding("Neighbors", [[9, d, b, a]]), binding("NewQueue", [[8, d, b, c, a], [10, d, c, a], [12, e, c, a], [9, d, b, a]]), binding("SortedQueue", [[8, d, b, c, a], [9, d, b, a], [10, d, c, a], [12, e, c, a]])]),
                            uses([
                              proof(goal(findall([NewCost, Neighbor, b, a], (edge(b, Neighbor, Weight), not(member(Neighbor, [b, c, a])), add(4, Weight, NewCost)), [[9, d, b, a]])), by(builtin(findall, 3))),
                              proof(goal(append([[8, d, b, c, a], [10, d, c, a], [12, e, c, a]], [[9, d, b, a]], [[8, d, b, c, a], [10, d, c, a], [12, e, c, a], [9, d, b, a]])), by(builtin(append, 3))),
                              proof(goal(sort([[8, d, b, c, a], [10, d, c, a], [12, e, c, a], [9, d, b, a]], [[8, d, b, c, a], [9, d, b, a], [10, d, c, a], [12, e, c, a]])), by(builtin(sort, 2))),
                              proof(
                                goal(dijkstra_queue([[8, d, b, c, a], [9, d, b, a], [10, d, c, a], [12, e, c, a]], f, [b, b, c, a], [f, e, d, b, c, a], 13)), by(rule("dijkstra-findall-sort.pl", clause(16))),
                                bindings([binding("Cost", 8), binding("Node", d), binding("Path", [b, c, a]), binding("Queue", [[9, d, b, a], [10, d, c, a], [12, e, c, a]]), binding("Goal", f), binding("Visited", [b, b, c, a]), binding("ResultPath", [f, e, d, b, c, a]), binding("ResultCost", 13), binding("Neighbors", [[10, e, d, b, c, a], [14, f, d, b, c, a]]), binding("NewQueue", [[9, d, b, a], [10, d, c, a], [12, e, c, a], [10, e, d, b, c, a], [14, f, d, b, c, a]]), binding("SortedQueue", [[9, d, b, a], [10, d, c, a], [10, e, d, b, c, a], [12, e, c, a], [14, f, d, b, c, a]])]),
                                uses([
                                  proof(goal(findall([NewCost, Neighbor, d, b, c, a], (edge(d, Neighbor, Weight), not(member(Neighbor, [b, b, c, a])), add(8, Weight, NewCost)), [[10, e, d, b, c, a], [14, f, d, b, c, a]])), by(builtin(findall, 3))),
                                  proof(goal(append([[9, d, b, a], [10, d, c, a], [12, e, c, a]], [[10, e, d, b, c, a], [14, f, d, b, c, a]], [[9, d, b, a], [10, d, c, a], [12, e, c, a], [10, e, d, b, c, a], [14, f, d, b, c, a]])), by(builtin(append, 3))),
                                  proof(goal(sort([[9, d, b, a], [10, d, c, a], [12, e, c, a], [10, e, d, b, c, a], [14, f, d, b, c, a]], [[9, d, b, a], [10, d, c, a], [10, e, d, b, c, a], [12, e, c, a], [14, f, d, b, c, a]])), by(builtin(sort, 2))),
                                  proof(
                                    goal(dijkstra_queue([[9, d, b, a], [10, d, c, a], [10, e, d, b, c, a], [12, e, c, a], [14, f, d, b, c, a]], f, [d, b, b, c, a], [f, e, d, b, c, a], 13)), by(rule("dijkstra-findall-sort.pl", clause(16))),
                                    bindings([binding("Cost", 9), binding("Node", d), binding("Path", [b, a]), binding("Queue", [[10, d, c, a], [10, e, d, b, c, a], [12, e, c, a], [14, f, d, b, c, a]]), binding("Goal", f), binding("Visited", [d, b, b, c, a]), binding("ResultPath", [f, e, d, b, c, a]), binding("ResultCost", 13), binding("Neighbors", [[11, e, d, b, a], [15, f, d, b, a]]), binding("NewQueue", [[10, d, c, a], [10, e, d, b, c, a], [12, e, c, a], [14, f, d, b, c, a], [11, e, d, b, a], [15, f, d, b, a]]), binding("SortedQueue", [[10, d, c, a], [10, e, d, b, c, a], [11, e, d, b, a], [12, e, c, a], [14, f, d, b, c, a], [15, f, d, b, a]])]),
                                    uses([
                                      proof(goal(findall([NewCost, Neighbor, d, b, a], (edge(d, Neighbor, Weight), not(member(Neighbor, [d, b, b, c, a])), add(9, Weight, NewCost)), [[11, e, d, b, a], [15, f, d, b, a]])), by(builtin(findall, 3))),
                                      proof(goal(append([[10, d, c, a], [10, e, d, b, c, a], [12, e, c, a], [14, f, d, b, c, a]], [[11, e, d, b, a], [15, f, d, b, a]], [[10, d, c, a], [10, e, d, b, c, a], [12, e, c, a], [14, f, d, b, c, a], [11, e, d, b, a], [15, f, d, b, a]])), by(builtin(append, 3))),
                                      proof(goal(sort([[10, d, c, a], [10, e, d, b, c, a], [12, e, c, a], [14, f, d, b, c, a], [11, e, d, b, a], [15, f, d, b, a]], [[10, d, c, a], [10, e, d, b, c, a], [11, e, d, b, a], [12, e, c, a], [14, f, d, b, c, a], [15, f, d, b, a]])), by(builtin(sort, 2))),
                                      proof(
                                        goal(dijkstra_queue([[10, d, c, a], [10, e, d, b, c, a], [11, e, d, b, a], [12, e, c, a], [14, f, d, b, c, a], [15, f, d, b, a]], f, [d, d, b, b, c, a], [f, e, d, b, c, a], 13)), by(rule("dijkstra-findall-sort.pl", clause(16))),
                                        bindings([binding("Cost", 10), binding("Node", d), binding("Path", [c, a]), binding("Queue", [[10, e, d, b, c, a], [11, e, d, b, a], [12, e, c, a], [14, f, d, b, c, a], [15, f, d, b, a]]), binding("Goal", f), binding("Visited", [d, d, b, b, c, a]), binding("ResultPath", [f, e, d, b, c, a]), binding("ResultCost", 13), binding("Neighbors", [[12, e, d, c, a], [16, f, d, c, a]]), binding("NewQueue", [[10, e, d, b, c, a], [11, e, d, b, a], [12, e, c, a], [14, f, d, b, c, a], [15, f, d, b, a], [12, e, d, c, a], [16, f, d, c, a]]), binding("SortedQueue", [[10, e, d, b, c, a], [11, e, d, b, a], [12, e, c, a], [12, e, d, c, a], [14, f, d, b, c, a], [15, f, d, b, a], [16, f, d, c, a]])]),
                                        uses([
                                          proof(goal(findall([NewCost, Neighbor, d, c, a], (edge(d, Neighbor, Weight), not(member(Neighbor, [d, d, b, b, c, a])), add(10, Weight, NewCost)), [[12, e, d, c, a], [16, f, d, c, a]])), by(builtin(findall, 3))),
                                          proof(goal(append([[10, e, d, b, c, a], [11, e, d, b, a], [12, e, c, a], [14, f, d, b, c, a], [15, f, d, b, a]], [[12, e, d, c, a], [16, f, d, c, a]], [[10, e, d, b, c, a], [11, e, d, b, a], [12, e, c, a], [14, f, d, b, c, a], [15, f, d, b, a], [12, e, d, c, a], [16, f, d, c, a]])), by(builtin(append, 3))),
                                          proof(goal(sort([[10, e, d, b, c, a], [11, e, d, b, a], [12, e, c, a], [14, f, d, b, c, a], [15, f, d, b, a], [12, e, d, c, a], [16, f, d, c, a]], [[10, e, d, b, c, a], [11, e, d, b, a], [12, e, c, a], [12, e, d, c, a], [14, f, d, b, c, a], [15, f, d, b, a], [16, f, d, c, a]])), by(builtin(sort, 2))),
                                          proof(
                                            goal(dijkstra_queue([[10, e, d, b, c, a], [11, e, d, b, a], [12, e, c, a], [12, e, d, c, a], [14, f, d, b, c, a], [15, f, d, b, a], [16, f, d, c, a]], f, [d, d, d, b, b, c, a], [f, e, d, b, c, a], 13)), by(rule("dijkstra-findall-sort.pl", clause(16))),
                                            bindings([binding("Cost", 10), binding("Node", e), binding("Path", [d, b, c, a]), binding("Queue", [[11, e, d, b, a], [12, e, c, a], [12, e, d, c, a], [14, f, d, b, c, a], [15, f, d, b, a], [16, f, d, c, a]]), binding("Goal", f), binding("Visited", [d, d, d, b, b, c, a]), binding("ResultPath", [f, e, d, b, c, a]), binding("ResultCost", 13), binding("Neighbors", [[13, f, e, d, b, c, a]]), binding("NewQueue", [[11, e, d, b, a], [12, e, c, a], [12, e, d, c, a], [14, f, d, b, c, a], [15, f, d, b, a], [16, f, d, c, a], [13, f, e, d, b, c, a]]), binding("SortedQueue", [[11, e, d, b, a], [12, e, c, a], [12, e, d, c, a], [13, f, e, d, b, c, a], [14, f, d, b, c, a], [15, f, d, b, a], [16, f, d, c, a]])]),
                                            uses([
                                              proof(goal(findall([NewCost, Neighbor, e, d, b, c, a], (edge(e, Neighbor, Weight), not(member(Neighbor, [d, d, d, b, b, c, a])), add(10, Weight, NewCost)), [[13, f, e, d, b, c, a]])), by(builtin(findall, 3))),
                                              proof(goal(append([[11, e, d, b, a], [12, e, c, a], [12, e, d, c, a], [14, f, d, b, c, a], [15, f, d, b, a], [16, f, d, c, a]], [[13, f, e, d, b, c, a]], [[11, e, d, b, a], [12, e, c, a], [12, e, d, c, a], [14, f, d, b, c, a], [15, f, d, b, a], [16, f, d, c, a], [13, f, e, d, b, c, a]])), by(builtin(append, 3))),
                                              proof(goal(sort([[11, e, d, b, a], [12, e, c, a], [12, e, d, c, a], [14, f, d, b, c, a], [15, f, d, b, a], [16, f, d, c, a], [13, f, e, d, b, c, a]], [[11, e, d, b, a], [12, e, c, a], [12, e, d, c, a], [13, f, e, d, b, c, a], [14, f, d, b, c, a], [15, f, d, b, a], [16, f, d, c, a]])), by(builtin(sort, 2))),
                                              proof(
                                                goal(dijkstra_queue([[11, e, d, b, a], [12, e, c, a], [12, e, d, c, a], [13, f, e, d, b, c, a], [14, f, d, b, c, a], [15, f, d, b, a], [16, f, d, c, a]], f, [e, d, d, d, b, b, c, a], [f, e, d, b, c, a], 13)), by(rule("dijkstra-findall-sort.pl", clause(16))),
                                                bindings([binding("Cost", 11), binding("Node", e), binding("Path", [d, b, a]), binding("Queue", [[12, e, c, a], [12, e, d, c, a], [13, f, e, d, b, c, a], [14, f, d, b, c, a], [15, f, d, b, a], [16, f, d, c, a]]), binding("Goal", f), binding("Visited", [e, d, d, d, b, b, c, a]), binding("ResultPath", [f, e, d, b, c, a]), binding("ResultCost", 13), binding("Neighbors", [[14, f, e, d, b, a]]), binding("NewQueue", [[12, e, c, a], [12, e, d, c, a], [13, f, e, d, b, c, a], [14, f, d, b, c, a], [15, f, d, b, a], [16, f, d, c, a], [14, f, e, d, b, a]]), binding("SortedQueue", [[12, e, c, a], [12, e, d, c, a], [13, f, e, d, b, c, a], [14, f, d, b, c, a], [14, f, e, d, b, a], [15, f, d, b, a], [16, f, d, c, a]])]),
                                                uses([
                                                  proof(goal(findall([NewCost, Neighbor, e, d, b, a], (edge(e, Neighbor, Weight), not(member(Neighbor, [e, d, d, d, b, b, c, a])), add(11, Weight, NewCost)), [[14, f, e, d, b, a]])), by(builtin(findall, 3))),
                                                  proof(goal(append([[12, e, c, a], [12, e, d, c, a], [13, f, e, d, b, c, a], [14, f, d, b, c, a], [15, f, d, b, a], [16, f, d, c, a]], [[14, f, e, d, b, a]], [[12, e, c, a], [12, e, d, c, a], [13, f, e, d, b, c, a], [14, f, d, b, c, a], [15, f, d, b, a], [16, f, d, c, a], [14, f, e, d, b, a]])), by(builtin(append, 3))),
                                                  proof(goal(sort([[12, e, c, a], [12, e, d, c, a], [13, f, e, d, b, c, a], [14, f, d, b, c, a], [15, f, d, b, a], [16, f, d, c, a], [14, f, e, d, b, a]], [[12, e, c, a], [12, e, d, c, a], [13, f, e, d, b, c, a], [14, f, d, b, c, a], [14, f, e, d, b, a], [15, f, d, b, a], [16, f, d, c, a]])), by(builtin(sort, 2))),
                                                  proof(
                                                    goal(dijkstra_queue([[12, e, c, a], [12, e, d, c, a], [13, f, e, d, b, c, a], [14, f, d, b, c, a], [14, f, e, d, b, a], [15, f, d, b, a], [16, f, d, c, a]], f, [e, e, d, d, d, b, b, c, a], [f, e, d, b, c, a], 13)), by(rule("dijkstra-findall-sort.pl", clause(16))),
                                                    bindings([binding("Cost", 12), binding("Node", e), binding("Path", [c, a]), binding("Queue", [[12, e, d, c, a], [13, f, e, d, b, c, a], [14, f, d, b, c, a], [14, f, e, d, b, a], [15, f, d, b, a], [16, f, d, c, a]]), binding("Goal", f), binding("Visited", [e, e, d, d, d, b, b, c, a]), binding("ResultPath", [f, e, d, b, c, a]), binding("ResultCost", 13), binding("Neighbors", [[15, f, e, c, a]]), binding("NewQueue", [[12, e, d, c, a], [13, f, e, d, b, c, a], [14, f, d, b, c, a], [14, f, e, d, b, a], [15, f, d, b, a], [16, f, d, c, a], [15, f, e, c, a]]), binding("SortedQueue", [[12, e, d, c, a], [13, f, e, d, b, c, a], [14, f, d, b, c, a], [14, f, e, d, b, a], [15, f, d, b, a], [15, f, e, c, a], [16, f, d, c, a]])]),
                                                    uses([
                                                      proof(goal(findall([NewCost, Neighbor, e, c, a], (edge(e, Neighbor, Weight), not(member(Neighbor, [e, e, d, d, d, b, b, c, a])), add(12, Weight, NewCost)), [[15, f, e, c, a]])), by(builtin(findall, 3))),
                                                      proof(goal(append([[12, e, d, c, a], [13, f, e, d, b, c, a], [14, f, d, b, c, a], [14, f, e, d, b, a], [15, f, d, b, a], [16, f, d, c, a]], [[15, f, e, c, a]], [[12, e, d, c, a], [13, f, e, d, b, c, a], [14, f, d, b, c, a], [14, f, e, d, b, a], [15, f, d, b, a], [16, f, d, c, a], [15, f, e, c, a]])), by(builtin(append, 3))),
                                                      proof(goal(sort([[12, e, d, c, a], [13, f, e, d, b, c, a], [14, f, d, b, c, a], [14, f, e, d, b, a], [15, f, d, b, a], [16, f, d, c, a], [15, f, e, c, a]], [[12, e, d, c, a], [13, f, e, d, b, c, a], [14, f, d, b, c, a], [14, f, e, d, b, a], [15, f, d, b, a], [15, f, e, c, a], [16, f, d, c, a]])), by(builtin(sort, 2))),
                                                      proof(
                                                        goal(dijkstra_queue([[12, e, d, c, a], [13, f, e, d, b, c, a], [14, f, d, b, c, a], [14, f, e, d, b, a], [15, f, d, b, a], [15, f, e, c, a], [16, f, d, c, a]], f, [e, e, e, d, d, d, b, b, c, a], [f, e, d, b, c, a], 13)), by(rule("dijkstra-findall-sort.pl", clause(16))),
                                                        bindings([binding("Cost", 12), binding("Node", e), binding("Path", [d, c, a]), binding("Queue", [[13, f, e, d, b, c, a], [14, f, d, b, c, a], [14, f, e, d, b, a], [15, f, d, b, a], [15, f, e, c, a], [16, f, d, c, a]]), binding("Goal", f), binding("Visited", [e, e, e, d, d, d, b, b, c, a]), binding("ResultPath", [f, e, d, b, c, a]), binding("ResultCost", 13), binding("Neighbors", [[15, f, e, d, c, a]]), binding("NewQueue", [[13, f, e, d, b, c, a], [14, f, d, b, c, a], [14, f, e, d, b, a], [15, f, d, b, a], [15, f, e, c, a], [16, f, d, c, a], [15, f, e, d, c, a]]), binding("SortedQueue", [[13, f, e, d, b, c, a], [14, f, d, b, c, a], [14, f, e, d, b, a], [15, f, d, b, a], [15, f, e, c, a], [15, f, e, d, c, a], [16, f, d, c, a]])]),
                                                        uses([
                                                          proof(goal(findall([NewCost, Neighbor, e, d, c, a], (edge(e, Neighbor, Weight), not(member(Neighbor, [e, e, e, d, d, d, b, b, c, a])), add(12, Weight, NewCost)), [[15, f, e, d, c, a]])), by(builtin(findall, 3))),
                                                          proof(goal(append([[13, f, e, d, b, c, a], [14, f, d, b, c, a], [14, f, e, d, b, a], [15, f, d, b, a], [15, f, e, c, a], [16, f, d, c, a]], [[15, f, e, d, c, a]], [[13, f, e, d, b, c, a], [14, f, d, b, c, a], [14, f, e, d, b, a], [15, f, d, b, a], [15, f, e, c, a], [16, f, d, c, a], [15, f, e, d, c, a]])), by(builtin(append, 3))),
                                                          proof(goal(sort([[13, f, e, d, b, c, a], [14, f, d, b, c, a], [14, f, e, d, b, a], [15, f, d, b, a], [15, f, e, c, a], [16, f, d, c, a], [15, f, e, d, c, a]], [[13, f, e, d, b, c, a], [14, f, d, b, c, a], [14, f, e, d, b, a], [15, f, d, b, a], [15, f, e, c, a], [15, f, e, d, c, a], [16, f, d, c, a]])), by(builtin(sort, 2))),
                                                          proof(
                                                            goal(dijkstra_queue([[13, f, e, d, b, c, a], [14, f, d, b, c, a], [14, f, e, d, b, a], [15, f, d, b, a], [15, f, e, c, a], [15, f, e, d, c, a], [16, f, d, c, a]], f, [e, e, e, e, d, d, d, b, b, c, a], [f, e, d, b, c, a], 13)), by(fact("dijkstra-findall-sort.pl", clause(15))),
                                                            bindings([binding("Cost", 13), binding("Goal", f), binding("Path", [e, d, b, c, a]), binding("_Queue", [[14, f, d, b, c, a], [14, f, e, d, b, a], [15, f, d, b, a], [15, f, e, c, a], [15, f, e, d, c, a], [16, f, d, c, a]]), binding("_Visited", [e, e, e, e, d, d, d, b, b, c, a])])
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
                                ])
                              )
                            ])
                          )
                        ])
                      )
                    ])
                  )
                ])
              ),
              proof(goal(reverse([f, e, d, b, c, a], [a, c, b, d, e, f])), by(builtin(reverse, 2)))
            ])
          )
        ])
      )
    ])
  )
).

