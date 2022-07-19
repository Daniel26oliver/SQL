create database if not exists escolaDanielc;
use escolaDanielc;

create table if not exists professor
(
    idProfessor int not null auto_increment primary key,
    nomeProfessor varchar(100) not null,
    telefone varchar(17),
    estado char(2) default 'RJ',
    email varchar(100)
);
create table if not exists turma
(
    idTurma int not null auto_increment primary key,
    dataInicio date,
    dataTermino date,
    idProfessor int not null,
    Turno varchar(6) not null
    check (upper(turno)='M' or upper(turno)='T' or upper(turno)='N'),
    foreign key(idProfessor)
    references professor(idProfessor)
    on update cascade
    on delete restrict
);
create table if not exists aluno
(
    idAluno int not null auto_increment primary key,
    nomeAluno varchar(100) not null,
    telefone varchar(17),
    estado char(2) default 'RJ',
    email varchar(100),
    idTurma int not null,
    foreign key(idTurma)
    references turma(idTurma)
    on update cascade
    on delete restrict
);
insert into professor(nomeProfessor,telefone,email)
values
('Jeany Laranjeira','(21)1111-1111','jeany.laranjeira@rj.senac.br'),
('Renata Ávila','(21)3333-3333','renata.avila@rj.senac.br');
insert into turma(idProfessor,dataInicio,dataTermino,turno)
values
(2,'2022/01/10','2022/12/10','N'),
(1,'2022/01/10','2022/12/10','T');
insert into aluno(nomeAluno,telefone,idTurma)
value
('José da Silva','(21)1111-1111',1),
('Maria das Coves','(21)2222-2222',1),
('Manuel Antares','(21)3333-3333',2),
('Jorge Antunes','(21)4444-4444',2),
('Rita Valadares','(21)5555-5555',2);
  
    
    