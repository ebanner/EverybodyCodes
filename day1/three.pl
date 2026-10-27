area(K, Area) :-
  Area is K*K - 1.

find(P, Remainder) :-
  between(3, inf, K),
  K mod 2 =:= 1,
  area(K, Area),
  P =< Area,
  Remainder is Area - P, !.

main(Ps, Sum) :-
  maplist(find, Ps, Remainders),
  sum_list(Remainders, Sum).
