SELECT * FROM itens_consumo;

INSERT INTO itens_consumo VALUES(1, 'Coca-cola', 4.99, 'bebida', 'veneno em lata de 350ml.');
INSERT INTO itens_consumo VALUES(2, 'Suco de laranja', 7.00, 'bebida', null);
INSERT INTO itens_consumo VALUES(3, 'Suco verde', 9.00, 'bebida', 'limao couve');
INSERT INTO itens_consumo VALUES(4, 'Strogonoff', 14.90, 'comida', 'frango' );
INSERT INTO itens_consumo VALUES(5, 'Pastel', 3.50, 'comida', null);
INSERT INTO itens_consumo VALUES(6, 'Carne assanda', 16.50, 'comida', null);

-- Atualizando dados da key(6) 'carne assanda':
UPDATE itens_consumo SET nome_item = 'Carne assada' where id_item = 6;
UPDATE itens_consumo SET preco_unit= preco_unit * 1.2;
UPDATE itens_consumo SET preco_unit= preco_unit * 1.1 WHERE categoria='bebida';
select * from itens_consumo ORDER BY id_item;

-- Retorna a projeção da tupla sem repetição de atributos:
SELECT DISTINCT categoria from itens_consumo

--inserindo clientes:

INSERT INTO cliente VALUES(10, 'Gabriel');
INSERT INTO cliente VALUES(11, 'Conrado');
INSERT INTO cliente VALUES(12, 'Bianca');
INSERT INTO cliente VALUES(13, 'Vitoria');

SELECT nome_cliente FROM cliente where id_cliente = 10;
-- mesa
INSERT INTO mesa VALUES(101);
INSERT INTO mesa VALUES(102);
INSERT INTO mesa VALUES(103);
INSERT INTO mesa VALUES(104);


-- Pedido
INSERT INTO pedido VALUES(1, '21/03/2019','fechado', null, 10, 101);
INSERT INTO pedido VALUES(2, '21/03/2019', 'cancelado', 'comida fria', 11, 102);
INSERT INTO pedido VALUES(3, '07/05/2019', 'cancelado', 'demorou', 12, 103);
INSERT INTO pedido VALUES(4, '10/11/2019', 'fechado', null, 11, 102);
INSERT INTO pedido VALUES(5, '19/11/2019', 'fechado', null, 13, 101);
select * from pedido;

--produto cartesiano entre pedido e cliente
select * from pedido CROSS JOIN cliente; 
select * from pedido, cliente;

-- produto cartesiano entre pedido e cliente, selecionando por id_cliente e ident_cliente, com projeção de todos os atributos(*)
select * from pedido CROSS JOIN cliente  where pedido.ident_cliente = cliente.id_cliente; 
-- inner join, junção.

select * from pedido INNER JOIN cliente on pedido.ident_cliente = cliente.id_cliente;
select * from pedido, cliente where nome_cliente = 'Gabriel' and pedido.ident_cliente = cliente.id_cliente;
select * from pedido as p, cliente as c where nome_cliente = 'Gabriel' and p.ident_cliente = c.id_cliente;
select * from pedido  p, cliente c where nome_cliente = 'Gabriel' and p.ident_cliente = c.id_cliente;
select id_pedido identificador, situacao from pedido  p, cliente c where nome_cliente = 'Gabriel' and p.ident_cliente = c.id_cliente;

-- inner join, junção natural.
select id_pedido identificador, situacao from pedido  p  join cliente c on  nome_cliente = 'Gabriel' and p.ident_cliente = c.id_cliente;

select  id_mesa from mesa NATURAL join pedido;

-----------------------
select * from pedido LEFT OUTER JOIN cliente  on pedido.ident_cliente = cliente.id_cliente;
select * from pedido RIGHT OUTER JOIN cliente  on pedido.ident_cliente = cliente.id_cliente;

-----------------------
select * from pedido, cliente where nome_cliente = 'Gabriel' and pedido.ident_cliente = cliente.id_cliente;

---left join
select id_pedido identificador, situacao from pedido  p  left join cliente c on  nome_cliente = 'Gabriel' and p.ident_cliente = c.id_cliente;

--right join
select id_pedido identificador, situacao from pedido  p right join cliente c on  nome_cliente = 'Gabriel' and p.ident_cliente = c.id_cliente;

--full join
select id_pedido identificador, situacao from pedido  p  full join cliente c on  nome_cliente = 'Gabriel' and p.ident_cliente = c.id_cliente;


