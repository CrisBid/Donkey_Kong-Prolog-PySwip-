
mapa(X).

mapaElementos(X,[]).

limitMapaH(Y).
limitMapaW(X).

barril(X,Y).
parede(X,Y).
escada(X,Y).

player(X,Y).

kong(X,Y).

princesa(X,Y).

%Funcoes%

dentroLimiteW(X) :- X < limitMapaW(X).
dentroLimiteH(Y) :- Y < limitMapaW(Y).

pertence(Elem,[Elem|_ ]).
pertence(Elem,[ _| Cauda]) :- pertence(Elem,Cauda).

