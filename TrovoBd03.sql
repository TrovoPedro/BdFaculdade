create database dbSprint1;

use dbSprint1;

create table atleta(
	id int primary key,
    nome varchar(40),
    modalidade varchar(40),
    qtdMedalha int
);

insert into atleta(id, nome, modalidade, qtdMedalha) values
	(1, 'Pedro', 'futebol', '7'),
	(2, 'João', 'futebol', '3'),
	(3, 'Rodrigo', 'volei', '10'),
	(4, 'Fernando', 'volei', '17'),
	(5, 'Claudio', 'boxe', '1'),
	(6, 'Fernanda', 'boxe', '13');
    
select * from atleta;

update atleta set qtdMedalha = '2'
	where id = 1;
    
update atleta set qtdMedalha = '5'
	where id = 2 or id = 3;
    
update atleta set nome = 'Jerivaldo'
	where id = 4;
    
alter table atleta
	add column dtNasc date;

update atleta set dtNasc = '2003-02-02'
	where id = '1';
    
update atleta set dtNasc = '2003-04-11'
	where id = '2';

update atleta set dtNasc = '2003-02-02'
	where id = '3';

update atleta set dtNasc = '2012-07-12'
	where id = '4';

update atleta set dtNasc = '2001-02-02'
	where id = '5';

update atleta set dtNasc = '2005-04-02'
	where id = '6';
    
delete from atleta
	where id = 5;

select * from atleta 
	where modalidade != 'natação';
    
select * from atleta
	where qtdMedalha >= 3;

alter table atleta
	modify column modalidade varchar(60);
    
truncate atleta;

create table musica(
	idMusica int primary key,
    titulo varchar(40),
    artista varchar(40),
    genero varchar(40)
);

insert into musica(idMusica, titulo, artista, genero) values
	('1', 'Sim ou Não', 'Massaru', 'Hip-Hop/rap'),
	('2', 'Aham', 'Massaru', 'Hip-Hop/rap'),
	('3', 'Ritmada do Zelda', 'Mc BF, Mc BN, DJ YUZAK', 'Funk'),
	('4', 'Maquina do tempo', 'Matue', 'Hip-Hop/rap'),
	('5', 'Antes', 'Matue', 'Hip-Hop/rap'),
	('6', 'Count Me Out', 'Kendrick Lamar', 'Hip-Hop/rap'),
	('7', 'N95', 'Kendrick Lamar', 'Hip-Hop/rap');

select * from musica;

alter table musica
	add column curtidas int;
    
update musica set curtidas = '30'
	where idMusica= 1;
    
update musica set curtidas = '2020030'
	where idMusica= 2;

update musica set curtidas = '0'
	where idMusica= 3;
    
update musica set curtidas = '3'
	where idMusica= 4;
    
update musica set curtidas = '4440'
	where idMusica = 5;
    
update musica set curtidas = '30555555'
	where idMusica = 6;
    
update musica set curtidas = '30555'
	where idMusica = 7;

alter table musica 
	modify column artista varchar(80);
    
update musica set curtidas = 10000000
	where idMusica = 1;
    
update musica set curtidas = '2999'
	where idMusica = 2 or idMusica = 3;
    
update musica set titulo = 'Uma musica'
	where idMusica = 5;
    
delete from musica 
	where idMusica = 4;
    
select titulo from musica 
	where genero != 'funk';
    
select * from musica 
	where curtidas >= 20;
    
desc musica;
truncate musica;

create table filme(
	idFilme int primary key,
    titulo varchar(50),
    genero varchar(50),
    diretor varchar (40)
);

insert into filme(idFilme, titulo, genero, diretor) values
	('1', 'Esqueceram de Mim', 'Comédia/Infantil', 'Chris Columbus'),
	('2', 'Esqueceram de Mim 2 - Perdido em Nova York', 'Comédia/Infantil', 'Chris Columbus'),
	('3', 'Bastardos Inglorios', 'Guerra/Aventura', 'Quentin Tarantino'),
	('4', 'Corações de Ferro', 'Guerra/Ação', 'David Ayer'),
	('5', 'Até o Último Homem', 'Guerra/Thriller', 'Mel Gibson'),
	('6', 'O Pacto', 'Guerra/Ação', 'Guy Ritchie'),
	('7', 'Invocação do Mal 3: A Ordem do Demônio', 'Terror/Mistério', 'Michael Chaves');

select * from filme;

alter table filme
	add column protagonista varchar(50);
    
update filme set protagonista = 'Elon Musk'
	where idFilme = 1;
    
update filme set protagonista = 'Claudia Leita'
	where idFilme = 2;

update filme set protagonista = 'Luciano Hulk'
	where idFilme = 3;
    
update filme set protagonista = 'Claudia Raia'
	where idFilme = 4;
    
update filme set protagonista = 'Marcello'
	where idFilme = 5;
    
update filme set protagonista = 'Will Smith'
	where idFilme = 6;
    
update filme set protagonista = 'Darlan'
	where idFilme = 7;

alter table filme
	modify diretor varchar(150);
    
update filme set diretor = 'Roberto Carlos'
	where idFilme = 5;
    
update filme set diretor = 'Fernandinho Beira-Mar'
	where idFilme = 2;
    
update filme set diretor = 'Juliano'
	where idFilme = 7;
    
update filme set titulo = 'O massacre da serra eletrica'
	where idFilme = 6;
    
delete from filme
	where idFilme = 3;
    
select titulo from filme
	where genero != 'drama';

select * from filme
	where genero = 'suspense';
    
desc filme;

truncate filme;

create table professor(
	idProfessor int primary key,
    nome varchar(50),
    especialidade varchar(40),
    dtNasc date
);

insert into professor(idProfessor, nome, especialidade, dtNasc) values
	('1', 'Claudinei', 'Historia', '1978/12/01'),
	('2', 'Roberto', 'Portugues', '1999/05/05'),
	('3', 'Sidnei', 'Portugues', '1989/03/04'),
	('4', 'Vilma', 'Matematica', '1976/08/05'),
	('5', 'Veronica', 'Matematica', '1967/10/12'),
	('6', 'Gilmar', 'Educação Fisica', '1998/11/02');
    
select * from professor;

alter table professor
	add column funcao varchar(50);

alter table professor 
	add constraint chkFuncao
		check (funcao in ('monitor', 'assistinte', 'titular')); 
        
alter table professor
	drop constraint chkFuncao;
    
alter table professor 
	add constraint chkFuncao
		check (funcao in ('monitor', 'assistente', 'titular')); 
    
update professor set funcao = 'monitor'
	where idProfessor = 1;
    
update professor set funcao = 'assistente'
	where idProfessor = 2;
    
update professor set funcao = 'assistente'
	where idProfessor = 3;
    
update professor set funcao = 'titular'
	where idProfessor = 4;
    
update professor set funcao = 'monitor'
	where idProfessor = 5;
    
update professor set funcao = 'titular'
	where idProfessor = 6;
		
insert into professor value
	(7, 'Robert', 'Banco de Dados', '1990/02/02', 'assistente');
    
delete from professor
	where idProfessor = 5;
    
select nome from professor 
	where funcao = 'titular';
    
select especialidade, dtNasc from professor 
	where funcao = 'monitor';
    
update professor set dtNasc = '2000/02/11'
	where idProfessor = 3;
    
truncate professor;

create table curso(
   idCurso int primary key,
   nome varchar(50),
   sigla varchar(3),
   coordenador varchar(60)
);

insert into curso(idCurso, nome, sigla, coordenador) values
   ('1', 'Sistemas de Informacao', 'Sis', 'Ronaldo'),
   ('2', 'Analise e Desenvolvimeto de Sistemas', 'Ads', 'Gilvan'),
   ('3', 'Ciencia da Computacao', 'Cco', 'Fernanda');

select * from curso;

select coordenador from curso;

select * from curso 
    

    


