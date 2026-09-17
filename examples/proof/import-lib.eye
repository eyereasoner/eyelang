# Eyelang result format 1
query(1, at(5, 1), [call(ancestor(iris, ?v0))], [binding("descendant", ?v0)]).
result(1, complete, 2).
answer(1, [binding("descendant", jules)]).
why(1, [binding("descendant", jules)], 3).
answer(1, [binding("descendant", kai)]).
why(1, [binding("descendant", kai)], 7).
proof(1, parent(iris, jules), rule(1, at(2, 1)), []).
proof(2, ancestor(iris, jules), rule(3, at(3, 1)), [uses(1, parent(iris, jules))]).
proof(3, solution([jules]), query, [uses(2, ancestor(iris, jules))]).
proof(4, parent(jules, kai), rule(2, at(2, 22)), []).
proof(5, ancestor(jules, kai), rule(3, at(3, 1)), [uses(4, parent(jules, kai))]).
proof(6, ancestor(iris, kai), rule(4, at(4, 1)), [uses(1, parent(iris, jules)), uses(5, ancestor(jules, kai))]).
proof(7, solution([kai]), query, [uses(6, ancestor(iris, kai))]).
