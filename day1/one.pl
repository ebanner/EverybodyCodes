find(P, Result) :-
  between(0, inf, K),
  P =< K*K,
  Result is K*K - P, !.

main(Ps, Sum) :-
  maplist(find, Ps, Results),
  sum_list(Results, Sum).

