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
			Values ('Edson'      ,'11-952453521','R. Gov. Carvalho Pinto, 538 - Jardim Boa Vista, São Roque - SP, 18132-380, Brasil'       ,-23.51784309561113, -47.145707197487354,'2021-04-01 18:30:00',68),--2,22
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