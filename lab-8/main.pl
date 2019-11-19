member(X,[X|_]).
member(X,[Y|Z]) :-
    member(X,Z).

subset([], _).
subset([X1|Y1], A) :-
    member(X1, A),
    subset(Y1, A).

update(X,[],[[X,1]]).
update(X,[[X,Y]|Tail], [[X,Z]|Tail]) :-
    Z is Y+1.
update(X, [Head|Tail], [Head|UpdatedTail]) :-
    update(X, Tail, UpdatedTail).

enumerate(L, X) :-
    enumerate(L, [], X).
enumerate([], X, X).
enumerate([X|XS], Dict, EnumeratedDict) :-
    update(X, Dict, UpdatedDict),
    enumerate(XS, UpdatedDict, EnumeratedDict).