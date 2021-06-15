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
					('Bebidas','Refrigerante','Guaraná','2 litros',11.00),
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
					('Bebidas','Vinho','Don Patto','Patto branco de mesa de mesa 720ml',45.00),
					('Bebidas','Vinho','Don Patto','Patto Tinto de mesa 720ml',45.00)														
Go


Drop Table Pedidos
Go

Select * from Produtos
Go


Insert Into Pedidos (Nome, Telefone, Endereco , Latitude, Longitude, Momento, TotalDoPedido )
					--Abertura da pizzaria 2021-04-01 19:00:00.000 Quinta feira--
			Values ('Edson'      ,'11-952453521','R. Gov. Carvalho Pinto, 538 - Jardim Boa Vista, São Roque - SP, 18132-380, Brasil'                   ,-23.51784309561113,  -47.145707197487354, '2021-04-01 18:30:00.000',68 ),--2,22
			    	('Mariza'    ,'11-954895352','R. Paraguai, 174 - Vila Sao Rafael, São Roque - SP, 18131-475, Brasil'                               ,-23.53371580879795,  -47.152799628674984, '2021-04-01 19:05:00.000',120),--11,40
			    	('Joâo'      ,'11-954895354','R. Paulino Hermílio de Campos, 58 - Centro, São Roque - SP, 18130-385, Brasil'                       ,-23.53009716835891,  -47.13880117982625,  '2021-04-01 19:20:00.000',120),--3,6,25
			    	('Marcos'    ,'11-954895355','R. José Gômide de Castro, 127 - Jardim Maria Trindade, São Roque - SP, 18133-400, Brasil'            ,-23.51821231456105,  -47.126943469047546, '2021-04-01 19:40:00.000',130),--11,38
			    	('Luciana'   ,'11-954895356','R. João XXIII, 64 - Centro, São Roque - SP, 18130-180, Brasil'                                       ,-23.53264086288481,  -47.13515404611825,  '2021-04-01 19:55:00.000',108),--7,28*6
			    	('Thereza'   ,'11-954895357','Rua Santa Cruz, 117 - Vila Santa Isabel, São Roque - SP, 18136-025, Brasil'                          ,-23.536778603376078, -47.13693100959063,  '2021-04-01 20:20:00.000',55),--5
			    	('Gerson'    ,'11-954895358','R. Barão do Rio Branco, 445 - Vila Junqueira, São Roque - SP, 18130-020, Brasil'                     ,-23.538849115392434, -47.13492874056101,  '2021-04-01 20:30:00.000',70),--10
			    	('Mariano'   ,'11-954895359','R. Tomás Antônio Gonzaga, 247 - Paisagem Colonial, São Roque - SP, 18136-700, Brasil'                ,-23.556905081914525, -47.14863214641809,  '2021-04-01 21:10:00.000',76),--16,18
			    	('Cristiane' ,'11-954895360','Av. João Pessoa, 378 - Centro, São Roque - SP, 18130-290, Brasil'                                    ,-23.532246785574436, -47.13871601969004,  '2021-04-01 22:00:00.000',142),--8,14,29*2,27
			    	('José'      ,'11-954895361','R. Duque de Caxias, 240 - Centro, São Roque - SP, 18130-150, Brasil'                                 ,-23.53361221845325,  -47.13631343096495,  '2021-04-01 22:40:00.000',54),--9
			    	('Lucas'     ,'11-954895362','R. Bento Antônio Pereira, 108 - Jardim Bela Vista, São Roque - SP, 18134-180, Brasil'                ,-23.522456259856284, -47.13113375008106,  '2021-04-01 23:10:00.000',52),--3
			    	('Lourdes'   ,'11-954895363','R. Amador Marquês da Silva, 206 - Vila Marques, São Roque - SP, 18130-545, Brasil'                   ,-23.536676244974018, -47.13959611952305,  '2021-04-01 23:32:00.000',50),--15
			    	('Paulo'     ,'11-954895363','Av. das Palmeiras, 352 - Jardim Suiça Paulista, São Roque - SP, 18136-780, Brasil'                   ,-23.54111846486106,  -47.143758572638035, '2021-04-01 23:58:00.000',60)--15,22
					--Abertura da pizzaria 2021-04-02 19:00:00.000 Sexta feira-- Sandro
			    	('Jair'      ,'11-954895365','R. Tamandaré, 63 - Vila Sao Rafael, São Roque - SP, 18131-500, Brasil'                               ,-23.532264614370607, -47.1506505087018,   '2021-04-02 18:00:00.000',53)--2
			    	('Clecio'    ,'11-954895366','R. Primeiro-Sargento A Aparecido Pereira, 350 - Jardim Conceiçao, São Roque - SP, 18136-490, Brasil' ,-23.551010563733737,  -47.136614844202995,'2021-04-02 18:10:00.000',60)--15,22
			    	('Maria'     ,'11-954895367','R. Padre Antônio Viêira, 71 - Paisagem Colonial, São Roque - SP, 18136-730, Brasil'                  ,-23.560269132348232, -47.146134339272976, '2021-04-02 18:30:00.000',73)--8,25
			    	('Lucio'     ,'11-954895368','Av. Guilherme de Almeida, 80 - Sao Roque, São Roque - SP, 18135-660, Brasil'                         ,-23.559611757072517, -47.12792918086051,  '2021-04-02 18:40:00.000',78)--15,4*32
			    	('Daniela'   ,'11-954895368','R. São Tibúrcio, 93 - Jardim Villaca, São Roque - SP, 18135-260, Brasil'                             ,-23.554321287649234, -47.12225899100303,  '2021-04-02 19:00:00.000',51)--12,
			    	('Samara'    ,'11-954895369','R. João Colo, 17 - Parque Primavera, São Roque - SP, 18135-590, Brasil'                              ,-23.560308470268833, -47.11494058370591,  '2021-04-02 19:10:00.000',60)--15,26
			    	('Celio'     ,'11-954895370','R. João Paulo I, 206 - Jardim Mosteiro, São Roque - SP, 18135-490, Brasil'                           ,-23.54766287359399,  -47.117252983152866, '2021-04-02 19:20:00.000',68)--2,22
			    	('Odair'     ,'11-954895371','R. Santa Leocádia, 95 - Jardim Villaca, São Roque - SP, 18135-310, Brasil'                           ,-23.545953342682566, -47.12087094783783,  '2021-04-02 19:30:00.000',74)--4,27
			    	('Luiz'      ,'11-954895372','R. das Papoulas, 568 - Vila Santa Rosalia, São Roque - SP, 18136-185, Brasil'                        ,-23.54702510621119,   -47.13165711611509, '2021-04-02 19:30:00.000',85)--5,30*3
			    	('Joel'      ,'11-954895373','Rua Msr A Morais 52 - Vila Mike, São Roque - SP, 18136-220, Brasil'                                  ,-23.5432211821392,    -47.13324632495642, '2021-04-02 19:42:00.000',82)--8,31,22
			    	('Maria'     ,'11-954895374','R. José Bonifácio de Andrada e Silva, 150 - Jardim Meny, São Roque - SP, 18130-005, Brasil'          ,-23.53514147415779,   -47.13589802384377, '2021-04-02 19:43:00.000',56)--13,
			    	('José'      ,'11-954895375','Av. Antonio Pannellini, 208 - Taboão, São Roque - SP, 18135-131, Brasil'                             ,-23.54373509944832,   -47.1220538020134,  '2021-04-02 19:48:00.000',126)--17,39
			    	('Pedro'     ,'11-954895376','R. Irineu Silveira, 121 - Vila Junqueira, São Roque - SP, 18136-100, Brasil'                         ,-23.540818469127807,  -47.13398527354001, '2021-04-02 19:49:00.000',53)--1,
			    	('alesandro' ,'11-954895377','R. Santa Augusta, 42 - Jardim Villaca, São Roque - SP, 18135-360, Brasil'                            ,-23.547008816208614,  -47.11882844567299, '2021-04-02 19:59:00.000',55)--15,18
			    	('Mauro'     ,'11-954895378','Av. Antônio Maria Picena, 139 - Vila Junqueira, São Roque - SP, 18136-040, Brasil'                   ,-23.540026673823945,  -47.13616892695426, '2021-04-02 20:13:00.000',54)--9,
			    	('Ana'       ,'11-954895379','R. Ten. Francisco Luís de Campos, 231 - Vila Junqueira, São Roque - SP, 18136-120, Brasil'           ,-23.53865854112339,   -47.133923918008804,'2021-04-02 20:15:00.000',70)--7,22
			    	('Dolores'   ,'11-954895380','Rua Marechal Deodoro da Fonseca, 360 - Centro, São Roque - SP, 18130-070, Brasil'                    ,-23.534870359166487,  -47.13308103382588, '2021-04-02 20:21:00.000',53)--1,
			    	('Marcio'    ,'11-954895381','R. Bento Antônio Pereira, 7 - Jardim Bela Vista, São Roque - SP, 18134-180, Brasil'                  ,-23.522989932825325,  -47.13158771395683, '2021-04-02 20:22:00.000',71)--7,27
			    	('Mecias'    ,'11-954895382','R. Santa Pedrina, 107 - Jardim Villaca, São Roque - SP, 18135-410, Brasil'                           ,-23.546045243597153,  -47.12182179093361, '2021-04-02 20:23:00.000',50)--15,
			    	('Jucemar'   ,'11-954895383','R. Maestro Porfírio Taváres, 335 - Jardim Maria Trindade, São Roque - SP, 18133-410, Brasil'         ,-23.518490227225822,  -47.12525971233845, '2021-04-02 20:29:00.000',55)--5,
			    	('Wagner'    ,'11-954895384','R. Júlio Xavier Ferreira, 130 - Jardim Maria Trindade, São Roque - SP, 18133-440, Brasil'            ,-23.51949642602654,   -47.12623938918114, '2021-04-02 22:33:00.000',120)--11,39
			    	('Adelia'    ,'11-954895384','R. João Pinto Splendore, 200, São Roque - SP, 18133-300, Brasil'                                     ,-23.51331093318866,   -47.129439264535904,'2021-04-02 22:45:00.000',56)--13,
			    	('Elaine'    ,'11-954895385','BR-272, 1325 - Taboão, São Roque - SP, 18135-125, Brasil'                                            ,-23.542411573883093,  -47.125645279884345,'2021-04-02 22:58:00.000',100)--11,35
			    	('Osmar'     ,'11-954895386','Rua Sabatini Alceste, 55, São Roque - SP, 18133-340, Brasil'                                         ,-23.514590173507546,  -47.13417571038008, '2021-04-02 22:59:00.000',54)--9
			    	('Thiago'    ,'11-954895387','R. das Rosas, 110 - Jardim Sao Jose, São Roque - SP, 18133-280, Brasil'                              ,-23.515013817285826,  -47.13141404092311, '2021-04-02 23:10:00.000',92)--6,29*4
			    	('Celma'     ,'11-954895389','R. São José, 205 - Jardim Sao Jose, São Roque - SP, 18133-255, Brasil'                               ,-23.51485518160395,   -47.13278565555811, '2021-04-02 23:20:00.000',52)--3,
			    	('Helio'     ,'11-954895390','BR-272, 1325 - Taboão, São Roque - SP, 18135-125, Brasil'                                            ,-23.542411573883093,  -47.125645279884345,'2021-04-02 23:40:00.000',50)--15,
			    	('Robson'    ,'11-954895391','R. Minas Gerais, 240 - Vila Irene, São Roque - SP, 18132-080, Brasil'                                ,-23.524010853023483,  -47.138444781303406,'2021-04-02 23:50:00.000',110)--11,31*4



--Abertura da pizzaria 2021-04-03 19:00:00.000 Sabado feira-- Carol
--Abertura da pizzaria 2021-04-04 19:00:00.000 Domingo feira-- Rafael
--azs

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