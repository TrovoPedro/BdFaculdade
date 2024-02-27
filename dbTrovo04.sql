create database dbTrovo;

use dbTrovo;

create table produto(
	idProduto int primary key auto_increment,
    nome varchar(50),
    validade date,
    categoria varchar(50),
    codigoBarras char(13),
	quantidadeProduto int
);

desc produto;
    
insert into produto values
	(null, 'Carregador USB-C', null, 'Eletronicos', '038645718234', 54);
    
insert into produto values
	(null, 'Carregador USB-C', null, 'Eletronicos', '038645718234', 54);
    
insert into produto values
	(null, 'Carregador USB-C', null, 'Eletronicos', '038645718234', 54),
    (null, 'Carregador portatil', null, 'Eletronicos', '9456873284587', 20);
    
insert into produto(nome, validade, categoria, codigoBarras, quantidadeProduto) values
	('Tomate', '2024-03-10', 'Alimenticio', '30495024521', 100),
    	('Maçã', '2024-03-10', 'Alimenticio', '30495024521', 100);
        
select * from produto;

-- comece com a determinada letra
select * from produto 
	where nome like'c%';
    
-- termine com a determinada letra
select * from produto 
	where nome like'%l';
    
-- contenha as letras
select * from produto 
	where nome like'%ga%';

-- comece com uma letra e termine com a outra
select * from produto 
	where nome like'c%l';
    
-- segunda letra
select * from produto 
	where nome like'_a%';
    
-- pega a penultima letra
select * from produto 
	where nome like '%i_';
    
-- modificando a tabela, adicionando uma coluna nova
alter table produto
	add column empresa varchar(50);
    
desc produto;

-- modifica a tabela
alter table produto
	modify column empresa varchar(60);
    
-- renomeia a tabela
alter table produto
	rename column empresa to marca;
    
-- adicionando novos valores as colunas
update produto
	set marca = 'LG',
    quantidadeProduto = 100
    where idProduto = '1';
    
-- adicionando novos valores em dois campos da coluna
update produto
	set marca = 'LG'
    where idProduto = '2';
    
-- alterando um campo em dois id diferentes
update produto
	set quantidadeProduto = 10
	where idProduto in('2', '3');
    
select * from produto;

-- dropandp a coluna marca
alter table produto
	drop column marca;
    
-- checagem de categoria
alter table produto
	add constraint chkCategoria
		check(categoria in('alimenticio', 'Eletronicos', 'limpesa', 'material'));
        
alter table produto
	drop constraint chkCategoria;
        
insert into produto values
	(null, 'Celular', null, 'Eletronicos', '0485678347183', 100);
    
insert into produto values
	(null, 'Desinfetante', '2024-03-10', 'Limpesa', '0485678347183', 100);
    
insert into produto values
	(null, 'Lapís', null, 'Material', '0485678347183', 100);
    
select * from produto;

delete from produto
	where idProduto = '2';
        
delete from produto 
	where idProduto in('5', '6');
    
truncate table produto;

select * from produto;

drop database dbTrovo;

delete from produto;

