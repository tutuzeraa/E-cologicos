import math

def p01(resposta):
    if resposta == "Sim":
        return 0.21
    else:
        return 0


def p02(resposta): # 2. Faz reciclagem?

    if resposta == "Sim":
        return 0
    else:
        return 0.3


def p03(resposta): #3. Separa o lixo por tipo? (Papel, vidro, metal, etc) 
    if resposta == "Sim":
        return 0
    else:
        return 0.3

def p04(resposta): 
    minutos = int(resposta)
    return math.floor((minutos/ 5)*0.03)


def p05(resposta): 
        if resposta == "00":  #Nenhum
            return 0
        elif resposta == "01":
            return 1.68
        elif resposta == "02":
            return 1.74
        elif resposta == "03":
            return 1.17
        elif resposta == "04": #híbrido
            return 1.15
        elif resposta == "05": #Híbrido elétrico
            return 0.7
        elif resposta == "06": #Elétrico
            return 0
        elif resposta == "07": #Não sei
            return 1.71

def p06(resposta): 
        if resposta == "Sim":
            return 0
        else:
            return 0.2

def p07(resposta):   #7. Realiza algum tipo de reaproveitamento da água? 
        if resposta == "Sim":
            return 0
        else:
            return 0.3

def p08(resposta): #8. Qual o consumo médio de água em um dia? (litros)
    litros = int(resposta)
    return litros*0.02

def p09(resposta):  #9. Toma quantos banhos por dia?
    quantidade = int(resposta)
    return quantidade*0.12

def p10(resposta): #10. Qual a duração do banho?
    return math.floor((int(resposta)/5) *0.3)

def p11(resposta):  #11. Quantas vezes por dia você escova os dentes, faz a barba ou lava as mãos?
    quantidade = int(resposta)

    return quantidade*0.05


def p12(resposta):  #12. Você deixa a torneira aberta durante o processo acima?
        if resposta == "Sim":
            return 0.03
        else:
            return 0

def p13(resposta): #Quantas cargas de roupa você lava em média por semana?
    return int(resposta)*0.7

def p14(resposta):  #Qual o consumo de energia em KW/h?
    return math.floor((int(resposta)/50))

def p15(resposta):  #15. Qual sua alimentação? 
    if resposta == "00":  #Como de tudo
        return 3.42
    elif resposta == "01": #Um dia sem carne na semana
        return 3.22
    elif resposta == "02": #Tento não comer carne vermelha
        return 3.17
    elif resposta == "03": #Não como carne vermelha
        return 1.81
    elif resposta == "04": #Só como peixe de carne
        return 1.05 
    elif resposta == "05": #Vegetariano
        return 2.01
    elif resposta == "06": #Vegano
        return 0.38

def p16(resposta):  #A casa usa energia renovável?
    if resposta == "00":  #sim
        return 0
    elif resposta == "01": #Sim, produção própria
        return 0
    elif resposta == "02": #não
        return 0.13
    elif resposta == "03": #Não sei
        return 0;13


def p17(resposta):  #17.    Consome produtos de uma empresa EcoFriendly ? 
    if resposta == "Sim":
        return 0
    else:
        return 0.31


def calculo(dic):
    pontuacao = 0

    for i in dic:
        #print("[",i,"]: ", dic[i])
        if(i == 'resposta1'):
            pontuacao += p01(dic[i])
        if(i == 'resposta2'):
            pontuacao += p02(dic[i])
        if(i == 'resposta3'):
            pontuacao += p03(dic[i])
        if(i == 'resposta4'):
            pontuacao += p04(dic[i])
        if(i == 'resposta5'):
            pontuacao += p05(dic[i])
        if(i == 'resposta6'):
            pontuacao += p06(dic[i])
        if(i == 'resposta7'):
            pontuacao += p07(dic[i])
        if(i == 'resposta8'):
            pontuacao += p08(dic[i])
        if(i == 'resposta9'):
            pontuacao += p09(dic[i])
        if(i == 'resposta10'):
            pontuacao += p10(dic[i])
        if(i == 'resposta11'):
            pontuacao += p11(dic[i])
        if(i == 'resposta12'):
            pontuacao += p12(dic[i])
        if(i == 'resposta13'):
            pontuacao += p13(dic[i])
        if(i == 'resposta14'):
            pontuacao += p14(dic[i])
        if(i == 'resposta15'):
            pontuacao += p15(dic[i])
        if(i == 'resposta16'):
            pontuacao += p16(dic[i])
        if(i == 'resposta17'):
            pontuacao += p17(dic[i])

    return pontuacao
    

def teste():
    print('chamou')