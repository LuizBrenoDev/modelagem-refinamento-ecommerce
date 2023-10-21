-- select, where, as, order by, having, join
USE shop;

-- Recuperando os produtos vendidos por vendedores
SELECT produto.id_produto, produtos_do_vendedor.id_vendedor, produto.nome, produto.categoria, produto.avaliacao, produto.classificacao
FROM produtos_do_vendedor, produto 
WHERE produtos_do_vendedor.id_produto = produto.id_produto;

-- Recuperando os produtos vendidos por fornecedores
SELECT produto.id_produto, fornecedor.id_fornecedor, produto.nome, fornecedor.razao_social, fornecedor.cnpj, produto.categoria, produto.avaliacao
FROM produtos_do_fornecedor, produto, fornecedor
WHERE produtos_do_fornecedor.id_produto = produto.id_produto 
AND produtos_do_fornecedor.id_fornecedor = fornecedor.id_fornecedor;

-- Recuperando o cliente, o id do pedido e os produtos pedidos pelo cliente
SELECT produto.id_produto, pedido.id_pedido, produto.nome, 
pedido.id_cliente_do_pedido AS IdDoCliente, pedido.status, 
pedido.entrega_codigo_rastreio AS CódigoDeRastreio, produtos_do_pedido.quantidade_produtos,
fornecedor.razao_social
FROM produto, pedido, produtos_do_pedido, fornecedor, produtos_do_fornecedor
WHERE produtos_do_pedido.id_pedido = pedido.id_pedido 
AND produtos_do_pedido.id_produto = produto.id_produto
AND produtos_do_fornecedor.id_produto = produto.id_produto
AND produtos_do_fornecedor.id_fornecedor = fornecedor.id_fornecedor
ORDER BY IdDoCliente;

-- Recuperando o número de pedidos por cliente
SELECT COUNT(*) AS Pedidos, cliente.nome AS Clientes FROM pedido, cliente
WHERE pedido.id_cliente_do_pedido = cliente.id_cliente
GROUP BY cliente.id_cliente;

-- Recuperando o status de uma entrega
SELECT cliente.id_cliente, cliente.nome, pedido.id_pedido, entrega.status FROM pedido, cliente, entrega
WHERE pedido.entrega_codigo_rastreio = entrega.codigo_rastreio
AND cliente.id_cliente = pedido.id_cliente_do_pedido
ORDER BY cliente.id_cliente;

-- Recuperando a quantidade de produtos por categoria, em que a quantidade de produtos seja menor que 5
SELECT COUNT(*) AS quantidade, categoria FROM produto
GROUP BY categoria
HAVING COUNT(*) < 5;

-- Recuperando os clientes PJ
SELECT * FROM cliente WHERE status = 'PJ';

-- Recuperando todos os produtos que estão no estoque e ordenando por nome
SELECT produto.nome, produto.classificacao, produto.avaliacao, produto.categoria
FROM produto 
JOIN estoque ON estoque.id_produto = produto.id_produto
ORDER BY nome;

-- Obtendo a quantidade de cada produto do estoque
SELECT produto.nome, produto.categoria, estoque.quantidade_produto FROM produto, estoque
WHERE produto.id_produto = estoque.id_produto;

-- Recuperando os produtos com classificação maior que 3
SELECT produto.nome, produto.categoria, produto.classificacao, produto.avaliacao FROM produto
WHERE produto.avaliacao > 4;