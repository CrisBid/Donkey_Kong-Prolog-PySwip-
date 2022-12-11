from pyswip import *
from tkinter import *
import numpy as np 

prolog = Prolog()
prolog.consult("Prolog/base.pl")

lista = np.zeros((10,10),dtype=np.int64)

def fase1():
    A = "X"

    for valor in prolog.query("dados1("+ A +",B,C,D,E,F,G)"):
        print(valor["X"],"\n", valor["B"],"\n", valor["C"],"\n",valor["D"],"\n", valor["E"],"\n", valor["F"],"\n",valor["G"],"\n")

    for i in range(0,5):
        for j in range(0,10):
            lista[i][j] = 0

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
    #print(valor1)

    valor2 = bool(prolog.query("fase1(0)"))
    print(valor2)

    Game(lista,valor1,valor2)


def fase2():
    A = "X"

    for valor in prolog.query("dados2("+ A +",B,C,D,E,F,G)"):
        print(valor["X"],"\n", valor["B"],"\n", valor["C"],"\n",valor["D"],"\n", valor["E"],"\n", valor["F"],"\n",valor["G"],"\n")

    for i in range(0,5):
        for j in range(0,10):
            lista[i][j] = 0


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
    #print(valor1)

    valor2 = bool(prolog.query("fase2(0)"))
    print(valor2)

    Game(lista,valor1,valor2)


def fase3():
    A = "X"

    for valor in prolog.query("dados3("+ A +",B,C,D,E,F,G)"):
        print(valor["X"],"\n", valor["B"],"\n", valor["C"],"\n",valor["D"],"\n", valor["E"],"\n", valor["F"],"\n",valor["G"],"\n")

    for i in range(0,5):
        for j in range(0,10):
            lista[i][j] = 0


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
    #print(valor1)

    valor2 = bool(prolog.query("fase3(0)"))
    print(valor2)

    Game(lista,valor1,valor2)

def fase4():
    A = "X"
   
    for valor in prolog.query("dados4("+ A +",B,C,D,E,F,G)"):
        print(valor["X"],"\n", valor["B"],"\n", valor["C"],"\n",valor["D"],"\n", valor["E"],"\n", valor["F"],"\n",valor["G"],"\n")

    for i in range(0,5):
        for j in range(0,10):
            lista[i][j] = 0


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
    #print(valor1)

    valor2 = bool(prolog.query("fase4(0)"))
    print(valor2)

    Game(lista,valor1,valor2)

def FaseCustom(Inicio,Barris,Paredes,Escadas,Marreta,DonkeyKong,Princesa):
   
    SolucaoFinal = str(prolog.query("main("+ Inicio +", "+ Barris +", "+ Paredes +", "+ Escadas +", "+ Marreta +", "+ DonkeyKong +", "+ Princesa +", Solucao)"))
    print(SolucaoFinal)

    SolucaoFinal = bool(prolog.query("main("+ Inicio +", "+ Barris +", "+ Paredes +", "+ Escadas +", "+ Marreta +", "+ DonkeyKong +", "+ Princesa +", Solucao)"))
    print(SolucaoFinal)

    def Convert(string): 
        string = string.replace('[', '')
        string = string.replace(']', '')
        li = list(string.split(","))
        n = (len(li)//2)
        if n > 1:
            splited = []
            len_l = len(li)
            for i in range(n):
                start = int(i*len_l/n)
                end = int((i+1)*len_l/n)
                splited.append(li[start:end])
            return splited
        return li

    print(Convert(Inicio),Convert(Barris),Convert(Paredes),Convert(Escadas),Convert(Marreta),Convert(DonkeyKong),Convert(Princesa))

    for i in range(0,5):
        for j in range(0,10):
            lista[i][j] = 0

    for ElenNum in list(Convert(Barris)):
        if ElenNum != '':
            lista[int(ElenNum[1])][int(ElenNum[0])] = 1

    for ElenNum in list(Convert(Paredes)):
        if ElenNum != '':
            lista[int(ElenNum[1])][int(ElenNum[0])] = 3

    for ElenNum in list(Convert(Escadas)):
        if ElenNum != '':
            lista[int(ElenNum[1])][int(ElenNum[0])] = 4

    ElenNum = Convert(Marreta)
    lista[int(ElenNum[1])][int(ElenNum[0])] = 5

    ElenNum = Convert(Inicio)
    lista[int(ElenNum[1])][int(ElenNum[0])] = 10

    ElenNum = Convert(DonkeyKong)
    lista[int(ElenNum[1])][int(ElenNum[0])] = 15

    ElenNum = Convert(Princesa)
    lista[int(ElenNum[1])][int(ElenNum[0])] = 20

    valor1 = list(prolog.query("main("+ Inicio +", "+ Barris +", "+ Paredes +", "+ Escadas +", "+ Marreta +", "+ DonkeyKong +", "+ Princesa +", Solucao)"))
    print(valor1)

    valor2 = bool(prolog.query("main("+ Inicio +", "+ Barris +", "+ Paredes +", "+ Escadas +", "+ Marreta +", "+ DonkeyKong +", "+ Princesa +", Solucao)"))
    print(valor2)

    Game(lista,valor1,valor2)

def FasePersonalizada():

    InicioText = Label(personalizada, text="Posicao de Inicio" )
    InicioText.grid(column=0,row=0,pady=5)
    Inicioinput = Entry(personalizada, width = 20) 
    Inicioinput.grid(column=1,row=0, pady=5,padx=20)
    BarrisText = Label(personalizada, text="Posicao dos Barris" )
    BarrisText.grid(column=0,row=1)
    Barrisinput = Entry(personalizada, width = 20) 
    Barrisinput.grid(column=1,row=1, pady=5)
    ParedesText = Label(personalizada, text="Posicao das Paredes" )
    ParedesText.grid(column=0,row=2)
    Paredesinput = Entry(personalizada, width = 20) 
    Paredesinput.grid(column=1,row=2, pady=5)
    EscadasText = Label(personalizada, text="Posicao das Escadas" )
    EscadasText.grid(column=0,row=3)
    Escadasinput = Entry(personalizada, width = 20) 
    Escadasinput.grid(column=1,row=3, pady=5)
    MarretaText = Label(personalizada, text="Posicao das Marreta" )
    MarretaText.grid(column=0,row=4)
    Marretainput = Entry(personalizada, width = 20) 
    Marretainput.grid(column=1,row=4, pady=5)
    DonkeyKongText = Label(personalizada, text="Posicao das DonkeyKong" )
    DonkeyKongText.grid(column=0,row=5)
    DonkeyKonginput = Entry(personalizada, width = 20) 
    DonkeyKonginput.grid(column=1,row=5, pady=5)
    PrincesaText = Label(personalizada, text="Posicao das Princesa" )
    PrincesaText.grid(column=0,row=6)
    Princesainput = Entry(personalizada, width = 20) 
    Princesainput.grid(column=1,row=6, pady=5)

    def JogoCustom():
        Inicio = (Inicioinput.get())
        Barris = (Barrisinput.get())
        Paredes = (Paredesinput.get())
        Escadas = (Escadasinput.get())
        Marreta = (Marretainput.get())
        DonkeyKong = (DonkeyKonginput.get())
        Princesa = ( Princesainput.get())
        FaseCustom(Inicio,Barris,Paredes,Escadas,Marreta,DonkeyKong,Princesa)

    FaseC = Button ( personalizada, text= "Rodar", command=JogoCustom )
    FaseC.grid(column=1,row=7, pady= 5)


def Game(matriz,res1,res2):

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
    if res2 == True:
        RepostaB = 'True'
    else:
        RepostaB = 'False'

    Resposta = Label(personalizada, text="Foi Possivel Resolver o Mapa: " )
    Resposta.grid(column=0,row=0)
    Resposta2 = Label(personalizada, text=RepostaB )
    Resposta2.grid(column=1,row=0)

    for i in range(0,5):
        for j in range(0,10):
            matriz[i][j] = 0
    

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

personalizada = Frame(janela, background="#449")
personalizada.pack(padx=40, pady=20)

jogo = Frame(janela, background="#111")
jogo.pack(padx=40, pady=40)

Resposta = Label(personalizada, text="DonkeyKong" )
Resposta.grid(column=0,row=0)

Fase1 = Button ( jogo, text= "Fase1", command=fase1 )
Fase1.grid(column=1,row=1, padx= 30)
Fase2 = Button ( jogo, text= "Fase2", command=fase2 )
Fase2.grid(column=2,row=1, padx= 30)
Fase3 = Button ( jogo, text= "Fase3", command=fase3 )
Fase3.grid(column=3,row=1, padx= 30)
Fase4 = Button ( jogo, text= "Fase4", command=fase4 )
Fase4.grid(column=4,row=1, padx= 30)
FaseP = Button ( jogo, text= "Custom", command=FasePersonalizada )
FaseP.grid(column=5,row=1, padx= 30)

        
janela.mainloop()