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

    # mycursor.execute('SELECT idHistorico FROM Historico ORDER BY idHistorico DESC LIMIT 1')
    # idHistorico = mycursor.fetchall()[0][0]

    # # insere na tabela Agua
    # campos = [idHistorico, pontuacaoGeral].extend([dic_resp2[i] for i in ['p08','p06', 'p07']])
    # mycursor.execute('INSERT INTO Agua (idHistorico, valorIndice, consumoDeAgua, coletaAguaDaChuva, fazReusoDeAgua) VALUES (%s,%s,%s,%s,%s)', campos)
    # mydb.commit()

    # # insere na tabela Alimentacao
    # campos = [idHistorico, pontuacaoGeral].extend([dic_resp2[i] for i in []])
    # mycursor.execute('INSERT INTO Agua (idHistorico, valorIndice, consumoDeAgua, coletaAguaDaChuva, fazReusoDeAgua) VALUES (%s,%s,%s,%s,%s)', campos)
    # mydb.commit()

    # # insere na tabela Energia
    # campos = [idHistorico, pontuacaoGeral].extend([dic_resp2[i] for i in []])
    # mycursor.execute('INSERT INTO Agua (idHistorico, valorIndice, consumoDeAgua, coletaAguaDaChuva, fazReusoDeAgua) VALUES (%s,%s,%s,%s,%s)', campos)
    # mydb.commit()

    # # insere na tabela Reciclagem
    # campos = [idHistorico, pontuacaoGeral].extend([dic_resp2[i] for i in []])
    # mycursor.execute('INSERT INTO Agua (idHistorico, valorIndice, consumoDeAgua, coletaAguaDaChuva, fazReusoDeAgua) VALUES (%s,%s,%s,%s,%s)', campos)
    # mydb.commit()

    # # insere na tabela Transporte
    # campos = [idHistorico, pontuacaoGeral].extend([dic_resp2[i] for i in []])
    # mycursor.execute('INSERT INTO Agua (idHistorico, valorIndice, consumoDeAgua, coletaAguaDaChuva, fazReusoDeAgua) VALUES (%s,%s,%s,%s,%s)', campos)
    # mydb.commit()

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
            message = 'Histórico do usuário: ',
            data = historico
        )
    )

app.run(debug=True)
