append([], A, A).
append([H|T], B, [H|C]) :-
    append(T, B, C).
