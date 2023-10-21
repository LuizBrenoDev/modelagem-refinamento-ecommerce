-- Esse script SQL seguirá um modelo original do curso da DIO.
-- No entanto, haverá mudanças significativas do modelo original como forma de refinamento.

-- Não haverá tabela "pagamentos" como no modelo original, pois tal controle ficaria a cargo da camada de aplicação do sistema no meu refinamento.

CREATE DATABASE IF NOT EXISTS shop;
USE shop;
DROP DATABASE shop;

CREATE TABLE cliente (
	id_cliente INT AUTO_INCREMENT PRIMARY KEY UNIQUE,
    nome VARCHAR(100) NOT NULL,
    cpf CHAR(11) NOT NULL UNIQUE,
    endereço VARCHAR(150) NOT NULL,
    status ENUM("PJ", "PF") NOT NULL
);

CREATE TABLE pedido (
	id_pedido INT NOT NULL UNIQUE,
    id_cliente_do_pedido INT NOT NULL UNIQUE,
    status ENUM('Concluído!', 'Cancelado', 'Em processamento...') NOT NULL,
    entrega_codigo_rastreio INT NOT NULL UNIQUE, 
    formas_pagamento VARCHAR(100) NOT NULL,
    CONSTRAINT foreign_cliente_pedido FOREIGN KEY (id_cliente_do_pedido) REFERENCES cliente(id_cliente),
    CONSTRAINT foreign_pedido_entrega FOREIGN KEY (entrega_codigo_rastreio) REFERENCES entrega (codigo_rastreio),
    PRIMARY KEY (id_pedido)
);

CREATE TABLE produto (
	id_produto INT AUTO_INCREMENT UNIQUE PRIMARY KEY,
    nome VARCHAR(100) NOT NULL,
    classificacao ENUM
    ('Livre para todos os públicos', 'Idade Superior ou igual a 14 anos', 'Idade igual ou superior a 16 anos', 'Idade igual ou superior a 18 anos') NOT NULL,
    categoria ENUM ('Eletrônicos', 'Brinquedos', 'Video Game', 'Livros', 'Filmes', 'Utensílios Domésticos', 'Ferramentas', 'Outros') NOT NULL,
    avaliacao FLOAT NOT NULL DEFAULT 0.0
);

CREATE TABLE estoque (
	id_produto INT UNIQUE NOT NULL,
    categoria ENUM ('Eletrônicos', 'Brinquedos', 'Video Game', 'Livros', 'Filmes', 'Utensílios Domésticos', 'Ferramentas', 'Outros') NOT NULL,
    quantidade_produto INT NOT NULL DEFAULT 1,
    CONSTRAINT fk_produto_estoque FOREIGN KEY(id_produto) REFERENCES produto(id_produto) ON UPDATE CASCADE ON DELETE CASCADE
);

CREATE TABLE fornecedor (
	id_fornecedor INT NOT NULL UNIQUE,
    razao_social VARCHAR(150) NOT NULL UNIQUE,
    cnpj CHAR(14) NOT NULL,
    contato VARCHAR(100) NOT NULL,
    PRIMARY KEY (id_fornecedor)
);

CREATE TABLE vendedor (
	id_vendedor INT NOT NULL,
    cnpj CHAR(14) NOT NULL,
    cpf CHAR(11) NOT NULL UNIQUE,
    razao_social VARCHAR(150) NOT NULL UNIQUE,
    contato VARCHAR(100) NOT NULL,
    localizacao VARCHAR(50) NOT NULL,
    PRIMARY KEY(id_vendedor)
);

CREATE TABLE produtos_do_vendedor (
	id_produto INT NOT NULL UNIQUE,
    id_vendedor INT NOT NULL AUTO_INCREMENT,
    quantidade_produtos INT NOT NULL,
    PRIMARY KEY (id_produto, id_vendedor),
    CONSTRAINT fk_vendedor_produto FOREIGN KEY (id_produto) REFERENCES produto(id_produto) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_produto_vendedor FOREIGN KEY (id_vendedor) REFERENCES vendedor(id_vendedor) 
    ON DELETE CASCADE ON UPDATE CASCADE
);  

CREATE TABLE produtos_do_pedido (
	id_produto INT NOT NULL UNIQUE,
    id_pedido INT NOT NULL UNIQUE,
    quantidade_produtos INT NOT NULL,
    disponibilidade ENUM("Disponível", "Indisponível") NOT NULL DEFAULT "Disponível", 
    PRIMARY KEY (id_produto, id_pedido),
    CONSTRAINT fk_pedido_produto FOREIGN KEY (id_produto) REFERENCES produto(id_produto) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_produto_pedido FOREIGN KEY (id_pedido) REFERENCES pedido(id_pedido) ON DELETE CASCADE ON UPDATE CASCADE
);  

CREATE TABLE produtos_do_fornecedor (
	id_produto INT NOT NULL UNIQUE,
    id_fornecedor INT NOT NULL,
    quantidade_produtos INT NOT NULL,
    disponibilidade ENUM("Disponível", "Indisponível") NOT NULL DEFAULT "Indisponível", 
    PRIMARY KEY (id_produto, id_fornecedor),
    CONSTRAINT fk_fornecedor_produto FOREIGN KEY (id_produto) REFERENCES produto(id_produto) ON DELETE CASCADE ON UPDATE CASCADE,
    CONSTRAINT fk_produto_fornecedor FOREIGN KEY (id_fornecedor) REFERENCES fornecedor(id_fornecedor) ON DELETE CASCADE ON UPDATE CASCADE
);  

CREATE TABLE entrega (
	status ENUM("A caminho...", "Partindo para entrega", "Chegou") NOT NULL DEFAULT "Partindo para entrega",
    codigo_rastreio INT NOT NULL UNIQUE PRIMARY KEY
);