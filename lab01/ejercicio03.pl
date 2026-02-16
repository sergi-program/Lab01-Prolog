/* Ejercicio 3 - Predicados con condiciones aritmeticas */

nota(ana, 4.5).
nota(luis, 2.8).
nota(maria, 3.7).
nota(juan, 5.0).
nota(pedro, 2.3).

% reprueba(+Estudiante)
reprueba(X) :-
    nota(X, N),
    N < 3.0.

% aprueba(+Estudiante)
% (en tu texto estaba mal escrito, aqui queda correcto)
aprueba(X) :-
    nota(X, N),
    N >= 3.0.

% rango(+Estudiante, +Min, +Max)
% (en tu texto estaba mal escrito, aqui queda correcto)
rango(X, Min, Max) :-
    nota(X, N),
    N >= Min,
    N =< Max.

% clasificacion(+Estudiante, -Categoria)
clasificacion(X, reprobado) :- nota(X, N), N >= 0.0, N =< 2.9.
clasificacion(X, aprobado)  :- nota(X, N), N >= 3.0, N =< 3.9.
clasificacion(X, notable)   :- nota(X, N), N >= 4.0, N =< 4.4.
clasificacion(X, excelente) :- nota(X, N), N >= 4.5, N =< 5.0.

% distancia(+P1, +P2, -D)
distancia((X1, Y1), (X2, Y2), D) :-
    DX is X2 - X1,
    DY is Y2 - Y1,
    D is sqrt(DX*DX + DY*DY).

% distancia_total(+ListaPuntos, -Total)
distancia_total([], 0).
distancia_total([_], 0).
distancia_total([P1, P2 | Resto], Total) :-
    distancia(P1, P2, D),
    distancia_total([P2 | Resto], TR),
    Total is D + TR.

% consultas (ejemplos)
% ?- reprueba(X).
% ?- aprueba(X).
% ?- rango(X, 3.0, 3.9).
% ?- clasificacion(X, C).
% ?- distancia((0,0), (3,4), D).
% ?- distancia_total([(0,0),(3,4),(6,4)], T).
