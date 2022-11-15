import math
from datetime import date
from datetime import datetime

def p01(resposta):  #1. Realiza separação do lixo entre orgânico e reciclável?
    if resposta == "Sim": return 0.21
    else: return 0.41

def p02(resposta):  #2. Faz reciclagem?
    if resposta == "Sim": return 0
    else: return 0.3
    
def p03(resposta):  #3. Separa o lixo por tipo? (Papel, vidro, metal, etc) 
    if resposta == "Sim": return 0
    else: return 0.3

def p04(resposta):  #4. Quantos minutos por dia você usa transporte público?
    return math.floor((int(resposta))/ 5)*0.03


def p05(resposta):  #5. Você tem um carro?
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

def p06(resposta):  #6. Realiza alguma coleta de água de chuva? Se sim, quantos litros?
        if resposta == "Sim": return 0
        else: return 0.2

def p07(resposta):  #7. Realiza algum tipo de reaproveitamento da água? 
        if resposta == "Sim": return 0
        else: return 0.2

def p08(resposta):  #8. Qual o consumo médio de água em um dia? (litros)
    return int(resposta)*0.02

def p09(resposta):  #9. Toma quantos banhos por dia?
    quantidade = int(resposta)
    return quantidade*0.12

def p10(resposta):  #10. Qual a duração do banho?
    return math.floor((int(resposta)/5))*0.3

def p11(resposta):  #11. Quantas vezes por dia você escova os dentes, faz a barba ou lava as mãos?
    return int(resposta)*0.05

def p12(resposta):  #12. Você deixa a torneira aberta durante o processo acima?
        if resposta == "Sim": return 0.03
        else: return 0

def p13(resposta):  #13. Quantas cargas de roupa você lava em média por semana?
    return int(resposta)*0.7

def p14(resposta):  #14. Qual o consumo de energia em KW/h?
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

def p16(resposta):  #16. A casa usa energia renovável?
    if resposta == "00":  #sim
        return 0
    elif resposta == "01": #Sim, produção própria
        return 0
    elif resposta == "02": #não
        return 0.13
    elif resposta == "03": #Não sei
        return 0.13


def p17(resposta):  #17. Consome produtos de uma empresa EcoFriendly ? 
    if resposta == "Sim": return 0
    else: return 0.31

'''
//Esta função gerencia as perguntas para outras funcões calcularesm os indices
//Retonar a soma (pontuação)
'''
def calculo(dic):
    pontuacao = 0
    j = 1
    for i in dic:    
        if j <= 9: pontuacao += globals()["p0%d"% j](dic[i])
        else: pontuacao += globals()["p%d"% j](dic[i])
        j += 1
    return pontuacao

'''
//Esta função calcula a idade
'''
def idade(data):
    hoje = date.today()
    return int(hoje.year) - data.year - ((hoje.month, hoje.day) <  (data.month, data.day)) 
