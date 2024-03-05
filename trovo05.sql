create database trovodb;

use trovodb;

create table funcionario(
	id int primary key auto_increment,
    nome varchar(60) not null,
    salario decimal(6,2) default 1.99,
    dtAtual datetime default current_timestamp
)auto_increment = 100;

-- not null = campo nao pode ser nulo
-- dafault = se o campo for nulo inserir o padrao
-- unique = campo que nao pode se repetir
-- concat() = concatenação

alter table funcionario
	add column cpf char(11) unique;
    
desc funcionario;

insert into funcionario values
	(default, 'Jesse', 100.00, default,'02323412290');

    
select * from funcionario;

insert into funcionario (nome) values
	('Walter');
    
-- formatando a data
select date_format(dtAtual, '%d/%m/%Y %h:%m')
	from funcionario;
    
select concat(nome, salario)
	from funcionario;
    
select concat(nome, ' ', salario)
	from funcionario;
    
select concat('O salário do ',nome, ' é R$', salario)
	from funcionario;
    
-- alias
select salario from funcionario;
select salario as Salário from funcionario;

select nome as 'Nome do funcionário',
	concat('R$ ', salario) as Salário
	from funcionario;
    
insert into funcionario (nome) values
	('claudio');
    
select * from funcionario;

truncate funcionario;

insert into funcionario (nome) values
	('Danilo');
    
alter table funcionario 
	auto_increment = 100;
    
insert into funcionario (nome) values 
	('pedro');
    
delete from funcionario 
	where id = 1;
    
select * from funcionario;

    
-- not null
-- unique
-- default
-- alias
-- concat()

-- números decimais
	-- float - 7 digitos
    -- double - 15 digitos
    -- decima() - 32 digitos
		-- decimal(6,3)? 345.124
		-- decimal(7,6)? 3.451245 numero antes da virgula é a quantidade total e o numero depois da virgula é a quantidade de numeros dps da virgula;

