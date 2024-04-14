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
