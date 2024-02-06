create database dbTrovo;

use dbTrovo;

create table aluno (
	ra char(8) primary key,
    nome varchar(100),
    bairro varchar(45)
    
);

describe aluno;

insert into aluno values
	('03241006', 'Pedro Trovo', 'Cidade Tiradentes'),
	('03241001', 'Trovo', 'Cidade Tiradentes'),
	('03241022', 'Pedro Trovo', 'Cidade Tiradentes');
    
select * from aluno;

select nome from aluno
	where nome = 'Trovo';

select * from aluno 
	where ra = '03241006';
    
select * from aluno
	where nome like 'T%';
    
select * from aluno 
	 where nome like '%O';

select * from aluno 
	where bairro like '%vis%';
    
select * from aluno order by nome;

select * from aluno order by nome desc;

select * from aluno
	where bairro like '_O%';

select * from aluno 
	where bairro like '%E_';
    
select * from aluno 
	where nome like 'T%' and bairro like '%E%';

