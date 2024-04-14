create table pessoa (
    id_pessoa int primary key auto_increment,
    nome varchar(45)
);

create table endereco (
    id_endereco int primary key auto_increment,
    rua varchar(100) not null,
    cidade varchar(50) not null,
    id_pessoa int,
    foreign key (id_pessoa) references pessoa(id_pessoa)
);

create table sombra (
    id_sombra int primary key auto_increment,
    id_pessoa_original int,
    id_pessoa_sombra int,
    foreign key (id_pessoa_original) references pessoa(id_pessoa),
    foreign key (id_pessoa_sombra) references pessoa(id_pessoa)
);

insert into pessoa (nome) values
('Pedro'),
('Trovo'),
('Souza');


insert into endereco (rua, cidade, id_pessoa) values
('rua 1', 'são paulo', 1),
('rua 2', 'Rio de Janeiro', 2),
('rua 3', 'Buenos Aires', 3);

insert into sombra (id_pessoa_original, id_pessoa_sombra) values
(1, 1),
(2, 2),
(3, 3);

select pessoa.nome, endereco.rua
from pessoa join endereco on pessoa.id_pessoa = endereco.id_pessoa;

select pessoaoriginal.nome as pessoa_original, pessoasombra.nome as sombra
from sombra join pessoa as pessoaoriginal 
	on sombra.id_pessoa_original = pessoaoriginal.id_pessoa
join pessoa as pessoasombra 
	on sombra.id_pessoa_sombra = pessoasombra.id_pessoa;