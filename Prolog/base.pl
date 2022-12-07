%main([0,0], [[4,0],[5,0],[1,2],[8,3],[1,4],[5,4]], [], [[3,0],[9,1],[6,2],[3,3]],[7,2], S).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Predicados dinâmicos			%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

:- dynamic pontuacao/1.
:- dynamic ultimapos/1.

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%		Fatos e Regras					%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%pega o primeiro elemento de uma lista
pegaPrimeiro([Cabeca|_], Cabeca).

%calcula os pontos dos corações adiquiridos
calcular(Andar) :-
	Andar1 is (Andar + 1),
	Pts is (Andar1 * 100),
	retract(pontuacao(Pontos)),
	PontuacaoFinal is (Pontos + Pts),
	asserta(pontuacao(PontuacaoFinal)).

%inicializa os predicados dinâmicos
inicializa :-
	asserta(pontuacao(0)),
	asserta(ultimapos([])).

%recolhe os corações e calcula e imprime a pontuação(recursiva)
coleta_coracoes([], _, _, _, _).
coleta_coracoes([Cabeca|Cauda], PosicaoInicial, ListaEscadas, ListaParedes, DonkeyKong) :-
	Objetivo = Cabeca,
	solucao_bl(PosicaoInicial,ListaBarris,ListaParedes,ListaEscadas, PosicaoMartelo, CaminhoObjetivo),
	pegaPrimeiro(CaminhoObjetivo, I),
	pegaPrimeiro(Cabeca, Andar),
	calcular(Andar),
	write('Pulou um barril'),
	write(I),
	write(' No seguinte caminho:'),
	inverte(CaminhoObjetivo, CaminhoCorreto),
	writeln(CaminhoCorreto),
	write('Pontuacao atual: '),
	pontuacao(Pontuacao),
	writeln(Pontuacao),
	retract(ultimapos(L)),
	pegaPrimeiro(CaminhoObjetivo, U),
	asserta(ultimapos(U)),
	coleta_coracoes(Cauda, I, ListaEscadas, ListaParedes, DonkeyKong).

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%	Criar fases 1,2,3,4				    %
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%chama a main com a predefinição da fase 1(Player, Barris, Escadas, Marreta)
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
	main([Inicio,0], CBarris, CParedes, CEscadas,CMarreta, Solucao)).
	
%chama a main com a predefinição da fase 2(Player, Barris, Escadas, Marreta)
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
	main([Inicio,0], CBarris, CParedes, CEscadas,CMarreta, Solucao)).
	
%chama a main com a predefinição da fase 3(Player, Barris, Escadas, Marreta)
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
	main([Inicio,0], CBarris, CParedes, CEscadas,CMarreta, Solucao)).

%chama a main com a predefinição da fase 4(Player, Barris, Escadas, Marreta)
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
	main([Inicio,0], CBarris, CParedes, CEscadas,CMarreta, Solucao)).
	

% ====================================================== FUNCOES DE MOVIMENTOS =================================================================
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
):- X<9, Xnovo is X + 1, 
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
):- X<8, Xnovo is X + 2, 
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
Xnovo is X - 2, 
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
% ====================================================== FUNCOES DE MOVIMENTOS =================================================================



% ============================================== FUNCOES BASICAS DE MANIPULAÇÃO DE LISTA ======================================================
% Decompor a lista
cons(X,Y,[X|Y]).

% Inverter lista
inverte([],[]).
inverte([E|C], Linv):- inverte(C,C_Inv), concatena(C_Inv,[E], Linv).

% Concatena duas listas
concatena([],L,L).
concatena([H|T],L2,[H|T2]) :- concatena(T,L2,T2).

meta(X, Y) :- X = Y.

% Verififcar se um elemento esta na lista
pertence(E, [E|_]).
pertence(E, [_|Cauda]):- pertence(E, Cauda).

% Retira um elemento da lista
retirar_elemento(Elem,[Elem|Cauda],Cauda).
retirar_elemento(Elem,[Cabeca|Cauda],[Cabeca|Resultado]) :- retirar_elemento(Elem,Cauda,Resultado).
% ============================================== FUNCOES BASICAS DE MANIPULAÇÃO DE LISTA ======================================================


% ==================================================== BUSCA LARGURA ======================================================
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
% ==================================================== BUSCA LARGURA ======================================================


solucao_bl(PosicaoInicial,ListaBarris,ListaParedes,ListaEscadas, Objetivo, Solucao) :- bl([[PosicaoInicial]],ListaBarris, ListaParedes,ListaEscadas,Objetivo, Solucao).


% Funcao principal - 
% Paremetros: posição inicial da busca
%             lista de barris 
%			  lista de paredes
%             lista de escadas
%             posicao do martelo para matar o donkey kong
%             variavel para receber o caminho percorrido

% A Princesa Peach e o Donkey Kong se encontram no último andar e última coluna em todos os casos de teste
main(PosicaoInicial, ListaBarris, ListaParedes, ListaEscadas, PosicaoMartelo, S) :-
	inicializa,
	coleta_coracoes(ListaBarris, PosicaoInicial, ListaEscadas, ListaParedes, [9, 4]),
	solucao_bl(PosicaoInicial,ListaBarris,ListaParedes,ListaEscadas, PosicaoMartelo, S2),
	inverte(S2, S2I),
	write('Achou a Marreta na posição '),
	write(PosicaoMartelo),
	write(', Coletado pelo seguinte caminho:'),
	writeln(S2I),
	cons(X, Y, S2),
	solucao_bl(X, ListaBarris,ListaParedes,ListaEscadas, [9, 4], S3),
	inverte(S3, S3I),
	write('Apos pegar a marreta achou o Donkey Kong na posição '),
	write([9, 4]),
	write(', pelo seguinte caminho:'),
	writeln(S3I),
	retirar_elemento(PosicaoMartelo,S2,S2SM),
	concatena(S3, S2SM, S4),
	inverte(S4, S4I),
	write('Caminho completo percorrido para alcançar o objetico:'),
	writeln(S4I),
	inverte(S4, S).
