create database alunoProjeto;

use alunoProjeto;

create table aluno(
	raAluno int primary key not null,
    nomeAluno varchar(45),
    telefone char(11),
    fkProjeto int,
    fkAlunoRep int
);

create table projeto(
	idProjeto int primary key not null auto_increment,
    nomeProjeto varchar(45),
    descProjeto varchar(150)
);

alter table aluno
	add constraint fkProjetoAluno foreign key(fkProjeto)
	references projeto(idProjeto);
    
alter table aluno
	add constraint fkAlunoRepresentante foreign key(fkAlunoRep)
	references aluno(raAluno);
    
insert into aluno (raAluno, nomeAluno, telefone)values 
	(090990, "Pedro Trovo", "11986785493"),
	(090231, "José Bonifácio", "11912332457");
    
insert into projeto values 
	(default, "Sprint1", "Entregar os projetos pedidos pelo professor"),
	(default, "Sprint2", "Entregar os projetos pedidos pelo professor");
    
update aluno set fkProjeto = 1
	where raAluno = 90231;
    
update aluno set fkProjeto = 2
	where raAluno = 90990;
    
update aluno set fkAlunoRep = 90231
	where raAluno = 90990;
    
update aluno set fkAlunoRep = 90990
	where raAluno = 90231;

select * from aluno;
select * from projeto;

select * from aluno join projeto
	on idProjeto = fkProjeto;
    
select representado.* from aluno as representado join aluno as representante
	on representado.raAluno = representante.fkAlunoRep;
    
select * from aluno join projeto
	on idProjeto = fkProjeto
	where nomeProjeto = "Sprint1";


