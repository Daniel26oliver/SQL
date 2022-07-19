create database if not exists music;
use music;

create table if not exists autor
(
	codigo_autor int auto_increment,
    nome_autor varchar(60),
    primary key(codigo_autor)
);

create table if not exists musica
(
	codigo_musica int auto_increment,
    nome_musica varchar(60),
    duracao time,
    primary key(codigo_musica)
);

create table if not exists gravadora
(
	codigo_gravadora int auto_increment,
    nome_gravadora varchar(60),
    endereco varchar(60),
    telefone varchar(20),
    contato varchar(20),
    url varchar(80),
    primary key(codigo_gravadora)
);

create table if not exists cd
(
	codigo_cd int auto_increment,
    codigo_gravadora int,
    nome_cd varchar(60),
    preco_venda decimal(16,2),
    data_lancamento date,
    cd_indicado int,
    primary key(codigo_cd),
    foreign key(codigo_gravadora) references gravadora(codigo_gravadora) on update cascade on delete restrict,
    foreign key(cd_indicado) references cd(codigo_cd) on update cascade on delete restrict
);

create table if not exists item_cd
(
	codigo_cd int,
	codigo_musica int,
	numero_faixa int,
    primary key(codigo_cd,codigo_musica),
    foreign key(codigo_cd) references cd(codigo_cd) on update cascade on delete restrict,
    foreign key(codigo_musica) references musica(codigo_musica) on update cascade on delete restrict
);

create table if not exists musica_autor
(
	codigo_musica int,
	codigo_autor int,
    primary key(codigo_musica,codigo_autor),    
    foreign key(codigo_autor) references autor(codigo_autor) on update cascade on delete restrict,
    foreign key(codigo_musica) references musica(codigo_musica) on update cascade on delete restrict
);


/* TABELA AUTOR */
insert into autor
values(1,'Renato Russo');
insert into autor(nome_autor)
values('Tom Jobim'),('Chico Buarque'),('Dado Villa-Lobos'),('Marcelo Bonfá'),('Ico Ouro Preto'),('Vinicius de Moraes');


/*  TABELA GRAVADORA */
insert into gravadora(nome_gravadora,endereco,url) values
('EMI','Rua Dutra, km 229,8','www.emi-music.com.br'),
('Polugram',null,null);


/* TABELA MUSICA*/
insert into musica(nome_musica,duracao) values 
('Será','00:02:28'),
('Ainda é Cedo','00:03:55'),
('Geração Coco-cola','00:02:20'),
('Eduardo e Mônica','00:04:32'),
('Tempo Perdido','00:05:00'),
('Indios','00:04:23'),
('Que país é esse','00:03:04'),
('Faroeste Cabloco','00:09:03'),
('Há Tempos','00:03:16'),
('Pais e Filhos','00:05:06'),
('Meninos e Meninas','00:03:22'),
('Vento no Litoral','00:06:05'),
('Perfeição','00:04:35'),
('Giz','00:03:20'),
('Dezesseis','00:05:28'),
('Antes das seis','00:03:09'),
('Menino,Eu vi','00:03:25'),
('Eu te amo','00:03:06'),
('Piano na Mangueira','00:02:23'),
('A violeira','00:02:54'),
('Anos Dourados','00:02:56'),
('Olha, Maria','00:03:55'),
('Biscate','00:03:20'),
('Retrato em Preto e Branco','00:03:03'),
('Falando de Amor','00:03:20'),
('Pois é ','00:02:48'),
('Noites dos Mascarados','00:02:42'),
('Sabiá','00:03:20'),
('Imagina','00:02:52'),
('Bate-boca','00:04:14');

/* TABELA CD*/
insert into cd(nome_cd,preco_venda,codigo_gravadora,cd_indicado) values
('Mais do Mesmo',15.00,1,1),
('Bate-boca',12.00,2,1);


/*   TABELA ITEM DE CD  */
insert into item_cd(codigo_cd,codigo_musica,numero_faixa) values
(1,1,1),(1,2,2),(1,3,3),(1,4,4),(1,5,5),
(1,6,6),(1,7,7),(1,8,8),(1,9,9),(1,10,10),
(1,11,11),(1,12,12),(1,13,13),(1,14,14),(1,15,15),
(1,16,16),(2,17,1),(2,18,2),(2,19,3),(2,20,4),
(2,21,5),(2,22,6),(2,23,7),(2,24,8),(2,25,9),
(2,26,10),(2,27,11),(2,28,12),(2,29,13),(2,30,14);


/* tabela musica_autor*/
insert into musica_autor(codigo_musica,codigo_autor) values
(1,1),
(2,5),(2,6),
(3,4),(3,5),(3,1),
(4,1),(4,4),
(5,1),
(6,1),
(7,1),
(8,1),
(9,1),(9,4),(9,5),
(10,1),(10,4),(10,5),
(11,1),(11,4),(11,5),
(12,1),(12,4),(12,5),
(13,1),(13,4),(13,5),
(14,1),(14,4),(14,5),
(15,1),(15,4),(15,5),
(16,1),(16,4),(16,5),
(17,2),(17,3),
(18,2),(18,3),
(19,2),(19,3),
(20,2),(20,3),
(21,2),(21,3),
(22,2),(22,3),(22,7),
(23,3),
(24,2),(24,3),
(25,2),
(26,2),(26,3),
(27,3),
(28,2),(28,3),
(29,2),(29,3),
(30,3);








