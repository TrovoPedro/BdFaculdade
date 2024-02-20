create database sprint1;

use sprint1;

-- decimal precisa especificar a quantidade de caracteres dps da virgula max(32)
-- float max (7)
-- double max(15)

create table pessoa(
	id int primary key,
    nome varchar(50),
    altura float,
    dtNasc date	
);

desc pessoa;
desc table pessoa;

insert into pessoa value
	(1, 'Pedro', 1.80, '2005-05-30');
    
select * from pessoa;

alter table pessoa modify column id int auto_increment;
desc pessoa;

insert into pessoa values 
	(default, 'carolina', 1.60, '2005-01-20');
    
select * from pessoa;

insert into pessoa (nome, altura) values 
	('Rogerio', 1.54);

update pessoa set nome = 'Carolina'
	where id = '2';
    
select * from pessoa;

update pessoa set dtNasc = '2004-02-11'
	where id = 3;
    
select * from pessoa;

delete from pessoa 
	where id = 3;
    
select * from pessoa;

alter table pessoa add column salario decimal(10,2);

select * from pessoa;

update pessoa set salario = 100000.22
	where id = 1;
    
select * from pessoa;

update pessoa set salario = 1000000.21
	where id = 1 or id = 2;
    
select * from pessoa;

alter table pessoa 
	drop column altura;

desc pessoa;

alter table pessoa 
	rename column nome to nomeCompleto;

desc pessoa;

-- limpa a tabela td
truncate table pessoa;

select * from pessoa;

insert into pessoa (nomeCompleto) value
	('Pedro Trovo');
    
select * from pessoa;

insert into pessoa (nomeCompleto, dtNasc, salario) value
	('Pedro', '2005-02-22', 1000000.00);
    

alter table pessoa
	add column genero char(1);
    
-- constraint = configuração/restrição

alter table pessoa
	add constraint chkGenero
		check (genero in ('f', 'n'));

insert into pessoa (nomeCompleto, genero) values
	('Fernanda', 'D'); 
-- erro por que so pode F ou M

insert into pessoa (nomeCompleto, genero) values
	('Fernanda', 'f'); 
    
alter table pessoa
	add column email varchar(50),
		add constraint chkEmail
			check (email like '%@');
            
alter table pessoa
	drop constraint chkGenero;

alter table pessoa
	add constraint chkGenero
		check (genero in ('f', 'm'));
        
insert into pessoa (nomeCompleto, genero) values 
	('Fernado', 'm');




