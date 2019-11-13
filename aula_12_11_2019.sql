-- Database: aula_12_11_2019

-- DROP DATABASE aula_12_11_2019;

CREATE DATABASE aula_12_11_2019;

-- ItemConsumo(idItem, nomeItem, precoUnit, descricao, categoria)

CREATE TABLE itens_consumo (
	id_item integer NOT NULL,
	nome_item varchar(20) NOT NULL,
	preco_unit REAL NOT NULL,
	categoria char(6) NOT NULL,
	descricao varchar(200),
	PRIMARY KEY(id_item)
);

CREATE TABLE cliente(
	id_cliente integer NOT NULL,
	nome_cliente varchar(20) NOT NULL
	--PRIMARY KEY(id_cliente)
);
alter table cliente add primary key(id_cliente);

CREATE TABLE mesa(
	id_mesa integer NOT NULL
	--PRIMARY KEY(id_mesa)
);

alter table mesa add primary key(id_mesa);

-- Pedido(idPedido, dtPedido, motivoCancel, situacao, idCliente, idMesa)

CREATE TABLE pedido(
	id_pedido integer 		NOT NULL,
	dt_pedido date 			NOT NULL,
	motivo_cancel varchar(100),
	situacao varchar(10) 	NOT NULL,
	ident_cliente integer 	NOT NULL,
	ident_mesa integer 		NOT NULL,
	PRIMARY KEY(id_pedido),
	FOREIGN KEY(ident_cliente) references cliente(id_cliente),
	FOREIGN KEY(ident_mesa) references mesa(id_mesa)
);




DROP TABLE cliente, mesa;