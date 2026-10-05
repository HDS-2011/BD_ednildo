/*Exercício Prático 01 – Preparando os Ambientes
Contexto Empresarial
Uma empresa de desenvolvimento recebeu quatro novos projetos:
• clínica veterinária; 
• oficina mecânica; 
• escola de idiomas; 
• loja de materiais de construção. 
As equipes responsáveis já iniciaram o levantamento e a modelagem. Agora será necessário preparar os 
ambientes onde futuramente esses projetos serão implementados.
Tarefa
Prepare um banco de dados independente para cada projeto:
➢ dbVeterinaria
➢ dbOficina
➢ dbEscolaIdiomas
➢ dbMateriais
Depois, verifique no servidor se os quatro ambientes foram realmente criados.
Deixe o projeto da oficina preparado para receber os próximos comandos.
Regras obrigatórias
O script deverá possuir um comentário identificando a atividade.
Todas as operações deverão ser realizadas por SQL. */

CREATE DATABASE dbVeterinaria;
CREATE DATABASE dbOficina;
CREATE DATABASE dbEscolaIdiomas;
CREATE DATABASE dbMateriais;
USE dbOficina;
SHOW databases;

/* Exercício Prático 02 – Um Novo Projeto
Contexto Empresarial
A empresa recebeu um quinto cliente.
Uma academia necessita de um sistema para controlar alunos, planos e matrículas.
A equipe de modelagem iniciou o projeto e solicitou a preparação do ambiente físico.
Tarefa
Prepare um banco chamado:
➢ dbAcademia
Confirme sua criação juntamente com os bancos anteriores.
Deixe esse novo ambiente preparado para utilização.
Regra obrigatória
Tente resolver a atividade lembrando dos comandos utilizados anteriormente antes de consultar exercícios 
anteriores. */

CREATE DATABASE dbAcademia;
SHOW databases;
USE dbAcademia;

/* Exercício Prático 03 – Lendo o Projeto da Oficina
Contexto Empresarial
A equipe de projeto entregou a primeira relação do modelo lógico da oficina.
Projeto recebido — VEICULO
Atributo Definição no projeto
id_veiculo Identificador
placa Até 10 caracteres, obrigatório e único
modelo Até 100 caracteres, obrigatório
ano Ano de fabricação
valor_estimado Valor monetário com duas casas decimais
ativo Situação do veículo, inicialmente ativo
Tarefa
Transforme essa parte do projeto em uma estrutura física dentro do banco destinado à oficina.
Escolha os tipos de dados e as restrições adequadas.
Depois:
• confira as tabelas existentes; 
• confira a estrutura que foi criada. 
Regra obrigatória
Implemente o que foi definido no projeto. Não acrescente atributos que não tenham sido solicitados. */

USE dboficina;
CREATE TABLE VEICULO (
id_veiculo INT PRIMARY KEY,
placa VARCHAR(10) NOT NULL UNIQUE,
modelo VARCHAR(100) NOT NULL,
ano YEAR,
valor_estimado DECIMAL (10,2),
ativo BOOLEAN DEFAULT TRUE
);

SHOW tables;
DESCRIBE VEICULO;

/* Exercício Prático 04 – Projeto x Implementação
Contexto Empresarial
A equipe de modelagem deseja verificar se o projeto foi corretamente implementado.
O modelo aprovado determina:
➢ id_veiculo identifica cada veículo; 
➢ placa é obrigatória e não pode se repetir; 
➢ modelo é obrigatório; 
➢ ano representa um ano; 
➢ valor_estimado aceita casas decimais; 
➢ ativo possui valor inicial definido pelo projeto. 
Tarefa
Consulte a estrutura física criada.
Compare-a com o projeto aprovado.
Caso encontre alguma diferença, faça as alterações necessárias.
Regras obrigatórias
Não exclua a tabela para criá-la novamente.
Antes de qualquer alteração, consulte sua estrutura atual. */

DESCRIBE VEICULO;
-- A estrutura física condiz com o modelo.

/* Exercício Prático 05 – Mudança nas Regras de Negócio
Contexto Empresarial
Durante uma nova reunião, a oficina solicitou mudanças no projeto.
Projeto atualizado
A estrutura deverá passar a armazenar:
• marca, com até 50 caracteres e preenchimento obrigatório; 
• cor, com até 30 caracteres e preenchimento opcional. 
Além disso:
• o modelo deverá permitir até 150 caracteres; 
• valor_estimado passará a se chamar valor_mercado. 
Tarefa
Atualize a implementação física para que ela represente o novo projeto.
Regras obrigatórias
Não recrie a tabela.
Preserve a estrutura existente.
Ao terminar, confira novamente o resultado. */

ALTER TABLE VEICULO
ADD marca VARCHAR(50) NOT NULL,
ADD cor VARCHAR(30) NULL,
MODIFY modelo VARCHAR(150) NOT NULL,
RENAME COLUMN valor_estimado TO valor_mercado;

DESCRIBE VEICULO;

/* Exercício Prático 06 – Projeto Cancelado
Contexto Empresarial
O projeto da clínica veterinária foi cancelado.
O ambiente criado exclusivamente para ele não deverá permanecer no servidor.
Regra de negócio
O script utilizado pela equipe poderá ser executado mais de uma vez.
Uma nova execução não deverá provocar erro simplesmente porque o banco já tenha sido removido.
Tarefa
Faça a operação necessária e depois confira os bancos disponívei */

DROP DATABASE IF EXISTS dbveterinaria;
SHOW DATABASES;

/* Exercício Prático 07 – Ambientes de Homologação
Contexto Empresarial
Os projetos da oficina e da escola de idiomas entrarão em homologação.
Crie os ambientes:
➢ dbOficinaHomologacao
➢ dbEscolaHomologacao
Tarefa
Prepare os dois ambientes.
Confirme que foram criados.
Selecione o ambiente da oficina.
Depois selecione o ambiente da escola.
Após os testes, os dois ambientes deverão ser completamente removidos.
Regra de negócio
A rotina de remoção poderá ser executada novamente mesmo que os ambientes já tenham sido excluídos. */

CREATE DATABASE dbOficinaHomologacao;
CREATE DATABASE dbEscolaHomologacao;

SHOW DATABASES;

USE dbOficinaHomologacao;
USE dbEscolaHomologacao;

DROP DATABASE IF EXISTS dbOficinaHomologacao;
DROP DATABASE IF EXISTS dbEscolaHomologacao;
SHOW DATABASES;

/* Exercício Prático 08 – Primeira Auditoria
Contexto Empresarial
O coordenador deseja saber o que existe atualmente no servidor.
Tarefa
Utilizando SQL:
• apresente os bancos disponíveis; 
• selecione o projeto da oficina; 
• apresente suas tabelas; 
• apresente a estrutura de veículo; 
• selecione o projeto da escola de idiomas; 
• apresente suas tabelas; 
• retorne ao projeto da oficina. 
Regra obrigatória
Nenhuma estrutura deverá ser criada ou excluída */

SHOW DATABASES;
USE dboficina;
SHOW TABLES;
DESCRIBE VEICULO;

USE dbescolaidiomas;
SHOW TABLES;

USE dboficina;

/* Exercício Prático 09 – Projeto da Escola de Idiomas
Contexto Empresarial
A equipe responsável pelo projeto da escola concluiu parte do modelo lógico.

CURSO
Atributo Definição
id_curso Identificador
nome Até 100 caracteres, obrigatório e único
carga_horaria Número inteiro, obrigatório
valor Valor monetário com duas casas decimais, obrigatório
ativo Inicialmente ativo

PROFESSOR
Atributo Definição
id_professor Identificador
nome Até 120 caracteres, obrigatório
email Até 150 caracteres, obrigatório e único
data_admissao Data obrigatória
ativo Inicialmente ativo

Tarefa
Implemente as duas relações no banco da escola.
Depois confira as tabelas existentes e suas estruturas.
Regra de negócio
Valores monetários não poderão ser negativos. */

USE dbescolaidiomas;
CREATE TABLE CURSO (
id_curso INT PRIMARY KEY,
nome VARCHAR(100) NOT NULL UNIQUE,
carga_horaria INT NOT NULL,
valor DECIMAL(10,2) NOT NULL CHECK (valor >= 0),
ativo BOOLEAN DEFAULT TRUE
);

CREATE TABLE PROFESSOR (
id_professor INT PRIMARY KEY,
nome VARCHAR(120) NOT NULL,
email VARCHAR(150) NOT NULL UNIQUE,
data_admissao DATE NOT NULL,
ativo BOOLEAN DEFAULT TRUE
);

SHOW TABLES;
DESCRIBE CURSO;
DESCRIBE PROFESSOR;

/* Exercício Prático 10 – Do Relacionamento 1:N para o Banco Físico
Contexto Empresarial
No modelo conceitual da escola foi definido:

CURSO 1 : N TURMA
Uma turma pertence a um único curso.
Um curso poderá possuir várias turmas.
No modelo lógico, a equipe definiu:

TURMA
Atributo Definição
id_turma Identificador
nome Até 50 caracteres, obrigatório
data_inicio Data obrigatória
horario Horário obrigatório
id_curso Referência ao curso

Tarefa
Implemente turma.
Regras de negócio
Não poderá existir uma turma associada a um curso inexistente.
O relacionamento definido durante a modelagem deverá ser preservado no banco físico.
Depois confira a estrutura criada. */

CREATE TABLE TURMA (
id_turma INT PRIMARY KEY,
nome VARCHAR(50) NOT NULL,
data_inicio DATE NOT NULL,
horario TIME NOT NULL,
id_curso INT NOT NULL,
FOREIGN KEY (id_curso)
	REFERENCES CURSO(id_curso)
);

DESCRIBE TURMA;

/* Exercício Prático 11 – Professor Responsável
Contexto Empresarial
Uma nova regra foi aprovada:
Cada turma deverá possuir um professor responsável.
O professor deverá existir previamente no cadastro.
Tarefa
Atualize o projeto físico existente para representar a nova regra.
Regras obrigatórias
turma já existe.
Não exclua e recrie a tabela.
A nova informação será obrigatória.
Ao terminar, confira a estrutura. */

ALTER TABLE TURMA
ADD id_professor INT NOT NULL,
ADD FOREIGN KEY (id_professor)
	REFERENCES PROFESSOR(id_professor);

DESCRIBE TURMA;

/* Exercício Prático 12 – Cadastro de Alunos
Projeto lógico — ALUNO

Atributo Definição
id_aluno Identificador
nome Até 150 caracteres, obrigatório
cpf 11 caracteres, obrigatório e único
data_nascimento Data opcional
email Até 150 caracteres, único quando informado
data_cadastro Data e hora
ativo Inicialmente ativo

Tarefa
Leia o projeto e implemente a relação aluno.
Atenção
CPF possui somente dígitos no projeto atual, mas não será utilizado em operações matemáticas.
Escolha o tipo de dado pensando na natureza da informação, e não apenas nos caracteres que ela contém */

CREATE TABLE ALUNO (
id_aluno INT PRIMARY KEY,
nome VARCHAR(150) NOT NULL,
cpf CHAR(11) NOT NULL UNIQUE,
data_nascimento DATE NULL,
email VARCHAR(150) UNIQUE NULL,
data_cadastro DATETIME,
ativo BOOLEAN DEFAULT TRUE
);

DESCRIBE ALUNO;

/* Exercício Prático 13 – Do N:N para uma Tabela Associativa
Contexto do Projeto
No modelo conceitual foi identificado:
ALUNO N : N TURMA
Um aluno poderá participar de várias turmas.
Uma turma possuirá vários alunos.
Durante a transformação para o modelo lógico, o relacionamento originou:
MATRICULA
• id_aluno — referência a ALUNO; 
• id_turma — referência a TURMA; 
• data_matricula — data obrigatória; 
• situacao — até 20 caracteres, obrigatória. 
Regras de negócio
Um aluno não poderá ser matriculado na mesma turma duas vezes.
Não poderá existir matrícula para aluno inexistente.
Não poderá existir matrícula para turma inexistente.

Tarefa
Implemente a solução definida no modelo lógico.
Atenção
Analise quais atributos, individualmente ou em conjunto, conseguem identificar cada matrícula. */
CREATE TABLE MATRICULA (
id_aluno INT,
id_turma INT,
data_matricula DATE NOT NULL, 
situacao VARCHAR(20) NOT NULL,
PRIMARY KEY (id_aluno, id_turma),
FOREIGN KEY (id_aluno)
	REFERENCES ALUNO(id_aluno),
FOREIGN KEY (id_turma)
	REFERENCES TURMA(id_turma)
);
DESCRIBE MATRICULA;

/* Exercício Prático 14 – Por que Normalizamos?
Contexto
Durante o levantamento inicial, alguém sugeriu armazenar:
ALUNO
id_aluno, nome, curso1, curso2, curso3
Essa estrutura não foi aprovada.
Depois da modelagem e normalização, o projeto resultou em:
ALUNO
CURSO
TURMA
MATRICULA
Tarefa
Observe as estruturas que você já implementou e explique, utilizando um comentário de múltiplas linhas no 
próprio script, por que não foi necessário criar curso1, curso2 e curso3 dentro de aluno.
Depois, utilize SQL para apresentar as estruturas de aluno e matricula. */

/* RESPOSTA: 
Porque faz mais sentido criar a tabela curso, que relaciona-se a várias outras tabelas, como aluno e turma. Os alunos têm variações nas quantidades e tipos de curso,
e, da primeira forma sugerida, um aluno teria, obrigatoriamente, no máximo três cursos. */
DESCRIBE ALUNO;
DESCRIBE MATRICULA;

/* Exercício Prático 15 – O Projeto Está Certo, mas o SQL Está?
Contexto
Um desenvolvedor recebeu o seguinte projeto:

CLIENTE
• id_cliente — identificador; 
• nome — até 100 caracteres e obrigatório; 
• cpf — 11 caracteres, obrigatório e único; 
• ativo — inicialmente ativo. 

Ele implementou:
CREATE TABLE cliente (
 id_cliente INT,
 nome VARCHAR(100),
 cpf CHAR(11),
 ativo BOOLEAN
);

Tarefa
Compare a implementação com o projeto.
Identifique quais regras do projeto não foram representadas no banco físico.
Depois, utilizando um banco de treinamento, crie a estrutura apresentada e faça as alterações necessárias 
para que a implementação passe a representar corretamente o projeto.
Regra obrigatória
Depois da criação inicial, as correções deverão ser feitas alterando a estrutura existente */

/*Resposta: As regras não representadas foram: id_cliente deve ser o identificador, logo, é uma primary key. Nome deve ser obrigatório, CPF deve ser obrigatório
e único, e ativo deve estar inicialmente ativo, sendo estabelecido um default true. */

CREATE DATABASE dbTesteExercicio15;
USE dbTesteExercicio15;

CREATE TABLE cliente (
 id_cliente INT,
 nome VARCHAR(100),
 cpf CHAR(11),
 ativo BOOLEAN
);

ALTER TABLE cliente
MODIFY id_cliente INT PRIMARY KEY,
MODIFY nome VARCHAR(100) NOT NULL,
MODIFY cpf char(11) NOT NULL UNIQUE,
MODIFY ativo BOOLEAN DEFAULT TRUE;

/* Exercício Prático 16 – Projeto de uma Pequena Locadora
Contexto Empresarial
Uma locadora de equipamentos concluiu o levantamento, o modelo conceitual e o modelo lógico.
Você recebeu o projeto para realizar a implementação física.
Crie um novo ambiente chamado:

dbLocadoraTeste

Projeto lógico
CLIENTE
• identificador; 
• nome de até 150 caracteres, obrigatório; 
• documento de até 14 caracteres, obrigatório e único; 
• telefone opcional; 
• situação inicialmente ativa. 
CATEGORIA
• identificador; 
• nome de até 80 caracteres, obrigatório e único. 
EQUIPAMENTO
• identificador; 
• nome de até 120 caracteres, obrigatório; 
• categoria; 
• valor diário com duas casas decimais; 
• situação inicialmente disponível. 
LOCACAO
• identificador; 
• cliente; 
• data e hora da retirada; 
• data prevista para devolução; 
• situação. 
ITEM_LOCACAO
• locação; 
• equipamento; 
• valor diário utilizado na locação. 

Regras de negócio
Todo equipamento deverá pertencer a uma categoria existente.
Toda locação deverá pertencer a um cliente existente.
Uma locação poderá possuir vários equipamentos.
Um equipamento poderá participar de várias locações ao longo do tempo.
O mesmo equipamento não poderá aparecer duas vezes na mesma locação.
Valores monetários não poderão ser negativos.

Tarefa
Implemente o projeto no MySQL.
Depois:
• confira o banco criado; 
• confira todas as tabelas; 
• consulte a estrutura de cada tabela; 
• verifique se as chaves e relacionamentos representam o projeto recebido. 
Regra obrigatória
Não há indicação de quais comandos, tipos ou restrições deverão ser utilizados.
Você deverá tomar essas decisões a partir do projeto */

CREATE DATABASE dbLocadoraTeste;
USE dbLocadoraTeste;

CREATE TABLE CLIENTE (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    documento VARCHAR(14) NOT NULL UNIQUE,
    telefone VARCHAR(20) NULL,
    situacao BOOLEAN DEFAULT TRUE
);

CREATE TABLE CATEGORIA (
    id_categoria INT PRIMARY KEY,
    nome VARCHAR(80) NOT NULL UNIQUE
);

CREATE TABLE EQUIPAMENTO (
    id_equipamento INT PRIMARY KEY,
    nome VARCHAR(120) NOT NULL,
    id_categoria INT NOT NULL,
    valor_diario DECIMAL(10,2) NOT NULL CHECK (valor_diario >= 0),
    situacao BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (id_categoria) REFERENCES CATEGORIA(id_categoria)
);

CREATE TABLE LOCACAO (
    id_locacao INT PRIMARY KEY,
    id_cliente INT NOT NULL,
    retirada DATETIME NOT NULL,
    devolucao DATETIME NOT NULL,
    situacao BOOLEAN DEFAULT TRUE,
    FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente)
);

CREATE TABLE ITEM_LOCACAO (
    id_locacao INT NOT NULL,
    id_equipamento INT NOT NULL,
    valor_diario DECIMAL(10,2) NOT NULL CHECK (valor_diario >= 0),
    PRIMARY KEY (id_locacao, id_equipamento), 
    FOREIGN KEY (id_locacao) REFERENCES LOCACAO(id_locacao),
    FOREIGN KEY (id_equipamento) REFERENCES EQUIPAMENTO(id_equipamento)
);

SHOW DATABASES;
SHOW TABLES;
DESCRIBE CLIENTE;
DESCRIBE CATEGORIA;
DESCRIBE EQUIPAMENTO;
DESCRIBE LOCACAO;
DESCRIBE ITEM_LOCACAO;

/* Exercício Prático 17 – Mudanças na Locadora
Contexto Empresarial
O cliente solicitou alterações depois da primeira versão.
Novas regras
O nome do equipamento deverá aceitar até 180 caracteres.
Será necessário armazenar a marca do equipamento, com até 80 caracteres e preenchimento obrigatório.
O telefone do cliente deixou de ser necessário.
valor_diario passará a se chamar valor_locacao.
A empresa decidiu que a tabela categoria deverá se chamar tipo_equipamento.
Tarefa
Atualize o banco físico.
Regras obrigatórias
Não recrie as tabelas.
Escolha a operação adequada para cada alteração.
Depois confira as estruturas modificadas. */

USE dbLocadoraTeste;

ALTER TABLE CLIENTE
    DROP COLUMN telefone;

SHOW CREATE TABLE EQUIPAMENTO;
SHOW CREATE TABLE ITEM_LOCACAO;

ALTER TABLE EQUIPAMENTO
	DROP CHECK equipamento_chk_1,
    MODIFY nome VARCHAR(180) NOT NULL,
    ADD marca VARCHAR(80) NOT NULL,
    RENAME COLUMN valor_diario TO valor_locacao,
    ADD CONSTRAINT chk_equipamento_valor_locacao
    CHECK (valor_locacao >= 0);

ALTER TABLE ITEM_LOCACAO
	DROP CHECK item_locacao_chk_1,
    RENAME COLUMN valor_diario TO valor_locacao,
    ADD CONSTRAINT chk_item_locacao_valor_locacao
    CHECK (valor_locacao >= 0);

RENAME TABLE CATEGORIA TO TIPO_EQUIPAMENTO;

SHOW TABLES;
DESCRIBE CLIENTE;
DESCRIBE TIPO_EQUIPAMENTO;
DESCRIBE EQUIPAMENTO;
DESCRIBE LOCACAO;
DESCRIBE ITEM_LOCACAO;

/* Exercício Prático 18 – Estrutura Temporária
Contexto Empresarial
Durante a migração dos equipamentos, a equipe criou uma tabela temporária chamada 
equipamento_importacao.
Ela deverá possuir:
• código; 
• descrição; 
• quantidade. 
Tarefa
Crie a estrutura.
Depois considere duas situações independentes.
Situação A: os dados importados estão incorretos e precisam ser removidos, mas a estrutura será utilizada 
novamente.
Situação B: depois da conclusão definitiva da migração, a estrutura não terá mais utilidade.
Determine qual operação é adequada para cada situação */

CREATE TABLE equipamento_importacao (
	codigo INT,
    descricao VARCHAR(200),
    quantidade INT
);

/* SITUAÇÃO A: TRUNCATE TABLE equipamento_importacao
SITUAÇÃO B: DROP TABLE equipamento_importacao */

/* Exercício Prático 19 – Encerramento dos Ambientes de Treinamento
Contexto Empresarial
A etapa de treinamento foi concluída.
Antes de iniciar o projeto oficial, os ambientes utilizados exclusivamente para exercícios deverão ser 
removidos.
Tarefa
Verifique os bancos existentes no servidor.
Identifique entre eles os bancos utilizados nesta sequência apenas para treinamento e remova-os.
Regras de negócio
dbHorizonte ainda não existe e não deverá ser criado neste exercício.
Os scripts de exclusão deverão considerar a possibilidade de algum ambiente já ter sido removido.
Ao terminar, confira novamente o servidor. */

SHOW DATABASES;
DROP DATABASE dbtesteexercicio15;
DROP DATABASE dblocadorateste;

/* Exercício Prático 20 – Retomando o Projeto Antes do SQL
Contexto Empresarial
A Horizonte Comercial comercializa produtos para clientes de diversas cidades.
A empresa possui funcionários, fornecedores, produtos organizados por categorias, estoque, pedidos, 
pagamentos e entregas.
Antes de escrever qualquer comando SQL, a equipe deverá lembrar que o banco físico é consequência do 
projeto.
Tarefa
A partir das informações fornecidas pelo projeto da Horizonte Comercial:
1. identifique as principais entidades; 
2. identifique os relacionamentos existentes; 
3. identifique situações 1:N; 
4. identifique situações N:N; 
5. identifique quais relações associativas deverão aparecer no modelo lógico; 
6. confira se o modelo está normalizado antes da implementação. 
Regra obrigatória
Não escreva SQL ainda.
O objetivo deste exercício é reforçar que a implementação física somente deverá começar depois que o 
projeto estiver compreendido. */

/*Resposta:
1. Identifique as principais entidades: Cliente, Cidade, Funcionário, Fornecedor, Produto, Categoria, Estoque, Pedido, Pagamento e Entrega.
2. Cidade com Cliente, Categoria com Produto, Cliente com Pedido, Funcionário com Pedido, Pedido com Pagamento, Pedido com Entrega, Pedido com Produto, Produto com Fornecedor.
3. Cidade-Cliente, Categoria-Produto, Cliente-Pedido, Funcionário-Pedido, Pedido-Pagamento, Pedido-Entrega.
4. Pedido-Produto, Produto-Fornecedor
5. Item_Pedido, Produto_Fornecedor
6. Sim, o modelo está normalizado
1FN: Todos os atributos são atómicos e não existem grupos repetidos.
2FN: Os atributos não-chave dependem totalmente das chaves primárias.
3FN: As dependências transitivas foram eliminadas. */

/*Exercício Prático 21 – Do Modelo Conceitual para o Lógico
Regras de negócio da Horizonte Comercial
A equipe levantou as seguintes necessidades:
• um estado possui várias cidades; 
• cada cidade pertence a um estado; 
• clientes podem possuir endereços; 
• funcionários ocupam cargos; 
• produtos pertencem a categorias; 
• fornecedores podem fornecer vários produtos; 
• um produto poderá possuir vários fornecedores; 
• cada produto possuirá controle de estoque; 
• clientes realizam pedidos; 
• cada pedido possui um funcionário responsável; 
• um pedido possui vários produtos; 
• um produto poderá aparecer em vários pedidos; 
• pedidos poderão possuir pagamentos; 
• cada pagamento utilizará uma forma de pagamento; 
• pedidos poderão gerar entregas. 
Tarefa
Antes da implementação física, analise essas regras juntamente com o modelo conceitual elaborado para o 
projeto.
Confira se o modelo lógico representa corretamente os relacionamentos e se as relações necessárias foram 
obtidas após a normalização.
Atenção
Ainda não é o momento de criar tabelas.
Primeiro devemos saber o que será implementado e por quê. */

/*Resposta: ESTADO E CIDADE
Estado (1) -> (N) Cidade
A tabela Cidade recebe id_estado como chave estrangeira.

ENDEREÇO DO CLIENTE
Cliente (1) -> (N) Endereco <- (1) Cidade
A tabela Endereco recebe id_cliente e id_cidade.
Permite múltiplos endereços por cliente e garante a 3FN.

CARGOS E FUNCIONÁRIOS
Cargo (1) -> (N) Funcionario
A tabela Funcionario recebe id_cargo como chave estrangeira.

CATEGORIAS E PRODUTOS
Categoria (1) -> (N) Produto
A tabela Produto recebe id_categoria como chave estrangeira.

FORNECEDORES E PRODUTOS
Relação N:N (Muitos para Muitos)
Cria-se a tabela associativa Produto_Fornecedor com id_produto e id_fornecedor.

CONTROLE DE ESTOQUE
Produto (1) -> (1 ou N) Estoque
A tabela Estoque armazena a quantidade disponível vinculada ao id_produto.

PEDIDOS
A tabela Pedido recebe id_cliente (quem comprou) e id_funcionario (quem atendeu).

ITENS DO PEDIDO
Relação N:N entre Pedido e Produto
Cria-se a tabela associativa Item_Pedido com id_pedido, id_produto, quantidade e preco_unitario.

PAGAMENTOS
Forma_Pagamento (1) -> (N) Pagamento <- (1) Pedido
A tabela Pagamento guarda id_pedido e id_forma_pagamento.

ENTREGAS
Pedido (1) -> (1 ou N) Entrega
A tabela Entrega recebe id_pedido para acompanhar status e transporte.

ANÁLISE DE NORMALIZAÇÃO:
1FN: Dados divididos de forma atômica.
2FN: Tabelas associativas dependem totalmente de suas chaves compostas.
3FN: Dados indiretos (Estado e Cidade) foram isolados para evitar dependências transitivas. */

/* Exercício Prático 22 – Nascimento do Banco Oficial
Contexto Empresarial
O projeto foi aprovado.
O modelo lógico está definido e a equipe recebeu autorização para iniciar a implementação física.
Tarefa
Crie o banco oficial:
dbHorizonte
Confirme sua criação.
Deixe-o selecionado para o início da implementação.
Regras obrigatórias
Inclua um comentário de múltiplas linhas identificando o início da implementação física.
Esse banco será utilizado durante todo o restante da disciplina e não deverá ser excluído. */

/*Início da implementação física */
CREATE DATABASE dbHorizonte;
SHOW DATABASES;
use dbHorizonte;

/* Exercício Prático 23 – Implementando Localização
Modelo lógico aprovado
ESTADO
• id_estado — identificador; 
• sigla — exatamente 2 caracteres, obrigatória e única; 
• nome — até 50 caracteres, obrigatório. 
CIDADE
• id_cidade — identificador; 
• nome — até 100 caracteres, obrigatório; 
• id_estado — referência obrigatória a ESTADO. 
Tarefa
Transforme essa parte do modelo lógico em estruturas físicas.
Depois confira as tabelas e suas estruturas */

CREATE TABLE ESTADO (
id_estado INT PRIMARY KEY,
sigla CHAR(2) NOT NULL UNIQUE,
NOME VARCHAR(50) NOT NULL
);

CREATE TABLE CIDADE (
id_cidade INT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
id_estado INT,
FOREIGN KEY(id_estado)
	REFERENCES ESTADO(id_estado)
);

SHOW TABLES;
DESCRIBE ESTADO;
DESCRIBE CIDADE;

/* Exercício Prático 24 – Implementando Clientes e Endereços
CLIENTE
• código interno gerado automaticamente; 
• nome ou razão social — até 150 caracteres, obrigatório; 
• documento — até 14 caracteres, obrigatório e único; 
• tipo de pessoa — F ou J; 
• telefone — opcional; 
• e-mail — opcional; 
• data de nascimento — opcional;
• data e hora do cadastro; 
• situação inicialmente ativa. 
ENDERECO
• identificador; 
• cliente; 
• logradouro; 
• número; 
• complemento; 
• CEP; 
• cidade. 
Regras de negócio
Todo endereço pertence a um cliente existente.
Todo endereço pertence a uma cidade existente.
Logradouro, número e CEP são obrigatórios.
Complemento é opcional.
O número poderá conter valores como 120, 120A ou S/N.
Tarefa
Implemente essa parte do projeto. */

CREATE TABLE CLIENTE (
    id_cliente INT PRIMARY KEY,
    nome VARCHAR(150) NOT NULL,
    documento VARCHAR(14) NOT NULL UNIQUE,
    tipo_pessoa CHAR(1) NOT NULL,
    telefone VARCHAR(20) NULL,
    email VARCHAR(100) NULL,
    data_nascimento DATE NULL,
    data_cadastro DATETIME NOT NULL,
    situacao BOOLEAN NOT NULL DEFAULT TRUE,
    CONSTRAINT chk_tipo_pessoa
        CHECK (tipo_pessoa IN ('F', 'J'))
);

CREATE TABLE ENDERECO (
    id_endereco INT PRIMARY KEY,
    id_cliente INT NOT NULL,
    logradouro VARCHAR(150) NOT NULL,
    numero VARCHAR(10) NOT NULL,
    complemento VARCHAR(80) NULL,
    cep CHAR(8) NOT NULL,
    id_cidade INT NOT NULL,
    CONSTRAINT fk_endereco_cliente
        FOREIGN KEY (id_cliente) REFERENCES CLIENTE(id_cliente),
    CONSTRAINT fk_endereco_cidade
        FOREIGN KEY (id_cidade) REFERENCES CIDADE(id_cidade)
);

SHOW TABLES;
DESCRIBE CLIENTE;
DESCRIBE ENDERECO;

/* Exercício Prático 25 – Estrutura Organizacional
Modelo lógico
CARGO
• identificador; 
• nome obrigatório e único; 
• salário-base não negativo. 
FUNCIONARIO
• identificador gerado automaticamente; 
• nome obrigatório; 
• CPF obrigatório e único; 
• data de admissão obrigatória; 
• horário de entrada; 
• cargo obrigatório; 
• situação inicialmente ativa. 
Regra de negócio
Um cargo poderá ser ocupado por vários funcionários.
Cada funcionário deverá possuir um cargo existente.
Tarefa
Implemente o modelo.
Depois confira se o relacionamento definido no projeto aparece corretamente no banco físico. */

CREATE TABLE CARGO (
id_cargo INT PRIMARY KEY,
nome VARCHAR(100) NOT NULL UNIQUE,
salario_base DECIMAL(10,2) CHECK (salario_base >= 0)
);

CREATE TABLE FUNCIONARIO (
id_funcionario INT AUTO_INCREMENT PRIMARY KEY ,
nome VARCHAR(100) NOT NULL,
cpf VARCHAR(14) NOT NULL UNIQUE,
data_admissao DATE NOT NULL,
horario_entrada TIME,
id_cargo INT NOT NULL,
situacao BOOLEAN DEFAULT TRUE,
FOREIGN KEY(id_cargo)
	REFERENCES CARGO(id_cargo)
);

DESCRIBE CARGO;
DESCRIBE FUNCIONARIO;

/* Exercício Prático 26 – Catálogo Comercial
Modelo lógico
CATEGORIA
• identificador; 
• nome obrigatório e único; 
• descrição opcional. 
PRODUTO
• identificador gerado automaticamente; 
• nome obrigatório; 
• categoria obrigatória; 
• preço de venda com duas casas decimais; 
• ano de fabricação; 
• estoque mínimo; 
• situação inicialmente ativa. 
Regras de negócio
O preço não poderá ser negativo.
O estoque mínimo não poderá ser negativo.
Todo produto deverá pertencer a uma categoria existente.
Tarefa
Implemente as relações. */

CREATE TABLE CATEGORIA (
id_categoria INT PRIMARY KEY,
nome VARCHAR(100) NOT NULL UNIQUE,
descricao TEXT NULL
);

CREATE TABLE PRODUTO (
id_produto INT AUTO_INCREMENT PRIMARY KEY,
nome VARCHAR(100) NOT NULL,
id_categoria INT NOT NULL,
preco_venda DECIMAL(10,2) CHECK(preco_venda >= 0),
ano_fabricacao YEAR,
estoque_minimo INT CHECK(estoque_minimo >= 0),
situacao BOOLEAN DEFAULT TRUE,
FOREIGN KEY(id_categoria)
	REFERENCES CATEGORIA(id_categoria)
);

/* Exercício Prático 27 – Fornecedores e Produtos
Contexto do modelo conceitual
FORNECEDOR N : N PRODUTO
Um fornecedor poderá fornecer vários produtos.
Um produto poderá ser adquirido de diferentes fornecedores.
Após a transformação e normalização, surgiu a relação associativa:

PRODUTO_FORNECEDOR
Ela deverá registrar:
• produto; 
• fornecedor; 
• código utilizado pelo fornecedor para o produto; 
• preço de custo. 

FORNECEDOR
Também deverá possuir:
• identificador; 
• razão social; 
• CNPJ obrigatório e único; 
• telefone opcional; 
• e-mail opcional; 
• situação inicialmente ativa. 

Regras de negócio
Produto e fornecedor deverão existir.
O mesmo produto não poderá ser relacionado duas vezes ao mesmo fornecedor.
O preço de custo não poderá ser negativo.
Tarefa
Implemente essa parte do projeto */

CREATE TABLE FORNECEDOR (
id_fornecedor INT PRIMARY KEY,
razao_social VARCHAR(150),
cnpj VARCHAR(18) NOT NULL UNIQUE,
telefone VARCHAR(20) NULL,
email VARCHAR(255) NULL,
situacao BOOLEAN DEFAULT TRUE
);

CREATE TABLE PRODUTO_FORNECEDOR (
id_produto INT,
id_fornecedor INT,
codigo INT,
preco_custo DECIMAL(10,2) CHECK(preco_custo >= 0),
PRIMARY KEY (id_produto, id_fornecedor), 
    FOREIGN KEY (id_produto) REFERENCES PRODUTO(id_produto),
    FOREIGN KEY (id_fornecedor) REFERENCES FORNECEDOR(id_fornecedor)
);

/* Exercício Prático 28 – Controle de Estoque
Projeto
Cada produto deverá possuir um único controle de estoque.
O controle deverá armazenar:
• produto; 
• quantidade atual; 
• data e hora da última atualização. 
Regras de negócio
Não poderá existir estoque de produto inexistente.
A quantidade não poderá ser negativa.
Um produto não deverá possuir dois controles diferentes de estoque.
Tarefa
Defina e implemente a estrutura adequada.
Atenção
O projeto apresenta a regra.
Cabe a você decidir como representar sua identificação e suas restrições no banco físico */

CREATE TABLE ESTOQUE (
    id_produto INT PRIMARY KEY,
    quantidade_atual INT NOT NULL CHECK (quantidade_atual >= 0),
    data_atualizacao DATETIME NOT NULL,
    FOREIGN KEY (id_produto)
        REFERENCES PRODUTO(id_produto)
);

/* Exercício Prático 29 – Pedidos
PEDIDO
• identificador; 
• cliente; 
• funcionário responsável; 
• data e hora; 
• percentual de desconto; 
• situação. 
Regras de negócio
Cliente e funcionário deverão existir.
O desconto deverá permanecer entre 0 e 100.
Quando não houver desconto informado, considere zero.
Tarefa
Implemente a relação */

SHOW TABLES;

CREATE TABLE PEDIDO (
id_pedido INT PRIMARY KEY,
id_cliente INT NOT NULL,
id_funcionario INT NOT NULL,
data_hora DATETIME,
desconto DECIMAL(5,2) DEFAULT 0 CHECK (desconto >= 0 AND desconto <= 100),
situacao BOOLEAN,
FOREIGN KEY(id_cliente)
	REFERENCES CLIENTE(id_cliente),
FOREIGN KEY(id_funcionario)
	REFERENCES FUNCIONARIO(id_funcionario)
);

/* Exercício Prático 30 – Itens do Pedido
Contexto do projeto
O modelo conceitual possui:
PEDIDO N : N PRODUTO
Durante a transformação para o modelo lógico surgiu:
ITEM_PEDIDO
• pedido; 
• produto; 
• quantidade; 
• valor unitário. 
Regras de negócio
Pedido e produto deverão existir.
Quantidade deverá ser maior que zero.
Valor unitário não poderá ser negativo.
O mesmo produto não poderá aparecer duas vezes no mesmo pedido.
Tarefa
Implemente a relação associativa respeitando as regras definidas no projeto */

CREATE TABLE ITEM_PEDIDO(
id_pedido INT,
id_produto INT,
quantidade INT CHECK(quantidade > 0),
valor_unitario DECIMAL(10,2) CHECK(valor_unitario >= 0),
PRIMARY KEY(id_pedido, id_produto),
	FOREIGN KEY(id_pedido)
		REFERENCES PEDIDO(id_pedido),
	FOREIGN KEY(id_produto)
		REFERENCES PRODUTO(id_produto)
);

/* Exercício Prático 31 – Pagamentos
Projeto lógico
FORMA_PAGAMENTO
• identificador; 
• descrição obrigatória e única; 
• situação inicialmente ativa. 
PAGAMENTO
• identificador; 
• pedido; 
• forma de pagamento; 
• valor pago; 
• data e hora; 
• situação. 

Regras de negócio
Pedido e forma de pagamento deverão existir.
O valor pago deverá ser maior que zero.
Tarefa
Implemente essa parte do projeto */

CREATE TABLE FORMA_PAGAMENTO (
id_forma_pagamento INT PRIMARY KEY,
descricao VARCHAR(100) NOT NULL UNIQUE,
situacao BOOLEAN DEFAULT TRUE
);

CREATE TABLE PAGAMENTO (
id_pagamento INT PRIMARY KEY,
id_pedido INT,
id_forma_pagamento INT,
valor_pago DECIMAL(10,2) CHECK(valor_pago > 0),
data_hora DATETIME,
situacao BOOLEAN,
FOREIGN KEY(id_pedido)
	REFERENCES PEDIDO(id_pedido),
FOREIGN KEY(id_forma_pagamento)
	REFERENCES FORMA_PAGAMENTO(id_forma_pagamento)
);

/* Exercício Prático 32 – Entregas
Projeto lógico — ENTREGA
• identificador; 
• pedido; 
• endereço; 
• data prevista; 
• data de envio; 
• data efetiva da entrega; 
• situação. 
Regras de negócio
Pedido e endereço deverão existir.
A data prevista é obrigatória.
Data de envio e data efetiva poderão inicialmente não possuir valor.
Tarefa
Implemente a estrutura. */

CREATE TABLE ENTREGA (
id_entrega INT PRIMARY KEY,
id_pedido INT,
id_endereco INT,
data_prevista DATE NOT NULL,
data_envio DATE NULL,
data_efetiva DATE NULL,
situacao BOOLEAN,

FOREIGN KEY(id_pedido)
        REFERENCES PEDIDO(id_pedido),

FOREIGN KEY(id_endereco)
        REFERENCES ENDERECO(id_endereco)
);

/* Exercício Prático 33 – Auditoria Projeto x Banco Físico
Contexto Empresarial
A primeira versão estrutural do sistema Horizonte foi concluída.
Antes de prosseguir, a equipe realizará uma auditoria.
Tarefa
Utilizando SQL, confira:
• o banco utilizado; 
• todas as tabelas existentes; 
• a estrutura de cliente; 
• a estrutura de produto; 
• a estrutura de pedido; 
• a estrutura de item_pedido; 
• a estrutura de pagamento; 
• a estrutura de entrega. 
Depois compare essas estruturas com o modelo lógico aprovado.
O banco físico representa o projeto?
Se alguma regra definida no projeto não estiver representada, faça a correção necessária. */

SHOW DATABASES;
SHOW TABLES;
DESCRIBE cliente;
DESCRIBE produto;
DESCRIBE pedido;
DESCRIBE item_pedido;
DESCRIBE pagamento;
DESCRIBE entrega;

/* Exercício Prático 34 – O Negócio Mudou
Contexto Empresarial
Depois da apresentação da primeira versão do sistema, a Horizonte Comercial solicitou algumas alterações.
As mudanças representam novas regras de negócio e deverão ser incorporadas ao banco físico já 
existente.
Novas regras
➢ O nome do cliente deverá aceitar até 200 caracteres. 
➢ O cliente passará a possuir observacao, com até 250 caracteres e preenchimento opcional. 
➢ O telefone do fornecedor deixou de ser necessário. 
➢ Em produto, ano_fabricacao passará a se chamar ano. 
Tarefa
Atualize o banco físico para que ele continue representando corretamente o projeto e as novas regras de 
negócio.
Ao terminar, confira as estruturas modificadas.
Regras obrigatórias
• Não exclua as tabelas para criá-las novamente. 
• Preserve as demais informações definidas no projeto. 
• Analise cada mudança e escolha a operação SQL adequada. */

DESCRIBE CLIENTE;
DESCRIBE FORNECEDOR;
DESCRIBE PRODUTO;

ALTER TABLE cliente
MODIFY nome VARCHAR(200) NOT NULL,
ADD observacao VARCHAR(250) NULL;

ALTER TABLE fornecedor
DROP COLUMN telefone;

ALTER TABLE produto
RENAME COLUMN ano_fabricacao TO ano;

DESCRIBE CLIENTE;
DESCRIBE FORNECEDOR;
DESCRIBE PRODUTO;

/* Exercício Prático 35 – Mudanças em Produtos
Novas regras de negócio
Produto deverá possuir:
• peso, aceitando casas decimais; 
• marca, com até 80 caracteres. 
Inicialmente o peso será opcional.
A marca será obrigatória.
Tarefa
Atualize a estrutura.
Depois confira o resultado */

ALTER TABLE produto
ADD peso DECIMAL(4,3) NULL,
ADD marca VARCHAR(80) NOT NULL;

DESCRIBE produto;

/* Exercício Prático 36 – Outra Mudança de Regra
A empresa decidiu que o peso do produto não poderá mais ficar sem preenchimento.
Tarefa
Adapte a estrutura existente.
Regra obrigatória
Não crie outra coluna.
Modifique aquela que já representa essa informação. */

ALTER TABLE PRODUTO
MODIFY peso DECIMAL(4,3) NOT NULL;
DESCRIBE PRODUTO;

/* Exercício Prático 37 – Informação Descontinuada
A empresa decidiu deixar de controlar o ano de fabricação dos produtos.
Tarefa
Atualize o banco físico para refletir a nova versão do projeto.
Depois confira a estrutura. */

ALTER TABLE PRODUTO
DROP COLUMN ano;
DESCRIBE PRODUTO;

/* Exercício Prático 38 – Estrutura Temporária de Importação
Durante uma migração, será necessária uma estrutura chamada:
produto_importacao
Ela armazenará temporariamente:
• código; 
• descrição; 
• quantidade. 

Tarefa
Crie a estrutura.
Depois considere:
Situação A: os dados precisam ser apagados, mas a estrutura será reutilizada.
Situação B: posteriormente a estrutura inteira deixará de ser necessária.
Determine a operação adequada para cada situação. */

CREATE TABLE produto_importacao (
codigo INT,
descricao TEXT,
quantidade INT
);

/*Situação A: TRUNCATE TABLE produto_importacao;
Situação B: DROP TABLE produto_importacao; */

/* Exercício Prático 39 – Alteração de Terminologia
Contexto Empresarial
A equipe responsável pela logística da Horizonte Comercial realizou uma revisão dos termos utilizados no 
projeto.
A partir de agora, a estrutura denominada entrega deverá passar a se chamar:
expedicao
A mudança é apenas de terminologia. A estrutura e sua finalidade permanecem as mesmas.
Tarefa
Atualize o banco físico para representar a nova terminologia adotada no projeto.
Depois, confira as tabelas existentes e verifique se a alteração foi realizada.
Regras obrigatórias
• Não exclua a tabela para criá-la novamente. 
• Os dados e a estrutura já definidos deverão ser preservados. 
• Escolha a operação SQL adequada para realizar a mudança. */

RENAME TABLE entrega
TO expedicao;

SHOW TABLES;
DESCRIBE expedicao;

/* Exercício Prático 40 – Desafio Final de DDL
Contexto Empresarial
Um analista recebeu o projeto Horizonte e precisa verificar se o ambiente físico está consistente com sua 
versão atual.
Ele não possui o histórico dos comandos executados.
Possui apenas:
• as regras de negócio; 
• o modelo lógico atualizado; 
• acesso ao banco físico. 
Tarefa
Faça uma auditoria completa da estrutura utilizando os comandos SQL estudados.
Confira bancos, tabelas e estruturas.
Compare:
Projeto aprovado
↓
Modelo lógico
↓
Banco físico
Caso encontre divergências, faça as alterações necessárias sem destruir estruturas corretas.
Regra principal
Não escolha um comando porque “este é o exercício de determinado comando”.
Primeiro identifique o problema que precisa ser resolvido.
Depois escolha o recurso SQL adequado */

SHOW DATABASES;
SHOW TABLES;
DESCRIBE cargo;
DESCRIBE categoria;
DESCRIBE cidade;
DESCRIBE cliente;
DESCRIBE endereco;
DESCRIBE estado;
DESCRIBE estoque;
DESCRIBE expedicao;
DESCRIBE forma_pagamento;
DESCRIBE fornecedor;
DESCRIBE funcionario;
DESCRIBE item_pedido;
DESCRIBE pagamento;
DESCRIBE pedido;
DESCRIBE produto;
DESCRIBE produto_fornecedor;
DROP DATABASE sakkolamarket;