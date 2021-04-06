take([H|T], H, T).
take([H|T], R, [H|S]) :-
    take(T, R, S).

perm([], []).
perm(L, [R|S]) :-
    take(L, R, T),
    perm(T, S).
