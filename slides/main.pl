relie(bureau, bibliotheque).
relie(bibliotheque, reserve).
relie(bibliotheque, vestiaire).
relie(vestiaire, vestibule).
relie(vestibule, salon).
relie(salleAManger, salon).
relie(salleAManger, cuisine).
relie(office, cuisine).
relie(office, reserve).

traverse(X, Y) :- relie(X, Y).
traverse(X, Y) :- relie(Y, X).

aller(_, _, M, _) :- M < 0, !, fail.
aller(X, X, _, 0).
aller(X, Y, M, N) :- L is M - 1, aller(X, Z, L, D), traverse(Z, Y), N is D+1.

position(0, baronne, salon).
position(0, servante, salon).
position(0, militaire, salon).
position(0, majordome, salon).
position(0, docteur, salon).
position(1, baronne, salon).
position(1, servante, salleAManger).
position(1, militaire, salon).
position(1, majordome, salleAManger).
position(1, docteur, salon).
position(2, baronne, salon).
position(2, servante, cuisine).
position(2, militaire, salon).
position(2, majordome, cuisine).
position(3, baronne, salleAManger).
position(3, servante, office).
position(3, militaire, salleAManger).
position(3, majordome, office).
position(4, baronne, cuisine).
position(4, servante, cuisine).
position(5, baronne, salleAManger).
position(5, militaire, salleAManger).
position(6, baronne, salleAManger).
position(6, servante, salleAManger).
position(6, militaire, salleAManger).
position(7, baronne, salleAManger).
position(7, militaire, salleAManger).
position(8, baronne, salleAManger).
position(8, servante, salleAManger).
position(8, militaire, salleAManger).
position(9, baronne, salleAManger).
position(9, servante, salleAManger).
position(9, militaire, salleAManger).
position(9, majordome, salleAManger).
position(9, docteur, salleAManger).

comettre_meutre(S) :-
    bagof((T, P), position(T, S, P), O),
    diff(O, R),
    comettre(R, non_armé).

diff([], []).
diff([_], []).
diff([(T1, P1),(T2, P2)|XS], [(D, P1, P2)|YS]) :-
    D is T2 - T1,
    diff([(T2, P2)|XS], YS).

comettre([(T, D, A)|XS], non_armé) :-
    aller(D, cuisine, T, Ta),
    Tr is T - Ta,
    comettre([(Tr, cuisine, A)|XS], armé).

comettre([(T, D, A)|XS], non_armé) :-
    aller(D, cuisine, T, Ta),
    Tr is T - Ta,
    aller(cuisine, A, Tr, _),
    comettre([XS], armé).

comettre([(T, D, A)|_], armé) :-
    aller(D, bibliotheque, T, Tc),
    Tr is T - Tc,
    aller(bibliotheque, A, Tr, _).

comettre([_|XS], A) :- !, comettre(XS, A).
