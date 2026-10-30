cmp(=, X, X) :- !.
cmp(O, X, Y) :- rel(X, O, Y), !.
cmp(O, X, Y) :- rel(Y, O0, X), flip(O0, O).

flip(<, >).
flip(>, <).

values(Xs) :-
    findall(X, rel(X, _, _), Lefts),
    findall(X, rel(_, _, X), Rights),
    append(Lefts, Rights, All),
    sort(All, Xs).

main(N) :-
  Rels = [[4,<,3],
          [2,<,5],
          [3,>,1],
          [1,>,2],
          [1,<,5],
          [4,<,1],
          [3,>,2],
          [4,<,2],
          [3,>,5],
          [4,<,5]],

  forall(
    member([X, O, Y], Rels),
    assertz(rel(X, O, Y))
  ),

  values(Xs),
  predsort(cmp, Xs, Asc),
  reverse(Asc, Desc),
  atomic_list_concat(Desc, S),
  atom_number(S, N).
