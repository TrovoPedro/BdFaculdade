create database sprint2;

use sprint2;

create table pais (
	idPais int primary key auto_increment,
    nomePais varchar(30),
    capital varchar(40)
);

create table atleta (
	idAtleta int primary key auto_increment,
    nomeAtleta varchar(40),
    modalidade varchar(40),
    qtdMedalha int,
    fkAtleta int not null,
    constraint fkAtletaPais foreign key (fkAtleta)
		references pais(idPais)
);

insert into atleta values
	(default, 'Pedro', 'futebol', 76, 1),
	(default, 'Cleber', 'Volei', 40, 3),
	(default, 'Fernanda', 'Futebol Americano', 1, 4),
	(default, 'Monica', 'volei', 10, 2),
	(default, 'Monique', 'futebol', 5, 1);

insert into pais values 
	(default, 'Brasil', 'Brasilia'),
	(default, 'Argentina', 'Buenos Aires'),
	(default, 'Chile', 'Santiago'),
	(default, 'Estados Unidos', 'Washington');
    
update atleta set fkAtleta = 4
	where idAtleta = 1;
    
update atleta set fkAtleta = 1
	where idAtleta = 2;
    
update atleta set fkAtleta = 4
	where idAtleta = 5;
    
select * from atleta join pais 
	on idPais = fkAtleta;
    
select nomeAtleta, nomePais from atleta join pais
	on idPais = fkAtleta;
    
select * from atleta join pais 
	on idPais = fkAtleta
	where capital = 'brasilia';
    
    
create table musica (
	idMusica int 


);
    

    


