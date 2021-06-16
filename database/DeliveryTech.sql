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


Insert Into Pedidos (Nome, Telefone, Endereco , Latitude, Longitude, Momento, TotalDoPedido)
					--Abertura da pizzaria 2021-04-01 19:00:00.000 Quinta feira--
			Values ('Edson'      ,'11-952453521','R. Gov. Carvalho Pinto, 538 - Jardim Boa Vista, São Roque - SP, 18132-380, Brasil'                     ,-23.51784309561113,  -47.145707197487354, '2021-04-01 18:30:00.000',68 ),--2,22
			    	('Mariza'    ,'11-954895352','R. Paraguai, 174 - Vila Sao Rafael, São Roque - SP, 18131-475, Brasil'                                 ,-23.53371580879795,  -47.152799628674984, '2021-04-01 19:05:00.000',120),--11,40
			    	('Joâo'      ,'11-954895354','R. Paulino Hermílio de Campos, 58 - Centro, São Roque - SP, 18130-385, Brasil'                         ,-23.53009716835891,  -47.13880117982625,  '2021-04-01 19:20:00.000',120),--3,6,25
			    	('Marcos'    ,'11-954895355','R. José Gômide de Castro, 127 - Jardim Maria Trindade, São Roque - SP, 18133-400, Brasil'              ,-23.51821231456105,  -47.126943469047546, '2021-04-01 19:40:00.000',130),--11,38
			    	('Luciana'   ,'11-954895356','R. João XXIII, 64 - Centro, São Roque - SP, 18130-180, Brasil'                                         ,-23.53264086288481,  -47.13515404611825,  '2021-04-01 19:55:00.000',108),--7,28*6
			    	('Thereza'   ,'11-954895357','Rua Santa Cruz, 117 - Vila Santa Isabel, São Roque - SP, 18136-025, Brasil'                            ,-23.536778603376078, -47.13693100959063,  '2021-04-01 20:20:00.000',55),--5
			    	('Gerson'    ,'11-954895358','R. Barão do Rio Branco, 445 - Vila Junqueira, São Roque - SP, 18130-020, Brasil'                       ,-23.538849115392434, -47.13492874056101,  '2021-04-01 20:30:00.000',70),--10
			    	('Mariano'   ,'11-954895359','R. Tomás Antônio Gonzaga, 247 - Paisagem Colonial, São Roque - SP, 18136-700, Brasil'                  ,-23.556905081914525, -47.14863214641809,  '2021-04-01 21:10:00.000',76),--16,18
			    	('Cristiane' ,'11-954895360','Av. João Pessoa, 378 - Centro, São Roque - SP, 18130-290, Brasil'                                      ,-23.532246785574436, -47.13871601969004,  '2021-04-01 22:00:00.000',142),--8,14,29*2,27
			    	('José'      ,'11-954895361','R. Duque de Caxias, 240 - Centro, São Roque - SP, 18130-150, Brasil'                                   ,-23.53361221845325,  -47.13631343096495,  '2021-04-01 22:40:00.000',54),--9
			    	('Lucas'     ,'11-954895362','R. Bento Antônio Pereira, 108 - Jardim Bela Vista, São Roque - SP, 18134-180, Brasil'                  ,-23.522456259856284, -47.13113375008106,  '2021-04-01 23:10:00.000',52),--3
			    	('Lourdes'   ,'11-954895363','R. Amador Marquês da Silva, 206 - Vila Marques, São Roque - SP, 18130-545, Brasil'                     ,-23.536676244974018, -47.13959611952305,  '2021-04-01 23:32:00.000',50),--15
			    	('Paulo'     ,'11-954895363','Av. das Palmeiras, 352 - Jardim Suiça Paulista, São Roque - SP, 18136-780, Brasil'                     ,-23.54111846486106,  -47.143758572638035, '2021-04-01 23:58:00.000',60),--15,22
			    	('Jair'      ,'11-954895365','R. Tamandaré, 63 - Vila Sao Rafael, São Roque - SP, 18131-500, Brasil'                                 ,-23.532264614370607, -47.1506505087018,   '2021-04-02 18:00:00.000',53),--2
			    	('Clecio'    ,'11-954895366','R. Primeiro-Sargento A Aparecido Pereira, 350 - Jardim Conceiçao, São Roque - SP, 18136-490, Brasil'   ,-23.551010563733737,  -47.136614844202995,'2021-04-02 18:10:00.000',60),--15,22
			    	('Maria'     ,'11-954895367','R. Padre Antônio Viêira, 71 - Paisagem Colonial, São Roque - SP, 18136-730, Brasil'                    ,-23.560269132348232, -47.146134339272976, '2021-04-02 18:30:00.000',73),--8,25
			    	('Lucio'     ,'11-954895368','Av. Guilherme de Almeida, 80 - Sao Roque, São Roque - SP, 18135-660, Brasil'                           ,-23.559611757072517, -47.12792918086051,  '2021-04-02 18:40:00.000',78),--15,4*32
			    	('Daniela'   ,'11-954895368','R. São Tibúrcio, 93 - Jardim Villaca, São Roque - SP, 18135-260, Brasil'                               ,-23.554321287649234, -47.12225899100303,  '2021-04-02 19:00:00.000',51),--12,
			    	('Samara'    ,'11-954895369','R. João Colo, 17 - Parque Primavera, São Roque - SP, 18135-590, Brasil'                                ,-23.560308470268833, -47.11494058370591,  '2021-04-02 19:10:00.000',60),--15,26
			    	('Celio'     ,'11-954895370','R. João Paulo I, 206 - Jardim Mosteiro, São Roque - SP, 18135-490, Brasil'                             ,-23.54766287359399,  -47.117252983152866, '2021-04-02 19:20:00.000',68),--2,22
			    	('Odair'     ,'11-954895371','R. Santa Leocádia, 95 - Jardim Villaca, São Roque - SP, 18135-310, Brasil'                             ,-23.545953342682566, -47.12087094783783,  '2021-04-02 19:30:00.000',74),--4,27
			    	('Luiz'      ,'11-954895372','R. das Papoulas, 568 - Vila Santa Rosalia, São Roque - SP, 18136-185, Brasil'                          ,-23.54702510621119,   -47.13165711611509, '2021-04-02 19:30:00.000',85),--5,30*3
			    	('Joel'      ,'11-954895373','Rua Msr A Morais 52 - Vila Mike, São Roque - SP, 18136-220, Brasil'                                    ,-23.5432211821392,    -47.13324632495642, '2021-04-02 19:42:00.000',82),--8,31,22
			    	('Maria'     ,'11-954895374','R. José Bonifácio de Andrada e Silva, 150 - Jardim Meny, São Roque - SP, 18130-005, Brasil'            ,-23.53514147415779,   -47.13589802384377, '2021-04-02 19:43:00.000',56),--13,
			    	('José'      ,'11-954895375','Av. Antonio Pannellini, 208 - Taboão, São Roque - SP, 18135-131, Brasil'                               ,-23.54373509944832,   -47.1220538020134,  '2021-04-02 19:48:00.000',126),--17,39
			    	('Pedro'     ,'11-954895376','R. Irineu Silveira, 121 - Vila Junqueira, São Roque - SP, 18136-100, Brasil'                           ,-23.540818469127807,  -47.13398527354001, '2021-04-02 19:49:00.000',53),--1,
			    	('alesandro' ,'11-954895377','R. Santa Augusta, 42 - Jardim Villaca, São Roque - SP, 18135-360, Brasil'                              ,-23.547008816208614,  -47.11882844567299, '2021-04-02 19:59:00.000',55),--15,18
			    	('Mauro'     ,'11-954895378','Av. Antônio Maria Picena, 139 - Vila Junqueira, São Roque - SP, 18136-040, Brasil'                     ,-23.540026673823945,  -47.13616892695426, '2021-04-02 20:13:00.000',54),--9,
			    	('Ana'       ,'11-954895379','R. Ten. Francisco Luís de Campos, 231 - Vila Junqueira, São Roque - SP, 18136-120, Brasil'             ,-23.53865854112339,   -47.133923918008804,'2021-04-02 20:15:00.000',70),--7,22
			    	('Dolores'   ,'11-954895380','Rua Marechal Deodoro da Fonseca, 360 - Centro, São Roque - SP, 18130-070, Brasil'                      ,-23.534870359166487,  -47.13308103382588, '2021-04-02 20:21:00.000',53),--1,
			    	('Marcio'    ,'11-954895381','R. Bento Antônio Pereira, 7 - Jardim Bela Vista, São Roque - SP, 18134-180, Brasil'                    ,-23.522989932825325,  -47.13158771395683, '2021-04-02 20:22:00.000',71),--7,27
			    	('Mecias'    ,'11-954895382','R. Santa Pedrina, 107 - Jardim Villaca, São Roque - SP, 18135-410, Brasil'                             ,-23.546045243597153,  -47.12182179093361, '2021-04-02 20:23:00.000',50),--15,
			    	('Jucemar'   ,'11-954895383','R. Maestro Porfírio Taváres, 335 - Jardim Maria Trindade, São Roque - SP, 18133-410, Brasil'           ,-23.518490227225822,  -47.12525971233845, '2021-04-02 20:29:00.000',55),--5,
			    	('Wagner'    ,'11-954895384','R. Júlio Xavier Ferreira, 130 - Jardim Maria Trindade, São Roque - SP, 18133-440, Brasil'              ,-23.51949642602654,   -47.12623938918114, '2021-04-02 22:33:00.000',120),--11,39
			    	('Adelia'    ,'11-954895384','R. João Pinto Splendore, 200, São Roque - SP, 18133-300, Brasil'                                       ,-23.51331093318866,   -47.129439264535904,'2021-04-02 22:45:00.000',56),--13,
			    	('Elaine'    ,'11-954895385','BR-272, 1325 - Taboão, São Roque - SP, 18135-125, Brasil'                                              ,-23.542411573883093,  -47.125645279884345,'2021-04-02 22:58:00.000',100),--11,35
			    	('Osmar'     ,'11-954895386','Rua Sabatini Alceste, 55, São Roque - SP, 18133-340, Brasil'                                           ,-23.514590173507546,  -47.13417571038008, '2021-04-02 22:59:00.000',54),--9
			    	('Thiago'    ,'11-954895387','R. das Rosas, 110 - Jardim Sao Jose, São Roque - SP, 18133-280, Brasil'                                ,-23.515013817285826,  -47.13141404092311, '2021-04-02 23:10:00.000',92),--6,29*4
			    	('Celma'     ,'11-954895389','R. São José, 205 - Jardim Sao Jose, São Roque - SP, 18133-255, Brasil'                                 ,-23.51485518160395,   -47.13278565555811, '2021-04-02 23:20:00.000',52),--3,
			    	('Helio'     ,'11-954895390','BR-272, 1325 - Taboão, São Roque - SP, 18135-125, Brasil'                                              ,-23.542411573883093,  -47.125645279884345,'2021-04-02 23:40:00.000',50),--15,
			    	('Robson'    ,'11-954895391','R. Minas Gerais, 240 - Vila Irene, São Roque - SP, 18132-080, Brasil'                                  ,-23.524010853023483,  -47.138444781303406,'2021-04-02 23:50:00.000',110),--11,31*4
			    	('Márcia'    ,'11-984701710','R. Mariápolis, 40 - Bairro do Carmo (Canguera), São Roque - SP, 18132-380, Brasil'                     ,-23.646257,           -47.076865,         '2021-04-03 19:00:00.000',118), -- 15, 7, 22
			    	('Henrique','11-985682008','R. Ângelo Meneguesso, 352 - Centro, São Roque - SP, 18130-433, Brasil'                                   ,-23.5315458,          -47.1406188,        '2021-04-03 19:00:00.000',91), -- 16, 36
			    	('Yasmin','11-989147417','Avenida Campo Limpo, 50 - Vila Nova São Roque, São Roque - SP, 18131-320, Brasil'                          ,-23.5252214,          -47.1524006,        '2021-04-03 19:38:00.000',118), -- 12, 13, 27
			    	('Priscila','11-991238914','Rua Sotero de Souza, 800 - Centro, São Roque - SP, 18130-200, Brasil'                                    ,-23.535687,           -47.1376056,        '2021-04-03 19:50:00.000',62), -- 14,23
			    	('Fábio','11-981921631','R. Francisco Tagliassachi, 82 - Jardim Rene, São Roque - SP, 18135-300, Brasil'                             ,-23.5389705,          -47.1304322,        '2021-04-03 19:55:00.000',196), -- 9,3,15,22,31x3
			    	('Joaquim','11-998581916','Av. Guilherme de Almeida, 271 - Jardim Santa Maria, São Roque - SP, 18135-660, Brasil'                    ,-23.5612862,          -47.1270003,        '2021-04-03 20:10:00.000',106), -- 17,35
			    	('Giovanna','11-998581916','R. dos Carvalhos, 54 - Jardim Guacu, São Roque - SP, 18132-440, Brasil'                                  ,-23.514503,           -47.1419799,        '2021-04-03 20:15:00.000',110), -- 6,15
			    	('Antonella','11-994231219','R. Santa Virgínia, 240 - Jardim Villaca, São Roque - SP, 18135-340, Brasil'                             ,-23.5476301,          -47.1214591,        '2021-04-03 21:10:00.000',70), -- 7,26
			    	('Geraldo','11-998581916','R. Cláudio de Souza, 129 - Vila Santa Rita, São Roque - SP, 18130-690, Brasil'                            ,-23.5301967,          -47.1269538,        '2021-04-03 21:12:00.000',72), -- 4,23
			    	('Danilo','11-998581916','R. Alexandre Bonini, 83 - Jardim Rene, São Roque - SP, 18135-040, Brasil'                                  ,-23.5392865,          -47.1298161,        '2021-04-03 21:30:00.000',106), -- 1, 14
			    	('Esther','11-998581916','Rua Monsenhor, 126 - Vila Santa Rosalia, São Roque - SP, 18136-220, Brasil'                                ,-23.5434782,          -47.1340701,        '2021-04-03 21:40:00.000',129), -- 5,15, 33x3
			    	('Thereza'   ,'11-954895357','Rua Santa Cruz, 117 - Vila Santa Isabel, São Roque - SP, 18136-025, Brasil'                            ,-23.536778603376078,  -47.13693100959063, '2021-04-03 21:50:00.000',55),--5
			    	('Paula','11-998581547','R. dos Carvalhos, 130 - Jardim Guacu, São Roque - SP, 18132-440, Brasil'                                    ,-23.5142204,          -47.141774,         '2021-04-03 21:50:00.000',55),--5
			    	('João','11-998581547','Rua Monsenhor, 77 - Vila Santa Rosalia, São Roque - SP, 18136-220, Brasil'                                   ,-23.5430125,          -47.1353322,        '2021-04-03 21:56:00.000',60), -- 7
			    	('Mateus','11-914682587','R. Marino Camurça, 78 - Centro, São Roque - SP, 18130-515, Brasil'                              	         ,-23.5260733,          -47.1335327,        '2021-04-03 21:56:00.000',54), -- 9
			    	('Cauê','11-994689587','R. Santo Antônio, 39 - Jardim Villaca, São Roque - SP, 18136-280, Brasil'                                    ,-23.547901,           -47.1236839,        '2021-04-03 22:00:00.000',54), -- 9
			    	('Elaine','11-994542875','R. Lívio Tagliassachi, 260 - Jardim Boa Vista, São Roque - SP, 18132-370, Brasil'                          ,-23.5173022,          -47.142984,         '2021-04-03 22:00:00.000',62), -- 14, 23
			    	('João'      ,'11-954895354','R. Paulino Hermílio de Campos, 58 - Centro, São Roque - SP, 18130-385, Brasil'                         ,-23.53009716835891,   -47.13880117982625, '2021-04-03 22:20:00.000',60),--3,25
			    	('Regina'      ,'11-975635521','R. Maria Guilhermina Lemos, 175-1 - Vila Junqueira, São Roque - SP, 18136-180, Brasil'  		     ,-23.541219,           -47.132667,         '2021-04-04 19:15:00.000',125), --5,7,22
			    	('Guilherme'   ,'11-987337822','R. Ten. Francisco Luís de Campos, 170-284 - Vila Junqueira, São Roque - SP, 18136-120, Brasil'       ,-23.538750,           -47.134115,         '2021-04-04 19:27:00.000',70), --8,25
			    	('Samuel'      ,'11-999737290','R. Primeiro de Maio, 40 - Estacao, São Roque - SP, 18131-025, Brasil'       					     ,-23.534235,           -47.141057,         '2021-04-04 19:59:00.000',123), --13,15,22,28
			    	('Lara'        ,'11-975377282','R. Goiás, 151-1 - Vila Irene, São Roque - SP, 18132-070, Brasil'      							     ,-23.523077,           -47.138289,         '2021-04-04 20:05:00.000',192), --3,6,7,22x2
			    	('Murilo'      ,'11-982672827','R. Leão XIII, 155-35 - Jardim Tanzi, São Roque - SP'       										     ,-23.524887,           -47.134738,         '2021-04-04 20:07:00.000',138), --1,7,35
			    	('Mariana'     ,'11-972838287','R. Bento Antônio Pereira, 157-1 - Jardim Bela Vista, São Roque - SP, 18134-180, Brasil'      	     ,-23.522280,           -47.131112,         '2021-04-04 20:25:00.000',121), --2,14
			    	('Beatriz'     ,'11-973728822','R. Francisco da Silva Pontes, 139 - Jardim Florida, São Roque - SP, 18133-040, Brasil'       	     ,-23.520116,           -47.132904,         '2021-04-04 20:29:00.000',167), --16,17,22,26
			    	('Isaque'      ,'11-963737826','R. Chad Kaid, 176 - Jardim Sao Jose, São Roque - SP, 18133-250, Brasil'      					     ,-23.515384,           -47.130244,         '2021-04-04 20:36:00.000',134), --5,10,23
			    	('Anthony'     ,'11-997362682','Av. Campo Limpo, 89-1 - Vila Nova Sao Roque, São Roque - SP, 18131-320, Brasil'       			     ,-23.525430,           -47.151320,         '2021-04-04 20:42:00.000',60), --6
			    	('Elisa'       ,'11-972384848','R. João Pinto Splendore, 150, São Roque - SP, 18133-300, Brasil'       							     ,-23.513574,           -47.129846,         '2021-04-04 20:48:00.000',52), --3
			    	('Nicolle'     ,'11-972828484','Av. Gérson Nastri, 163-197 - Vila Santa Rita, São Roque - SP, 18130-700, Brasil'      			     ,-23.530424,           -47.128567,         '2021-04-04 20:49:00.000',61), --12,22
			    	('Rebeca'      ,'11-962753848','R. Maria Antônia Constancia, 102 - Esplanada Mendes Moraes, São Roque - SP, 18130-770, Brasil'       ,-23.529932,           -47.130852,         '2021-04-04 20:51:00.000',256), --2,5,7,13,22,24,25
			    	('Caio'        ,'11-972548493','R. Comendador Inocêncio, 57 - Centro, São Roque - SP, 18130-480, Brasil'       					     ,-23.528263,           -47.134822,         '2021-04-04 20:55:00.000',50), --15
			    	('Emanuel'     ,'11-982627484','R. Dr. Silvério Moura García, 236 - Vila Santo Antonio, São Roque - SP, 18133-350, Brasil'           ,-23.513484,           -47.133281,         '2021-04-04 20:59:00.000',66), --13,26
			    	('Catarina'    ,'11-925648482','R. José Gômide de Castro, 251-207 - Jardim Maria Trindade, São Roque - SP, 18133-400, Brasil'        ,-23.517952,           -47.125405,         '2021-04-04 21:05:00.000',83), --5,28x4
			    	('Francisco'   ,'11-972838765','R. Padre Marçal, 570-662 - Vila Junqueira, São Roque - SP, 18136-120, Brasil'       			     ,-23.536231,           -47.133511,         '2021-04-04 21:26:00.000',80), --7,31x2
			    	('Otavio'      ,'11-976559877','R. Barra Bonita, 2-64 - Vila Nova Sao Roque, São Roque - SP, 18131-215, Brasil'      			     ,-23.527752,           -47.153366,         '2021-04-04 21:39:00.000',89), --11,28x2
			    	('Olivia'      ,'11-990273826','R. Manoel Lessa, 456 - Jardim Marieta, São Roque - SP, 18131-418, Brasil'       				     ,-23.529003,           -47.155923,         '2021-04-04 22:01:00.000',77), --16,27
			    	('Thiago'      ,'11-996921807','R. Manoel José Ferreira - Marmeleiro, São Roque - SP, 18120-000, Brasil'      				         ,-23.535409,           -47.160054,         '2021-04-04 22:18:00.000',78), --10,25
			    	('Renata'      ,'11-996324678','R. Maestro Porfírio Taváres, 102-298 - Jardim Maria Trindade, São Roque - SP, Brasil'      		     ,-23.518529,           -47.126278,         '2021-04-04 22:36:00.000',80), --15,28x2,29x2
			    	('André'       ,'11-994475231','R. Epaminondas de Oliveira, 12-132 - Centro, São Roque - SP, 18130-505, Brasil'      		         ,-23.526265,           -47.134675,         '2021-04-04 23:03:00.000',126), --17,40
			    	('Vicente'      ,'11-981539703','R. México, 121 - Vila Sao Rafael, São Roque - SP, 18131-453, Brasil'                                ,-23.5322361,          -47.1522304,        '2021-04-06 19:20:00.000',60),--3,25
			    	('Manuela'      ,'11-997414917','R. Padre Anchieta, 123 - Esplanada Mendes Moraes, São Roque - SP, 18130-720, Brasil'                ,-23.5283878,          -47.1304861,        '2021-04-06 19:20:00.000',56),--13
			    	('Elisa'      ,'11-997414917','R. Profa. Maria Antônia Constancia, 105 - Esplanada Mendes Moraes, São Roque - SP, 18130-770, Brasil' ,-23.5298451,          -47.1318728,        '2021-04-06 19:20:00.000',62),--8
			    	('Ana'      ,'11-997414874','Av. Gérson Nastri, 78 - Vila Santa Rita, São Roque - SP, 18130-700, Brasil'                             ,-23.5305001,          -47.1296621,        '2021-04-06 19:50:00.000',70),--810
			    	('Roberto'     ,'11-933215787','R. Rosa Passos, 95 - Vila Irene, São Roque - SP, 18132-050, Brasil'      		                     ,-23.523551,           -47.137127,         '2021-04-07 19:23:00.000',69), --9,34x2
			    	('Juliana'     ,'11-995568741','R. Paraná, 107-63 - Vila Irene, São Roque - SP, 18132-110, Brasil'      		                     ,-23.524912,           -47.137406,         '2021-04-07 19:57:00.000',78), --1,35
			    	('Aline'       ,'11-994475231','Av. São Roque, 80-158 - Estacao, São Roque - SP, 18130-545, Brasil'      		                     ,-23.535702,           -47.139583,         '2021-04-07 20:12:00.000',158), --8,16,29x2,32x2
			    	('Pamela'      ,'11-994475231','R. Santa Pedrina, 49 - Jardim Villaca, São Roque - SP, 18135-410, Brasil'      		                 ,-23.545277,           -47.122203,         '2021-04-07 20:34:00.000',90), --5,28x5
			    	('Lucas'       ,'11-994475231','R. Bento Antônio Pereira, 160-246 - Jardim Bela Vista, São Roque - SP, 18134-180, Brasil'            ,-23.521224,           -47.130670,         '2021-04-07 20:45:00.000',60), --15,22
			    	('Alan'        ,'11-994475231','R. Rotary Club, 78-230 - Jardim Florida, São Roque - SP, 18133-050, Brasil'      		             ,-23.520360,           -47.134009,         '2021-04-07 21:32:00.000',130), --11,38
			    	('André'       ,'11-994475231','R. Epaminondas de Oliveira, 12-132 - Centro, São Roque - SP, 18130-505, Brasil'      		         ,-23.526265,           -47.134675,         '2021-04-07 23:03:00.000',126), --17,40
			    	('Fabio'     ,'11-957395470'  ,'R. Tibiriçá, 78 - Esplanada Mendes Moraes, São Roque - SP, 18130-800, Brasil'                        ,-23.528416612322687,  -47.13103383779526 ,'2021-04-08 19:00:00.000',122),--7,8
			    	('Lindalvo'  ,'11-938541048'  ,'R. São Joaquim, 100 - Sao Roque, São Roque - SP, 18130-220, Brasil'                                  ,-23.534602010104486,  -47.138254679739475,'2021-04-08 19:15:00.000',151),--11,12,36
			    	('Andre'     ,'11-956021428'  ,'R. Tomás Antônio Gonzaga, 325 - Paisagem Colonial, São Roque - SP, 18136-700, Brasil'                ,-23.557902381564233,  -47.14839577674865 ,'2021-04-08 19:17:00.000',50),--15
			    	('Geraldo'   ,'11-976362387'  ,'R. Primeiro-Sargento A Aparecido Pereira, 100 - Jardim Conceicao, São Roque - SP, 18136-490, Brasil' ,-23.55038080370918,   -47.138280160725124,'2021-04-08 19:40:00.000',66),--13,22
			    	('Ana'       ,'11-954895379'  ,'R. Ten. Francisco Luís de Campos, 231 - Vila Junqueira, São Roque - SP, 18136-120, Brasil'           ,-23.53865854112339,   -47.133923918008804,'2021-04-08 20:05:00.000',58),--2
			    	('Geraldo'   ,'11-976362387'  ,'R. Primeiro-Sargento A Aparecido Pereira, 100 - Jardim Conceicao, São Roque - SP, 18136-490, Brasil' ,-23.55038080370918,   -47.138280160725124,'2021-04-08 20:50:00.000',55),--5
			    	('Malaquias' ,'11-973645635'  ,'R. dos Carvalhos, 224 - Jardim Guacu, São Roque - SP, 18132-440, Brasil'                             ,-23.513228847408648,  -47.14126713573933 ,'2021-04-08 21:05:00.000',60),--12,23
			    	('Marcio'    ,'11-954895381'  ,'R. Bento Antônio Pereira, 7 - Jardim Bela Vista, São Roque - SP, 18134-180, Brasil'                  ,-23.522989932825325,  -47.13158771395683 ,'2021-04-08 21:50:00.000',91),--17.22
			    	('Patrícia'  ,'11-905747585'  ,'R. Ida, 118 - Vila Santo Antonio, São Roque - SP, 18133-290, Brasil'                                 , -23.515310182660063, -47.13280007243156 ,'2021-04-08 23:00:00.000',85),--11,10
			    	('Dolores'   ,'11-954895380'  ,'Rua Marechal Deodoro da Fonseca, 360 - Centro, São Roque - SP, 18130-070, Brasil'                    ,-23.534870359166487,  -47.13308103382588 ,'2021-04-08 23:50:00.000',50),--15
			    	('Januário','11-913957395','R. José Vitório Cavalheiros, 127 - Jardim Maria Trindade, São Roque - SP, 18133, Brasil'                 ,-23.51883054647095,   -47.12518058717251 ,'2021-04-09 19:40:00.000',60),--15,22
			    	('Amanda','11-995856484','R. Ida, 154 - Vila Santo Antonio, São Roque - SP, 18133-290, Brasil'                                       ,-23.5151380202832,    -47.132128179073334,'2021-04-09 19:50:00.000',70),--7,22
			    	('Romualdo','11-954758584','Av. Anhanguera, 166 - Jardim Bandeirantes, São Roque - SP, 18134-240, Brasil'                            ,-23.52378951598343,   -47.1325982362032  ,'2021-04-09 20:10:00.000',75),--9,32*3
			    	('Vinicius','11-997654648','R. Paulino Hermílio de Campos, 116 - Centro, São Roque - SP, 18130-385, Brasil'                          ,-23.530205372438676,  -47.13948681950569 ,'2021-04-09 20:20:00.000',53),--14
			    	('Francisco','11-987654365','R. Joaquim Silveira Mello, 209 - Jardim Carambei, São Roque - SP, 18132-170, Brasil'                    ,-23.523613675736318,  -47.14176636189222 ,'2021-04-09 20:40:00.000',62),--8
			    	('Augusto','11-976476365','Rua Cardeal, 432, São Roque - SP, Brasil'                                                                 ,-23.509749838999195,  -47.14945625513792 ,'2021-04-09 21:10:00.000',60),--6
			    	('Antônia','11-967600224','Rua Araras, 118 - Jardim Carambei, São Roque - SP, 18132-270, Brasil'                                     ,-23.521246572621433,  -47.14085709303617 ,'2021-04-09 21:20:00.000',80),--10,26
			    	('Jussara','11-911133445','R. Cap. Fernão Paes de Barros, 218 - Jardim Bela Vista, São Roque - SP, 18134-150, Brasil'                ,-23.52193303690705,   -47.129760794341564,'2021-04-09 21:30:00.000',50),--15
			    	('Amaral','11-968885533','R. Prof. Júlio César de Oliveira, 118 - Jardim Villaca, São Roque - SP, 18130-630, Brasil'                 ,-23.53231195288663,   -47.12795801460742 ,'2021-04-09 21:50:00.000',79),--2,28*3
			    	('Bruna','11-999774456','R. São Tibúrcio, 376 - Sao Roque, São Roque - SP, 18135-260, Brasil'                                        ,-23.55455609631582,   -47.12289299815893 ,'2021-04-09 22:30:00.000',52),--3
			    	('Cristiane' ,'11-954895360','Av. João Pessoa, 378 - Centro, São Roque - SP, 18130-290, Brasil'                                      ,-23.532246785574436,  -47.13871601969004 ,'2021-04-09 22:35:00.000',142),--8,14,29*2,27
			    	('Cecilia','11-977755332','R. Júlio Salvetti, 33 - Parque Primavera, São Roque - SP, 18135-580, Brasil'                              ,-23.560312772853194,  -47.11548440158368 ,'2021-04-09 22:40:00.000',53),--14
			    	('Daniel','11-955543947','R. Dirceu P de Andrade, 183 - Jardim Vinhas do Sol (Mailasqui), São Roque - SP, 18143-665, Brasil'         ,-23.566244673353136,  -47.08882391452789 ,'2021-04-09 22:45:00.000',60),--15,22
			    	('José'      ,'11-954895361','R. Duque de Caxias, 240 - Centro, São Roque - SP, 18130-150, Brasil'                                   ,-23.53361221845325,   -47.13631343096495 ,'2021-04-09 23:20:00.000',54),--9
			    	('Daniel','11-955543947','R. Dirceu P de Andrade, 183 - Jardim Vinhas do Sol (Mailasqui), São Roque - SP, 18143-665, Brasil'         ,-23.566244673353136,  -47.08882391452789 ,'2021-04-09 23:25:00.000',76),--16,22
			    	('Emilson','11-946489887','R. José Rosa, 140 - Jardim Ponta-Pora (Mailasqui), São Roque - SP, 18143-757, Brasil'                     ,-23.559755587007174,  -47.09486357867718 ,'2021-04-09 23:30:00.000',52),--3
			    	('Elaine'    ,'11-954895385','BR-272, 1325 - Taboão, São Roque - SP, 18135-125, Brasil'                                              ,-23.542411573883093,  -47.125645279884345,'2021-04-10 19:01:00.000',75),--13, 18,19
			    	('Osmar'     ,'11-954895386','Rua Sabatini Alceste, 55, São Roque - SP, 18133-340, Brasil'                                           ,-23.514590173507546,  -47.13417571038008, '2021-04-10 19:10:00.000',66),--16
			    	('Thiago'    ,'11-954895387','R. das Rosas, 110 - Jardim Sao Jose, São Roque - SP, 18133-280, Brasil'                                ,-23.515013817285826,  -47.13141404092311, '2021-04-10 19:15:00.000',58),--2
			    	('Manuela'      ,'11-997414917','R. Padre Anchieta, 123 - Esplanada Mendes Moraes, São Roque - SP, 18130-720, Brasil'                ,-23.5283878,          -47.1304861,        '2021-04-10 19:20:00.000',56),--13
			    	('Elisa'      ,'11-997414917','R. Profa. Maria Antônia Constancia, 105 - Esplanada Mendes Moraes, São Roque - SP, 18130-770, Brasil' ,-23.5298451,          -47.1318728,        '2021-04-10 19:20:00.000',69),--13, 29x2
			    	('Ana'       ,'11-954895379','R. Ten. Francisco Luís de Campos, 231 - Vila Junqueira, São Roque - SP, 18136-120, Brasil'             ,-23.53865854112339,   -47.133923918008804,'2021-04-10 20:00:00.000',70),--7,22
			    	('Dolores'   ,'11-954895380','Rua Marechal Deodoro da Fonseca, 360 - Centro, São Roque - SP, 18130-070, Brasil'                      ,-23.534870359166487,  -47.13308103382588, '2021-04-10 20:00:00.000',53),--1
			    	('Iago'   ,'11-954895946','R. Prof. Joaquim de Oliveira, 112 - Centro, São Roque - SP, 18130-140, Brasil'                            ,-23.5338794,          -47.135989,         '2021-04-10 20:15:00.000',236),--15x2,7,13,22x2
			    	('Elias'   ,'11-936985380','R. Duque de Caxias, 362 - Centro, São Roque - SP, 18130-150, Brasil'                                     ,-23.5339808,          -47.136148,         '2021-04-10 20:15:00.000',50),--15
			    	('Luiz'      ,'11-954895372','R. das Papoulas, 568 - Vila Santa Rosalia, São Roque - SP, 18136-185, Brasil'                          ,-23.54702510621119,   -47.13165711611509, '2021-04-10 20:30:00.000',85),--5,30*3
			    	('Joel'      ,'11-954895373','Rua Msr A Morais 52 - Vila Mike, São Roque - SP, 18136-220, Brasil'                                    ,-23.5432211821392,    -47.13324632495642, '2021-04-10 20:42:00.000',82),--8,31,22
			    	('Maria'     ,'11-954895374','R. José Bonifácio de Andrada e Silva, 150 - Jardim Meny, São Roque - SP, 18130-005, Brasil'            ,-23.53514147415779,   -47.13589802384377, '2021-04-10 20:43:00.000',56),--13,
			    	('Betina'     ,'11-954895999','R. Santana, 105 - Vila Marques, São Roque - SP, 18130-555, Brasil'                                    ,-23.5362918,          -47.1392895,        '2021-04-10 20:43:00.000',56),--13,
			    	('Flávia'     ,'11-979895374','Av. Nhá Vita, 28 - Vila Junqueira, São Roque - SP, 18136-080, Brasil'                                 ,-23.5402,             -47.135387,         '2021-04-10 20:43:00.000',60),--6,
			    	('Tomás'     ,'11-989895374','R. São Paulo, 660 - Centro, São Roque - SP, 18135-125, Brasil'                                         ,-23.540064,           -47.1316376,        '2021-04-10 20:49:00.000',113),--12, 1, 23
			    	('Lucca'     ,'11-989899634','R. Boa Vista, 80 - Vila Mike, São Roque - SP, 18136-240, Brasil'                                       ,-23.5451837,          -47.1346821,        '2021-04-10 20:58:00.000',54),--9
			    	('Juan'     ,'11-99684513 ','R. Santa Emília, 62 - Jardim Villaca, São Roque - SP, 18135-400, Brasil'                                ,-23.5462076,          -47.1227761,        '2021-04-10 21:03:00.000',50),--15
			    	('Filipe'     ,'11-999874516 ','R. Sergipe, 107 - Taboão, São Roque - SP, 18135-130, Brasil'                                         ,-23.5429047,          -47.1259609,        '2021-04-10 21:15:00.000',66),--15,33x2
                    ('Anthony'     ,'11-997362682','Av. Campo Limpo, 89-1 - Vila Nova Sao Roque, São Roque - SP, 18131-320, Brasil'       			     ,-23.525430,           -47.151320,         '2021-04-11 19:42:00.000',60), --7
                    ('Fernando'    ,'11-954040544','R. Jacareí, 42-218 - Vila Nova Sao Roque, São Roque - SP, 18131-160, Brasil'                         ,-23.526654,           -47.155182,         '2021-04-11 19:58:00.000',74), --2,29x2
                    ('Anthony'     ,'11-915464467','Rua Msr Aguiar, 107 - Vila Mike, São Roque - SP, 18136-220, Brasil'       			                 ,-23.543283,           -47.132968,         '2021-04-11 19:42:00.000',118), --1,9,27
                    ('Vicente'     ,'11-981539703','R. México, 121 - Vila Sao Rafael, São Roque - SP, 18131-453, Brasil'                                 ,-23.532236,           -47.152230,         '2021-04-06 19:20:00.000',60),--3,25
                    ('Emanuel'     ,'11-982627484','R. Dr. Silvério Moura García, 236 - Vila Santo Antonio, São Roque - SP, 18133-350, Brasil'           ,-23.513484,           -47.133281,         '2021-04-04 20:59:00.000',66), --13,26
                    ('Lara'        ,'11-912344975','R. Goiás, 151-1 - Vila Irene, São Roque - SP, 18132-070, Brasil'      							     ,-23.523077,           -47.138289,         '2021-04-04 20:05:00.000',75),--13, 18,19
                    ('Julia'       ,'11-999874895','Av. São Roque, 403 - Sao Roque, São Roque - SP, 18131-000, Brasil'       			                 ,-23.537481,           -47.140567,         '2021-04-11 20:39:00.000',176), --11,12,35,36
                    ('Roberta'     ,'11-991348741','R. Aparecido Nunes de Moraes, 60-246 - Jardim Ponta-Pora, São Roque - SP, 18143-763, Brasil'         ,-23.557623,           -47.094701,         '2021-04-11 20:41:00.000',66), --5,18,19
                    ('Cecilia'     ,'11-974644784','R. Novellara, 94-302 - Vila Mike, São Roque - SP, 18136-255, Brasil'       			                 ,-23.547314,           -47.130419,         '2021-04-11 20:59:00.000',202), --1,2,5,27,36
                    ('Janaina'     ,'11-961161884','R. Santa Isabel, 4-128 - Vila Marques, São Roque - SP, 18130-565, Brasil'       			         ,-23.536340,           -47.137685,         '2021-04-11 21:16:00.000',76), --7,29x2
                    ('Bruna'       ,'11-913485741','Av. Santa Rita, 192-306 - Vila Santa Rita, São Roque - SP, 18130-675'       			             ,-23.531743,           -47.129682,         '2021-04-11 21:37:00.000',161), --8,9,39
                    ('Viviane'     ,'11-979189171','Alameda Di Turim, São Roque - SP, Brasil'       			                                         ,-23.497653,           -47.142593,         '2021-04-11 21:56:00.000',268), --1,7x2,8,22,24,28x2
                    ('Geisa'       ,'11-916789434','R. Newton Prado, 64-192 - Estacao, São Roque - SP, 18131-030, Brasil'       			             ,-23.534856,           -47.140419,         '2021-04-11 22:15:00.000',60), --7
                    ('Yasmin'      ,'11-989147417','Avenida Campo Limpo, 50 - Vila Nova São Roque, São Roque - SP, 18131-320, Brasil'                    ,-23.525221,           -47.152400,         '2021-04-03 22:38:00.000',118), -- 12, 13, 27
                    ('luiz'        ,'11-961821647','R. Garfield Pereira Barreto, 19 - Centro, São Roque - SP, 18130-380, Brasil'       			         ,-23.531818,           -47.139337,         '2021-04-11 22:45:00.000',75), --11
                    ('Henrique'    ,'11-916578481','R. Dr. Stevaux, 93-197 - Centro, São Roque - SP, 18130-500, Brasil'       			                 ,-23.529674,           -47.133967,         '2021-04-11 23:03:00.000',85), --6,36
                    ('Mariana'     ,'11-972838287','R. Bento Antônio Pereira, 157-1 - Jardim Bela Vista, São Roque - SP, 18134-180, Brasil'      	     ,-23.522280,           -47.131112,         '2021-04-13 20:00:00.000',60), --7
                    ('Beatriz'     ,'11-973728822','R. Francisco da Silva Pontes, 139 - Jardim Florida, São Roque - SP, 18133-040, Brasil'       	     ,-23.520116,           -47.132904,         '2021-04-13 20:15:00.000',50), --15
                    ('Isaque'      ,'11-963737826','R. Chad Kaid, 176 - Jardim Sao Jose, São Roque - SP, 18133-250, Brasil'      					     ,-23.515384,           -47.130244,         '2021-04-13 20:25:00.000',66), --16
                    ('Anthony'     ,'11-997362682','Av. Campo Limpo, 89-1 - Vila Nova Sao Roque, São Roque - SP, 18131-320, Brasil'       			     ,-23.525430,           -47.151320,         '2021-04-13 20:33:00.000',60), --7
                    ('Thiago'      ,'11-954895387','R. das Rosas, 110 - Jardim Sao Jose, São Roque - SP, 18133-280, Brasil'                              ,-23.515013817285826,  -47.13141404092311, '2021-04-13 20:45:00.000',64),--2, 19
					('Amanda'      ,'11-991451870','R. Barão do Rio Branco, 2-162 - Centro, São Roque - SP, 18130-020, Brasil'                           ,-23.536457,           -47.134066,         '2021-04-14 19:19:00.000',58), --15,25
					('Zenilda'     ,'11-990898105','R. Silvio Edgar Rosa, 2-98 - Jardim Esther, São Roque - SP, 18131-070, Brasil'                       ,-23.531536,           -47.140946,         '2021-04-14 19:47:00.000',126), --1,4,26
					('Pamela'      ,'11-994475231','R. Santa Pedrina, 49 - Jardim Villaca, São Roque - SP, 18135-410, Brasil'      		                 ,-23.545277,           -47.122203,         '2021-04-07 19:55:00.000',90), --5,28x5
					('Nickolas'    ,'11-994165401','Rua Sabatini Alceste, 133-9, São Roque - SP, 18133-340, Brasil'                                      ,-23.515073,           -47.134350,         '2021-04-14 20:09:00.000',141), --5,12,28x5
					('Eli'         ,'11-995751620','R. Juvenal Novaes, 44-156 - Parque Varanguera, São Roque - SP, 18132-560, Brasil'                    ,-23.510137,           -47.143659,         '2021-04-14 20:35:00.000',68), --14,18
					('Luiza'       ,'11-999018410','R. Bernardino Pereira Leite, 1 - Jardim Maria Trindade, São Roque - SP, 18133-365, Brasil'           ,-23.516374,           -47.126421,         '2021-04-14 20:57:00.000',91), --16,35
					('Erica'       ,'11-998261048','Av. Três de Maio, 982 - Parque IX de Julho, São Roque - SP, 18133-445, Brasil'                       ,-23.519261,           -47.127954,         '2021-04-14 21:13:00.000',63), --1,26
					('Sebastião'   ,'11-989402108','R. Francisco da Silva Pontes, 103 - Jardim Florida, São Roque - SP, 18133-040, Brasil'               ,-23.520508,           -47.133294,         '2021-04-14 22:01:00.000',66), --15,29x2
					('Emily'       ,'11-995594824','Rua Antônio Cavaglieri, 65 - Centro, São Roque - SP, 18130-065, Brasil'       		                 ,-23.533422,           -47.139856,         '2021-04-14 22:33:00.000',127), --2,7,23
					('Fernada','11-989876765','R. José F Rodrigues, 75 - Jardim Vinhas do Sol (Mailasqui), São Roque - SP, 18143-665, Brasil'            , -23.56468935015538,  -47.08935834467411, '2021-04-15 19:05:00.000',70),--7,22
					('Gisele','11-979944637','R. Profa. Célia Asse Jacob, 3 - Centro (Mailasqui), São Roque - SP, 18143-073, Brasil'                     ,-23.556351876996285,  -47.09145314991475, '2021-04-15 19:33:00.000',65),--13,24
					('Hamilton','11-953684683','R. Paraguai, 250 - Vila Sao Rafael, São Roque - SP, 18131-475, Brasil'                                   ,-23.53371580879795,   -47.152799628674984,'2021-04-15 19:45:00.000',98),--16,33*4
					('Claudio','11-999555647','R. Ten. Francisco Luís de Campos, 332 - Vila Junqueira, São Roque - SP, 18136-120, Brasil'                ,-23.53877595949601,   -47.1328305825591,  '2021-04-15 20:15:00.000',126),--17,39
					('Maria','11-911223857','R. José Bonifácio de Andrada e Silva, 220 - Jardim Meny, São Roque - SP, 18130-005, Brasil'                 ,-23.53514147415779,   -47.13589802384377, '2021-04-15 20:43:00.000',80),--10,26
					('José','11-944456634','R. Maestro Porfírio Taváres, 335 - Jardim Maria Trindade, São Roque - SP, 18133-410, Brasil'                 ,-23.518490227225822,  -47.12525971233845, '2021-04-15 20:57:00.000',50),--15
					('Marco','11-967777563','R. José Gômide de Castro, 170- Jardim Maria Trindade, São Roque - SP, 18133-400, Brasil'                    ,-23.51821231456105,   -47.126943469047546,'2021-04-15 21:40:00.000',53),--14
					('Junior','11-922344345','Rua Marechal Deodoro da Fonseca, 361 - Centro, São Roque - SP, 18130-070, Brasil'                          ,-23.534870359166487,  -47.13308103382588, '2021-04-15 21:50:00.000',105),--5,30*5
					('Raimundo','11-956667788','Rua Santa Cruz, 120 - Vila Santa Isabel, São Roque - SP, 18136-025, Brasil'                              ,-23.536778603376078,  -47.13693100959063, '2021-04-15 21:55:00.000',60),--6,
					('Joāo','11-901375893','R. João Pinto Splendore, 205, São Roque - SP, 18133-300, Brasil'                                             ,-23.51331093318866,   -47.129439264535904,'2021-04-15 22:59:00.000',53),--1
					('José','11-964700044','R. das Rosas, 115 - Jardim Sao Jose, São Roque - SP, 18133-280, Brasil'                                      ,-23.515013817285826,  -47.13141404092311, '2021-04-15 23:30:00.000',60),--7
					('Pedro','11-964574250','R. Bento Antônio Pereira, 10 - Jardim Bela Vista, São Roque - SP, 18134-180, Brasil'                        ,-23.522989932825325,  -47.13158771395683 ,'2021-04-16 19:10:00.000',70),--7,26
					('Douglas','11-953688665','R. Ten. Francisco Luís de Campos, 238 - Vila Junqueira, São Roque - SP, 18136-120, Brasil'                ,-23.53865854112339,-   47.133923918008804,'2021-04-16 19:20:00.000',54),--9
					('Luciana','11-956479994','R. Santa Pedrina, 110 - Jardim Villaca, São Roque - SP, 18135-410, Brasil'                                ,-23.546045243597153,  -47.12182179093361 ,'2021-04-16 19:30:00.000',62),--12,27
					('Alex','11-933334758','R. Paulino Hermílio de Campos, 61 - Centro, São Roque - SP, 18130-385, Brasil'                               ,-23.53009716835891,   -47.13880117982625 ,'2021-04-16 19:50:00.000',64),--14,27
					('Thereza','11-955667782','R. Irineu Silveira, 126 - Vila Junqueira, São Roque - SP, 18136-100, Brasil'                              ,-23.540818469127807,  -47.13398527354001 ,'2021-04-16 20:20:00.000',60),--15,26
					('Jeferson','11-959477449','Av. João Pessoa, 381 - Centro, São Roque - SP, 18130-290, Brasil'                                        ,-23.532246785574436,  -47.13871601969004 ,'2021-04-16 20:30:00.000',74),--4,27
					('Osmar','11-958888857','R. Primeiro-Sargento A Aparecido Pereira, 357 - Jardim Conceiçao, São Roque - SP, 18136-490, Brasil'        ,-23.551010563733737,  -47.136614844202995,'2021-04-16 20:40:00.000',86),--8,29*3
					('Elisangela','11-973001497','R. Amador Marquês da Silva, 201 - Vila Marques, São Roque - SP, 18130-545,Brasil'                      ,-23.536676244974018,  -47.13959611952305 ,'2021-04-16 20:55:00.000',120),--15,10
					('Marlene','11-944556671','R. São José, 210 - Jardim Sao Jose, São Roque - SP, 18133-255, Brasil'                                    ,-23.51485518160395,   -47.13278565555811 ,'2021-04-16 21:15:00.000',55),--5
					('Dolores','11-999334758','R. Nicolau Chad, 83 - Vila Borghesi, São Roque - SP, 18136-271, Brasil'                                   ,-23.54648814977974,   -47.13044676929712 ,'2021-04-16 21:33:00.000',60),--15,26
					('Aline','11-944457523','R. Tomás Antônio Gonzaga, 250 - Paisagem Colonial, São Roque - SP, 18136-700, Brasil'                       ,-23.556905081914525,  -47.14863214641809 ,'2021-04-16 21:45:00.000',51),--12
					('Concheta','11-955565431','Av. Antônio Maria Picena, 140 - Vila Junqueira, São Roque - SP, 18136-040, Brasil'                       ,-23.540026673823945,  -47.13616892695426 ,'2021-04-16 21:48:00.000',84),--13,28*4
					('Luiz','11-964746739','R. Duque de Caxias, 242 - Centro, São Roque - SP, 18130-150, Brasil'                                         ,-23.53361221845325,   -47.13631343096495 ,'2021-04-16 21:47:00.000',69),--2,27
					('Dirce','11-9553214481','R. Tamandaré, 66 - Vila Sao Rafael, São Roque - SP, 18131-500, Brasil'                                     ,-23.532264614370607,  -47.1506505087018  ,'2021-04-16 22:13:00.000',70),--6,26
					('Jonas','11-933458711','R. Rotary Club, 273 - Jardim Florida, São Roque - SP, 18133-050, Brasil'                                    ,-23.519199455228087,  -47.132859751582146,'2021-04-16 22:25:00.000',126),--12,11
					('Caio','11-967444557','R. Bento Antônio Pereira, 111 - Jardim Bela Vista, São Roque - SP, 18134-180, Brasil'                        ,-23.522456259856284,  -47.13113375008106 ,'2021-04-16 22:38:00.000',55),--5
					('Rogerio','11-912324645','Av. Guilherme de Almeida, 83 - Sao Roque, São Roque - SP, 18135-660, Brasil'                              ,-23.559611757072517,  -47.12792918086051 ,'2021-04-16 23:33:00.000',81),--10.27
					('Juliana','11-978665578','R. das Papoulas, 571 - Vila Santa Rosalia, São Roque - SP, 18136-185, Brasil'                             ,-23.54702510621119,   -47.13165711611509 ,'2021-04-16 23:40:00.000',79),--2,28*3
                    ('Lucio'     ,'11-954895368','Av. Guilherme de Almeida, 80 - Sao Roque, São Roque - SP, 18135-660, Brasil'                           ,-23.559611757072517,  -47.12792918086051, '2021-04-17 19:30:00.000',50),--15
                    ('Daniela'   ,'11-954895368','R. São Tibúrcio, 93 - Jardim Villaca, São Roque - SP, 18135-260, Brasil'                               ,-23.554321287649234,  -47.12225899100303, '2021-04-17 19:33:00.000',136),--17,38
                    ('Samara'    ,'11-954895369','R. João Colo, 17 - Parque Primavera, São Roque - SP, 18135-590, Brasil'                                ,-23.560308470268833,  -47.11494058370591, '2021-04-17 19:42:00.000',80),--15,31x3
                    ('Giovanna'  ,'11-998581916','R. dos Carvalhos, 54 - Jardim Guacu, São Roque - SP, 18132-440, Brasil'                                ,-23.514503,           -47.1419799,        '2021-04-17 20:15:00.000',110), -- 6,15
                    ('Antonella' ,'11-994231219','R. Santa Virgínia, 240 - Jardim Villaca, São Roque - SP, 18135-340, Brasil'                            ,-23.5476301,          -47.1214591,        '2021-04-17 21:10:00.000',70), -- 7,26
                    ('Geraldo'   ,'11-998581916','R. Cláudio de Souza, 129 - Vila Santa Rita, São Roque - SP, 18130-690, Brasil'                         ,-23.5301967,          -47.1269538,        '2021-04-17 21:12:00.000',72), -- 4,23
                    ('Regina'    ,'11-975635521','R. Maria Guilhermina Lemos, 175-1 - Vila Junqueira, São Roque - SP, 18136-180, Brasil'  		         ,-23.541219,           -47.132667,         '2021-04-17 19:15:00.000',144), --11,7,23
                    ('Murilo'    ,'11-982672827','R. Leão XIII, 155-35 - Jardim Tanzi, São Roque - SP'       										     ,-23.524887,           -47.134738,         '2021-04-18 19:07:00.000',138), --1,7,35
                    ('Alan'      ,'11-994475231','R. Rotary Club, 78-230 - Jardim Florida, São Roque - SP, 18133-050, Brasil'      		                 ,-23.520360,           -47.134009,         '2021-04-18 19:32:00.000',130), --11,38
                    ('Jucemar'   ,'11-954895383','R. Maestro Porfírio Taváres, 335 - Jardim Maria Trindade, São Roque - SP, 18133-410, Brasil'           ,-23.518490227225822,  -47.12525971233845, '2021-04-18 19:29:00.000',55),--5,
                    ('Marcos'    ,'11-954895355','R. José Gômide de Castro, 127 - Jardim Maria Trindade, São Roque - SP, 18133-400, Brasil'              ,-23.51821231456105,  -47.126943469047546, '2021-04-18 19:40:00.000',130),--11,38
                    ('Cintia'    ,'11-954895355','R. Manoel Lessa, 119 - Jardim Marieta, São Roque - SP, 18131-418, Brasil'                              ,-23.529431,           -47.155002,         '2021-04-18 20:04:00.000',66), --16
                    ('Francisco' ,'11-954895355','R. Marília, 415 - Vila Nova Sao Roque, São Roque - SP, 18131-250, Brasil'                              ,-23.524842,           -47.150880,         '2021-04-18 20:16:00.000',66),--15,33x2
                    ('Gilberto'  ,'11-965654604','R. Prof. Joaquim Firmino de Lima, 126 - Jardim Villaca, São Roque - SP, 18135-270, Brasil'             ,-23.553444,           -47.122278,         '2021-04-18 20:31:00.000',64),--14,27
                    ('Lucas'     ,'11-945480521','R. Diamante, 140 - Parque Alianca, São Roque - SP, 18136-450, Brasil'                                  ,-23.552795,           -47.136505,         '2021-04-18 20:52:00.000',70),--7,26
                    ('Flávio'    ,'11-901684184','R. das Petúnias, 101-1 - Vila Amaral, São Roque - SP, 18136-300, Brasil'                               ,-23.549896,           -47.133317,         '2021-04-18 21:10:00.000',65),--13,24
                    ('Carol'     ,'11-998450054','R. Ismênia Rosa, 105-37 - Jardim Meny, São Roque - SP, 18130-010, Brasil'                              ,-23.538560,           -47.135605,         '2021-04-18 21:25:00.000',79),--2,28*3
                    ('Rafaela'   ,'11-905497032','R. Amador Marquês da Silva, 140 - Vila Marques, São Roque - SP, 18130-545, Brasil'                     ,-23.536331,           -47.139187,         '2021-04-18 21:48:00.000',80),--10,26
                    ('Monique'   ,'11-909484094','Rua Marechal Deodoro da Fonseca, 347-289 - Centro, São Roque - SP, 18130-120, Brasil'                  ,-23.534433,           -47.133388,         '2021-04-18 21:53:00.000',84),--13,28*4
                    ('Joana'     ,'11-954984030','Av. Tiradentes, 148 - Centro, São Roque - SP, 18130-470, Brasil'                                       ,-23.529127,           -47.134633,         '2021-04-18 22:13:00.000',70), -- 7,26
                    ('Roberto'   ,'11-990508455','R. Marino Camurça, 22-110 - Centro, São Roque - SP, 18130-515, Brasil'                                 ,-23.526368,           -47.132784,         '2021-04-18 22:20:00.000',85), --6,36
                    ('Denis'     ,'11-998780150','R. Epaminondas de Oliveira, 289-133 - Centro, São Roque - SP, 18130-505, Brasil'                       ,-23.524873,           -47.134002,         '2021-04-18 22:43:00.000',51),--12
                    ('Gerusa'    ,'11-989044087','R. Cap. Fernão Paes de Barros, 36-182 - Jardim Bela Vista, São Roque - SP, 18134-150, Brasil'          ,-23.523166,           -47.130158,         '2021-04-18 22:57:00.000',62),--8	
                    ('Jonathan'  ,'11-999984098','R. das Rosas, 31-1 - Jardim Sao Jose, São Roque - SP, 18133-280, Brasil'                               ,-23.516259,           -47.133037,         '2021-04-18 23:05:00.000',53),--14
                    ('Rogerio'   ,'11-998904123','R. Alm. Barroso, 20 - Vila Sao Rafael, São Roque - SP, 18131-490, Brasil'                              ,-23.532720,           -47.149614,         '2021-04-18 23:09:00.000',85), --6,36
			    	('Sabrina'      ,'11-991413514','R. Honorio M. de Moraes, 100 - Esplanada Mendes Moraes, São Roque - SP, 18130-760, Brasil'          ,-23.5342766,          -47.1392441,        '2021-04-20 19:20:00.000',104), --12, 14
			    	('Tânia'      ,'11-996823512','R. Amador Bueno, 56 - Centro, São Roque - SP, 18130-320, Brasil'                                      ,-23.5306357,          -47.146874,         '2021-04-20 19:30:00.000',79), --1, 37
			    	('Fernando'      ,'11-985613579','R. Barão de Piratininga, 186 - Centro, São Roque - SP, 18130-270, Brasil'                          ,-23.5336901,          -47.1475721,        '2021-04-20 19:38:00.000',50), --15
			    	('Fernando'      ,'11-996399847','R. Barão de Piratininga, 78 - Centro, São Roque - SP, 18130-270, Brasil'                           ,-23.5327386,          -47.1471933,        '2021-04-20 19:45:00.000',55), --5
			    	('Daniel'      ,'11-996399847','Rua Ângelo Meneguesso, 240 - Centro, São Roque - SP, 18130-375, Brasil'                              ,-23.5322257,          -47.1480169,        '2021-04-20 19:47:00.000',70), --10
			    	('Thiago'      ,'11-996921807','R. Manoel José Ferreira - Marmeleiro, São Roque - SP, 18120-000, Brasil'      				         ,-23.535409,           -47.160054,         '2021-04-20 20:18:00.000',78), --10,25
			    	('Renata'      ,'11-996324678','R. Maestro Porfírio Taváres, 102-298 - Jardim Maria Trindade, São Roque - SP, Brasil'      		     ,-23.518529,           -47.126278,         '2021-04-20 20:36:00.000',80), --15,28x2,29x2
			    	('André'       ,'11-994475231','R. Epaminondas de Oliveira, 12-132 - Centro, São Roque - SP, 18130-505, Brasil'      		         ,-23.526265,           -47.134675,         '2021-04-20 21:03:00.000',126), --17,40
			    	--Abertura da pizzaria 2021-04-21 19:00:00.000 Quarta feira--
			    	('Adriana','11-956712343','Rua Sabatini Alceste, 58, São Roque - SP, 18133-340, Brasil'                                              ,-23.514590173507546,  -47.13417571038008 ,'2021-04-22 19:10:00.000',65),--5,22
			    	('Cintia','11-954738465','Rua Msr A Morais 55 - Vila Mike, São Roque - SP, 18136-220, Brasil'                                        ,-23.5432211821392,    -47.13324632495642 ,'2021-04-22 19:50:00.000',66),--5,27
			    	('Luana','11-923436543','R. Santa Augusta, 43 - Jardim Villaca, São Roque - SP, 18135-360, Brasil'                                   ,-23.547008816208614,  -47.11882844567299 ,'2021-04-22 20:20:00.000',60),--15,22
			    	('Yzoroku','11-967344221','R. Júlio Xavier Ferreira, 133 - Jardim Maria Trindade, São Roque - SP, 18133-440, Brasil'                 ,-23.51949642602654,   -47.12623938918114 ,'2021-04-22 20:30:00.000',76),--8,19*2
			    	('Constantino','11-911234434','R. Minas Gerais, 245 - Vila Irene, São Roque - SP, 18132-080, Brasil'                                 ,-23.524010853023483,  -47.138444781303406,'2021-04-22 20:40:00.000',60),--7
			    	('Joaquim','11-974866443','R. João XXIII, 67 - Centro, São Roque - SP, 18130-180, Brasil'                                            ,-23.53264086288481,   -47.13515404611825 ,'2021-04-22 20:45:00.000',100),--11,36
			    	('Kyome','11-945555567','R. São José, 205 - Jardim Sao Jose, São Roque - SP, 18133-255, Brasil'                                      ,-23.51485518160395,   -47.13278565555811 ,'2021-04-22 21:10:00.000',103),--1,31*4
			    	('Pamela','11-954757773','Av. Antonio Pannellini, 211 - Taboão, São Roque - SP, 18135-131, Brasil'                                   ,-23.54373509944832,   -47.1220538020134  ,'2021-04-22 21:30:00.000',54),--9
			    	('Gilmar','11-9646677743','Av. das Palmeiras, 355 - Jardim Suiça Paulista, São Roque - SP, 18136-780, Brasil'                        ,-23.54111846486106,   -47.143758572638035,'2021-04-22 21:35:00.000',70),--10
			    	('Laercio','11-955774443','R. Barão do Rio Branco, 448 - Vila Junqueira, São Roque - SP, 18130-020, Brasil'                          ,-23.538849115392434,  -47.13492874056101 ,'2021-04-22 21:48:00.000',61),--12,22
			    	('Gisele','11-957473521','R. João Colo, 20 - Parque Primavera, São Roque - SP, 18135-590, Brasil'                                    ,-23.560308470268833,  -47.11494058370591 ,'2021-04-22 22:30:00.000',53),--14
			    	('Raimundo','11-911122348','São Tibúrcio, 96 - Jardim Villaca, São Roque - SP, 18135-260, Brasil'                                    ,-23.554321287649234,  -47.12225899100303 ,'2021-04-22 22:45:00.000',136),--17*38
			    	('Flavio','11-946987896','R. Santa Leocádia, 98 - Jardim Villaca, São Roque - SP, 18135-310, Brasil'                                 ,-23.545953342682566,  -47.12087094783783 ,'2021-04-22 23:30:00.000',50),--15
					('Tiago','11-966644523','R. Padre Antônio Viêira, 74 - Paisagem Colonial, São Roque - SP, 18136-730, Brasil'                         ,-23.560269132348232,  -47.146134339272976,'2021-04-23 18:30:00.000 ',50),--15
					('Sergio','11-973322445','R. Tancredo Neves, 183 - Jardim Boa Vista, São Roque - SP, 18132-400, Brasil'                              ,-23.518228300703676,  -47.14435502886772, '2021-04-23 19:10:00.000 ',52),--3
					('Cicero','11-979898674','R. João Paulo I, 209 - Jardim Mosteiro, São Roque - SP, 18135-490, Brasil'                                 ,-23.54766287359399,   -47.117252983152866,'2021-04-23 19:50:00.000 ',55),--5
					('Marcela','11-900048582','R. Gov. Carvalho Pinto, 535 - Jardim Boa Vista, São Roque - SP, 18132-380, Brasil'                        ,-23.51784309561113,   -47.145707197487354,'2021-04-23 19:55:00.000 ',60),--7
					('Ricardo','11-955830586','R. João Paulo I, 209 - Jardim Mosteiro, São Roque - SP, 18135-490, Brasil'                                ,-23.54766287359399,   -47.117252983152866,'2021-04-23 20:05:00.000 ',70),--10
					('Silmara','11-944455667','BR-272, 1328 - Taboão, São Roque - SP, 18135-125, Brasil'                                                 ,-23.542411573883093,  -47.125645279884345,'2021-04-23 20:10:00.000 ',51),--12
					('Silmara','11-944455667','BR-272, 1328 - Taboão, São Roque - SP, 18135-125, Brasil'                                                 ,-23.542411573883093,  -47.125645279884345,'2021-04-23 20:30:00.000 ',50),--15
			    	('Luciana'   ,'11-954895356','R. João XXIII, 64 - Centro, São Roque - SP, 18130-180, Brasil'                                         ,-23.53264086288481,   -47.13515404611825, '2021-04-23 20:35:00.000 ',108),--7,28*6
                    ('Patrícia'  ,'11-905747585'  ,'R. Ida, 118 - Vila Santo Antonio, São Roque - SP, 18133-290, Brasil'                                 ,-23.515310182660063,  -47.13280007243156, '2021-04-23 20:50:00.000 ',85),--11,10
					('Anthony'     ,'11-997362682','Av. Campo Limpo, 89-1 - Vila Nova Sao Roque, São Roque - SP, 18131-320, Brasil'       			     ,-23.525430, -47.151320,                   '2021-04-23 21:20:00.000 ',60), --6
                    ('Lucas'       ,'11-994475231','R. Bento Antônio Pereira, 160-246 - Jardim Bela Vista, São Roque - SP, 18134-180, Brasil'            ,-23.521224, -47.130670,                   '2021-04-23 21:39:00.000 ',60), --15,22
			    	('Lucio'     ,'11-954895368','Av. Guilherme de Almeida, 80 - Sao Roque, São Roque - SP, 18135-660, Brasil'                           ,-23.559611757072517, -47.12792918086051,  '2021-04-23 21:42:00.000 ',78),--15,4*32
			    	('alesandro' ,'11-954895377','R. Santa Augusta, 42 - Jardim Villaca, São Roque - SP, 18135-360, Brasil'                              ,-23.547008816208614,  -47.11882844567299, '2021-04-23 21:45:00.000 ',55),--15,18
                    ('Joaquim','11-998581916','Av. Guilherme de Almeida, 271 - Jardim Santa Maria, São Roque - SP, 18135-660, Brasil'                    ,-23.5612862,         -47.1270003,         '2021-04-23 21:50:00.000 ',106),-- 17,35
			    	('alesandro' ,'11-954895377','R. Santa Augusta, 42 - Jardim Villaca, São Roque - SP, 18135-360, Brasil'                              ,-23.547008816208614,  -47.11882844567299, '2021-04-23 22:30:00.000 ',55),--15,18
			    	('Thiago'    ,'11-954895387','R. das Rosas, 110 - Jardim Sao Jose, São Roque - SP, 18133-280, Brasil'                                ,-23.515013817285826,  -47.13141404092311, '2021-04-23 22:40:00.000 ',92),--6,29*4
					('Elisa'       ,'11-972384848','R. João Pinto Splendore, 150, São Roque - SP, 18133-300, Brasil'       							     ,-23.513574, -47.129846,                   '2021-04-23 22:55:00.000 ',52), --3
			    	('José'      ,'11-954895361','R. Duque de Caxias, 240 - Centro, São Roque - SP, 18130-150, Brasil'                                   ,-23.53361221845325,  -47.13631343096495,  '2021-04-23 23:40:00.000 ',54),--9
			    	('Jair'      ,'11-954895365','R. Tamandaré, 63 - Vila Sao Rafael, São Roque - SP, 18131-500, Brasil'                                 ,-23.532264614370607, -47.1506505087018,   '2021-04-24 19:10:00.000',138),--8, 16,22
			    	('Clecio'    ,'11-954895366','R. Primeiro-Sargento A Aparecido Pereira, 350 - Jardim Conceiçao, São Roque - SP, 18136-490, Brasil'   ,-23.551010563733737,  -47.136614844202995,'2021-04-24 19:12:00.000',60),--15,22
			    	('Maria'     ,'11-954895367','R. Padre Antônio Viêira, 71 - Paisagem Colonial, São Roque - SP, 18136-730, Brasil'                    ,-23.560269132348232, -47.146134339272976, '2021-04-24 19:18:00.000',68),--7,25
			    	('Lucio'     ,'11-954895368','Av. Guilherme de Almeida, 80 - Sao Roque, São Roque - SP, 18135-660, Brasil'                           ,-23.559611757072517, -47.12792918086051,  '2021-04-24 19:22:00.000',78),--15,4*32
			    	('Daniela'   ,'11-954895368','R. São Tibúrcio, 93 - Jardim Villaca, São Roque - SP, 18135-260, Brasil'                               ,-23.554321287649234, -47.12225899100303,  '2021-04-24 19:30:00.000',51),--12,
			    	('Samara'    ,'11-954895369','R. João Colo, 17 - Parque Primavera, São Roque - SP, 18135-590, Brasil'                                ,-23.560308470268833, -47.11494058370591,  '2021-04-24 19:33:00.000',64),--5,24
			    	('Lindalvo'  ,'11-938541048'  ,'R. São Joaquim, 100 - Sao Roque, São Roque - SP, 18130-220, Brasil'                                  ,-23.534602010104486,  -47.138254679739475,'2021-04-24 19:15:00.000',151),--11,12,36
			    	('Andre'     ,'11-956021428'  ,'R. Tomás Antônio Gonzaga, 325 - Paisagem Colonial, São Roque - SP, 18136-700, Brasil'                ,-23.557902381564233,  -47.14839577674865 ,'2021-04-24 19:40:00.000',71),--15, 28x3
			    	('Geraldo'   ,'11-976362387'  ,'R. Primeiro-Sargento A Aparecido Pereira, 100 - Jardim Conceicao, São Roque - SP, 18136-490, Brasil' ,-23.55038080370918,   -47.138280160725124,'2021-04-24 19:41:00.000',66),--13,22
			    	('Ana'       ,'11-954895379'  ,'R. Ten. Francisco Luís de Campos, 231 - Vila Junqueira, São Roque - SP, 18136-120, Brasil'           ,-23.53865854112339,   -47.133923918008804,'2021-04-24 19:48:00.000',58),--2
			    	('Celma'     ,'11-954895389','R. São José, 205 - Jardim Sao Jose, São Roque - SP, 18133-255, Brasil'                                 ,-23.51485518160395,   -47.13278565555811, '2021-04-24 19:55:00.000',52),--3,
			    	('Helio'     ,'11-954895390','BR-272, 1325 - Taboão, São Roque - SP, 18135-125, Brasil'                                              ,-23.542411573883093,  -47.125645279884345,'2021-04-24 20:03:00.000',50),--15,
			    	('Robson'    ,'11-954895391','R. Minas Gerais, 240 - Vila Irene, São Roque - SP, 18132-080, Brasil'                                  ,-23.524010853023483,  -47.138444781303406,'2021-04-24 20:08:00.000',110),--11,31*4
			    	('Nicolle'     ,'11-972828484','Av. Gérson Nastri, 163-197 - Vila Santa Rita, São Roque - SP, 18130-700, Brasil'      			     ,-23.530424, -47.128567,                   '2021-04-24 20:19:00.000',61), --12,22
			    	('Otavio'      ,'11-976559877','R. Barra Bonita, 2-64 - Vila Nova Sao Roque, São Roque - SP, 18131-215, Brasil'      			     ,-23.527752, -47.153366,                   '2021-04-24 20:39:00.000',67), --14,28x2
			    	--Abertura da pizzaria 2021-04-25 19:00:00.000 Domingo feira--
			    	('Gerson'    ,'11-954895358','R. Barão do Rio Branco, 445 - Vila Junqueira, São Roque - SP, 18130-020, Brasil'                       ,-23.538849115392434, -47.13492874056101,  '2021-04-27 19:10:00.000',70),--10
			    	('Mariano'   ,'11-954895359','R. Tomás Antônio Gonzaga, 247 - Paisagem Colonial, São Roque - SP, 18136-700, Brasil'                  ,-23.556905081914525, -47.14863214641809,  '2021-04-27 19:10:00.000',142),--8,14,29*2,27
			    	('Cristiane' ,'11-954895360','Av. João Pessoa, 378 - Centro, São Roque - SP, 18130-290, Brasil'                                      ,-23.532246785574436, -47.13871601969004,  '2021-04-27 19:15:00.000',76),--16,18
			    	('José'      ,'11-954895361','R. Duque de Caxias, 240 - Centro, São Roque - SP, 18130-150, Brasil'                                   ,-23.53361221845325,  -47.13631343096495,  '2021-04-27 20:20:00.000',54),--9
			    	('Lucas'     ,'11-954895362','R. Bento Antônio Pereira, 108 - Jardim Bela Vista, São Roque - SP, 18134-180, Brasil'                  ,-23.522456259856284, -47.13113375008106,  '2021-04-27 21:03:00.000',60),--6
			    	--Abertura da pizzaria 2021-04-28 19:00:00.000 Quarta feira--
					('Odair'     ,'11-954895361','R. Santa Leocádia, 95 - Jardim Villaca, São Roque - SP, 18135-310, Brasil'                             ,-23.545953342682566, -47.12087094783783,  '2021-04-29 19:30:00.000',74),--4,27
			    	('Luiz'      ,'11-954895362','R. das Papoulas, 568 - Vila Santa Rosalia, São Roque - SP, 18136-185, Brasil'                          ,-23.54702510621119,   -47.13165711611509, '2021-04-29 19:30:00.000',85),--5,30*3
			    	('Joel'      ,'11-954895365','Rua Msr A Morais 52 - Vila Mike, São Roque - SP, 18136-220, Brasil'                                    ,-23.5432211821392,    -47.13324632495642, '2021-04-29 19:42:00.000',82),--8,31,22
			    	('Maria'     ,'11-954895365','R. José Bonifácio de Andrada e Silva, 150 - Jardim Meny, São Roque - SP, 18130-005, Brasil'            ,-23.53514147415779,   -47.13589802384377, '2021-04-29 19:43:00.000',56),--13,
			    	('José'      ,'11-954895368','Av. Antonio Pannellini, 208 - Taboão, São Roque - SP, 18135-131, Brasil'                               ,-23.54373509944832,   -47.1220538020134,  '2021-04-29 19:48:00.000',126),--17,39
			    	('Pedro'     ,'11-954895364','R. Irineu Silveira, 121 - Vila Junqueira, São Roque - SP, 18136-100, Brasil'                           ,-23.540818469127807,  -47.13398527354001, '2021-04-29 19:49:00.000',53),--1,
			    	('alesandro' ,'11-954895371','R. Santa Augusta, 42 - Jardim Villaca, São Roque - SP, 18135-360, Brasil'                              ,-23.547008816208614,  -47.11882844567299, '2021-04-29 19:59:00.000',55),--15,18
			    	('Mauro'     ,'11-954895372','Av. Antônio Maria Picena, 139 - Vila Junqueira, São Roque - SP, 18136-040, Brasil'                     ,-23.540026673823945,  -47.13616892695426, '2021-04-29 20:13:00.000',54),--9,
			    	('Ana'       ,'11-954895373','R. Ten. Francisco Luís de Campos, 231 - Vila Junqueira, São Roque - SP, 18136-120, Brasil'             ,-23.53865854112339,   -47.133923918008804,'2021-04-29 20:15:00.000',70),--7,22
                    ('Osmar'     ,'11-954895374','Rua Sabatini Alceste, 55, São Roque - SP, 18133-340, Brasil'                                           ,-23.514590173507546,  -47.13417571038008, '2021-04-29 22:59:00.000',54),--9
			    	('Thiago'    ,'11-954895375','R. das Rosas, 110 - Jardim Sao Jose, São Roque - SP, 18133-280, Brasil'                                ,-23.515013817285826,  -47.13141404092311, '2021-04-29 23:10:00.000',92),--6,29*4
			    	('Celma'     ,'11-954895376','R. São José, 205 - Jardim Sao Jose, São Roque - SP, 18133-255, Brasil'                                 ,-23.51485518160395,   -47.13278565555811, '2021-04-29 23:20:00.000',52),--3,
			    	('Helio'     ,'11-954895377','BR-272, 1325 - Taboão, São Roque - SP, 18135-125, Brasil'                                              ,-23.542411573883093,  -47.125645279884345,'2021-04-29 23:40:00.000',50),--15,
			    	('Robson'    ,'11-954895378','R. Minas Gerais, 240 - Vila Irene, São Roque - SP, 18132-080, Brasil'                                  ,-23.524010853023483,  -47.138444781303406,'2021-04-29 23:50:00.000',110),--11,31*4
					('Regina'      ,'11-975635521','R. Maria Guilhermina Lemos, 175-1 - Vila Junqueira, São Roque - SP, 18136-180, Brasil'  		     ,-23.541219, -47.132667,                   '2021-04-30 19:15:00.000',125), --5,7,22
					('Guilherme'   ,'11-987337822','R. Ten. Francisco Luís de Campos, 170-284 - Vila Junqueira, São Roque - SP, 18136-120, Brasil'       ,-23.538750, -47.134115,                   '2021-04-30 19:27:00.000',70), --8,25
					('Samuel'      ,'11-999737290','R. Primeiro de Maio, 40 - Estacao, São Roque - SP, 18131-025, Brasil'       					     ,-23.534235, -47.141057,                   '2021-04-30 19:59:00.000',123), --13,15,22,28
					('Lara'        ,'11-975377282','R. Goiás, 151-1 - Vila Irene, São Roque - SP, 18132-070, Brasil'      							     ,-23.523077, -47.138289,                   '2021-04-30 20:05:00.000',192), --3,6,7,22x2
					('Murilo'      ,'11-982672827','R. Leão XIII, 155-35 - Jardim Tanzi, São Roque - SP'       										     ,-23.524887, -47.134738,                   '2021-04-30 20:07:00.000',138), --1,7,35
					('Mariana'     ,'11-972838287','R. Bento Antônio Pereira, 157-1 - Jardim Bela Vista, São Roque - SP, 18134-180, Brasil'      	     ,-23.522280, -47.131112,                   '2021-04-30 20:25:00.000',121), --2,14
					('Beatriz'     ,'11-973728822','R. Francisco da Silva Pontes, 139 - Jardim Florida, São Roque - SP, 18133-040, Brasil'       	     ,-23.520116, -47.132904,                   '2021-04-30 20:29:00.000',167), --16,17,22,26
					('Isaque'      ,'11-963737826','R. Chad Kaid, 176 - Jardim Sao Jose, São Roque - SP, 18133-250, Brasil'      					     ,-23.515384, -47.130244,                   '2021-04-30 20:36:00.000',134), --5,10,23
					('Anthony'     ,'11-997362682','Av. Campo Limpo, 89-1 - Vila Nova Sao Roque, São Roque - SP, 18131-320, Brasil'       			     ,-23.525430, -47.151320,                   '2021-04-30 20:42:00.000',60), --6
					('Elisa'       ,'11-972384848','R. João Pinto Splendore, 150, São Roque - SP, 18133-300, Brasil'       							     ,-23.513574, -47.129846,                   '2021-04-30 20:48:00.000',52), --3
					('Nicolle'     ,'11-972828484','Av. Gérson Nastri, 163-197 - Vila Santa Rita, São Roque - SP, 18130-700, Brasil'      			     ,-23.530424, -47.128567,                   '2021-04-30 20:49:00.000',61), --12,22
                    ('Elaine'      ,'11-994542875','R. Lívio Tagliassachi, 260 - Jardim Boa Vista, São Roque - SP, 18132-370, Brasil'                    ,-23.5173022,         -47.142984,          '2021-04-30 22:00:00.000',62), -- 14, 23
                    ('João'        ,'11-954895354','R. Paulino Hermílio de Campos, 58 - Centro, São Roque - SP, 18130-385, Brasil'                       ,-23.53009716835891,  -47.13880117982625,  '2021-04-30 22:20:00.000',60),--3,25
					('Regina'      ,'11-975635521','R. Maria Guilhermina Lemos, 175-1 - Vila Junqueira, São Roque - SP, 18136-180, Brasil'  		     ,-23.541219, -47.132667,                   '2021-04-30 23:15:00.000',125), --5,7,22
					('Guilherme'   ,'11-987337822','R. Ten. Francisco Luís de Campos, 170-284 - Vila Junqueira, São Roque - SP, 18136-120, Brasil'       ,-23.538750, -47.134115,                   '2021-04-30 23:27:00.000',70), --8,25
					('Samuel'      ,'11-999737290','R. Primeiro de Maio, 40 - Estacao, São Roque - SP, 18131-025, Brasil'       					     ,-23.534235, -47.141057,                   '2021-04-30 23:53:00.000',123), --13,15,22,28
					('Lara'        ,'11-975377282','R. Goiás, 151-1 - Vila Irene, São Roque - SP, 18132-070, Brasil'      							     ,-23.523077, -47.138289,                   '2021-04-30 23:59:00.000',192), --3,6,7,22x2

Go

Select * from Pedidos
Go
