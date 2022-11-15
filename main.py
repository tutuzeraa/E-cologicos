from re import X
from contas import *
from contextlib import redirect_stderr
from flask import Flask, render_template, redirect, request
from datetime import date

dic_resp2 = {}


app = Flask(__name__)
app.config['SECRET_KEY'] = 'TESTE'  #n lembro o que era


@app.route('/')  #quando entra sem rota 
def home():
    return render_template('formulario.html') #pagina inicial


@app.route('/formulario', methods = ['GET' , 'POST'])
def formulario():  #criar a f com o mesmo nome da rota ajuda
    nome = request.form.get('nome')
    data_nasc = request.form.get('data_nasc')
    data = request.form.get('data')
    id = request.form.get('id')


    idade = cal_idade(datetime.strptime(data_nasc, '%Y-%m-%d').date())

    for i in range (1,17):
        if i <= 9:
            dic_resp2["resposta"+str(i)] = request.form.get('p0'+str(i))
        else:
            dic_resp2["resposta"+str(i)] = request.form.get('p'+str(i))


    print("SOMA INDICE: " , calculo(dic_resp2))  

    return redirect('/')#retorna acesso
    #return render_template()#retorna acesso

if __name__ in "__main__":
    #app.run(debug=True,port=6543)
    app.run(debug=True,port=6543)
