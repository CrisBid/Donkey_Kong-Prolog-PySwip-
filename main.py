from pyswip import *
from tkinter import *
import numpy as np 

prolog = Prolog()
prolog.consult("Prolog/base.pl")

lista = np.zeros((10,10),dtype=np.int64)

Game = False

def fase1():
    

    A = "X"

    for valor in prolog.query("dados1("+ A +",B,C,D,E,F,G)"):
        print(valor["X"],"\n", valor["B"],"\n", valor["C"],"\n",valor["D"],"\n", valor["E"],"\n", valor["F"],"\n",valor["G"],"\n")


    for ElenNum in valor["B"]:
        lista[ElenNum[1]][ElenNum[0]] = 1

    for ElenNum in valor["C"]:
        lista[ElenNum[1]][ElenNum[0]] = 3

    for ElenNum in valor["D"]:
        lista[ElenNum[1]][ElenNum[0]] = 4

    ElenNum = valor["E"]
    lista[ElenNum[1]][ElenNum[0]] = 5

    ElenNum = valor["X"]
    lista[ElenNum[1]][ElenNum[0]] = 10

    ElenNum = valor["F"]
    lista[ElenNum[1]][ElenNum[0]] = 15

    ElenNum = valor["G"]
    lista[ElenNum[1]][ElenNum[0]] = 20

    valor1 = list(prolog.query("fase1(0)"))
    print(valor1)

    valor1 = bool(prolog.query("fase1(0)"))
    print(valor1)

    Game(lista)


def fase2():

    A = "X"

    for valor in prolog.query("dados2("+ A +",B,C,D,E,F,G)"):
        print(valor["X"],"\n", valor["B"],"\n", valor["C"],"\n",valor["D"],"\n", valor["E"],"\n", valor["F"],"\n",valor["G"],"\n")


    for ElenNum in valor["B"]:
        lista[ElenNum[1]][ElenNum[0]] = 1

    for ElenNum in valor["C"]:
        lista[ElenNum[1]][ElenNum[0]] = 3

    for ElenNum in valor["D"]:
        lista[ElenNum[1]][ElenNum[0]] = 4

    ElenNum = valor["E"]
    lista[ElenNum[1]][ElenNum[0]] = 5

    ElenNum = valor["X"]
    lista[ElenNum[1]][ElenNum[0]] = 10

    ElenNum = valor["F"]
    lista[ElenNum[1]][ElenNum[0]] = 15

    ElenNum = valor["G"]
    lista[ElenNum[1]][ElenNum[0]] = 20

    valor1 = list(prolog.query("fase2(0)"))
    print(valor1)

    valor1 = bool(prolog.query("fase2(0)"))
    print(valor1)

    Game(lista)


def fase3():

    A = "X"

    for valor in prolog.query("dados3("+ A +",B,C,D,E,F,G)"):
        print(valor["X"],"\n", valor["B"],"\n", valor["C"],"\n",valor["D"],"\n", valor["E"],"\n", valor["F"],"\n",valor["G"],"\n")


    for ElenNum in valor["B"]:
        lista[ElenNum[1]][ElenNum[0]] = 1

    for ElenNum in valor["C"]:
        lista[ElenNum[1]][ElenNum[0]] = 3

    for ElenNum in valor["D"]:
        lista[ElenNum[1]][ElenNum[0]] = 4

    ElenNum = valor["E"]
    lista[ElenNum[1]][ElenNum[0]] = 5

    ElenNum = valor["X"]
    lista[ElenNum[1]][ElenNum[0]] = 10

    ElenNum = valor["F"]
    lista[ElenNum[1]][ElenNum[0]] = 15

    ElenNum = valor["G"]
    lista[ElenNum[1]][ElenNum[0]] = 20

    valor1 = list(prolog.query("fase3(0)"))
    print(valor1)

    valor1 = bool(prolog.query("fase3(0)"))
    print(valor1)

    Game(lista)

def fase4():

    A = "X"

    for valor in prolog.query("dados4("+ A +",B,C,D,E,F,G)"):
        print(valor["X"],"\n", valor["B"],"\n", valor["C"],"\n",valor["D"],"\n", valor["E"],"\n", valor["F"],"\n",valor["G"],"\n")


    for ElenNum in valor["B"]:
        lista[ElenNum[1]][ElenNum[0]] = 1

    for ElenNum in valor["C"]:
        lista[ElenNum[1]][ElenNum[0]] = 3

    for ElenNum in valor["D"]:
        lista[ElenNum[1]][ElenNum[0]] = 4

    ElenNum = valor["E"]
    lista[ElenNum[1]][ElenNum[0]] = 5

    ElenNum = valor["X"]
    lista[ElenNum[1]][ElenNum[0]] = 10

    ElenNum = valor["F"]
    lista[ElenNum[1]][ElenNum[0]] = 15

    ElenNum = valor["G"]
    lista[ElenNum[1]][ElenNum[0]] = 20

    valor1 = list(prolog.query("fase4(0)"))
    print(valor1)

    valor1 = bool(prolog.query("fase4(0)"))
    print(valor1)

    Game(lista)

def Game(matriz):

    k = 4

    for i in range(0,5):
        for j in range(0,10):
            if matriz[k][j] == 1:
                texto_resposta = Label(jogo, image=barril )
                texto_resposta.grid(column=j,row=i)
            elif matriz[k][j] == 3:
                texto_resposta = Label(jogo, image=parede )
                texto_resposta.grid(column=j,row=i)
            elif matriz[k][j] == 4:
                texto_resposta = Label(jogo, image=escada )
                texto_resposta.grid(column=j,row=i)
            elif matriz[k][j] == 5:
                texto_resposta = Label(jogo, image=marreta )
                texto_resposta.grid(column=j,row=i)
            elif matriz[k][j] == 10:
                texto_resposta = Label(jogo, image=mario )
                texto_resposta.grid(column=j,row=i)
            elif matriz[k][j] == 15:
                texto_resposta = Label(jogo, image=donkeykong )
                texto_resposta.grid(column=j,row=i)
            elif matriz[k][j] == 20:
                texto_resposta = Label(jogo, image=princesa )
                texto_resposta.grid(column=j,row=i)
            else:
                texto_resposta = Label(jogo, image=imagevazia )
                texto_resposta.grid(column=j,row=i)
        k -= 1
    

janela = Tk()
janela.title("Donkey Kong")
janela.configure(background="#111")

imagevazia = PhotoImage(file="Imagens/Preto.png")
barril = PhotoImage(file="Imagens/BarrilF.png")
parede = PhotoImage(file="Imagens/ParedeF.png")
marreta = PhotoImage(file="Imagens/MarretaF.png")
escada = PhotoImage(file="Imagens/EscadaF.png")

mario = PhotoImage(file="Imagens/MarioF.png")
donkeykong = PhotoImage(file="Imagens/KongF.png")
princesa = PhotoImage(file="Imagens/PrincesaF.png")

jogo = Frame(janela, background="red")
jogo.pack(padx=40, pady=40)

Fase1 = Button ( jogo, text= "Fase1", command=fase1 )
Fase1.grid(column=1,row=1)
Fase2 = Button ( jogo, text= "Fase2", command=fase2 )
Fase2.grid(column=2,row=1)
Fase3 = Button ( jogo, text= "Fase3", command=fase3 )
Fase3.grid(column=3,row=1)
Fase4 = Button ( jogo, text= "Fase4", command=fase4 )
Fase4.grid(column=4,row=1)

        
janela.mainloop()