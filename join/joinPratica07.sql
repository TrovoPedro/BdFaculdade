create database PetShopTrovo;

use PetShopTrovo;

CREATE TABLE clientes (
    cliente_id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(255) NOT NULL,
    telefone_fixo VARCHAR(15),
    telefone_celular VARCHAR(15),
    endereco VARCHAR(255)
);

CREATE TABLE pets (
    pet_id INT AUTO_INCREMENT PRIMARY KEY,
    tipo_animal VARCHAR(50) NOT NULL,
    nome VARCHAR(255) NOT NULL,
    raca VARCHAR(50),
    data_nascimento DATE,
    cliente_id INT,
    FOREIGN KEY (cliente_id) REFERENCES Clientes(cliente_id)
);

INSERT INTO Clientes (nome, telefone_fixo, telefone_celular, endereco)
VALUES
('Pedro', '1199-5151', '11951516471', 'Rua Arroio Triunfo'),
('Trovo', '6464-3138', '11942170850', 'Rua Arroio Arapongas'),
('Souza', '4217-0850', '11964643138', 'Rua Sarandi');

INSERT INTO Pets (tipo_animal, nome, raca, data_nascimento, cliente_id)
VALUES
('cachorro', 'Doguinho', 'Vira-lata', '2017-10-10', 1),
('gato', 'Nego', 'Vira-lata', '2018-05-30', 2),
('cachorro', 'Maya', 'Yorkshire', '2024-01-10', 1),
('gato', 'Penelope', 'Siames', '2018-11-07', 3);

SELECT * FROM clientes;
SELECT * FROM pets;

ALTER TABLE clientes MODIFY nome VARCHAR(150);

SELECT * FROM pets
	WHERE tipo_animal = 'cachorro';
    
SELECT nome, data_nascimento FROM pets;

SELECT * FROM cets ORDER BY nome;

SELECT * FROM clientes ORDER BY endereco DESC;

SELECT * FROM cets WHERE nome LIKE 'P%';

SELECT * FROM clientes WHERE nome LIKE '%Trovo%';

UPDATE clientes SET telefone_celular = '9090-4217' 
	WHERE cliente_id = 1;

SELECT * FROM clientes;

SELECT tp.pet_id AS 'Id do pet', tp.nome AS 'Nome do pet', tp.tipo_animal AS 'Tipo do animal', tc.nome AS 'Nome do dono'
FROM pets tp
	JOIN clientes tc 
	ON tp.cliente_id = tc.cliente_id;
    
SELECT tp.pet_id AS 'Id do pet', tp.nome AS 'Nome do pet', tp.tipo_animal AS 'Tipo do animal', tc.nome AS 'Nome do dono'
FROM pets tp
	JOIN clientes tc 
	ON tp.cliente_id = tc.cliente_id
		WHERE tc.cliente_id = 2;
        
DELETE FROM pets 
	WHERE pet_id = 101;
    
SELECT * FROM pets;

alter table pets auto_increment = 101;


CREATE DATABASE gastos;

USE gastos;

CREATE TABLE pessoa (
    idPessoa INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    data_nascimento DATE,
    profissao VARCHAR(45)
);

CREATE TABLE gasto (
    idGasto INT AUTO_INCREMENT PRIMARY KEY,
    data DATE NOT NULL,
    valor DECIMAL(10,2) NOT NULL,
    descricao VARCHAR(150),
    idPessoa INT,
    FOREIGN KEY (idPessoa) REFERENCES Pessoa(idPessoa)
);

INSERT INTO pessoa (nome, data_nascimento, profissao)
VALUES
	('Pedro', '2005-05-30', 'Engenheiro de software'),
	('Trovo', '1999-05-05', 'Cozinheiro'),
	('Souza', '2010-04-30', 'Jogador de futebol'),
	('Pedro Trovo Souza', '2005-05-30', 'Engenheiro de software');

INSERT INTO gasto (data, valor, descricao, idPessoa)
VALUES
	('2024-10-15', 190.57, 'Gastos em comida', 1),
	('2024-04-14', 44.87, 'Game-Pass', 2),
	('2024-04-12', 450.00, 'Contas para pagar', 3),
	('2024-01-11', 10.00, 'Padaria', 1);
    
SELECT * FROM pessoa;
SELECT * FROM gasto;

SELECT * FROM pessoa 
	WHERE profissao = 'Engenheiro de software';
    
SELECT tp.idPessoa AS 'Id Pessoa', tp.nome AS 'Nome Pessoa', tp.profissao AS 'Profissão', tg.idGasto AS 'Id Gastos', tg.descricao AS 'Descrição', tg.valor AS 'Valor', tg.data AS 'Data'
FROM pessoa tp
	JOIN gasto tg 
		ON tp.idPessoa = tg.idPessoa;
        
SELECT tp.idPessoa AS 'Id Pessoa', tp.nome AS 'Nome Pessoa', tp.profissao AS 'Profissão', tg.idGasto AS 'Id Gastos', tg.descricao AS 'Descrição', tg.valor AS 'Valor', tg.data AS 'Data'
FROM pessoa tp
	JOIN gasto tg 
		ON tp.idPessoa = tg.idPessoa
		WHERE tp.idPessoa = 2;

UPDATE gasto SET valor = 100.00 
	WHERE idGasto = 1;
    
DELETE FROM Gasto 
	WHERE idGasto = 3;
    
CREATE DATABASE PraticaFuncionario;

USE PraticaFuncionario;

CREATE TABLE setor (
    idSetor INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    andar INT NOT NULL
);

CREATE TABLE funcionario (
    idFuncionario INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    telefone VARCHAR(11),
    salario DECIMAL(10,2) CHECK (salario > 0),
    idSetor INT,
    FOREIGN KEY (idSetor) REFERENCES Setor(idSetor)
);

CREATE TABLE acompanhante (
    idFuncionario INT NOT NULL,
    idAcompanhante INT,
    nome VARCHAR(45),
    relacao VARCHAR(100),
    data_nascimento DATE,
    PRIMARY KEY (idFuncionario, idAcompanhante),
    FOREIGN KEY (idFuncionario) REFERENCES funcionario(idFuncionario)
);

INSERT INTO Setor (nome, andar)
VALUES
	('Publicidade', 1),
	('Recursos Hmanos', 2),
	('TI', 5);

INSERT INTO funcionario (nome, telefone, salario, idSetor)
VALUES
	('Pedro', '9090-4217', 7500.00, 1),
	('Trovo', '1234-4217', 5500.00, 2),
	('Souza', '4321-1234', 9000.00, 3),
	('Claudio', '0987-7809', 1000.00, 1);
    
INSERT INTO Acompanhante (idAcompanhante, idFuncionario, nome, relacao, data_nascimento)
VALUES
	(1, 1, 'Claudia', 'Mãe', '1987-04-28'),
	(2, 1, 'Guilherme', 'Irmão', '2002-02-19'),
	(3, 2, 'Rafael', 'Irmão', '2012-03-22'),
	(4, 2, 'Natalia', 'Namorada', '2005-10-03');

SELECT * FROM setor;
SELECT * FROM funcionario;
SELECT * FROM acompanhante;

SELECT ts.nome AS 'Nome do setor', tf.nome AS 'Nome do funcionário'
FROM Setor ts
JOIN funcionario tf ON ts.idSetor = tf.idSetor;

SELECT ts.nome AS 'Nome do setor', tf.nome AS 'Nome do funcionário'
FROM Setor ts
	JOIN funcionario tf 
		ON ts.idSetor = tf.idSetor
		WHERE ts.nome = 'TI';
        
SELECT tf.nome AS 'Nome do funcionário', ta.nome AS 'Nome do acompanhante', ta.relacao AS 'Relação', ta.data_nascimento AS 'Data de nascimento'
FROM funcionario tf
	JOIN acompanhante ta 
    ON tf.idFuncionario = ta.idFuncionario;
    
SELECT tf.nome AS 'Nome do funcionário', ta.nome AS 'Nome do acompanhante', ta.relacao AS 'Relação', ta.data_nascimento AS 'Data de nascimento'
FROM funcionario tf
	JOIN acompanhante ta 
    ON tf.idFuncionario = ta.idFuncionario
		WHERE tf.nome = 'Pedro';
        
SELECT tf.nome AS 'Nome do funcionário', ts.nome AS 'Setor', ta.nome AS 'Nome do acompanhante', ta.relacao AS 'Relação'
FROM funcionario tf
	JOIN setor ts 
    ON tf.idSetor = ts.idSetor
		JOIN acompanhante ta 
        ON tf.idFuncionario = ta.idFuncionario;
        
UPDATE funcionario SET salario = 5200.00 WHERE idFuncionario = 1;

DELETE FROM Acompanhante 
	WHERE idFuncionario = 3 AND idAcompanhante = 2;

CREATE DATABASE Treinador;

USE Treinador;

CREATE TABLE treinador (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    telefone VARCHAR(11) NOT NULL,
    email VARCHAR(50) NOT NULL
);

CREATE TABLE nadador (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nome VARCHAR(45) NOT NULL,
    estado_origem VARCHAR(15) NOT NULL,
    data_nascimento DATE NOT NULL,
    treinador_id INT,
    FOREIGN KEY (treinador_id) REFERENCES treinador(id)
);

CREATE TABLE orientador (
    treinador_novato_id INT NOT NULL,
    treinador_experiente_id INT NOT NULL,
    FOREIGN KEY (treinador_novato_id) REFERENCES treinador(id),
    FOREIGN KEY (treinador_experiente_id) REFERENCES treinador(id)
);

INSERT INTO treinador (nome, telefone, email) VALUES
	('João Cleber', '1111-1111', 'joaocleber@experiente.com'),
	('Robson', '2222-2222', 'robson@novato.com'),
	('Claudiano', '3333-3333', 'claudiano@novato.com');

INSERT INTO nadador (nome, estado_origem, data_nascimento, treinador_id) VALUES
	('Pedro', 'SP', '2005-05-30', 1),
	('Trovo', 'RJ', '2006-05-31', 2),
	('Souza', 'SP', '2002-05-30', 2);

INSERT INTO orientador (treinador_novato_id, treinador_experiente_id) VALUES
	(2, 1),
	(3, 1);
    
SELECT * FROM treinador;

SELECT * FROM nadador;

SELECT * FROM orientador;

SELECT treinador.nome AS 'Nome do treinador',
       nadador.nome AS 'Nome do nadador',
       nadador.estado_origem AS 'Estado',
       nadador.data_nascimento AS 'Data de nascimento'
FROM treinador
	JOIN nadador 
		ON treinador.id = nadador.treinador_id;
        
SELECT treinador.nome AS 'Nome do treinador',
       nadador.nome AS 'Nome do nadador',
       nadador.estado_origem AS 'Estado',
       nadador.data_nascimento AS 'Data de nascimento'
FROM treinador
	JOIN nadador 
		ON treinador.id = nadador.treinador_id
		WHERE treinador.nome = 'João Cleber';
        
SELECT treinador.nome AS 'Nome do Treinador novato',
       orientador.treinador_experiente_id,
       treinadorExperiente.nome AS 'Nome do treinador experiente'
FROM treinador
JOIN orientador 
	ON treinador.id = orientador.treinador_novato_id
JOIN treinador AS TreinadorExperiente 
	ON orientador.treinador_experiente_id = treinadorExperiente.id;
    
SELECT treinador.nome AS 'Nome do Treinador novato',
       treinadorExperiente.nome AS 'Nome do treinador experiente'
FROM treinador
JOIN orientador 
	ON treinador.id = orientador.treinador_novato_id
JOIN treinador AS treinadorExperiente 
	ON orientador.treinador_experiente_id = treinadorExperiente.id
WHERE treinadorExperiente.nome = 'João Cleber';

SELECT treinador.nome AS 'Nome do Treinador novato',
       nadador.nome AS 'Nome do nadador',
       treinadorExperiente.nome AS 'Nome do treinador experiente'
FROM treinador
JOIN nadador 
	ON treinador.id = nadador.treinador_id
JOIN orientador 
	ON treinador.id = orientador.treinador_novato_id
JOIN treinador AS treinadorExperiente 
	ON orientador.treinador_experiente_id = treinadorExperiente.id;
    
SELECT treinador.nome AS 'Nome do Treinador novato',
       nadador.nome AS 'Nome do nadador',
       treinadorExperiente.nome AS 'Nome do treinador experiente'
FROM treinador
JOIN nadador 
	ON treinador.id = nadador.treinador_id
JOIN orientador 
	ON treinador.id = orientador.treinador_novato_id
JOIN treinador AS treinadorExperiente 
	ON orientador.treinador_experiente_id = treinadorExperiente.id
WHERE treinador.nome = 'Robson';

alter table treinador auto_increment = 10;

alter table nadador auto_increment = 100;















