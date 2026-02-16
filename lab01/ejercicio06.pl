/* Ejercicio 6 - Listas */

% miembro(+X, +Lista)
miembro(X, [X|_]).
miembro(X, [_|T]) :-
    miembro(X, T).

% longitud(+Lista, -N)
longitud([], 0).
longitud([_|T], N) :-
    longitud(T, N1),
    N is N1 + 1.

% concatena(+L1, +L2, -L3)
concatena([], L, L).
concatena([H|T], L2, [H|R]) :-
    concatena(T, L2, R).

% fibonacci (se usa en fibonacci_lista)
fibonacci(0, 0).
fibonacci(1, 1).
fibonacci(N, F) :-
    N > 1,
    N1 is N - 1,
    N2 is N - 2,
    fibonacci(N1, F1),
    fibonacci(N2, F2),
    F is F1 + F2.

% fibonacci_lista(+N, -Lista)
fibonacci_lista(0, []).
fibonacci_lista(1, [0]).
fibonacci_lista(N, L) :-
    N > 1,
    N1 is N - 1,
    fibonacci_lista(N1, L1),
    fibonacci(N1, F),
    append(L1, [F], L).

% reverso(+Lista, -Reverso)
reverso([], []).
reverso([H|T], R) :-
    reverso(T, RT),
    append(RT, [H], R).

% palindroma(+Lista)
% (en tu texto estaba mal, aqui queda correcto)
palindroma(L) :-
    reverso(L, R),
    L = R.

% consultas (ejemplos)
% ?- miembro(3, [1,2,3,4]).
% ?- longitud([a,b,c,d], N).
% ?- concatena([1,2], [3,4], L).
% ?- fibonacci_lista(7, L).
% ?- reverso([1,2,3,4], R).
% ?- palindroma([r,a,d,a,r]).
