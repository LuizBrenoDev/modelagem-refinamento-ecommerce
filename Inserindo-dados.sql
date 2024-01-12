USE shop;

INSERT INTO produto VALUES (
	677, "Notebook PRO", "Livre para todos os públicos", "Eletrônicos", 2000.0, 3.3 
);
INSERT INTO produto VALUES (
	489, "O Cavaleiro", "Idade igual ou superior a 18 anos", "Filmes", 1200.0, 4.8 
);
INSERT INTO produto VALUES (
	333, "Video Game PRO", "Livre para todos os públicos", "Video Game", 3000.0, 3.5
);
INSERT INTO produto VALUES (
	908, "Bola de Borracha", "Livre para todos os públicos", "Brinquedos", 100.0, 2.7 
);
INSERT INTO produto VALUES (
	445, "Televisão Modelo 445", "Livre para todos os públicos", "Eletrônicos",1500.0, 3.0
);
INSERT INTO produto VALUES (
	456, "O Iluminado", "Idade Superior ou igual a 14 anos", "Livros", 50.0, 4.9
);
INSERT INTO produto VALUES (
	380, "Pratos Floridos", "Livre para todos os públicos", "Utensílios Domésticos", 80.0, 3.2
);
INSERT INTO produto VALUES (
	776, "Pintura do pôr do sol", "Livre para todos os públicos", "Outros", 37.0, 4.5
);
INSERT INTO produto VALUES (
	987, "It", "Idade Superior ou igual a 14 anos", "Livros", 60.0, 3.9
);
INSERT INTO produto VALUES (
	551, "Cujo", "Idade Superior ou igual a 14 anos", "Livros", 88.0, 3.3
);
INSERT INTO produto VALUES (
	399, "Misery: Louca Obsessão", "Idade Superior ou igual a 14 anos", 56.0, "Livros", 3.8
);
INSERT INTO produto VALUES (
	775, "Sob a Redoma", "Idade Superior ou igual a 14 anos", "Livros", 38.0, 3.7
);

INSERT INTO estoque VALUES (677, 'Eletrônicos', 50),
						   (489, "Filmes", 30),
						   (333, "Video Game", 53),
                           (908, "Brinquedos", 30),
                           (445, "Eletrônicos", 20),
                           (456, "Livros", 40),
                           (380, "Utensílios Domésticos", 20),
                           (776, "Outros", 18);
                           
INSERT INTO fornecedor VALUES (12, "Eletrônicos e Tecnologia Costa LTDA", 55613246482962, "71 97889-6577");
INSERT INTO fornecedor VALUES (21, "Filmes Blockbuster S.A", 65271435627254, "71 96531-3341");
INSERT INTO fornecedor VALUES (15, "Brinquedos Sorriso LTDA", 82536728415739, "71 96667-8991");

INSERT INTO produtos_do_fornecedor VALUES (677, 12, 50, "Disponível"),
										  (489, 21, 30, "Disponível"),
                                          (333, 12, 53, "Disponível"),
                                          (908, 15, 30, "Disponível"),
                                          (445, 12, 20, "Disponível");

INSERT INTO cliente VALUES (
	null, "José Campos Nascimento", 10745367289, "Casa 13, Rua Das Margaridas Rosadas, Rio Grande Do Sul", "PJ"
);
INSERT INTO cliente VALUES (
	null, "José Melo Bispo", 78523418496, "Casa 01, Rua Dos Coqueiros, São Paulo", "PJ"
);
INSERT INTO cliente VALUES (
	null, "Maria Rosada Costa", 56425163895, "Casa 78, Rua Chuvosa, Minas Gerais", "PF"
);
INSERT INTO cliente VALUES (
	null, "Eduardo Meireles Alcântara", 67415627890, "Casa 02, Rua de Ferro, DF", "PF"
);

INSERT INTO entrega VALUES ("A caminho...", 141);
INSERT INTO entrega VALUES ("A caminho...", 155);
INSERT INTO entrega VALUES ("A caminho...", 899);
INSERT INTO entrega VALUES ("A caminho...", 341);

INSERT INTO pedido VALUES (
	4441, 1, "Em processamento...", 141, "Crédito" 
);
INSERT INTO pedido VALUES (
	4442, 2, "Em processamento...", 155, "Débito, Crédito" 
);
INSERT INTO pedido VALUES (
	4563, 3, "Em processamento...", 899, "Dédito" 
);
INSERT INTO pedido VALUES (
	4341, 4, "Em processamento...", 341, "Débito, Crédito" 
);

INSERT INTO produtos_do_pedido VALUES (
	677, 4441, 5, "Disponível"
);
INSERT INTO produtos_do_pedido VALUES (
	489, 4442, 1, "Disponível"
);
INSERT INTO produtos_do_pedido VALUES (
	333, 4563, 2, "Disponível"
);
INSERT INTO produtos_do_pedido VALUES (
	908, 4341, 5, "Disponível"
);

INSERT INTO vendedor VALUES (
	123, 67435953631074, 45365142753, "Livraria Santana LTDA", "8866-7831", "Rio De Janeiro"
);
INSERT INTO vendedor VALUES (
	221, 45134289635014, 55419045672, "Cerâmica Bela Vista S.A", "6679-9853", "São Paulo"
);
INSERT INTO vendedor VALUES (
	311, 13267306524819, 67241986529, "Artes Plásticas e Esculturas S.A", "5567-6671", "Bahia"
);

INSERT INTO produtos_do_vendedor VALUES (
	456, 123, 40
);
INSERT INTO produtos_do_vendedor VALUES (
	380, 221, 20
);
INSERT INTO produtos_do_vendedor VALUES (
	776, 311, 18
);
