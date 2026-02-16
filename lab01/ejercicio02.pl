/* Ejercicio 2 - Reglas basicas
Se definen reglas a partir de vuelos (escala, viaje, destinos)
y otra base con mascotas (perros, gatos, aves) con sus duenos.
*/

% base de conocimiento de vuelos
vuelo(bogota, medellin).
vuelo(medellin, cartagena).
vuelo(cali, bogota).
vuelo(bogota, cartagena).
vuelo(manizales, cartagena).
vuelo(medellin, barranquilla).
vuelo(pasto, bogota).
vuelo(bogota, pasto).

% conectadas(+X, +Y)
% verdadero si hay una escala: X -> M -> Y
conectadas(X, Y) :-
    vuelo(X, M),
    vuelo(M, Y),
    X \= Y.

% conectadas_desde_cali(+X, -Y)
% en tu solucion era basicamente la misma idea, pero con nombre fijo de cali
conectadas_desde_cali(X, Y) :-
    vuelo(X, M),
    vuelo(M, Y).

% viaje(+X, +Y)
% vuelo directo o con una escala (sin recursion)
viaje(X, Y) :-
    (vuelo(X, M), vuelo(M, Y))
    ;
    vuelo(X, Y).

% destinos(+X, -Y)
% destinos directos desde una ciudad
destinos(X, Y) :-
    vuelo(X, Y).

% consultas (ejemplos)
% ?- conectadas(bogota, barranquilla).
% ?- conectadas_desde_cali(cali, X).
% ?- viaje(bogota, pasto).
% ?- destinos(bogota, X).


% base de conocimiento de mascotas
perro(firulais).
perro(bruno).
perro(max).
gato(misu).
gato(luna).
gato(chanel).
gato(orion).
ave(piolin).

dueno(ana, firulais).
dueno(ana, misu).
dueno(luis, luna).
dueno(luis, orion).
dueno(luis, firulais).
dueno(maria, piolin).
dueno(julia, chanel).
dueno(pedro, bruno).

% tiene_perro(+Persona)
tiene_perro(Persona) :-
    dueno(Persona, M),
    perro(M).

% tiene_perro(+Persona, -Perro)
tiene_perro(Persona, P) :-
    dueno(Persona, P),
    perro(P).

% tiene_gato(+Persona)
tiene_gato(Persona) :-
    dueno(Persona, M),
    gato(M).

% tiene_multiples_mascotas(+Persona)
tiene_multiples_mascotas(Persona) :-
    dueno(Persona, M1),
    dueno(Persona, M2),
    M1 \= M2.

% amante_animales(+Persona)
% verdadero si tiene al menos un perro y al menos un gato
amante_animales(Persona) :-
    dueno(Persona, M1),
    perro(M1),
    dueno(Persona, M2),
    gato(M2).

% mascota_compartida(+P1, +P2)
mascota_compartida(P1, P2) :-
    dueno(P1, M),
    dueno(P2, M),
    P1 \= P2.

% tipo_mascota(+Persona, -Tipo)
tipo_mascota(Persona, perro) :- dueno(Persona, M), perro(M).
tipo_mascota(Persona, gato)  :- dueno(Persona, M), gato(M).
tipo_mascota(Persona, ave)   :- dueno(Persona, M), ave(M).

% consultas (ejemplos)
% ?- tiene_perro(pedro).
% ?- tiene_perro(X, P).
% ?- tiene_gato(X).
% ?- tiene_multiples_mascotas(X).
% ?- amante_animales(maria).
% ?- mascota_compartida(ana, luis).
% ?- tipo_mascota(luis, T).
