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

main :-
    aller(office, vestibule),
    print('On peut aller de l\'office au vestibule'), nl.
