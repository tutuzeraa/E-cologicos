import mysql.connector
from flask import Flask, make_response, jsonify, request
# from datetime import datetime


mydb = mysql.connector.connect( 
    host='localhost',
    user='root',
    password='',
    database='e-cologicos'
)

app = Flask('e-cologicos')
app.config['JSON_SORT_KEYS'] = False
 
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


app.run()