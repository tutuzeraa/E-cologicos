from contextlib import redirect_stderr
from flask import Flask, render_template, redirect, request
import calculo

lista_resp = [] 
dic_resp2 = {}
def Teste(x, y, z):
    print("RESULTADO DA MINHA FUNÇÂO TESTE: ",x+y+z)


app = Flask(__name__)
app.config['SECRET_KEY'] = 'TESTE'  #n lembro o que era


@app.route('/')  #quando entra sem rota 
def home():
    return render_template('formulario.html') #pagina inicial


@app.route('/formulario', methods = ['GET' , 'POST'])
def formulario():  #criar a f com o mesmo nome da rota ajuda
    nome = request.form.get('nome')
    data = request.form.get('data')

    resp01 = request.form.get('p01')
    resp02 = request.form.get('p02')
    resp03 = request.form.get('p03')
    resp04 = request.form.get('p04')
    resp05 = request.form.get('p05') ## 00=nenhum, 07 nao sei
    resp06 = request.form.get('p06')
    resp07 = request.form.get('p07')
    resp08 = request.form.get('p08')
    resp09 = request.form.get('p09')
    resp10 = request.form.get('p10')
    resp11 = request.form.get('p11')
    resp12 = request.form.get('p12')
    resp13 = request.form.get('p13')
    resp14 = request.form.get('p14')
    resp15 = request.form.get('p15')
    resp16 = request.form.get('p16')
    resp17 = request.form.get('p17')

    for i in range (1,17):
        dic_resp2["resposta"+str(i)] = request.form.get('p0'+str(i))

 
    #testando as veriaveis
    print("Nome:", nome, "\nData:", data, "\n1.",  resp01, "\n2.",  resp02, "\n3.",  resp03, "\n4.",  resp04, "\n5.",  resp05, "\n6.",  resp06, "\n7.",  resp07, "\n8.",  resp08, "\n9.",  resp09, "\n10.",  resp10, "\n11.",  resp11, "\n12.",  resp12, "\n13.",  resp13, "\n14.",  resp14, "\n15.",  resp15, "\n16.",  resp16, "\n17.",  resp17)
    print("data : ",type(data))
    print("TIpo4 : ",type(resp04))
    print("TIpo7 : ",type(resp07))
    #print("tipos")
    #print("nome: ", type(nome), " senha: ", type(senha), "resp01: ",  type(resp01), "resp02: ",  type(resp02) )

    #testando funções
    Teste(int(resp04), 0 ,0) 

    print(dic_resp2)
    print("---", type(dic_resp2))
    print("resposta pergunta 1: " , dic_resp2['resposta1'])
    return redirect('/')#retorna acesso
    #return render_template()#retorna acesso

if __name__ in "__main__":
    #app.run(debug=True,port=6543)
    app.run(debug=True,port=6543)
