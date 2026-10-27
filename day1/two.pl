find(P, Remainder) :-
  between(3, inf, K),
  K0 is K - 2,
  Area is K*K - (K0*K0),
  P =< Area,
  Remainder is Area - P, !.

main(Ps, Sum) :-
  maplist(find, Ps, Remainders),
  sum_list(Remainders, Sum).

