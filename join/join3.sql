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
	(default, "roupa", "", ""),
	(default, "mascara", "", ""),
	(default, "", "", "");


