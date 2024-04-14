create database petShop;

use petShop;

create table dono (
    id_dono int primary key auto_increment,
    nome varchar(100) not null
);


create table pet (
    id_pet int primary key auto_increment,
    nome varchar(100) not null,
    id_dono int,
    id_mae_pet int,
    foreign key (id_dono) references dono(id_dono),
    foreign key (id_mae_pet) references pet(id_pet)
);


create table relacao_pet_mae (
    id_pet_filho int,
    id_pet_mae int,
    foreign key (id_pet_filho) references pet(id_pet),
    foreign key (id_pet_mae) references pet(id_pet),
    primary key (id_pet_filho, id_pet_mae)
);


insert into dono (nome) values
('Pedro'),
('Trovo');

insert into pet (nome, id_dono, id_mae_pet) values
('Doguinho', 1, null),
('Rex', 1, 2),
('Penelope', 2, null),
('maya', 2, 2);


insert into relacao_pet_mae (id_pet_filho, id_pet_mae) values
(2, 1),
(3, 2),
(4, 3);

select p.nome as nome_pet, d.nome as nome_dono, m.nome as nome_mae
from pet p join dono d on p.id_dono = d.id_dono
join pet m on p.id_mae_pet = m.id_pet;
