isogram(Phrase) :-
    string_codes(Phrase, Codes),
    isogram(Codes, []).

isogram([], _).
isogram([X|Xs], D) :-
    \+ lc(X, _),
    !,
    isogram(Xs, D).
isogram([X|Xs], D) :-
    lc(X, L),
    !,
    \+ member(L, D),
    isogram(Xs, [L|D]).

lc(C, L) :-
    C >= 65,
    C =< 90,
    L is C + 32.
lc(C, C) :-
    C >= 97,
    C =< 122.