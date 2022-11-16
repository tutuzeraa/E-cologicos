# E-cologicos

## Sobre o Projeto

Desenvolvemos uma API e um formulário, em que um usuário pode responder algumas perguntas sobre seus
hábitos e comportamentos relacionados à emissão de carbono, e calculamos um *score* de sustentabilidade
com base em suas respostas.


Com a API, é possível calcular um *score* relacionado a pegada de carbono de um indivíduo. Esse resultado
e suas respostas ao formulário ficam armazenadas em um Banco de Dados, sendo possível visualizar também o
histórico de pontuações de um usuário, permitindo avaliar sua evolução (ou não) no que tange sua prática
sustentável.
 
## Como usar
 
### Configurando o ambiente
 
Execute os seguintes comando no Powershell ou no terminal:
 
```
git clone https://github.com/tutuzeraa/E-cologicos.git
cd E-cologicos
python -m venv venv
./venv/Scripts/activate   # Se estiver utilizando Windows
source venv/bin/activate  # Se estiver utilizando Linux
pip install -r requirements.txt
```
 
### Conectando-se ao Banco de Dados
 
Utilizamos o MySQL como sistema gerenciador de Banco de Dados. Para utilizar a API, é necessário
ter MySQL instalado e configurado na sua máquina.
 
No diretório "db", está o script "createDatabase.sql" para criação do banco e inserção de alguns valores nas
tabelas. Execute esse script.
 
No arquivo "main.py" est'a setado da seguinte forma a conexão ao Banco de Dados:
```
mydb = mysql.connector.connect(
   host='localhost',
   user='root',
   password='',
   database='e-cologicos'
)
```
Pode ser necessário alterar algum desses parâmetros para conseguir se conectar a database. Caso possua senha,
ou se estiver utilizando outro user ou host, coloque o valor correto nos parâmetros e salve o arquivo.
 
### Executando
 
Com o ambiente configurado e conectado ao Banco de Dados, basta executar o seguinte comando no terminal:
 
```
python3 main.py
```
 
Agora o servidor deve estar funcionando, localmente, em http://127.0.0.1:5000 ! 
