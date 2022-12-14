import mysql.connector
from contas import *
from flask import Flask, make_response, jsonify, request, render_template, redirect


dic_resp2 = {}

mydb = mysql.connector.connect( 
    host='localhost',
    user='root',
    password='',
    database='e-cologicos'
)

app = Flask('e-cologicos')
app.config['JSON_SORT_KEYS'] = False
 
@app.route('/')  #quando entra sem rota 
def home():
    return render_template('formulario.html') #pagina inicial


@app.route('/formulario', methods = ['POST'])
def formulario():  #criar a f com o mesmo nome da rota ajuda
    # insere na tabela Usuario
    nome = request.form.get('nome')
    data_nasc = request.form.get('data_nasc')
    idade = calculaIdade(datetime.strptime(data_nasc, '%Y-%m-%d').date())
    id = request.form.get('id')
    
    mycursor = mydb.cursor()
    if id == "":
        mycursor.execute('INSERT INTO Usuario (nome, idade) VALUES (%s, %s)', [nome, idade])
        mydb.commit()

    # preenche respostas no dicionario
    for i in range (1,17):
        if i <= 9:
            dic_resp2["resposta"+str(i)] = request.form.get('p0'+str(i))
        else:
            dic_resp2["resposta"+str(i)] = request.form.get('p'+str(i))

    # insere na tabela Historico
    pontuacaoGeral = calculo(dic_resp2)
    dataColeta = request.form.get('data')
    if id == "":
        mycursor.execute('SELECT id FROM Usuario ORDER BY id DESC LIMIT 1')
        idUsuario = mycursor.fetchall()[0][0]
    else:
        idUsuario = id
    mycursor.execute('INSERT INTO Historico (pontuacaoGeral, dataColeta, idUsuario) VALUES (%s, %s, %s)', [pontuacaoGeral, dataColeta, idUsuario])
    mydb.commit()

    #return redirect('/')#retorna acesso
    return render_template('historico.html',  nome = nome, id = idUsuario , pontuacaoGeral=round(pontuacaoGeral,2)  )

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
            message = 'Lista de Usu??rios: ',
            data = usuarios
        )
    )

@app.route('/historico', methods=['GET'])
def get_historico():
    id_usuario = request.args.get('id')
    mycursor = mydb.cursor()
    mycursor.execute('SELECT * FROM Historico WHERE idUsuario=%s', [id_usuario])

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
            message = 'Hist??rico do usu??rio: ',
            data = historico
        )
    )

app.run(debug=True)
