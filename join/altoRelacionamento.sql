create database faculdade;

use faculdade;

create table projeto(
	idProjeto int primary key auto_increment,
    nomeProjeto varchar(45),
    descricao varchar(45)
);

create table aluno(
	ra char(8) primary key,
    nomeAluno varchar(45),
    telefone varchar(11),
    fkProjeto int,
    constraint fkProjetoAluno
		foreign key(fkProjeto) 
		references projeto (idProjeto),
    fkRepresentante char(8),
    constraint fkRepresentanteAluno
		foreign key(fkRepresentante)
        references aluno (ra)
);

insert into projeto (nomeProjeto, descricao) values
	('MorangoTech', 'Solução para monitorar morangos'),
	('AcquaTech', 'Solução para monitorar aquários'),
	('ServerTemp', 'Solução para monitorar servidores');
    
select * from projeto;

insert into aluno (ra, nomeAluno, telefone, fkProjeto, fkRepresentante) values
	('0124001', 'Pedro', '912345678', 1, null),
	('0124002', 'Rodolfo', '123456789', 1, '0124001'),
	('0124003', 'Alberto', '987654321', 1, '0124001'),
	('0124004', 'Diego', '78965432', 2, null),
	('0124005', 'Cluadio', '21345678', 2, '0124004'),
	('0124006', 'Fernando', '43215678', 2, '0124004'),
	('0124007', 'Fernanda', '21345678', 3, null),
	('0124008', 'Mauricia', '65478354', 3, '0124007'),
	('0124009', 'Cluadia', '56342788', 3, '0124007');
    
select * from aluno;

select * from aluno join projeto
	on fkProjeto = idProjeto;

select aluno.nomeAluno as Nome,
	projeto.nomeProjeto as Projeto
	from aluno join projeto 
		on fkProjeto = idProjeto;
        
select * from aluno as representante
	join aluno as representado
		on representado.ra = representante.ra;
