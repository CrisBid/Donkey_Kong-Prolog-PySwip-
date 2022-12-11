%main([0,0], [[4,0],[5,0],[1,2],[8,3],[1,4],[5,4]], [], [[3,0],[9,1],[6,2],[3,3]],[7,2], S).

%______________________Variaveis dinâmicos______________________%

:- dynamic pontuacao/1.

%______________________Fatos e Regras______________________%

%inicializa os predicados dinâmicos
inicializa :-
	asserta(pontuacao(0)).

% Decompor a lista
cons(X,Y,[X|Y]).

%Define uma meta
meta(X, Y) :- X = Y.

%Retira um elemento da lista e salva em outra
retirar_elemento(Elem,[Elem|Cauda],Cauda).
retirar_elemento(Elem,[Cabeca|Cauda],[Cabeca|Resultado]) :- retirar_elemento(Elem,Cauda,Resultado).

%Faz a intercessão entre duas listas e salva em outra
intersection([XI|YI],MI,[XI|ZI]) :- pertence(XI,MI), intersection(YI,MI,ZI).
intersection([XI|YI],MI,ZI) :- not(pertence(XI,MI)), intersection(YI,MI,ZI).
intersection([],MI,[]).

%Inverter uma lista e salva em outra
inverte([],[]).
inverte([E|C], Linv):- inverte(C,C_Inv), concatena(C_Inv,[E], Linv).

%Concatena duas listas e salva em outra
concatena([],L,L).
concatena([H|T],L2,[H|T2]) :- concatena(T,L2,T2).

% Verififcar se um elemento esta na lista
pertence(E, [E|_]).
pertence(E, [_|Cauda]):- pertence(E, Cauda).

%Calcula em quais pontos do mapa Mário pulou/quebrou um barril e soma os respectivos pontos a pontuação
calcular( _,[]).
calcular(Valor, [Cabeca|Cauda]) :-
	retract(pontuacao(Pontos)),
	PontuacaoFinal is (Pontos + Valor),
	asserta(pontuacao(PontuacaoFinal)),
	calcular(Valor, Cauda).

%______________________Gera as fases predefinidas______________________%

%chama a main com a predefinição da fase 1(Player, Barris, Escadas, Marreta, DonkeyKong, Princessa)
dados1(A,B,C,D,E,F,G):-
	CBarris = [[4,0],[5,0],[1,2],[8,3],[1,4],[5,4]],
	CParedes = [],
	CEscadas = [[3,0],[9,1],[6,2],[3,3]],
	CMarreta = [7,2],
	CDonkeyKong = [8,4],
	CPrincesa = [9,4],
	A = [0,0],
	B = CBarris,
	C = CParedes,
	D = CEscadas,
	E = CMarreta,
	F = CDonkeyKong,
	G = CPrincesa.
	
fase1(Inicio) :- 
	(Inicio >= 0,
	Inicio < 10,
	Inicio =\= 3,
	Inicio =\= 4,
	Inicio =\= 5 ->
	CBarris = [[4,0],[5,0],[1,2],[8,3],[1,4],[5,4]],
	CParedes = [],
	CEscadas = [[3,0],[9,1],[6,2],[3,3]],
	CMarreta = [7,2],
	CDonkeyKong = [8,4],
	CPrincesa = [9,4],
	main([Inicio,0], CBarris, CParedes, CEscadas, CMarreta, CDonkeyKong, CPrincesa, Solucao)).
	
%chama a main com a predefinição da fase 2(Player, Barris, Escadas, Marreta, DonkeyKong, Princessa)
dados2(A,B,C,D,E,F,G):-
	CBarris = [[6,1],[2,2],[4,2],[7,3],[5,4]],
    CParedes = [[6,0],[2,4]],
    CEscadas = [[3,0],[8,0],[0,1],[9,1],[6,2],[3,3]],
    CMarreta = [9,0],
    CDonkeyKong = [8,4],
    CPrincesa = [9,4],
	A = [0,0],
	B = CBarris,
	C = CParedes,
	D = CEscadas,
	E = CMarreta,
	F = CDonkeyKong,
	G = CPrincesa.

fase2(Inicio) :- 
	(Inicio >= 0,
    Inicio < 10,
    Inicio =\= 3,
    Inicio =\= 6,
    Inicio =\= 8 ->
    CBarris = [[6,1],[2,2],[4,2],[7,3],[5,4]],
    CParedes = [[6,0],[2,4]],
    CEscadas = [[3,0],[8,0],[0,1],[9,1],[6,2],[3,3]],
    CMarreta = [9,0],
    CDonkeyKong = [8,4],
    CPrincesa = [9,4],
	main([Inicio,0], CBarris, CParedes, CEscadas, CMarreta, CDonkeyKong, CPrincesa, Solucao)).
	
%chama a main com a predefinição da fase 3(Player, Barris, Escadas, Marreta, DonkeyKong, Princessa)
dados3(A,B,C,D,E,F,G):-
	CBarris = [[6,1],[5,2],[7,2],[6,3],[5,4]],
	CParedes = [[3,3],[6,4]],
	CEscadas = [[8,0],[2,1],[0,2],[9,2],[2,3],[7,3]],
	CMarreta = [0,4],
	CDonkeyKong = [8,4],
	CPrincesa = [9,4],
	A = [0,0],
	B = CBarris,
	C = CParedes,
	D = CEscadas,
	E = CMarreta,
	F = CDonkeyKong,
	G = CPrincesa.

fase3(Inicio) :- 
	(Inicio >= 0,
    Inicio < 10,
    Inicio =\= 8->
    CBarris = [[6,1],[5,2],[7,2],[6,3],[5,4]],
	CParedes = [[3,3],[6,4]],
	CEscadas = [[8,0],[2,1],[0,2],[9,2],[2,3],[7,3]],
	CMarreta = [0,4],
	CDonkeyKong = [8,4],
	CPrincesa = [9,4],
	main([Inicio,0], CBarris, CParedes, CEscadas, CMarreta, CDonkeyKong, CPrincesa, Solucao)).

%chama a main com a predefinição da fase 4(Player, Barris, Escadas, Marreta, DonkeyKong, Princessa)
dados4(A,B,C,D,E,F,G):-
	CBarris = [[3,1],[6,1],[3,3],[5,4]],
	CParedes = [[2,2],[6,4]],
	CEscadas = [[4,0],[8,1],[0,2],[9,2],[2,3],[4,3],[7,3]],
	CMarreta = [1,2],
	CDonkeyKong = [8,4],
	CPrincesa = [9,4],
	A = [0,0],
	B = CBarris,
	C = CParedes,
	D = CEscadas,
	E = CMarreta,
	F = CDonkeyKong,
	G = CPrincesa.

fase4(Inicio) :- 
	(Inicio >= 0,
	Inicio < 10,
	Inicio =\= 4->
	CBarris = [[3,1],[6,1],[3,3],[5,4]],
	CParedes = [[2,2],[6,4]],
	CEscadas = [[4,0],[8,1],[0,2],[9,2],[2,3],[4,3],[7,3]],
	CMarreta = [1,2],
	CDonkeyKong = [8,4],
	CPrincesa = [9,4],
	main([Inicio,0], CBarris, CParedes, CEscadas, CMarreta, CDonkeyKong, CPrincesa, Solucao)).
	

%______________________Funçoes de Movimentação______________________%

% Cima
% Somente onde há uma escada
s(
	[X,Y], 
	[X,Ynovo],
	ListaBarris, 
	ListaParedes,
	ListaEscadas
):- Y<4, Ynovo is Y + 1, 
	pertence(
		[X, Y], 
		ListaEscadas
	), 
	not(
		pertence(
			[X, Ynovo], 
			ListaParedes
		)
	).

% Baixo
% Somente se na posição abaixo há uma escada
s(
	[X,Y], 
	[X,Ynovo],
	ListaBarris, 
	ListaParedes,
	ListaEscadas
):- Y>0, Ynovo is Y - 1, 
pertence(
	[X, Ynovo], 
	ListaEscadas
), 
not(
	pertence(
		[X, Ynovo], 
		ListaParedes
	)
).

% Direita
% Dois casos:
%			1) Caso não haja parede nem barril, anda uma unidade
%			2) Caso haja um barril, anda duas unidades se não houver parede ou outro barril
s(
	[X,Y], 
	[Xnovo,Y],
	ListaBarris, 
	ListaParedes,
	ListaEscadas
):- X<9, 
Xnovo is X + 1, 
not(
	pertence(
		[Xnovo, Y], 
		ListaParedes
	)
), 
not(
	pertence(
		[Xnovo, Y], 
		ListaBarris
	)
).
s(
	[X,Y], 
	[Xnovo,Y],
	ListaBarris, 
	ListaParedes,
	ListaEscadas
):- X<8, 
Xnovo is X + 1, 
Xmid is X+1,
not(
	pertence(
		[Xnovo, Y], 
		ListaParedes
	)
), 
not(
	pertence(
		[Xnovo, Y], 
		ListaBarris
	)
), 
not(
	pertence(
		[Xnovo, Y], 
		ListaEscadas
	)
), 
pertence(
	[Xmid, Y], 
	ListaBarris
).

s(
	[X,Y], 
	[Xnovo,Y],
	ListaBarris, 
	ListaParedes,
	ListaEscadas
):- X<8, 
Xnovo is X + 1, 
Xmid is X+1,
not(
	pertence(
		[Xnovo, Y], 
		ListaParedes
	)
), 
not(
	pertence(
		[Xnovo , Y], 
		ListaEscadas
	)
), 
pertence(
	[Xnovo, Y], 
	ListaBarris
), 
pertence(
	[Xmid, Y], 
	ListaBarris
).

% Esquerda
% Dois casos:
%			1) Caso não haja parede nem barril, anda uma unidade
%			2) Caso haja um barril, anda duas unidades se não houver parede ou outro barril
s(
	[X,Y], 
	[Xnovo,Y],
	ListaBarris, 
	ListaParedes,
	ListaEscadas
):- X>0, 
Xnovo is X - 1,
not(
	pertence(
		[Xnovo, Y], 
		ListaParedes
	)
), 
not(
	pertence(
		[Xnovo, Y], 
		ListaBarris
	)
).
s(
	[X,Y], 
	[Xnovo,Y],
	ListaBarris, 
	ListaParedes,
	ListaEscadas
):- X>1, 
Xnovo is X - 1, 
Xmid is X-1,
not(
	pertence(
		[Xnovo, Y], 
		ListaParedes
	)
), 
not(
	pertence(
		[Xnovo, Y], 
		ListaBarris
	)
), 
not(
	pertence(
		[Xnovo, Y], 
		ListaEscadas
	)
), 
pertence(
	[Xmid, Y], 
	ListaBarris
).
s(
	[X,Y], 
	[Xnovo,Y],
	ListaBarris, 
	ListaParedes,
	ListaEscadas
):- X>1, 
Xnovo is X - 1, 
Xmid is X-1,
not(
	pertence(
		[Xnovo, Y], 
		ListaParedes
	)
), 
not(
	pertence(
		[Xnovo, Y], 
		ListaEscadas
	)
), 
pertence(
	[Xnovo, Y], 
	ListaBarris
),
pertence(
	[Xmid, Y], 
	ListaBarris
).

%______________________Funçao de Busca em Largura______________________%
estende([Estado|Caminho],ListaSucessores,ListaBarris, ListaParedes,ListaEscadas):- 
	bagof(
		[Sucessor,Estado|Caminho], 
		(s(Estado,Sucessor,ListaBarris,ListaParedes,ListaEscadas),not(pertence(Sucessor,[Estado|Caminho]))), 
		ListaSucessores
	),!.
estende( _ ,[], _, _, _). 

bl([[Estado|Caminho]|_],ListaBarris, ListaParedes,ListaEscadas,Objetivo, [Estado|Caminho]) :- 
	meta(Estado, Objetivo).
bl([Primeiro|Outros],ListaBarris, ListaParedes,ListaEscadas,Objetivo, Solucao) :-
	estende(Primeiro,Sucessores,ListaBarris, ListaParedes, ListaEscadas),
	concatena(Outros,Sucessores,NovaFronteira),
	bl(NovaFronteira,ListaBarris,ListaParedes,ListaEscadas,Objetivo, Solucao).

%______________________Funçao Main______________________%

solucao_bl(PosicaoInicial,ListaBarris,ListaParedes,ListaEscadas, Objetivo, Solucao) :- bl([[PosicaoInicial]],ListaBarris, ListaParedes,ListaEscadas,Objetivo, Solucao).

% Funcao principal - 
main(PosicaoInicial, ListaBarris, ListaParedes, ListaEscadas, PosicaoMartelo, PosicaoDonkeyKong, PosicaoPrincesa, S) :-
	inicializa,
	solucao_bl(PosicaoInicial,ListaBarris,ListaParedes,ListaEscadas, PosicaoMartelo, S2),
	inverte(S2, S2I),
	write('Achou a Marreta na posicao '),
	write(PosicaoMartelo),
	write(', coletado pelo seguinte caminho:'),
	write(S2I),
	write('.\n'),
	inverte(S2, CFinal),
	intersection(CFinal,ListaBarris,ListaBarrisPulados),
	write('Lista de barris pulados:'),
	write(ListaBarrisPulados),
	calcular(100,ListaBarrisPulados),
	write(' | Pontuacao atual: '),
	pontuacao(Pontuacao),
	write(Pontuacao),
	write('.\n'),
	cons(X, Y, S2),
	solucao_bl(X, ListaBarris,ListaParedes,ListaEscadas, PosicaoPrincesa, S3),
	inverte(S3, S3I),
	write('Apos pegar a marreta achou o Donkey Kong na posicao '),
	write(PosicaoDonkeyKong),
	write(', e alcancou a princesa pelo seguinte caminho:'),
	write(S3I),
	write('.\n'),
	inverte(S3, CFinal2),
	intersection(CFinal2,ListaBarris,ListaBarrisMartelados),
	write('Lista de barris martelados:'),
	write(ListaBarrisMartelados),
	calcular(500,ListaBarrisMartelados),
	write(' | Pontuacao atual: '),
	pontuacao(Pontuacao2),
	write(Pontuacao2),
	write('.\n'),
	retirar_elemento(PosicaoMartelo,S2,S2SM),
	concatena(S3, S2SM, S4),
	inverte(S4, S4I),
	write('Caminho completo percorrido para alcancar o objetico:'),
	write(S4I),
	write(' | Pontuacao final: '),
	pontuacao(Pontuacao3),
	write(Pontuacao3),
	write('.'),
	inverte(S4, S).
