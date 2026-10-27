find(P, Result) :-
  between(0, inf, K),
  Area is K * K,
  P =< Area,
  Result is Area - P, !.

main(Ps, Sum) :-
  maplist(find, Ps, Results),
  sum_list(Results, Sum).
