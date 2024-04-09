-- tipos de atributos
-- Atributo identificador -> cahve primaria
-- Atributo Simples -> nao se divide em subparte (NomeCompleto)(depende da regra de negocio)
-- Atributo Composto -> deve ser divido em subpartes (endereço -> cep, número e complemento)
-- Atributo monovalorado -> (Tem somente 1 valor) -> bairro
-- Atributo multivalorado -> (Tem muitos valores) -> telefone, email
-- Atributo derivado -> (idade)->(deriva da dtNasc)

create database testeTrovo;

use testeTrovo;

create table funcionario(
	idFunc int primary key auto_increment,
    nome varchar(45),
    cep char(9), -- atributo composto: cep + numeEnd + complemento
    numEnd varchar(45),
    complemento varchar(45),
    telCelular varchar(45), -- atributo multivalorado: telFixo + telCelular 
    telFixo varchar(45)
);

insert into funcionario values
	(default, 'Pedro', '08485430', '260', 'Apto 42c', '11942170850', '11951516471'),
	(default, 'Trovo', '08485430', '535', 'Apto 21b', '11953576854', '11964645171'),
	(default, 'Souza', '08485430', '235', 'Apto 24b', '11971716451', '11954546471');
    
select * from funcionario;

create table dependente(
	idDep int, -- chave primaria composta
    fkFunc int,
    constraint pkComposta primary key (idDep, fkFunc),
    nome varchar(45),
    parentesco varchar(45),
    dtNasc date,
	constraint fkFuncDep foreign key (fkFunc)
		references funcionario(idFunc)
);

insert into dependente values
	(1, 1, 'Zeca', 'pai', '1990-01-01'),
	(2, 1, 'Leoncio', 'avô', '1960-05-01'),
	(1, 2, 'Mamãe Smurf', 'mãe', '1990-10-10');



