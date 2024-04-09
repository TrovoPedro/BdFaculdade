create database campanha;

use campanha;

create table organizador (
	idOrg int primary key auto_increment,
    nomeOrg varchar(45),
    enderecoOrg varchar(45),
    email varchar(45),
    fkOrganizadorExp int
)auto_increment = 30;

create table campanha(
	idCampanha int primary key auto_increment,
	doacaoCampanha varchar(45),
    instituicao varchar(45),
    fkOrganizador int
)auto_increment = 500;

alter table organizador 
	add constraint fkOrganizadorCampanha foreign key(fkOrganizadorExp)
		references organizador(idOrg);
        
alter table campanha
	add constraint fkCampanhaOrganizador foreign key(fkOrganizador)
		references organizador(idOrg);

insert into organizador(idOrg, nomeOrg, enderecoOrg, email) values
	(default, "Pedro Trovo", "Rua Triunfo 244", "pedrotrovo@gmail.com"),
	(default, "Ronaldo Fernando", "Rua arroio 260", "ronaldo@gmail.com"),
	(default, "Fernando Ronaldo", "Rua arroio arapongas 211", "fernando@gmail.com");

insert into campanha values 
	(default, "roupa", "ratiufli", 30),
	(default, "mascara", "ratiuflai", 31),
	(default, "luva", "xurere", 32);
    
alter table organizador
	add column tipo varchar(10);
    
alter table	organizador
	add constraint chkTipo
	check(tipo in('exp', 'novato'));
    
update organizador 
	set tipo = 'exp'
    where idOrg = 30;

update organizador 
	set tipo = 'exp'
    where idOrg = 31;
    
update organizador 
	set tipo = 'novato'
    where idOrg = 32;
    
update organizador 
	set fkOrganizadorExp = 30
    where idOrg = 32;
    
update organizador 
	set fkOrganizadorExp = 30
    where idOrg = 30;
    
update organizador 
	set fkOrganizadorExp = 31
    where idOrg = 31;
    
select * from organizador;

select * from campanha;

select * from organizador join campanha
	on fkOrganizador = idOrg;
    
select * from organizador join campanha
	on fkOrganizador = idOrg
    where idOrg = 30;
    
select organizadorEx.* from organizador as organizadorEx join organizador as novato
	on organizadorEx.idOrg = novato.fkOrganizadorExp;
    
select organizadorEx.* from organizador as organizadorEx join organizador as novato join campanha
	on organizadorEx.idOrg = novato.fkOrganizadorExp;
