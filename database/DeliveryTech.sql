--Banco de delivery tech---
-- Allan, Carol, Nestor, Sandro

--Criando o banco de dados delivery tech--
Create Database delivery
Go

--Acessando o banco delivery--
Use delivery
Go

--Criando a tabela de pedidos--
--Obs: Na table original existe o campo status que verifica se o pedido foi entregue--
Create Table  Pedidos (CodPedido Int Primary Key Identity(1,1), 
						Nome Varchar(50) Not Null, 
						Telefone Varchar(14) Not Null, 
						Endereco Varchar(255) Not Null, 
						Latitude Float Not Null, 
						Longitude Float Not Null,
						Momento DateTime Not Null,
						TotalDoPedido Decimal(18,2) Not Null) 
Go

Drop table Pedidos
Go
--Criando a tabela de produtos
--Obs: Na table original existe o campo imagem que informa o local onde a imagem do produto est� armazenada--
Create Table Produtos (CodProduto Int Primary Key Identity(1,1),
						Tipo Varchar(50) Not Null,
						Categoria Varchar(50) Not Null,
						Nome Varchar(50) Not Null,
						Descricao Varchar(255) Not Null,
						ValorProduto Decimal(18,2) Not Null)
Go

Drop table Produtos
Go

--Tabela de relacionamento--
--Aqui deixamos a tabela mais elaborada que a original--
Create Table PedidoProduto (CodPedido Int, 
							CodProduto Int Not Null, 
							Quantidade Int Not Null, 
							ValorUnitario Decimal(18,2) Not Null, 
							PercetualDesconto Decimal(5,2) Not Null, 
							ValorDoDesconto Decimal(18,2) Not Null, 
							ValorTotal Decimal(18,2) Not Null)
Go

Drop table PedidoProduto
Go

--Criando o relacionamento entra a tabela PedidoProduto e pedidos--
Alter Table PedidoProduto
  Add Constraint [FK_PedidoProduto_CodPedido]
   Foreign Key (CodPedido)
    References Pedidos (CodPedido)
Go

--Criando o relacionamento entra a tabela PedidoProduto e produtos--
Alter Table PedidoProduto
  Add Constraint [FK_PedidoProduto_CodProduto]
   Foreign Key (CodProduto)
    References Produtos (CodProduto)
Go


--Criando uma regra de negocio--
-- Um pedido nao pode ter o mesmo produto no mesmo pedido--
Alter Table PedidoProduto
 Add Constraint PK_PedidoProduto_CodProduto Primary Key (CodProduto)
Go

Insert Into Produtos (Tipo, Categoria, Nome, Descricao, ValorProduto)
			 Values ('Massas','Pizza','Alcachofra','Cora��o da alcachofra temperado. Podendo ser coberta com mussarela especial ou parmes�o.', 53.00),
					('Massas','Pizza','Catupiry','Coberta com o mais puro catupiry.',58.00),
					('Massas','Pizza','Milho Verde','Milho verde. Podendo ser coberta com mussarela especial ou catupiry.',52.00),
					('Massas','Pizza','Piment�o','Piment�o fatiado, champignom picado, palmito cortado. Podendo ser coberta com mussarela especial ou catupiry.',63),
					('Massas','Pizza','Calabreza com Piment�o','Calabreza fatiada, piment�o fatiado e cebola. Coberto com queijo parmes�o ralado.',55.00),
					('Massas','Pizza','Aliche','Fatias de aliche importado, coberto com queijo parmes�o ralado.',60.00),
					('Massas','Pizza','Portuguesa','Presunto picado, ovos picado, cebola e coberta com mussarela',60.00),
					('Massas','Pizza','Atum','Atum s�lido coberto com cebolas.',62.00),
					('Massas','Pizza','Baiana','Calabreza mo�da com acentuado sabor de pimenta.',54.00),
					('Massas','Pizza','Br�colis','Broc�lis com bacon frito, coberto com parmes�o.',70.00),
					('Massas','Pizza','Bacalhau','Bacalhau desfiado e refogado no azeite com salsinha,coberto com rodelas de piment�o e queijo parmes�o ralado.',75.00),
					('Massas','Pizza','Escarola','Escarola refogada no azeite temperada com aliche ou bacon',51.00),
					('Massas','Pizza','Frango com Catupiry','Peito de frango temperado, milho verde e palmito cortado. Podendo ser coberta com mussarela especial ou catupiry.',56.00),
					('Massas','Pizza','Margherita','Mussaela especial, rodelas de tomate e manjeric�o fresco, salpicado com queijo parmes�o.',53.00),
					('Massas','Pizza','Mussarela','Coberta com mussarela especial.',50.00),
					('Massas','Pizza','5 Queijos','Queijo gorgonzola, catupiry, mussarela, provolone e parmes�o ralado',66.00),
					('Massas','Pizza','Camar�o','Camar�o temperado e refogado no azeite. Podendo ser coberta com mussarela especial ou catupiry.',81.00),
					('Bebidads','Refrigerante','Coca cola','Lata 350ml',5.00),
					('Bebidads','Refrigerante','Guaran�','Lata 350ml',6.00),
					('Bebidads','Refrigerante','Sprit','Lata 350ml',4.00),
					('Bebidads','Refrigerante','Fanta laranja 350ml','Lata',5.00),
					('Bebidas','Refrigerante','Coca cola','2 litros',10.00),
					('Bebidas','Refrigerante','Sprit','2 litros',9.00),
					('Bebidas','Refrigerante','Fanta Laranja','2 litros',9.00),
					('Bebidas','Refrigerante','Kuat','2 litros',8.00),
					('Bebidas','Refrigerante','Coca zero','2 litros',10.00),
					('Bebidas','Refrigerante','Guaran�','2 litros',11.00),
					('Bebidas','Cerveja','Skol','Lata 350ml',7.00),
					('Bebidas','Cerveja','Bhama','Lata 350ml',8.00),
					('Bebidas','Cerveja','Paulistana','Lata 350ml',10.00),
					('Bebidas','Cerveja','Heineken','Lata 350ml',10.00),
					('Bebidas','Cerveja','Eisenbahn','Lata 220ml',7.00),
					('Bebidas','Cerveja','Bohemia','Lata 350ml',8.00),
					('Bebidas','Cerveja','Original','Lata 350ml',9.00),
					('Bebidas','Vinho','Goes','Tinto de mesa 720ml',25.00),
					('Bebidas','Vinho','Goes','Tinto de mesa suave 720ml',25.00),
					('Bebidas','Vinho','Goes','Tinto bordo 720ml',26.00),
					('Bebidas','Vinho','Don Patto','Tinto seco merlot 750ml',55.00),
					('Bebidas','Vinho','Don Patto','Patt�o branco de mesa de mesa 720ml',45.00),
					('Bebidas','Vinho','Don Patto','Patt�o Tinto de mesa 720ml',45.00)														
Go


Drop Table Pedidos
Go

Select * from Produtos
Go


Insert Into Pedidos (Nome, Telefone, Endereco , Latitude, Longitude, Momento, TotalDoPedido )
--Abertura da pizzaria 2021-04-01 19:00:00.000 Quinta feira--
			Values  ('Edson'     ,'11-952453521','R. Gov. Carvalho Pinto, 538 - Jardim Boa Vista, São Roque - SP, 18132-380, Brasil'       ,-23.51784309561113, -47.145707197487354,'2021-04-01 18:30:00',68),--2,22
			    	('Mariza'    ,'11-954895352','R. Paraguai, 174 - Vila Sao Rafael, São Roque - SP, 18131-475, Brasil'                   ,-23.53371580879795, -47.152799628674984,'2021-04-01 19:05:00',120),--11,40
			    	('Joâo'      ,'11-954895354','R. Paulino Hermílio de Campos, 58 - Centro, São Roque - SP, 18130-385, Brasil'           ,-23.53009716835891, -47.13880117982625, '2021-04-01 19:20:00',120),--3,6,25
			    	('Marcos'    ,'11-954895355','R. José Gômide de Castro, 127 - Jardim Maria Trindade, São Roque - SP, 18133-400, Brasil',-23.51821231456105,-47.126943469047546,'2021-04-01 19:40:00'120),--11,40
			    	('Luciana'   ,'11-954895356',,120),--11,40
			    	('Thereza'   ,'11-954895357',,120),--11,40
			    	('Gerson'    ,'11-954895358',,120),--11,40
			    	('Mariano'   ,'11-954895359',,120),--11,40
			    	('Cristiane' ,'11-954895360',,120),--11,40
			    	('Roberto'   ,'11-954895361',,120),--11,40

--Abertura da pizzaria 2021-04-02 19:00:00.000 Sexta feira-- Sandro
--Abertura da pizzaria 2021-04-03 19:00:00.000 Sabado feira-- Carol
--Abertura da pizzaria 2021-04-04 19:00:00.000 Domingo feira-- Rafael
					('Regina'      ,'11-975635521','R. Maria Guilhermina Lemos, 175-1 - Vila Junqueira, São Roque - SP, 18136-180, Brasil'  		 ,-23.541219, -47.132667,'2021-04-04 19:15:00',125), --5,7,23
					('Guilherme'   ,'11-987337822','R. Ten. Francisco Luís de Campos, 170-284 - Vila Junqueira, São Roque - SP, 18136-120, Brasil'   ,-23.538750, -47.134115,'2021-04-04 19:27:00',70), --9,26
					('Samuel'      ,'11-999737290','R. Primeiro de Maio, 40 - Estacao, São Roque - SP, 18131-025, Brasil'       					 ,-23.534235, -47.141057,'2021-04-04 19:59:00',123), --14,16,23,29
					('Lara'        ,'11-975377282','R. Goiás, 151-1 - Vila Irene, São Roque - SP, 18132-070, Brasil'      							 ,-23.523077, -47.138289,'2021-04-04 20:05:00',192), --4,7,8,23x2
					('Murilo'      ,'11-982672827','R. Leão XIII, 155-35 - Jardim Tanzi, São Roque - SP'       										 ,-23.524887, -47.134738,'2021-04-04 20:07:00',138), --2,8,36
					('Mariana'     ,'11-972838287','R. Bento Antônio Pereira, 157-1 - Jardim Bela Vista, São Roque - SP, 18134-180, Brasil'      	 ,-23.522280, -47.131112,'2021-04-04 20:25:00',121), --3,15
					('Beatriz'     ,'11-973728822','R. Francisco da Silva Pontes, 139 - Jardim Florida, São Roque - SP, 18133-040, Brasil'       	 ,-23.520116, -47.132904,'2021-04-04 20:29:00',167), --17,18,23,27
					('Isaque'      ,'11-963737826','R. Chad Kaid, 176 - Jardim Sao Jose, São Roque - SP, 18133-250, Brasil'      					 ,-23.515384, -47.130244,'2021-04-04 20:36:00',134), --6,11,24
					('Anthony'     ,'11-997362682','Av. Campo Limpo, 89-1 - Vila Nova Sao Roque, São Roque - SP, 18131-320, Brasil'       			 ,-23.525430, -47.151320,'2021-04-04 20:42:00',60, --7
					('Elisa'       ,'11-972384848','R. João Pinto Splendore, 150, São Roque - SP, 18133-300, Brasil'       							 ,-23.513574, -47.129846,'2021-04-04 20:48:00',52), --4
					('Nicolle'     ,'11-972828484','Av. Gérson Nastri, 163-197 - Vila Santa Rita, São Roque - SP, 18130-700, Brasil'      			 ,-23.530424, -47.128567,'2021-04-04 20:49:00',61), --13,23
					('Rebeca'      ,'11-962753848','R. Maria Antônia Constancia, 102 - Esplanada Mendes Moraes, São Roque - SP, 18130-770, Brasil'   ,-23.529932, -47.130852,'2021-04-04 20:51:00',256), --3,6,8,14,23,25,26
					('Caio'        ,'11-972548493','R. Comendador Inocêncio, 57 - Centro, São Roque - SP, 18130-480, Brasil'       					 ,-23.528263, -47.134822,'2021-04-04 20:55:00',50), --16
					('Emanuel'     ,'11-982627484','R. Dr. Silvério Moura García, 236 - Vila Santo Antonio, São Roque - SP, 18133-350, Brasil'       ,-23.513484, -47.133281,'2021-04-04 20:59:00',66), --14,27
					('Catarina'    ,'11-925648482','R. José Gômide de Castro, 251-207 - Jardim Maria Trindade, São Roque - SP, 18133-400, Brasil'    ,-23.517952, -47.125405,'2021-04-04 21:05:00',83), --6,29x4
					('Francisco'   ,'11-972838765','R. Padre Marçal, 570-662 - Vila Junqueira, São Roque - SP, 18136-120, Brasil'       			 ,-23.536231, -47.133511,'2021-04-04 21:26:00',80), --8,32x2
					('Otavio'      ,'11-976559877','R. Barra Bonita, 2-64 - Vila Nova Sao Roque, São Roque - SP, 18131-215, Brasil'      			 ,-23.527752, -47.153366,'2021-04-04 21:39:00',89), --12,29x2
					('Olivia'      ,'11-990273826','R. Manoel Lessa, 456 - Jardim Marieta, São Roque - SP, 18131-418, Brasil'       				 ,-23.529003, -47.155923,'2021-04-04 22:01:00',77), --17,28
					('Thiago'      ,'11-996921807','R. Manoel José Ferreira - Marmeleiro, São Roque - SP, 18120-000, Brasil'      				     ,-23.535409, -47.160054,'2021-04-04 22:18:00',78), --11,26

--Abertura da pizzaria 2021-04-06 19:00:00.000 Terça feira-- Carol
--Abertura da pizzaria 2021-04-07 19:00:00.000 Quarta feira-- Rafael
--Abertura da pizzaria 2021-04-08 19:00:00.000 Quinta feira-- Sandro
--Abertura da pizzaria 2021-04-09 19:00:00.000 Sexta feira--
--Abertura da pizzaria 2021-04-10 19:00:00.000 Sabado feira--
--Abertura da pizzaria 2021-04-11 19:00:00.000 Domingo feira--
--Abertura da pizzaria 2021-04-13 19:00:00.000 Terça feira--
--Abertura da pizzaria 2021-04-14 19:00:00.000 Quarta feira--
--Abertura da pizzaria 2021-04-15 19:00:00.000 Quinta feira--
--Abertura da pizzaria 2021-04-16 19:00:00.000 Sexta feira--
--Abertura da pizzaria 2021-04-17 19:00:00.000 Sabado feira--
--Abertura da pizzaria 2021-04-18 19:00:00.000 Domingo feira--
--Abertura da pizzaria 2021-04-20 19:00:00.000 Terça feira--
--Abertura da pizzaria 2021-04-21 19:00:00.000 Quarta feira--
--Abertura da pizzaria 2021-04-22 19:00:00.000 Quinta feira--
--Abertura da pizzaria 2021-04-23 19:00:00.000 Sexta feira--
--Abertura da pizzaria 2021-04-24 19:00:00.000 Sabado feira--
--Abertura da pizzaria 2021-04-25 19:00:00.000 Domingo feira--
--Abertura da pizzaria 2021-04-27 19:00:00.000 Terça feira--
--Abertura da pizzaria 2021-04-28 19:00:00.000 Quarta feira--
--Abertura da pizzaria 2021-04-29 19:00:00.000 Quinta feira--
--Abertura da pizzaria 2021-04-30 19:00:00.000 Sexta feira--

--Abertura da pizzaria 2021-05-01 19:00:00.000 Sabado feira--
--Abertura da pizzaria 2021-04-02 19:00:00.000 Domingo feira--
--Abertura da pizzaria 2021-04-04 19:00:00.000 Terça feira--
--Abertura da pizzaria 2021-04-05 19:00:00.000 Quarta feira--
--Abertura da pizzaria 2021-04-06 19:00:00.000 Quinta feira--
--Abertura da pizzaria 2021-04-07 19:00:00.000 Sexta feira--
--Abertura da pizzaria 2021-04-08 19:00:00.000 Sabado feira--
--Abertura da pizzaria 2021-04-09 19:00:00.000 Domingo feira--
--Abertura da pizzaria 2021-04-11 19:00:00.000 Terça feira--
--Abertura da pizzaria 2021-04-12 19:00:00.000 Quarta feira--
--Abertura da pizzaria 2021-04-13 19:00:00.000 Quinta feira--
--Abertura da pizzaria 2021-04-14 19:00:00.000 Sexta feira--
--Abertura da pizzaria 2021-04-15 19:00:00.000 Sabado feira--
--Abertura da pizzaria 2021-04-16 19:00:00.000 Domingo feira--
--Abertura da pizzaria 2021-04-18 19:00:00.000 Terça feira--
--Abertura da pizzaria 2021-04-19 19:00:00.000 Quarta feira--
--Abertura da pizzaria 2021-04-20 19:00:00.000 Quinta feira--
--Abertura da pizzaria 2021-04-21 19:00:00.000 Sexta feira--
--Abertura da pizzaria 2021-04-22 19:00:00.000 Sabado feira--
--Abertura da pizzaria 2021-04-23 19:00:00.000 Domingo feira--
--Abertura da pizzaria 2021-04-25 19:00:00.000 Terça feira--
--Abertura da pizzaria 2021-04-26 19:00:00.000 Quarta feira--
--Abertura da pizzaria 2021-04-27 19:00:00.000 Quinta feira--
--Abertura da pizzaria 2021-04-28 19:00:00.000 Sexta feira--
--Abertura da pizzaria 2021-04-29 19:00:00.000 Sabado feira--
--Abertura da pizzaria 2021-04-30 19:00:00.000 Domingo feira--



Go

Select * from Pedidos
Go