find(P, Result) :-
  between(3, inf, K),
  K0 is K - 2,
  P =< K*K - (K0*K0),
  Result is K*K - (K0*K0) - P, !.

main(Ps, Sum) :-
  maplist(find, Ps, Results),
  sum_list(Results, Sum).

