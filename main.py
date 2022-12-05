from pyswip import *
from tkinter import *
import numpy as np 


matriz = np.zeros((5,10),dtype=np.int64)


prolog = Prolog()
prolog.consult("Prolog/mapa1.pl")

lista = np.zeros((5,10),dtype=np.int64)

X = "X"

for valor in prolog.query("barril("+ X +",Y)"):
    print(valor["Y"],valor["X"])
    lista[valor["Y"]][valor["X"]] = 1

for valor in prolog.query("escada("+ X +",Y)"):
    print(valor["Y"],valor["X"])
    lista[valor["Y"]][valor["X"]] = 4

for valor in prolog.query("marreta("+ X +",Y)"):
    print(valor["Y"],valor["X"])
    lista[valor["Y"]][valor["X"]] = 5

for valor in prolog.query("player("+ X +",Y)"):
    print(valor["Y"],valor["X"])
    lista[valor["Y"]][valor["X"]] = 10

for valor in prolog.query("donkeyKong("+ X +",Y)"):
    print(valor["Y"],valor["X"])
    lista[valor["Y"]][valor["X"]] = 15

for valor in prolog.query("princesa("+ X +",Y)"):
    print(valor["Y"],valor["X"])
    lista[valor["Y"]][valor["X"]] = 20



#for i in range(0,5):
    #for j in range(0,10):
        #lista[i][j] = 0
        #lista.append(i)
    #lista.append("\n")

matriz = lista
print(lista)
    

janela = Tk()
janela.title("Donkey Kong")
janela.configure(background="#111")

imagevazia = PhotoImage(file="Imagens/Preto.png")
barril = PhotoImage(file="Imagens/BarrilF.png")
marreta = PhotoImage(file="Imagens/MarretaF.png")
escada = PhotoImage(file="Imagens/EscadaF.png")

mario = PhotoImage(file="Imagens/MarioF.png")
donkeykong = PhotoImage(file="Imagens/KongF.png")
princesa = PhotoImage(file="Imagens/PrincesaF.png")

jogo = Frame(janela, background="red")
jogo.pack(padx=40, pady=40)

for i in range(0,5):
    for j in range(0,10):
        if matriz[i][j] == 1:
            texto_resposta = Label(jogo, image=barril )
            texto_resposta.grid(column=j,row=i)
        elif matriz[i][j] == 4:
            texto_resposta = Label(jogo, image=escada )
            texto_resposta.grid(column=j,row=i)
        elif matriz[i][j] == 5:
            texto_resposta = Label(jogo, image=marreta )
            texto_resposta.grid(column=j,row=i)
        elif matriz[i][j] == 10:
            texto_resposta = Label(jogo, image=mario )
            texto_resposta.grid(column=j,row=i)
        elif matriz[i][j] == 15:
            texto_resposta = Label(jogo, image=donkeykong )
            texto_resposta.grid(column=j,row=i)
        elif matriz[i][j] == 20:
            texto_resposta = Label(jogo, image=princesa )
            texto_resposta.grid(column=j,row=i)
        else:
            texto_resposta = Label(jogo, image=imagevazia )
            texto_resposta.grid(column=j,row=i)

janela.mainloop()