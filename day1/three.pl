find(P, Remainder) :-
  between(3, inf, K),
  K mod 2 =:= 1,
  Area is K*K - 1,
  P =< Area,
  Remainder is Area - P, !.

main(Ps, Sum) :-
  maplist(find, Ps, Remainders),
  sum_list(Remainders, Sum).

