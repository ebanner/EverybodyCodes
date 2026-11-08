rel(2,<,5).
rel(3,>,1).
rel(1,>,2).
rel(1,<,5).
rel(4,<,1).
rel(3,>,2).
rel(4,<,2).
rel(3,>,5).
rel(4,<,5).

lt(X, Y) :- rel(X,<,Y).
lt(X, Y) :- rel(Y,>,X).

cmp(=, X, X) :- !.
cmp(<, X, Y) :- lt(X, Y), !.
cmp(<, X, Y) :- lt(X, Z), lt(Z, Y), !.
cmp(>, X, Y) :- cmp(<, Y, X).

