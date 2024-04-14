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
    













