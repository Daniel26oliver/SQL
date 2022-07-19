create database if not exists loja;
use loja;

CREATE TABLE IF NOT EXISTS produto (
    idProduto INT AUTO_INCREMENT,
    descricao VARCHAR(50) NOT NULL,
    precoUnitario DECIMAL(16 , 2 ),
    PRIMARY KEY (idProduto)
);

CREATE TABLE IF NOT EXISTS cliente (
    idCliente INT AUTO_INCREMENT,
    nome VARCHAR(100),
    endereco VARCHAR(100),
    bairro VARCHAR(30),
    cep VARCHAR(10),
    cidade VARCHAR(30),
    estado CHAR(2),
    telefone VARCHAR(14),
    email VARCHAR(100),
    PRIMARY KEY (idCliente)
);

CREATE TABLE IF NOT EXISTS pedido (
    idPedido INT AUTO_INCREMENT,
    idCliente INT,
    dataPedido DATE,
    PRIMARY KEY (idPedido),
    FOREIGN KEY (idCliente)
        REFERENCES cliente (idCliente)
        ON UPDATE CASCADE ON DELETE RESTRICT
);

CREATE TABLE IF NOT EXISTS detalhesPedido (
    idPedido INT,
    idProduto INT,
    quantidade INT,
    PRIMARY KEY (idPedido , idProduto),
    CONSTRAINT fk_pedido FOREIGN KEY (idPedido)
        REFERENCES pedido (idPedido)
        ON UPDATE CASCADE ON DELETE RESTRICT,
    CONSTRAINT fk_produto FOREIGN KEY (idProduto)
        REFERENCES produto (idProduto)
        ON UPDATE CASCADE ON DELETE RESTRICT
);



insert into produto(descricao,precoUnitario) values 
('Lápis','1.50'),
('Caneta','2.50'),
('Borracha','1.20'),
('Apontador','3.80'),
('Lapiseira','7.50'),
('Caderno 96 fls','12.50'),
('Caderno 10 matérias','22.50'),
('Caderno 12 matérias','25.90'),
('Cola','4.50'),
('Ponta 0.7','3.80');

insert into cliente(nome,bairro, cidade, estado, email) values 
('Juca Chaves','Campo Grande', 'Rio de Janeiro', 'RJ','juca.chaves@gmail.com'),
('Maria Neves','Realengo', 'Rio de Janeiro', 'RJ','maria.neves@gmail.com'),
('Marcus Ferreira','Copacabana', 'Rio de Janeiro', 'RJ','marcus.ferreira@gmail.com'),
('Paulo Marques','Tijuca', 'Rio de Janeiro', 'RJ','paulo.marques@gmail.com'),
('Pedro Xavier','Bangu', 'Rio de Janeiro', 'RJ','pedro.xavier@gmail.com');

insert into pedido(idCliente, dataPedido) values 
(1,'2016-12-20'),
(5,'2016-12-23'),
(3,'2017-01-08'),
(1,'2017-01-10'),
(3,'2017-01-12');

insert into detalhesPedido(idPedido,idProduto,quantidade) values 
(1,1,1),
(1,2,5),
(1,8,3),
(1,10,1),
(2,2,1),
(2,3,1),
(3,1,1),
(3,5,1),
(3,9,1),
(3,10,2),
(4,10,3),
(5,2,10),
(5,3,3);