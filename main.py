import mysql.connector
from contas import *
from flask import Flask, make_response, jsonify, request, render_template, redirect

# from datetime import datetime

dic_resp2 = {}

mydb = mysql.connector.connect(
    host='localhost',
    user='root',
    password='',
    database='e-cologicos'
)

app = Flask('e-cologicos')
app.config['JSON_SORT_KEYS'] = False


@app.route('/')  # quando entra sem rota 
def home():
    return render_template('formulario.html')  # pagina inicial


@app.route('/formulario', methods=['GET', 'POST'])
def formulario():  # criar a f com o mesmo nome da rota ajuda
    nome = request.form.get('nome')
    idade = request.form.get('idade')  # perguntar idade do user
    data = request.form.get('data')

    mycursor = mydb.cursor()
    mycursor.execute('INSERT INTO Usuario (nome, idade) VALUES (%s, %s)', [nome, 7])
    mydb.commit()

    for i in range(1, 17):
        if i <= 9:
            dic_resp2["resposta" + str(i)] = request.form.get('p0' + str(i))
        else:
            dic_resp2["resposta" + str(i)] = request.form.get('p' + str(i))

    print("SOMA INDICE: ", 1)  # consertar função calculo, ta dando erro 

    return redirect('/')  # retorna acesso


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
            message='Lista de Usuários: ',
            data=usuarios
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
