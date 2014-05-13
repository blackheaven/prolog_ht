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


aller(X, X).
aller(X, Y) :- traverse(X, Z), aller(Z, Y).

main :-
    aller(office, vestibule),
    print('On peut aller de l\'office au vestibule'), nl.
