flip(<, >).
flip(>, <).

cmp(=, X, X) :- !.
cmp(O, X, Y) :- rel(X, O, Y), !.
cmp(O, X, Y) :- rel(Y, O0, X), flip(O0, O).

values(Xs) :-
    findall(X, rel(X, _, _), Lefts),
    findall(X, rel(_, _, X), Rights),
    append(Lefts, Rights, All),
    sort(All, Xs).

triplet(Tok, [A, Op, B]) :-
    string_chars(Tok, [CA, Op, CB]),
    atom_number(CA, A),
    atom_number(CB, B).

triplets(Line, Ts) :-
    split_string(Line, " ", "", Toks),
    maplist(triplet, Toks, Ts).

main_(Line, N) :-
  triplets(Line, Rels),

  forall(
    member([X, O, Y], Rels),
    assertz(rel(X, O, Y))
  ),

  values(Xs),
  predsort(cmp, Xs, Asc),
  reverse(Asc, Desc),
  atomic_list_concat(Desc, S),
  atom_number(S, N),

  retractall(rel(_, _, _)).

main(Lines, Sum) :-
    maplist(main_, Lines, Ns),
    sum_list(Ns, Sum).
