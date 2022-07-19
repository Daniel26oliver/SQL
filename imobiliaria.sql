create database if not exists imobiliaria;

use imobiliaria;

create table if not exists vendedor(
cdvendedor integer primary key auto_increment,
nmvendedor varchar(40),
nmendereco varchar(40),
nrcpf decimal(11),
nmcidade varchar(20),
nmbairro varchar(20),
sgestado char(2),
telefone varchar(20),
email varchar(80)
);

create table if not exists imovel(
cdimovel integer primary key auto_increment,
cdvendedor integer,
cdbairro integer,
cdcidade integer,
sgestado char(2),
nmendereco varchar(40),
nrareautil decimal(10,2),
nrareatotal decimal(10,2),
dsimovel varchar(300),
vlpreco decimal(16,2),
nrofertas integer,
stvendido char(11),
dtlancto date,
imovel_indicado integer
);

create table if not exists comprador(
cdcomprador integer primary key auto_increment,
nmcomprador varchar(40),
nmendereco varchar(40),
nrcpf decimal(11),
nmcidade varchar(20),
nmbairro varchar(20),
sgestado char(2),
telefone varchar(20),
email varchar(80)
);

create table if not exists oferta(
cdimovel integer,
cdcomprador integer,
vloferta decimal(16,2),
dtoferta date,
primary key(cdimovel,cdcomprador),
constraint fk_imovel foreign key(cdimovel) references imovel(cdimovel) on update cascade on delete restrict,
constraint fk_comprador foreign key(cdcomprador) references comprador(cdcomprador) on update cascade on delete restrict
);

create table if not exists estado(
sgestado char(2) primary key,
nmestado varchar(20)
);

create table if not exists cidade(
cdcidade integer auto_increment,
nmcidade varchar(20),
sgestado char(2),
primary key(cdcidade,sgestado),
foreign key(sgestado) references estado(sgestado) on update cascade on delete restrict
);

create table if not exists bairro(
cdbairro integer auto_increment,
cdcidade integer,
sgestado char(2),
primary key(cdbairro,cdcidade,sgestado),
foreign key(cdcidade) references cidade(cdcidade) on update cascade on delete restrict,
foreign key(sgestado) references estado(sgestado) on update cascade on delete restrict,
nmbairro varchar(20)
);

create table if not exists faixa_imovel(
cdfaixa integer auto_increment primary key,
nmfaixa varchar(30),
vlminimo decimal(14,2),
vlmaximo decimal(14,2)
);

insert into estado(sgestado,nmestado) values
('SP','São Paulo'),
('RJ','Rio de Janeiro');

insert into cidade(cdcidade,nmcidade,sgestado) values
('1','São Paulo','SP'),
('2','Santo André','SP'),
('3','Campinas','SP'),
('4','Rio de Janeiro','RJ'),
('5','Niterói','RJ');

insert into bairro(cdbairro,nmbairro,cdcidade,sgestado) values
('1','Jardins','1','SP'),
('2','Morumbi','1','SP'),
('3','Aeroporto','1','SP'),
('1','Aeroporto','1','RJ'),
('2','Flamengo','1','RJ');

insert into vendedor(cdvendedor,nmvendedor,nmendereco,email) values
('1','Maria da Silva','Rua do Grito, 45','msilva@novatec.com.br'),
('2','Marcos Andrade','Av. da Saudade, 325','mandrade@novate.com.br'),
('3','Andre Cardoso','Av. Brasil, 401','acardoso@novatec.com.br'),
('4','Tatiana Souza','Rua do Imperador, 778','tsouza@novatec.com.br');

insert into imovel(cdimovel,cdvendedor,cdbairro,cdcidade,sgestado,nmendereco,nrareautil,nrareatotal,vlpreco,imovel_indicado) values
('1','1','1','1','SP','Al Tiete, 3304 AP 101','250','400','180000',null),
('2','1','2','1','SP','Av. Morumbi, 2230','150','250','135000','1'),
('3','2','1','1','RJ','R. Gal Osorio, 445 AP 34','250','400','185000','2'),
('4','2','2','1','RJ','R. D. Pedro I, 882','120','200','110000','1'),
('5','3','3','1','SP','Av. Rubem Berta, 2355','110','200','95000','4'),
('6','4','1','1','RJ','R. Getúlio Vargas, 552','200','300','99000','5');

insert into comprador(cdcomprador,nmcomprador,nmendereco,email) values
('1','Emmanuel Antunes','R. Saraiva, 452','eantunes@novatec.com.br'),
('2','Joana Pereira','Av. Portugal, 52','jpereira@novatec.com.br'),
('3','Ronaldo Campelo','R. Estados Unidos, 790','@novatec.com.br'),
('4','Manfred Augusto','Av. Brasil, 351','@novatec.com.br');

insert into oferta(cdcomprador,cdimovel,vloferta,dtoferta) values
('1','1','170000','10/01/02'),
('1','3','180000','10/01/02'),
('2','2','135000','15/02/02'),
('2','4','100000','15/02/02'),
('3','1','160000','05/01/02'),
('3','2','140000','20/02/02');

insert into faixa_imovel(cdfaixa,nmfaixa,vlminimo,vlmaximo) values
('1','BAIXO','0','105000'),
('2','MÉDIO','105001','180000'),
('3','ALTO','180001','999999');





