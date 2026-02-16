/* Ejercicio 5 - 4 color problem
Se busca colorear un mapa con 4 colores, donde regiones adyacentes no pueden tener el mismo color.

Tu solucion define adjacent/2 como "dos colores distintos", y map/5 pone las restricciones.
*/

% colores
color(red).
color(blue).
color(yellow).
color(green).

% adjacent(+Color1, +Color2)
% valido si son colores distintos
adjacent(X, Y) :-
    color(X),
    color(Y),
    X \= Y.

% Mapa (5 regiones A, B, C, D, E)
map(A, B, C, D, E) :-
    adjacent(A, B), adjacent(A, D), adjacent(A, E),
    adjacent(B, C), adjacent(B, D), adjacent(B, E),
    adjacent(C, D), adjacent(C, E),
    adjacent(D, E).

% consulta (ejemplo)
% ?- map(A, B, C, D, E).
