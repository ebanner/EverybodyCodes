rel(4,<,3).
rel(2,<,5).
rel(3,>,1).
rel(1,>,2).
rel(1,<,5).
rel(4,<,1).
rel(3,>,2).
rel(4,<,2).
rel(3,>,5).
rel(4,<,5).

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
  values(Xs),
  predsort(cmp, Xs, Asc),
  reverse(Asc, Desc),
  atomic_list_concat(Desc, S),
  atom_number(S, N).
