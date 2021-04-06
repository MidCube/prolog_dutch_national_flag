:- [perm].
:- [append].

dutch_national_flag(In, Out) :-
    singleScan(In,[],[],[],Out),
    check(Out).

singleScan([],R,W,B,Out):-
    append(W,B,T),
    append(R,T,Out).

singleScan([H|T],Reds,Whites,Blues,Out):-
    H=red,
    singleScan(T,[H|Reds],Whites,Blues,Out).
singleScan([H|T],Reds,Whites,Blues,Out):-
    H=white,
    singleScan(T,Reds,[H|Whites],Blues,Out).
singleScan([H|T],Reds,Whites,Blues,Out):-
    H=blue,
    singleScan(T,Reds,Whites,[H|Blues],Out).



check([]).
check([H|T]):- checkRed([H|T]).
checkRed([]).
checkRed([H|T]):- H=red,
    checkRed(T).
checkRed([H|T]):-H=white,
    checkWhite(T).
checkRed([H|T]):-H=blue,
    checkBlue(T).
checkWhite([]).
checkWhite([H|T]):-H=white,
    checkWhite(T).
checkWhite([H|T]):-H=blue,
    checkBlue(T).
checkBlue([]).
checkBlue([H|T]):-H=blue,
    checkBlue(T).


:- dutch_national_flag([red, white, blue, white, red], R),
   format('[red,white,blue,white,red] -> ~w~n', [R]).
