% Chandy-Misra dining philosophers trace adapted from Eyeling dining-philosophers.n3.
% Requests and sends are derived; KeepFork facts copy forks that are not sent.

left_fork(dp:P1, dp:F51). right_fork(dp:P1, dp:F12).
left_fork(dp:P2, dp:F12). right_fork(dp:P2, dp:F23).
left_fork(dp:P3, dp:F23). right_fork(dp:P3, dp:F34).
left_fork(dp:P4, dp:F34). right_fork(dp:P4, dp:F45).
left_fork(dp:P5, dp:F45). right_fork(dp:P5, dp:F51).

slot(dp:C0, dp:s1, 1). after_sends(dp:C0, dp:C1). after_eat(dp:C1, dp:C2).
slot(dp:C2, dp:s2, 1). after_sends(dp:C2, dp:C3). after_eat(dp:C3, dp:C4).
slot(dp:C4, dp:s3, 1). after_sends(dp:C4, dp:C5). after_eat(dp:C5, dp:C6).
slot(dp:C6, dp:s4, 2). after_sends(dp:C6, dp:C7). after_eat(dp:C7, dp:C8).
slot(dp:C8, dp:s5, 2). after_sends(dp:C8, dp:C9). after_eat(dp:C9, dp:C10).
slot(dp:C10, dp:s6, 2). after_sends(dp:C10, dp:C11). after_eat(dp:C11, dp:C12).
slot(dp:C12, dp:s7, 3). after_sends(dp:C12, dp:C13). after_eat(dp:C13, dp:C14).
slot(dp:C14, dp:s8, 3). after_sends(dp:C14, dp:C15). after_eat(dp:C15, dp:C16).
slot(dp:C16, dp:s9, 3). after_sends(dp:C16, dp:C17). after_eat(dp:C17, dp:C18).

hungry(dp:C0, dp:P1). hungry(dp:C0, dp:P3).
hungry(dp:C2, dp:P2). hungry(dp:C2, dp:P4).
hungry(dp:C4, dp:P5).
hungry(dp:C6, dp:P1). hungry(dp:C6, dp:P3).
hungry(dp:C8, dp:P2). hungry(dp:C8, dp:P4).
hungry(dp:C10, dp:P5).
hungry(dp:C12, dp:P1). hungry(dp:C12, dp:P3).
hungry(dp:C14, dp:P2). hungry(dp:C14, dp:P4).
hungry(dp:C16, dp:P5).

start_state(dp:C0, dp:F12, dp:P1, dp:Dirty).
start_state(dp:C0, dp:F23, dp:P2, dp:Dirty).
start_state(dp:C0, dp:F34, dp:P3, dp:Dirty).
start_state(dp:C0, dp:F45, dp:P4, dp:Dirty).
start_state(dp:C0, dp:F51, dp:P1, dp:Dirty).
start_state(dp:C2, dp:F12, dp:P1, dp:Dirty).
start_state(dp:C2, dp:F23, dp:P3, dp:Dirty).
start_state(dp:C2, dp:F34, dp:P3, dp:Dirty).
start_state(dp:C2, dp:F45, dp:P4, dp:Dirty).
start_state(dp:C2, dp:F51, dp:P1, dp:Dirty).
start_state(dp:C4, dp:F12, dp:P2, dp:Dirty).
start_state(dp:C4, dp:F23, dp:P2, dp:Dirty).
start_state(dp:C4, dp:F34, dp:P4, dp:Dirty).
start_state(dp:C4, dp:F45, dp:P4, dp:Dirty).
start_state(dp:C4, dp:F51, dp:P1, dp:Dirty).
start_state(dp:C6, dp:F12, dp:P2, dp:Dirty).
start_state(dp:C6, dp:F23, dp:P2, dp:Dirty).
start_state(dp:C6, dp:F34, dp:P4, dp:Dirty).
start_state(dp:C6, dp:F45, dp:P5, dp:Dirty).
start_state(dp:C6, dp:F51, dp:P5, dp:Dirty).
start_state(dp:C8, dp:F12, dp:P1, dp:Dirty).
start_state(dp:C8, dp:F23, dp:P3, dp:Dirty).
start_state(dp:C8, dp:F34, dp:P3, dp:Dirty).
start_state(dp:C8, dp:F45, dp:P5, dp:Dirty).
start_state(dp:C8, dp:F51, dp:P1, dp:Dirty).
start_state(dp:C10, dp:F12, dp:P2, dp:Dirty).
start_state(dp:C10, dp:F23, dp:P2, dp:Dirty).
start_state(dp:C10, dp:F34, dp:P4, dp:Dirty).
start_state(dp:C10, dp:F45, dp:P4, dp:Dirty).
start_state(dp:C10, dp:F51, dp:P1, dp:Dirty).
start_state(dp:C12, dp:F12, dp:P2, dp:Dirty).
start_state(dp:C12, dp:F23, dp:P2, dp:Dirty).
start_state(dp:C12, dp:F34, dp:P4, dp:Dirty).
start_state(dp:C12, dp:F45, dp:P5, dp:Dirty).
start_state(dp:C12, dp:F51, dp:P5, dp:Dirty).
start_state(dp:C14, dp:F12, dp:P1, dp:Dirty).
start_state(dp:C14, dp:F23, dp:P3, dp:Dirty).
start_state(dp:C14, dp:F34, dp:P3, dp:Dirty).
start_state(dp:C14, dp:F45, dp:P5, dp:Dirty).
start_state(dp:C14, dp:F51, dp:P1, dp:Dirty).
start_state(dp:C16, dp:F12, dp:P2, dp:Dirty).
start_state(dp:C16, dp:F23, dp:P2, dp:Dirty).
start_state(dp:C16, dp:F34, dp:P4, dp:Dirty).
start_state(dp:C16, dp:F45, dp:P4, dp:Dirty).
start_state(dp:C16, dp:F51, dp:P1, dp:Dirty).
keep(dp:C0, dp:F12). keep(dp:C0, dp:F34). keep(dp:C0, dp:F45). keep(dp:C0, dp:F51).
keep(dp:C2, dp:F45). keep(dp:C2, dp:F51).
keep(dp:C4, dp:F12). keep(dp:C4, dp:F23). keep(dp:C4, dp:F34).
keep(dp:C6, dp:F45).
keep(dp:C8, dp:F51).
keep(dp:C10, dp:F12). keep(dp:C10, dp:F23). keep(dp:C10, dp:F34).
keep(dp:C12, dp:F45).
keep(dp:C14, dp:F51).
keep(dp:C16, dp:F12). keep(dp:C16, dp:F23). keep(dp:C16, dp:F34).

meal_handle(dp:P1, 1, dp:mP1_1). meal_handle(dp:P1, 2, dp:mP1_2). meal_handle(dp:P1, 3, dp:mP1_3).
meal_handle(dp:P2, 1, dp:mP2_1). meal_handle(dp:P2, 2, dp:mP2_2). meal_handle(dp:P2, 3, dp:mP2_3).
meal_handle(dp:P3, 1, dp:mP3_1). meal_handle(dp:P3, 2, dp:mP3_2). meal_handle(dp:P3, 3, dp:mP3_3).
meal_handle(dp:P4, 1, dp:mP4_1). meal_handle(dp:P4, 2, dp:mP4_2). meal_handle(dp:P4, 3, dp:mP4_3).
meal_handle(dp:P5, 1, dp:mP5_1). meal_handle(dp:P5, 2, dp:mP5_2). meal_handle(dp:P5, 3, dp:mP5_3).

request(C, P, Q, F) :-
  hungry(C, P), left_fork(P, F), start_state(C, F, Q, _Cleanliness), log:notEqualTo(Q, P).
request(C, P, Q, F) :-
  hungry(C, P), right_fork(P, F), start_state(C, F, Q, _Cleanliness), log:notEqualTo(Q, P).

send_fork(C, Q, P, F) :-
  request(C, P, Q, F), start_state(C, F, Q, dp:Dirty).

after_send_state(CS, F, P, dp:Clean) :-
  after_sends(C, CS), send_fork(C, _Q, P, F).
after_send_state(CS, F, H, Cleanliness) :-
  after_sends(C, CS), keep(C, F), start_state(C, F, H, Cleanliness).

meal(M, P, N, S) :-
  after_sends(C, CS), slot(C, S, N), hungry(C, P), meal_handle(P, N, M),
  left_fork(P, LF), right_fork(P, RF),
  after_send_state(CS, LF, P, _LeftCleanliness),
  after_send_state(CS, RF, P, _RightCleanliness).

triple(request(C, P, Q, F), dp:type, dp:Request) :- request(C, P, Q, F).
triple(request(C, P, Q, F), dp:in, C) :- request(C, P, Q, F).
triple(request(C, P, Q, F), dp:from, P) :- request(C, P, Q, F).
triple(request(C, P, Q, F), dp:to, Q) :- request(C, P, Q, F).
triple(request(C, P, Q, F), dp:fork, F) :- request(C, P, Q, F).

triple(send(C, Q, P, F), dp:type, dp:SendFork) :- send_fork(C, Q, P, F).
triple(send(C, Q, P, F), dp:in, C) :- send_fork(C, Q, P, F).
triple(send(C, Q, P, F), dp:from, Q) :- send_fork(C, Q, P, F).
triple(send(C, Q, P, F), dp:to, P) :- send_fork(C, Q, P, F).
triple(send(C, Q, P, F), dp:fork, F) :- send_fork(C, Q, P, F).

triple(M, dp:type, dp:Meal) :- meal(M, _P, _N, _S).
triple(M, dp:philosopher, P) :- meal(M, P, _N, _S).
triple(M, dp:mealNo, N) :- meal(M, _P, N, _S).
triple(M, dp:inSlot, S) :- meal(M, _P, _N, S).
triple(M, dp:usesFork, LF) :- meal(M, P, _N, _S), left_fork(P, LF).
triple(M, dp:usesFork, RF) :- meal(M, P, _N, _S), right_fork(P, RF).
