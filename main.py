import mysql.connector
from contas import *
from flask import Flask, make_response, jsonify, request, render_template, redirect
# from datetime import datetime

dic_resp2 = {}

mydb = mysql.connector.connect(
    host='localhost',
    user='root',
    password='123',
    database=''
)

app = Flask('e-cologicos')
app.config['JSON_SORT_KEYS'] = False
 
@app.route('/')  #quando entra sem rota 
def home():
    return render_template('formulario.html') #pagina inicial


@app.route('/formulario', methods = ['GET' , 'POST'])
def formulario():  #criar a f com o mesmo nome da rota ajuda
    nome = request.form.get('nome')
    data = request.form.get('data')

    for i in range (1,17):
        if i <= 9:
            dic_resp2["resposta"+str(i)] = request.form.get('p0'+str(i))
        else:
            dic_resp2["resposta"+str(i)] = request.form.get('p'+str(i))


    print("SOMA INDICE: " , calculo(dic_resp2))  

    return redirect('/')#retorna acesso

@app.route('/usuarios', methods=['GET'])
def get_usuarios():
    mycursor = mydb.cursor()
    mycursor.execute('SELECT * FROM Usuario')

    usuarios_nao_tratado = mycursor.fetchall()

    usuarios = list()
    for usuario in usuarios_nao_tratado:
        usuarios.append(
            {
            'id': usuario[0],
            'nome': usuario[1],
            'idade': usuario[2]
            }
        )

    return make_response(
        jsonify(
            message = 'Lista de Usuários: ',
            data = usuarios
        )
    )


@app.route('/usuarios', methods=['POST'])
def insert_usuario():

    usuario = request.json

    mycursor = mydb.cursor()
    sql = f"INSERT INTO Usuario (nome, idade) VALUES('{usuario['nome']}','{usuario['idade']}')"
    mycursor.execute(sql)
    mydb.commit()

    return make_response(
        jsonify(
            message = 'Usuário cadastrado com sucesso.',
            usuario = usuario
        )
    )

@app.route('/historico', methods=['GET'])
def get_historico():
    id_usuario = request.args.get('id')
    mycursor = mydb.cursor()
    mycursor.execute('SELECT * FROM Historico WHERE idUsuario=%s', id_usuario)

    raw_historico = mycursor.fetchall()

    historico = list()
    for h in raw_historico:
        historico.append(
            {
            'pontuacaoGeral': h[1],
            'dataColeta': h[2],
            'idUsuario': h[3]
            }
        )

    return make_response(
        jsonify(
            message = 'Histórico do usuário: ',
            data = historico
        )
    )

app.run()
