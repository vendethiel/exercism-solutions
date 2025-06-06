maximum_value(Items, Capacity, Value) :-
    maximum_value(Items, [], Capacity, Value).

weight(item(Weight, _), Weight).
weights([], 0).
weights([X|Xs], Weight) :-
  weight(X, W),
  weights(Xs, Ws),
  Weight is W + Ws.

value(item(_, Value), Value).
values([], 0).
values([X|Xs], Value) :-
  value(X, V),
  values(Xs, Vs),
  Value is V + Vs.

maximum_value([], [], _, 0).
maximum_value(_, Cur, Capacity, Value) :-
  weights(Cur, W),
  W > Capacity,
  Value is 0.
maximum_value([], Cur, Capacity, Value) :-
  weights(Cur, W),
  W =< Capacity,
  values(Cur, Value).
maximum_value([X|Xs], Cur, Capacity, Value) :-
  weights(Cur, W),
  W =< Capacity,
  values(Cur, V1),
  maximum_value(Xs, [X|Cur], Capacity, V2),
  maximum_value(Xs, Cur, Capacity, V3),
  Value is max(V1, max(V2, V3)).
