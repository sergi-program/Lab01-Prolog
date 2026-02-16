/* Ejercicio 1 - Hechos y consultas simples
Base de conocimiento de ciudades y vuelos directos
*/

% Hechos: relacion entre ciudades
ciudad(bogota).
ciudad(medellin).
ciudad(cali).
ciudad(cartagena).
ciudad(manizales).
ciudad(barranquilla).
ciudad(pasto).
ciudad(monteria).

% Hechos: vuelos directos
vuelo(bogota, medellin).
vuelo(medellin, cartagena).
vuelo(cali, bogota).
vuelo(bogota, cartagena).
vuelo(manizales, cartagena).
vuelo(medellin, barranquilla).
vuelo(pasto, bogota).
vuelo(bogota, pasto).

% Consultas (ejemplos)
% ?- vuelo(bogota, medellin).
% ?- vuelo(bogota, X).
% ?- vuelo(X, medellin).
% ?- vuelo(X, cali).
