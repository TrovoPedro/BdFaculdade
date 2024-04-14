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












