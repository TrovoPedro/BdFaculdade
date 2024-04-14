create database Empresa;

use Empresa;

create table empresa (
    id_empresa int primary key,
    nome_empresa varchar(45)
);

create table funcionario (
    id_funcionario int primary key,
    nome_funcionario varchar(100) not null,
    id_empresa int,
    id_supervisor int,
    foreign key (id_empresa) references empresa(id_empresa),
    foreign key (id_supervisor) references funcionario(id_funcionario)
);


insert into empresa (id_empresa, nome_empresa)
values (1, 'empresa A'),
       (2, 'empresa B');


insert into funcionario (id_funcionario, nome_funcionario, id_empresa, id_supervisor)
values (1, 'Pedro', 1, null),         
       (2, 'Trovo', 1, 1),            
       (3, 'Souza', 2, null),        
       (4, 'Jurandir', 2, 3);             

select funcionario.nome_funcionario as funcionario,
supervisor.nome_funcionario as supervisor from funcionario as funcionario join funcionario as supervisor 
	on funcionario.id_supervisor = supervisor.id_funcionario;