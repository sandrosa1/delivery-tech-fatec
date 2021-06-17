--Banco de delivery tech---
-- Allan, Carol, Nestor,Rafael, Sandro

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
Create Table PedidoProduto (CodPedido Int Not Null, 
							CodProduto Int Not Null, 
							Quantidade Int Not Null,
							ValorUnitario Decimal(18,2) Not Null,
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



Insert Into Produtos (Tipo, Categoria, Nome, Descricao, ValorProduto)
			 Values ('Massas','Pizza','Alcachofra','Coração da alcachofra temperado. Podendo ser coberta com mussarela especial ou parmesão.', 53.00),
					('Massas','Pizza','Catupiry','Coberta com o mais puro catupiry.',58.00),
					('Massas','Pizza','Milho Verde','Milho verde. Podendo ser coberta com mussarela especial ou catupiry.',52.00),
					('Massas','Pizza','Pimentão','Pimentão fatiado, champignom picado, palmito cortado. Podendo ser coberta com mussarela especial ou catupiry.',63),
					('Massas','Pizza','Calabreza com Pimentão','Calabreza fatiada, pimentção fatiado e cebola. Coberto com queijo parmesão ralado.',55.00),
					('Massas','Pizza','Aliche','Fatias de aliche importado, coberto com queijo parmesão ralado.',60.00),
					('Massas','Pizza','Portuguesa','Presunto picado, ovos picado, cebola e coberta com mussarela',60.00),
					('Massas','Pizza','Atum','Atum s�lido coberto com cebolas.',62.00),
					('Massas','Pizza','Baiana','Calabreza mo�da com acentuado sabor de pimenta.',54.00),
					('Massas','Pizza','Brócolis','Brócolis com bacon frito, coberto com parmesão.',70.00),
					('Massas','Pizza','Bacalhau','Bacalhau desfiado e refogado no azeite com salsinha,coberto com rodelas de pimentção e queijo parmesão ralado.',75.00),
					('Massas','Pizza','Escarola','Escarola refogada no azeite temperada com aliche ou bacon',51.00),
					('Massas','Pizza','Frango com Catupiry','Peito de frango temperado, milho verde e palmito cortado. Podendo ser coberta com mussarela especial ou catupiry.',56.00),
					('Massas','Pizza','Margherita','Mussaela especial, rodelas de tomate e manjericão fresco, salpicado com queijo parmesão.',53.00),
					('Massas','Pizza','Mussarela','Coberta com mussarela especial.',50.00),
					('Massas','Pizza','5 Queijos','Queijo gorgonzola, catupiry, mussarela, provolone e parmesão ralado',66.00),
					('Massas','Pizza','Camarão','Camarão temperado e refogado no azeite. Podendo ser coberta com mussarela especial ou catupiry.',81.00),
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
			Values ('Edson'      ,'11-952453521'  ,'R. Gov. Carvalho Pinto, 538 - Jardim Boa Vista, São Roque - SP, 18132-380, Brasil'                     ,-23.51784309561113,   -47.145707197487354,'2021-04-01 18:30:00.000',68 ),--2,22
			    	('Mariza'    ,'11-954895352'  ,'R. Paraguai, 174 - Vila Sao Rafael, São Roque - SP, 18131-475, Brasil'                                 ,-23.53371580879795,   -47.152799628674984,'2021-04-01 19:05:00.000',120),--11,40
			    	('Joâo'      ,'11-954895354'  ,'R. Paulino Hermílio de Campos, 58 - Centro, São Roque - SP, 18130-385, Brasil'                         ,-23.53009716835891,   -47.13880117982625, '2021-04-01 19:20:00.000',120),--3,6,25
			    	('Marcos'    ,'11-954895355'  ,'R. José Gômide de Castro, 127 - Jardim Maria Trindade, São Roque - SP, 18133-400, Brasil'              ,-23.51821231456105,   -47.126943469047546,'2021-04-01 19:40:00.000',130),--11,38
			    	('Luciana'   ,'11-954895356'  ,'R. João XXIII, 64 - Centro, São Roque - SP, 18130-180, Brasil'                                         ,-23.53264086288481,   -47.13515404611825, '2021-04-01 19:55:00.000',108),--7,28*6
			    	('Thereza'   ,'11-954895357'  ,'Rua Santa Cruz, 117 - Vila Santa Isabel, São Roque - SP, 18136-025, Brasil'                            ,-23.536778603376078,  -47.13693100959063, '2021-04-01 20:20:00.000',55 ),--5
			    	('Gerson'    ,'11-954895358'  ,'R. Barão do Rio Branco, 445 - Vila Junqueira, São Roque - SP, 18130-020, Brasil'                       ,-23.538849115392434,  -47.13492874056101, '2021-04-01 20:30:00.000',70 ),--10
			    	('Mariano'   ,'11-954895359'  ,'R. Tomás Antônio Gonzaga, 247 - Paisagem Colonial, São Roque - SP, 18136-700, Brasil'                  ,-23.556905081914525,  -47.14863214641809, '2021-04-01 21:10:00.000',76 ),--16,18
			    	('Cristiane' ,'11-954895360'  ,'Av. João Pessoa, 378 - Centro, São Roque - SP, 18130-290, Brasil'                                      ,-23.532246785574436,  -47.13871601969004, '2021-04-01 22:00:00.000',142),--8,14,29*2,27
			    	('José'      ,'11-954895361'  ,'R. Duque de Caxias, 240 - Centro, São Roque - SP, 18130-150, Brasil'                                   ,-23.53361221845325,   -47.13631343096495, '2021-04-01 22:40:00.000',54 ),--9
			    	('Lucas'     ,'11-954895362'  ,'R. Bento Antônio Pereira, 108 - Jardim Bela Vista, São Roque - SP, 18134-180, Brasil'                  ,-23.522456259856284,  -47.13113375008106, '2021-04-01 23:10:00.000',52 ),--3
			    	('Lourdes'   ,'11-954895363'  ,'R. Amador Marquês da Silva, 206 - Vila Marques, São Roque - SP, 18130-545, Brasil'                     ,-23.536676244974018,  -47.13959611952305, '2021-04-01 23:32:00.000',50 ),--15
			    	('Paulo'     ,'11-954895363'  ,'Av. das Palmeiras, 352 - Jardim Suiça Paulista, São Roque - SP, 18136-780, Brasil'                     ,-23.54111846486106,   -47.143758572638035,'2021-04-01 23:58:00.000',60 ),--15,22
			    	('Jair'      ,'11-954895365'  ,'R. Tamandaré, 63 - Vila Sao Rafael, São Roque - SP, 18131-500, Brasil'                                 ,-23.532264614370607,  -47.1506505087018,  '2021-04-02 18:00:00.000',53 ),--2
			    	('Clecio'    ,'11-954895366'  ,'R. Primeiro-Sargento A Aparecido Pereira, 350 - Jardim Conceiçao, São Roque - SP, 18136-490, Brasil'   ,-23.551010563733737,  -47.136614844202995,'2021-04-02 18:10:00.000',60 ),--15,22
			    	('Maria'     ,'11-954895367'  ,'R. Padre Antônio Viêira, 71 - Paisagem Colonial, São Roque - SP, 18136-730, Brasil'                    ,-23.560269132348232,  -47.146134339272976,'2021-04-02 18:30:00.000',73 ),--8,25
			    	('Lucio'     ,'11-954895368'  ,'Av. Guilherme de Almeida, 80 - Sao Roque, São Roque - SP, 18135-660, Brasil'                           ,-23.559611757072517,  -47.12792918086051, '2021-04-02 18:40:00.000',78 ),--15,4*32
			    	('Daniela'   ,'11-954895368'  ,'R. São Tibúrcio, 93 - Jardim Villaca, São Roque - SP, 18135-260, Brasil'                               ,-23.554321287649234,  -47.12225899100303, '2021-04-02 19:00:00.000',51 ),--12,
			    	('Samara'    ,'11-954895369'  ,'R. João Colo, 17 - Parque Primavera, São Roque - SP, 18135-590, Brasil'                                ,-23.560308470268833,  -47.11494058370591, '2021-04-02 19:10:00.000',60 ),--15,26
			    	('Celio'     ,'11-954895370'  ,'R. João Paulo I, 206 - Jardim Mosteiro, São Roque - SP, 18135-490, Brasil'                             ,-23.54766287359399,   -47.117252983152866,'2021-04-02 19:20:00.000',68 ),--2,22
			    	('Odair'     ,'11-954895371'  ,'R. Santa Leocádia, 95 - Jardim Villaca, São Roque - SP, 18135-310, Brasil'                             ,-23.545953342682566,  -47.12087094783783, '2021-04-02 19:30:00.000',74 ),--4,27
			    	('Luiz'      ,'11-954895372'  ,'R. das Papoulas, 568 - Vila Santa Rosalia, São Roque - SP, 18136-185, Brasil'                          ,-23.54702510621119,   -47.13165711611509, '2021-04-02 19:30:00.000',85 ),--5,30*3
			    	('Joel'      ,'11-954895373'  ,'Rua Msr A Morais 52 - Vila Mike, São Roque - SP, 18136-220, Brasil'                                    ,-23.5432211821392,    -47.13324632495642, '2021-04-02 19:42:00.000',82 ),--8,31,22
			    	('Maria'     ,'11-954895374'  ,'R. José Bonifácio de Andrada e Silva, 150 - Jardim Meny, São Roque - SP, 18130-005, Brasil'            ,-23.53514147415779,   -47.13589802384377, '2021-04-02 19:43:00.000',56 ),--13,
			    	('José'      ,'11-954895375'  ,'Av. Antonio Pannellini, 208 - Taboão, São Roque - SP, 18135-131, Brasil'                               ,-23.54373509944832,   -47.1220538020134,  '2021-04-02 19:48:00.000',126),--17,39
			    	('Pedro'     ,'11-954895376'  ,'R. Irineu Silveira, 121 - Vila Junqueira, São Roque - SP, 18136-100, Brasil'                           ,-23.540818469127807,  -47.13398527354001, '2021-04-02 19:49:00.000',53 ),--1,
			    	('alesandro' ,'11-954895377'  ,'R. Santa Augusta, 42 - Jardim Villaca, São Roque - SP, 18135-360, Brasil'                              ,-23.547008816208614,  -47.11882844567299, '2021-04-02 19:59:00.000',55 ),--15,18
			    	('Mauro'     ,'11-954895378'  ,'Av. Antônio Maria Picena, 139 - Vila Junqueira, São Roque - SP, 18136-040, Brasil'                     ,-23.540026673823945,  -47.13616892695426, '2021-04-02 20:13:00.000',54 ),--9,
			    	('Ana'       ,'11-954895379'  ,'R. Ten. Francisco Luís de Campos, 231 - Vila Junqueira, São Roque - SP, 18136-120, Brasil'             ,-23.53865854112339,   -47.133923918008804,'2021-04-02 20:15:00.000',70 ),--7,22
			    	('Dolores'   ,'11-954895380'  ,'Rua Marechal Deodoro da Fonseca, 360 - Centro, São Roque - SP, 18130-070, Brasil'                      ,-23.534870359166487,  -47.13308103382588, '2021-04-02 20:21:00.000',53 ),--1,
			    	('Marcio'    ,'11-954895381'  ,'R. Bento Antônio Pereira, 7 - Jardim Bela Vista, São Roque - SP, 18134-180, Brasil'                    ,-23.522989932825325,  -47.13158771395683, '2021-04-02 20:22:00.000',71 ),--7,27
			    	('Mecias'    ,'11-954895382'  ,'R. Santa Pedrina, 107 - Jardim Villaca, São Roque - SP, 18135-410, Brasil'                             ,-23.546045243597153,  -47.12182179093361, '2021-04-02 20:23:00.000',50 ),--15,
			    	('Jucemar'   ,'11-954895383'  ,'R. Maestro Porfírio Taváres, 335 - Jardim Maria Trindade, São Roque - SP, 18133-410, Brasil'           ,-23.518490227225822,  -47.12525971233845, '2021-04-02 20:29:00.000',55 ),--5,
			    	('Wagner'    ,'11-954895384'  ,'R. Júlio Xavier Ferreira, 130 - Jardim Maria Trindade, São Roque - SP, 18133-440, Brasil'              ,-23.51949642602654,   -47.12623938918114, '2021-04-02 22:33:00.000',120),--11,39
			    	('Adelia'    ,'11-954895384'  ,'R. João Pinto Splendore, 200, São Roque - SP, 18133-300, Brasil'                                       ,-23.51331093318866,   -47.129439264535904,'2021-04-02 22:45:00.000',56 ),--13,
			    	('Elaine'    ,'11-954895385'  ,'BR-272, 1325 - Taboão, São Roque - SP, 18135-125, Brasil'                                              ,-23.542411573883093,  -47.125645279884345,'2021-04-02 22:58:00.000',100),--11,35
			    	('Osmar'     ,'11-954895386'  ,'Rua Sabatini Alceste, 55, São Roque - SP, 18133-340, Brasil'                                           ,-23.514590173507546,  -47.13417571038008, '2021-04-02 22:59:00.000',54 ),--9
			    	('Thiago'    ,'11-954895387'  ,'R. das Rosas, 110 - Jardim Sao Jose, São Roque - SP, 18133-280, Brasil'                                ,-23.515013817285826,  -47.13141404092311, '2021-04-02 23:10:00.000',92 ),--6,29*4
			    	('Celma'     ,'11-954895389'  ,'R. São José, 205 - Jardim Sao Jose, São Roque - SP, 18133-255, Brasil'                                 ,-23.51485518160395,   -47.13278565555811, '2021-04-02 23:20:00.000',52 ),--3,
			    	('Helio'     ,'11-954895390'  ,'BR-272, 1325 - Taboão, São Roque - SP, 18135-125, Brasil'                                              ,-23.542411573883093,  -47.125645279884345,'2021-04-02 23:40:00.000',50 ),--15,
			    	('Robson'    ,'11-954895391'  ,'R. Minas Gerais, 240 - Vila Irene, São Roque - SP, 18132-080, Brasil'                                  ,-23.524010853023483,  -47.138444781303406,'2021-04-02 23:50:00.000',110),--11,31*4
			    	('Márcia'    ,'11-984701710'  ,'R. Mariápolis, 40 - Bairro do Carmo (Canguera), São Roque - SP, 18132-380, Brasil'                     ,-23.646257,           -47.076865,         '2021-04-03 19:00:00.000',118),--15, 7, 22
			    	('Henrique'  ,'11-985682008'  ,'R. Ângelo Meneguesso, 352 - Centro, São Roque - SP, 18130-433, Brasil'                                 ,-23.5315458,          -47.1406188,        '2021-04-03 19:00:00.000',91 ),--16, 36
			    	('Yasmin'    ,'11-989147417'  ,'Avenida Campo Limpo, 50 - Vila Nova São Roque, São Roque - SP, 18131-320, Brasil'                      ,-23.5252214,          -47.1524006,        '2021-04-03 19:38:00.000',118),--12, 13, 27
			    	('Priscila'  ,'11-991238914'  ,'Rua Sotero de Souza, 800 - Centro, São Roque - SP, 18130-200, Brasil'                                  ,-23.535687,           -47.1376056,        '2021-04-03 19:50:00.000',62 ),--14,23
			    	('Fábio'     ,'11-981921631'  ,'R. Francisco Tagliassachi, 82 - Jardim Rene, São Roque - SP, 18135-300, Brasil'                        ,-23.5389705,          -47.1304322,        '2021-04-03 19:55:00.000',196),--9,3,15,22,31x3
			    	('Joaquim'   ,'11-998581916'  ,'Av. Guilherme de Almeida, 271 - Jardim Santa Maria, São Roque - SP, 18135-660, Brasil'                 ,-23.5612862,          -47.1270003,        '2021-04-03 20:10:00.000',106),--17,35
			    	('Giovanna'  ,'11-998581916'  ,'R. dos Carvalhos, 54 - Jardim Guacu, São Roque - SP, 18132-440, Brasil'                                ,-23.514503,           -47.1419799,        '2021-04-03 20:15:00.000',110),--6,15
			    	('Antonella' ,'11-994231219'  ,'R. Santa Virgínia, 240 - Jardim Villaca, São Roque - SP, 18135-340, Brasil'                            ,-23.5476301,          -47.1214591,        '2021-04-03 21:10:00.000',70 ),--7,26
			    	('Geraldo'   ,'11-998581916'  ,'R. Cláudio de Souza, 129 - Vila Santa Rita, São Roque - SP, 18130-690, Brasil'                         ,-23.5301967,          -47.1269538,        '2021-04-03 21:12:00.000',72 ),--4,23
			    	('Danilo'    ,'11-998581916'  ,'R. Alexandre Bonini, 83 - Jardim Rene, São Roque - SP, 18135-040, Brasil'                              ,-23.5392865,          -47.1298161,        '2021-04-03 21:30:00.000',106),--1, 14
			    	('Esther'    ,'11-998581916'  ,'Rua Monsenhor, 126 - Vila Santa Rosalia, São Roque - SP, 18136-220, Brasil'                            ,-23.5434782,          -47.1340701,        '2021-04-03 21:40:00.000',129),--5,15, 33x3
			    	('Thereza'   ,'11-954895357'  ,'Rua Santa Cruz, 117 - Vila Santa Isabel, São Roque - SP, 18136-025, Brasil'                            ,-23.536778603376078,  -47.13693100959063, '2021-04-03 21:50:00.000',55 ),--5
			    	('Paula'     ,'11-998581547'  ,'R. dos Carvalhos, 130 - Jardim Guacu, São Roque - SP, 18132-440, Brasil'                               ,-23.5142204,          -47.141774,         '2021-04-03 21:50:00.000',55 ),--5
			    	('João'      ,'11-998581547'  ,'Rua Monsenhor, 77 - Vila Santa Rosalia, São Roque - SP, 18136-220, Brasil'                             ,-23.5430125,          -47.1353322,        '2021-04-03 21:56:00.000',60 ),--7
			    	('Mateus'    ,'11-914682587'  ,'R. Marino Camurça, 78 - Centro, São Roque - SP, 18130-515, Brasil'                              	   ,-23.5260733,          -47.1335327,        '2021-04-03 21:56:00.000',54 ),--9
			    	('Cauê'      ,'11-994689587'  ,'R. Santo Antônio, 39 - Jardim Villaca, São Roque - SP, 18136-280, Brasil'                              ,-23.547901,           -47.1236839,        '2021-04-03 22:00:00.000',54 ),--9
			    	('Elaine'    ,'11-994542875'  ,'R. Lívio Tagliassachi, 260 - Jardim Boa Vista, São Roque - SP, 18132-370, Brasil'                      ,-23.5173022,          -47.142984,         '2021-04-03 22:00:00.000',62 ),--14, 23
			    	('João'      ,'11-954895354'  ,'R. Paulino Hermílio de Campos, 58 - Centro, São Roque - SP, 18130-385, Brasil'                         ,-23.53009716835891,   -47.13880117982625, '2021-04-03 22:20:00.000',60 ),--3,25
			    	('Regina'    ,'11-975635521'  ,'R. Maria Guilhermina Lemos, 175-1 - Vila Junqueira, São Roque - SP, 18136-180, Brasil'  		       ,-23.541219,           -47.132667,         '2021-04-04 19:15:00.000',125),--5,7,22
			    	('Guilherme' ,'11-987337822'  ,'R. Ten. Francisco Luís de Campos, 170-284 - Vila Junqueira, São Roque - SP, 18136-120, Brasil'         ,-23.538750,           -47.134115,         '2021-04-04 19:27:00.000',70 ),--8,25
			    	('Samuel'    ,'11-999737290'  ,'R. Primeiro de Maio, 40 - Estacao, São Roque - SP, 18131-025, Brasil'       					       ,-23.534235,           -47.141057,         '2021-04-04 19:59:00.000',123),--13,15,22,28
			    	('Lara'      ,'11-975377282'  ,'R. Goiás, 151-1 - Vila Irene, São Roque - SP, 18132-070, Brasil'      							       ,-23.523077,           -47.138289,         '2021-04-04 20:05:00.000',192),--3,6,7,22x2
			    	('Murilo'    ,'11-982672827'  ,'R. Leão XIII, 155-35 - Jardim Tanzi, São Roque - SP'       										       ,-23.524887,           -47.134738,         '2021-04-04 20:07:00.000',138),--1,7,35
			    	('Mariana'   ,'11-972838287'  ,'R. Bento Antônio Pereira, 157-1 - Jardim Bela Vista, São Roque - SP, 18134-180, Brasil'      	       ,-23.522280,           -47.131112,         '2021-04-04 20:25:00.000',121),--2,14
			    	('Beatriz'   ,'11-973728822'  ,'R. Francisco da Silva Pontes, 139 - Jardim Florida, São Roque - SP, 18133-040, Brasil'       	       ,-23.520116,           -47.132904,         '2021-04-04 20:29:00.000',167),--16,17,22,26
			    	('Isaque'    ,'11-963737826'  ,'R. Chad Kaid, 176 - Jardim Sao Jose, São Roque - SP, 18133-250, Brasil'      					       ,-23.515384,           -47.130244,         '2021-04-04 20:36:00.000',134),--5,10,23
			    	('Anthony'   ,'11-997362682'  ,'Av. Campo Limpo, 89-1 - Vila Nova Sao Roque, São Roque - SP, 18131-320, Brasil'       			       ,-23.525430,           -47.151320,         '2021-04-04 20:42:00.000',60 ),--6
			    	('Elisa'     ,'11-972384848'  ,'R. João Pinto Splendore, 150, São Roque - SP, 18133-300, Brasil'       							       ,-23.513574,           -47.129846,         '2021-04-04 20:48:00.000',52 ),--3
			    	('Nicolle'   ,'11-972828484'  ,'Av. Gérson Nastri, 163-197 - Vila Santa Rita, São Roque - SP, 18130-700, Brasil'      			       ,-23.530424,           -47.128567,         '2021-04-04 20:49:00.000',61 ),--12,22
			    	('Rebeca'    ,'11-962753848'  ,'R. Maria Antônia Constancia, 102 - Esplanada Mendes Moraes, São Roque - SP, 18130-770, Brasil'         ,-23.529932,           -47.130852,         '2021-04-04 20:51:00.000',256),--2,5,7,13,22,24,25
			    	('Caio'      ,'11-972548493'  ,'R. Comendador Inocêncio, 57 - Centro, São Roque - SP, 18130-480, Brasil'       					       ,-23.528263,           -47.134822,         '2021-04-04 20:55:00.000',50 ),--15
			    	('Emanuel'   ,'11-982627484'  ,'R. Dr. Silvério Moura García, 236 - Vila Santo Antonio, São Roque - SP, 18133-350, Brasil'             ,-23.513484,           -47.133281,         '2021-04-04 20:59:00.000',66 ),--13,26
			    	('Catarina'  ,'11-925648482'  ,'R. José Gômide de Castro, 251-207 - Jardim Maria Trindade, São Roque - SP, 18133-400, Brasil'          ,-23.517952,           -47.125405,         '2021-04-04 21:05:00.000',83 ),--5,28x4
			    	('Francisco' ,'11-972838765'  ,'R. Padre Marçal, 570-662 - Vila Junqueira, São Roque - SP, 18136-120, Brasil'       			       ,-23.536231,           -47.133511,         '2021-04-04 21:26:00.000',80 ),--7,31x2
			    	('Otavio'    ,'11-976559877'  ,'R. Barra Bonita, 2-64 - Vila Nova Sao Roque, São Roque - SP, 18131-215, Brasil'      			       ,-23.527752,           -47.153366,         '2021-04-04 21:39:00.000',89 ),--11,28x2
			    	('Olivia'    ,'11-990273826'  ,'R. Manoel Lessa, 456 - Jardim Marieta, São Roque - SP, 18131-418, Brasil'       				       ,-23.529003,           -47.155923,         '2021-04-04 22:01:00.000',77 ),--16,27
			    	('Thiago'    ,'11-996921807'  ,'R. Manoel José Ferreira - Marmeleiro, São Roque - SP, 18120-000, Brasil'      				           ,-23.535409,           -47.160054,         '2021-04-04 22:18:00.000',78 ),--10,25
			    	('Renata'    ,'11-996324678'  ,'R. Maestro Porfírio Taváres, 102-298 - Jardim Maria Trindade, São Roque - SP, Brasil'      		       ,-23.518529,           -47.126278,         '2021-04-04 22:36:00.000',80 ),--15,28x2,29x2
			    	('André'     ,'11-994475231'  ,'R. Epaminondas de Oliveira, 12-132 - Centro, São Roque - SP, 18130-505, Brasil'      		           ,-23.526265,           -47.134675,         '2021-04-04 23:03:00.000',126),--17,40
			    	('Vicente'   ,'11-981539703'  ,'R. México, 121 - Vila Sao Rafael, São Roque - SP, 18131-453, Brasil'                                   ,-23.5322361,          -47.1522304,        '2021-04-06 19:20:00.000',60 ),--3,25
			    	('Manuela'   ,'11-997414917'  ,'R. Padre Anchieta, 123 - Esplanada Mendes Moraes, São Roque - SP, 18130-720, Brasil'                   ,-23.5283878,          -47.1304861,        '2021-04-06 19:20:00.000',56 ),--13
			    	('Elisa'     ,'11-997414917'  ,'R. Profa. Maria Antônia Constancia, 105 - Esplanada Mendes Moraes, São Roque - SP, 18130-770, Brasil'  ,-23.5298451,          -47.1318728,        '2021-04-06 19:20:00.000',62 ),--8
			    	('Ana'       ,'11-997414874'  ,'Av. Gérson Nastri, 78 - Vila Santa Rita, São Roque - SP, 18130-700, Brasil'                            ,-23.5305001,          -47.1296621,        '2021-04-06 19:50:00.000',70 ),--10
			    	('Roberto'   ,'11-933215787'  ,'R. Rosa Passos, 95 - Vila Irene, São Roque - SP, 18132-050, Brasil'      		                       ,-23.523551,           -47.137127,         '2021-04-07 19:23:00.000',69 ),--9,34x2
			    	('Juliana'   ,'11-995568741'  ,'R. Paraná, 107-63 - Vila Irene, São Roque - SP, 18132-110, Brasil'      		                       ,-23.524912,           -47.137406,         '2021-04-07 19:57:00.000',78 ),--1,35
			    	('Aline'     ,'11-994475231'  ,'Av. São Roque, 80-158 - Estacao, São Roque - SP, 18130-545, Brasil'      		                       ,-23.535702,           -47.139583,         '2021-04-07 20:12:00.000',158),--8,16,29x2,32x2
			    	('Pamela'    ,'11-994475231'  ,'R. Santa Pedrina, 49 - Jardim Villaca, São Roque - SP, 18135-410, Brasil'      		                   ,-23.545277,           -47.122203,         '2021-04-07 20:34:00.000',90 ),--5,28x5
			    	('Lucas'     ,'11-994475231'  ,'R. Bento Antônio Pereira, 160-246 - Jardim Bela Vista, São Roque - SP, 18134-180, Brasil'              ,-23.521224,           -47.130670,         '2021-04-07 20:45:00.000',60 ),--15,22
			    	('Alan'      ,'11-994475231'  ,'R. Rotary Club, 78-230 - Jardim Florida, São Roque - SP, 18133-050, Brasil'      		               ,-23.520360,           -47.134009,         '2021-04-07 21:32:00.000',130),--11,38
			    	('André'     ,'11-994475231'  ,'R. Epaminondas de Oliveira, 12-132 - Centro, São Roque - SP, 18130-505, Brasil'      		           ,-23.526265,           -47.134675,         '2021-04-07 23:03:00.000',126),--17,40
			    	('Fabio'     ,'11-957395470'  ,'R. Tibiriçá, 78 - Esplanada Mendes Moraes, São Roque - SP, 18130-800, Brasil'                          ,-23.528416612322687,  -47.13103383779526 ,'2021-04-08 19:00:00.000',122),--7,8
			    	('Lindalvo'  ,'11-938541048'  ,'R. São Joaquim, 100 - Sao Roque, São Roque - SP, 18130-220, Brasil'                                    ,-23.534602010104486,  -47.138254679739475,'2021-04-08 19:15:00.000',151),--11,12,36
			    	('Andre'     ,'11-956021428'  ,'R. Tomás Antônio Gonzaga, 325 - Paisagem Colonial, São Roque - SP, 18136-700, Brasil'                  ,-23.557902381564233,  -47.14839577674865 ,'2021-04-08 19:17:00.000',50 ),--15
			    	('Geraldo'   ,'11-976362387'  ,'R. Primeiro-Sargento A Aparecido Pereira, 100 - Jardim Conceicao, São Roque - SP, 18136-490, Brasil'   ,-23.55038080370918,   -47.138280160725124,'2021-04-08 19:40:00.000',66 ),--13,22
			    	('Ana'       ,'11-954895379'  ,'R. Ten. Francisco Luís de Campos, 231 - Vila Junqueira, São Roque - SP, 18136-120, Brasil'             ,-23.53865854112339,   -47.133923918008804,'2021-04-08 20:05:00.000',58 ),--2
			    	('Geraldo'   ,'11-976362387'  ,'R. Primeiro-Sargento A Aparecido Pereira, 100 - Jardim Conceicao, São Roque - SP, 18136-490, Brasil'   ,-23.55038080370918,   -47.138280160725124,'2021-04-08 20:50:00.000',55 ),--5
			    	('Malaquias' ,'11-973645635'  ,'R. dos Carvalhos, 224 - Jardim Guacu, São Roque - SP, 18132-440, Brasil'                               ,-23.513228847408648,  -47.14126713573933 ,'2021-04-08 21:05:00.000',60 ),--12,23
			    	('Marcio'    ,'11-954895381'  ,'R. Bento Antônio Pereira, 7 - Jardim Bela Vista, São Roque - SP, 18134-180, Brasil'                    ,-23.522989932825325,  -47.13158771395683 ,'2021-04-08 21:50:00.000',91 ),--17.22
			    	('Patrícia'  ,'11-905747585'  ,'R. Ida, 118 - Vila Santo Antonio, São Roque - SP, 18133-290, Brasil'                                   , -23.515310182660063, -47.13280007243156 ,'2021-04-08 23:00:00.000',85 ),--11,10
			    	('Dolores'   ,'11-954895380'  ,'Rua Marechal Deodoro da Fonseca, 360 - Centro, São Roque - SP, 18130-070, Brasil'                      ,-23.534870359166487,  -47.13308103382588 ,'2021-04-08 23:50:00.000',50 ),--15
			    	('Januário'  ,'11-913957395'  ,'R. José Vitório Cavalheiros, 127 - Jardim Maria Trindade, São Roque - SP, 18133, Brasil'               ,-23.51883054647095,   -47.12518058717251 ,'2021-04-09 19:40:00.000',60 ),--15,22
			    	('Amanda'    ,'11-995856484'  ,'R. Ida, 154 - Vila Santo Antonio, São Roque - SP, 18133-290, Brasil'                                   ,-23.5151380202832,    -47.132128179073334,'2021-04-09 19:50:00.000',70 ),--7,22
			    	('Romualdo'  ,'11-954758584'  ,'Av. Anhanguera, 166 - Jardim Bandeirantes, São Roque - SP, 18134-240, Brasil'                          ,-23.52378951598343,   -47.1325982362032  ,'2021-04-09 20:10:00.000',75 ),--9,32*3
			    	('Vinicius'  ,'11-997654648'  ,'R. Paulino Hermílio de Campos, 116 - Centro, São Roque - SP, 18130-385, Brasil'                        ,-23.530205372438676,  -47.13948681950569 ,'2021-04-09 20:20:00.000',53 ),--14
			    	('Francisco' ,'11-987654365'  ,'R. Joaquim Silveira Mello, 209 - Jardim Carambei, São Roque - SP, 18132-170, Brasil'                   ,-23.523613675736318,  -47.14176636189222 ,'2021-04-09 20:40:00.000',62 ),--8
			    	('Augusto'   ,'11-976476365'  ,'Rua Cardeal, 432, São Roque - SP, Brasil'                                                              ,-23.509749838999195,  -47.14945625513792 ,'2021-04-09 21:10:00.000',60 ),--6
			    	('Antônia'   ,'11-967600224'  ,'Rua Araras, 118 - Jardim Carambei, São Roque - SP, 18132-270, Brasil'                                  ,-23.521246572621433,  -47.14085709303617 ,'2021-04-09 21:20:00.000',80 ),--10,26
			    	('Jussara'   ,'11-911133445'  ,'R. Cap. Fernão Paes de Barros, 218 - Jardim Bela Vista, São Roque - SP, 18134-150, Brasil'             ,-23.52193303690705,   -47.129760794341564,'2021-04-09 21:30:00.000',50 ),--15
			    	('Amaral'    ,'11-968885533'  ,'R. Prof. Júlio César de Oliveira, 118 - Jardim Villaca, São Roque - SP, 18130-630, Brasil'             ,-23.53231195288663,   -47.12795801460742 ,'2021-04-09 21:50:00.000',79 ),--2,28*3
			    	('Bruna'     ,'11-999774456'  ,'R. São Tibúrcio, 376 - Sao Roque, São Roque - SP, 18135-260, Brasil'                                   ,-23.55455609631582,   -47.12289299815893 ,'2021-04-09 22:30:00.000',52 ),--3
			    	('Cristiane' ,'11-954895360'  ,'Av. João Pessoa, 378 - Centro, São Roque - SP, 18130-290, Brasil'                                      ,-23.532246785574436,  -47.13871601969004 ,'2021-04-09 22:35:00.000',142),--8,14,29*2,27
			    	('Cecilia'   ,'11-977755332'  ,'R. Júlio Salvetti, 33 - Parque Primavera, São Roque - SP, 18135-580, Brasil'                           ,-23.560312772853194,  -47.11548440158368 ,'2021-04-09 22:40:00.000',53 ),--14
			    	('Daniel'    ,'11-955543947'  ,'R. Dirceu P de Andrade, 183 - Jardim Vinhas do Sol (Mailasqui), São Roque - SP, 18143-665, Brasil'     ,-23.566244673353136,  -47.08882391452789 ,'2021-04-09 22:45:00.000',60 ),--15,22
			    	('José'      ,'11-954895361'  ,'R. Duque de Caxias, 240 - Centro, São Roque - SP, 18130-150, Brasil'                                   ,-23.53361221845325,   -47.13631343096495 ,'2021-04-09 23:20:00.000',54 ),--9
			    	('Daniel'    ,'11-955543947'  ,'R. Dirceu P de Andrade, 183 - Jardim Vinhas do Sol (Mailasqui), São Roque - SP, 18143-665, Brasil'     ,-23.566244673353136,  -47.08882391452789 ,'2021-04-09 23:25:00.000',76 ),--16,22
			    	('Emilson'   ,'11-946489887'  ,'R. José Rosa, 140 - Jardim Ponta-Pora (Mailasqui), São Roque - SP, 18143-757, Brasil'                  ,-23.559755587007174,  -47.09486357867718 ,'2021-04-09 23:30:00.000',52 ),--3
			    	('Elaine'    ,'11-954895385'  ,'BR-272, 1325 - Taboão, São Roque - SP, 18135-125, Brasil'                                              ,-23.542411573883093,  -47.125645279884345,'2021-04-10 19:01:00.000',75 ),--13, 18,19
			    	('Osmar'     ,'11-954895386'  ,'Rua Sabatini Alceste, 55, São Roque - SP, 18133-340, Brasil'                                           ,-23.514590173507546,  -47.13417571038008, '2021-04-10 19:10:00.000',66 ),--16
			    	('Thiago'    ,'11-954895387'  ,'R. das Rosas, 110 - Jardim Sao Jose, São Roque - SP, 18133-280, Brasil'                                ,-23.515013817285826,  -47.13141404092311, '2021-04-10 19:15:00.000',58 ),--2
			    	('Manuela'   ,'11-997414917'  ,'R. Padre Anchieta, 123 - Esplanada Mendes Moraes, São Roque - SP, 18130-720, Brasil'                   ,-23.5283878,          -47.1304861,        '2021-04-10 19:20:00.000',56 ),--13
			    	('Elisa'     ,'11-997414917'  ,'R. Profa. Maria Antônia Constancia, 105 - Esplanada Mendes Moraes, São Roque - SP, 18130-770, Brasil'  ,-23.5298451,          -47.1318728,        '2021-04-10 19:20:00.000',69 ),--13, 29x2
			    	('Ana'       ,'11-954895379'  ,'R. Ten. Francisco Luís de Campos, 231 - Vila Junqueira, São Roque - SP, 18136-120, Brasil'             ,-23.53865854112339,   -47.133923918008804,'2021-04-10 20:00:00.000',70 ),--7,22
			    	('Dolores'   ,'11-954895380'  ,'Rua Marechal Deodoro da Fonseca, 360 - Centro, São Roque - SP, 18130-070, Brasil'                      ,-23.534870359166487,  -47.13308103382588, '2021-04-10 20:00:00.000',53 ),--1
			    	('Iago'      ,'11-954895946'  ,'R. Prof. Joaquim de Oliveira, 112 - Centro, São Roque - SP, 18130-140, Brasil'                         ,-23.5338794,          -47.135989,         '2021-04-10 20:15:00.000',236),--15x2,7,13,22x2
			    	('Elias'     ,'11-936985380'  ,'R. Duque de Caxias, 362 - Centro, São Roque - SP, 18130-150, Brasil'                                   ,-23.5339808,          -47.136148,         '2021-04-10 20:15:00.000',50 ),--15
			    	('Luiz'      ,'11-954895372'  ,'R. das Papoulas, 568 - Vila Santa Rosalia, São Roque - SP, 18136-185, Brasil'                          ,-23.54702510621119,   -47.13165711611509, '2021-04-10 20:30:00.000',85 ),--5,30*3
			    	('Joel'      ,'11-954895373'  ,'Rua Msr A Morais 52 - Vila Mike, São Roque - SP, 18136-220, Brasil'                                    ,-23.5432211821392,    -47.13324632495642, '2021-04-10 20:42:00.000',82 ),--8,31,22
			    	('Maria'     ,'11-954895374'  ,'R. José Bonifácio de Andrada e Silva, 150 - Jardim Meny, São Roque - SP, 18130-005, Brasil'            ,-23.53514147415779,   -47.13589802384377, '2021-04-10 20:43:00.000',56 ),--13,
			    	('Betina'    ,'11-954895999'  ,'R. Santana, 105 - Vila Marques, São Roque - SP, 18130-555, Brasil'                                     ,-23.5362918,          -47.1392895,        '2021-04-10 20:43:00.000',56 ),--13,
			    	('Flávia'    ,'11-979895374'  ,'Av. Nhá Vita, 28 - Vila Junqueira, São Roque - SP, 18136-080, Brasil'                                  ,-23.5402,             -47.135387,         '2021-04-10 20:43:00.000',60 ),--6,
			    	('Tomás'     ,'11-989895374'  ,'R. São Paulo, 660 - Centro, São Roque - SP, 18135-125, Brasil'                                         ,-23.540064,           -47.1316376,        '2021-04-10 20:49:00.000',113),--12, 1, 23
			    	('Lucca'     ,'11-989899634'  ,'R. Boa Vista, 80 - Vila Mike, São Roque - SP, 18136-240, Brasil'                                       ,-23.5451837,          -47.1346821,        '2021-04-10 20:58:00.000',54 ),--9
			    	('Juan'      ,'11-996845133'  ,'R. Santa Emília, 62 - Jardim Villaca, São Roque - SP, 18135-400, Brasil'                               ,-23.5462076,          -47.1227761,        '2021-04-10 21:03:00.000',50 ),--15
			    	('Filipe'    ,'11-999874516'  ,'R. Sergipe, 107 - Taboão, São Roque - SP, 18135-130, Brasil'                                           ,-23.5429047,          -47.1259609,        '2021-04-10 21:15:00.000',66 ),--15,33x2
                    ('Anthony'   ,'11-997362682'  ,'Av. Campo Limpo, 89-1 - Vila Nova Sao Roque, São Roque - SP, 18131-320, Brasil'       			       ,-23.525430,           -47.151320,         '2021-04-11 19:42:00.000',60 ),--7
                    ('Fernando'  ,'11-954040544'  ,'R. Jacareí, 42-218 - Vila Nova Sao Roque, São Roque - SP, 18131-160, Brasil'                           ,-23.526654,           -47.155182,         '2021-04-11 19:58:00.000',74 ),--2,29x2
                    ('Anthony'   ,'11-915464467'  ,'Rua Msr Aguiar, 107 - Vila Mike, São Roque - SP, 18136-220, Brasil'       			                   ,-23.543283,           -47.132968,         '2021-04-11 19:42:00.000',118),--1,9,27
                    ('Vicente'   ,'11-981539703'  ,'R. México, 121 - Vila Sao Rafael, São Roque - SP, 18131-453, Brasil'                                   ,-23.532236,           -47.152230,         '2021-04-06 19:20:00.000',60 ),--3,25
                    ('Emanuel'   ,'11-982627484'  ,'R. Dr. Silvério Moura García, 236 - Vila Santo Antonio, São Roque - SP, 18133-350, Brasil'             ,-23.513484,           -47.133281,         '2021-04-04 20:59:00.000',66 ),--13,26
                    ('Lara'      ,'11-912344975'  ,'R. Goiás, 151-1 - Vila Irene, São Roque - SP, 18132-070, Brasil'      							       ,-23.523077,           -47.138289,         '2021-04-04 20:05:00.000',75 ),--13, 18,19
                    ('Julia'     ,'11-999874895'  ,'Av. São Roque, 403 - Sao Roque, São Roque - SP, 18131-000, Brasil'       			                   ,-23.537481,           -47.140567,         '2021-04-11 20:39:00.000',176), --11,12,35,36
                    ('Roberta'   ,'11-991348741'  ,'R. Aparecido Nunes de Moraes, 60-246 - Jardim Ponta-Pora, São Roque - SP, 18143-763, Brasil'           ,-23.557623,           -47.094701,         '2021-04-11 20:41:00.000',66 ),--5,18,19
                    ('Cecilia'   ,'11-974644784'  ,'R. Novellara, 94-302 - Vila Mike, São Roque - SP, 18136-255, Brasil'       			                   ,-23.547314,           -47.130419,         '2021-04-11 20:59:00.000',202),--1,2,5,27,36
                    ('Janaina'   ,'11-961161884'  ,'R. Santa Isabel, 4-128 - Vila Marques, São Roque - SP, 18130-565, Brasil'       			           ,-23.536340,           -47.137685,         '2021-04-11 21:16:00.000',76 ),--7,29x2
                    ('Bruna'     ,'11-913485741'  ,'Av. Santa Rita, 192-306 - Vila Santa Rita, São Roque - SP, 18130-675'       			               ,-23.531743,           -47.129682,         '2021-04-11 21:37:00.000',161),--8,9,39
                    ('Viviane'   ,'11-979189171'  ,'Alameda Di Turim, São Roque - SP, Brasil'       			                                           ,-23.497653,           -47.142593,         '2021-04-11 21:56:00.000',268),--1,7x2,8,22,24,28x2
                    ('Geisa'     ,'11-916789434'  ,'R. Newton Prado, 64-192 - Estacao, São Roque - SP, 18131-030, Brasil'       			               ,-23.534856,           -47.140419,         '2021-04-11 22:15:00.000',60 ),--7
                    ('Yasmin'    ,'11-989147417'  ,'Avenida Campo Limpo, 50 - Vila Nova São Roque, São Roque - SP, 18131-320, Brasil'                      ,-23.525221,           -47.152400,         '2021-04-03 22:38:00.000',118),-- 12, 13, 27
                    ('luiz'      ,'11-961821647'  ,'R. Garfield Pereira Barreto, 19 - Centro, São Roque - SP, 18130-380, Brasil'       			           ,-23.531818,           -47.139337,         '2021-04-11 22:45:00.000',75 ),--11
                    ('Henrique'  ,'11-916578481'  ,'R. Dr. Stevaux, 93-197 - Centro, São Roque - SP, 18130-500, Brasil'       			                   ,-23.529674,           -47.133967,         '2021-04-11 23:03:00.000',85 ),--6,36
                    ('Mariana'   ,'11-972838287'  ,'R. Bento Antônio Pereira, 157-1 - Jardim Bela Vista, São Roque - SP, 18134-180, Brasil'      	       ,-23.522280,           -47.131112,         '2021-04-13 20:00:00.000',60 ),--7
                    ('Beatriz'   ,'11-973728822'  ,'R. Francisco da Silva Pontes, 139 - Jardim Florida, São Roque - SP, 18133-040, Brasil'       	       ,-23.520116,           -47.132904,         '2021-04-13 20:15:00.000',50 ),--15
                    ('Isaque'    ,'11-963737826'  ,'R. Chad Kaid, 176 - Jardim Sao Jose, São Roque - SP, 18133-250, Brasil'      					       ,-23.515384,           -47.130244,         '2021-04-13 20:25:00.000',66 ),--16
                    ('Anthony'   ,'11-997362682'  ,'Av. Campo Limpo, 89-1 - Vila Nova Sao Roque, São Roque - SP, 18131-320, Brasil'       			       ,-23.525430,           -47.151320,         '2021-04-13 20:33:00.000',60 ),--7
                    ('Thiago'    ,'11-954895387'  ,'R. das Rosas, 110 - Jardim Sao Jose, São Roque - SP, 18133-280, Brasil'                                ,-23.515013817285826,  -47.13141404092311, '2021-04-13 20:45:00.000',64 ),--2, 19
					('Amanda'    ,'11-991451870'  ,'R. Barão do Rio Branco, 2-162 - Centro, São Roque - SP, 18130-020, Brasil'                             ,-23.536457,           -47.134066,         '2021-04-14 19:19:00.000',58 ),--15,25
					('Zenilda'   ,'11-990898105'  ,'R. Silvio Edgar Rosa, 2-98 - Jardim Esther, São Roque - SP, 18131-070, Brasil'                         ,-23.531536,           -47.140946,         '2021-04-14 19:47:00.000',126),--1,4,26
					('Pamela'    ,'11-994475231'  ,'R. Santa Pedrina, 49 - Jardim Villaca, São Roque - SP, 18135-410, Brasil'      		                   ,-23.545277,           -47.122203,         '2021-04-07 19:55:00.000',90 ),--5,28x5
					('Nickolas'  ,'11-994165401'  ,'Rua Sabatini Alceste, 133-9, São Roque - SP, 18133-340, Brasil'                                        ,-23.515073,           -47.134350,         '2021-04-14 20:09:00.000',141),--5,12,28x5
					('Eli'       ,'11-995751620'  ,'R. Juvenal Novaes, 44-156 - Parque Varanguera, São Roque - SP, 18132-560, Brasil'                      ,-23.510137,           -47.143659,         '2021-04-14 20:35:00.000',68 ),--14,18
					('Luiza'     ,'11-999018410'  ,'R. Bernardino Pereira Leite, 1 - Jardim Maria Trindade, São Roque - SP, 18133-365, Brasil'             ,-23.516374,           -47.126421,         '2021-04-14 20:57:00.000',91 ),--16,35
					('Erica'     ,'11-998261048'  ,'Av. Três de Maio, 982 - Parque IX de Julho, São Roque - SP, 18133-445, Brasil'                         ,-23.519261,           -47.127954,         '2021-04-14 21:13:00.000',63 ),--1,26
					('Sebastião' ,'11-989402108'  ,'R. Francisco da Silva Pontes, 103 - Jardim Florida, São Roque - SP, 18133-040, Brasil'                 ,-23.520508,           -47.133294,         '2021-04-14 22:01:00.000',66 ),--15,29x2
					('Emily'     ,'11-995594824'  ,'Rua Antônio Cavaglieri, 65 - Centro, São Roque - SP, 18130-065, Brasil'       		                   ,-23.533422,           -47.139856,         '2021-04-14 22:33:00.000',127),--2,7,23
					('Fernada'   ,'11-989876765'  ,'R. José F Rodrigues, 75 - Jardim Vinhas do Sol (Mailasqui), São Roque - SP, 18143-665, Brasil'         ,-23.56468935015538,   -47.08935834467411, '2021-04-15 19:05:00.000',70 ),--7,22
					('Gisele'    ,'11-979944637'  ,'R. Profa. Célia Asse Jacob, 3 - Centro (Mailasqui), São Roque - SP, 18143-073, Brasil'                 ,-23.556351876996285,  -47.09145314991475, '2021-04-15 19:33:00.000',65 ),--13,24
					('Hamilton'  ,'11-953684683'  ,'R. Paraguai, 250 - Vila Sao Rafael, São Roque - SP, 18131-475, Brasil'                                 ,-23.53371580879795,   -47.152799628674984,'2021-04-15 19:45:00.000',98 ),--16,33*4
					('Claudio'   ,'11-999555647'  ,'R. Ten. Francisco Luís de Campos, 332 - Vila Junqueira, São Roque - SP, 18136-120, Brasil'             ,-23.53877595949601,   -47.1328305825591,  '2021-04-15 20:15:00.000',126),--17,39
					('Maria'     ,'11-911223857'  ,'R. José Bonifácio de Andrada e Silva, 220 - Jardim Meny, São Roque - SP, 18130-005, Brasil'            ,-23.53514147415779,   -47.13589802384377, '2021-04-15 20:43:00.000',80 ),--10,26
					('José'      ,'11-944456634'  ,'R. Maestro Porfírio Taváres, 335 - Jardim Maria Trindade, São Roque - SP, 18133-410, Brasil'           ,-23.518490227225822,  -47.12525971233845, '2021-04-15 20:57:00.000',50 ),--15
					('Marco'     ,'11-967777563'  ,'R. José Gômide de Castro, 170- Jardim Maria Trindade, São Roque - SP, 18133-400, Brasil'               ,-23.51821231456105,   -47.126943469047546,'2021-04-15 21:40:00.000',53 ),--14
					('Junior'    ,'11-922344345'  ,'Rua Marechal Deodoro da Fonseca, 361 - Centro, São Roque - SP, 18130-070, Brasil'                      ,-23.534870359166487,  -47.13308103382588, '2021-04-15 21:50:00.000',105),--5,30*5
					('Raimundo'  ,'11-956667788'  ,'Rua Santa Cruz, 120 - Vila Santa Isabel, São Roque - SP, 18136-025, Brasil'                            ,-23.536778603376078,  -47.13693100959063, '2021-04-15 21:55:00.000',60 ),--6,
					('Joāo'      ,'11-901375893'  ,'R. João Pinto Splendore, 205, São Roque - SP, 18133-300, Brasil'                                       ,-23.51331093318866,   -47.129439264535904,'2021-04-15 22:59:00.000',53 ),--1
					('José'      ,'11-964700044'  ,'R. das Rosas, 115 - Jardim Sao Jose, São Roque - SP, 18133-280, Brasil'                                ,-23.515013817285826,  -47.13141404092311, '2021-04-15 23:30:00.000',60 ),--7
					('Pedro'     ,'11-964574250'  ,'R. Bento Antônio Pereira, 10 - Jardim Bela Vista, São Roque - SP, 18134-180, Brasil'                   ,-23.522989932825325,  -47.13158771395683 ,'2021-04-16 19:10:00.000',70 ),--7,26
					('Douglas'   ,'11-953688665'  ,'R. Ten. Francisco Luís de Campos, 238 - Vila Junqueira, São Roque - SP, 18136-120, Brasil'             ,-23.53865854112339,-   47.133923918008804,'2021-04-16 19:20:00.000',54 ),--9
					('Luciana'   ,'11-956479994'  ,'R. Santa Pedrina, 110 - Jardim Villaca, São Roque - SP, 18135-410, Brasil'                             ,-23.546045243597153,  -47.12182179093361 ,'2021-04-16 19:30:00.000',62 ),--12,27
					('Alex'      ,'11-933334758'  ,'R. Paulino Hermílio de Campos, 61 - Centro, São Roque - SP, 18130-385, Brasil'                         ,-23.53009716835891,   -47.13880117982625 ,'2021-04-16 19:50:00.000',64 ),--14,27
					('Thereza'   ,'11-955667782'  ,'R. Irineu Silveira, 126 - Vila Junqueira, São Roque - SP, 18136-100, Brasil'                           ,-23.540818469127807,  -47.13398527354001 ,'2021-04-16 20:20:00.000',60 ),--15,26
					('Jeferson'  ,'11-959477449'  ,'Av. João Pessoa, 381 - Centro, São Roque - SP, 18130-290, Brasil'                                      ,-23.532246785574436,  -47.13871601969004 ,'2021-04-16 20:30:00.000',74 ),--4,27
					('Osmar'     ,'11-958888857'  ,'R. Primeiro-Sargento A Aparecido Pereira, 357 - Jardim Conceiçao, São Roque - SP, 18136-490, Brasil'   ,-23.551010563733737,  -47.136614844202995,'2021-04-16 20:40:00.000',86 ),--8,29*3
					('Elisangela','11-973001497'  ,'R. Amador Marquês da Silva, 201 - Vila Marques, São Roque - SP, 18130-545,Brasil'                      ,-23.536676244974018,  -47.13959611952305 ,'2021-04-16 20:55:00.000',120),--15,10
					('Marlene'   ,'11-944556671'  ,'R. São José, 210 - Jardim Sao Jose, São Roque - SP, 18133-255, Brasil'                                 ,-23.51485518160395,   -47.13278565555811 ,'2021-04-16 21:15:00.000',55 ),--5
					('Dolores'   ,'11-999334758'  ,'R. Nicolau Chad, 83 - Vila Borghesi, São Roque - SP, 18136-271, Brasil'                                ,-23.54648814977974,   -47.13044676929712 ,'2021-04-16 21:33:00.000',60 ),--15,26
					('Aline'     ,'11-944457523'  ,'R. Tomás Antônio Gonzaga, 250 - Paisagem Colonial, São Roque - SP, 18136-700, Brasil'                  ,-23.556905081914525,  -47.14863214641809 ,'2021-04-16 21:45:00.000',51 ),--12
					('Concheta'  ,'11-955565431'  ,'Av. Antônio Maria Picena, 140 - Vila Junqueira, São Roque - SP, 18136-040, Brasil'                     ,-23.540026673823945,  -47.13616892695426 ,'2021-04-16 21:48:00.000',84 ),--13,28*4
					('Luiz'      ,'11-964746739'  ,'R. Duque de Caxias, 242 - Centro, São Roque - SP, 18130-150, Brasil'                                   ,-23.53361221845325,   -47.13631343096495 ,'2021-04-16 21:47:00.000',69 ),--2,27
					('Dirce'     ,'11-955321448'  ,'R. Tamandaré, 66 - Vila Sao Rafael, São Roque - SP, 18131-500, Brasil'                                 ,-23.532264614370607,  -47.1506505087018  ,'2021-04-16 22:13:00.000',70 ),--6,26
					('Jonas'     ,'11-933458711'  ,'R. Rotary Club, 273 - Jardim Florida, São Roque - SP, 18133-050, Brasil'                               ,-23.519199455228087,  -47.132859751582146,'2021-04-16 22:25:00.000',126),--12,11
					('Caio'      ,'11-967444557'  ,'R. Bento Antônio Pereira, 111 - Jardim Bela Vista, São Roque - SP, 18134-180, Brasil'                  ,-23.522456259856284,  -47.13113375008106 ,'2021-04-16 22:38:00.000',55 ),--5
					('Rogerio'   ,'11-912324645'  ,'Av. Guilherme de Almeida, 83 - Sao Roque, São Roque - SP, 18135-660, Brasil'                           ,-23.559611757072517,  -47.12792918086051 ,'2021-04-16 23:33:00.000',81 ),--10.27
					('Juliana'   ,'11-978665578'  ,'R. das Papoulas, 571 - Vila Santa Rosalia, São Roque - SP, 18136-185, Brasil'                          ,-23.54702510621119,   -47.13165711611509 ,'2021-04-16 23:40:00.000',79 ),--2,28*3
                    ('Lucio'     ,'11-954895368'  ,'Av. Guilherme de Almeida, 80 - Sao Roque, São Roque - SP, 18135-660, Brasil'                           ,-23.559611757072517,  -47.12792918086051, '2021-04-17 19:30:00.000',50 ),--15
                    ('Daniela'   ,'11-954895368'  ,'R. São Tibúrcio, 93 - Jardim Villaca, São Roque - SP, 18135-260, Brasil'                               ,-23.554321287649234,  -47.12225899100303, '2021-04-17 19:33:00.000',136),--17,38
                    ('Samara'    ,'11-954895369'  ,'R. João Colo, 17 - Parque Primavera, São Roque - SP, 18135-590, Brasil'                                ,-23.560308470268833,  -47.11494058370591, '2021-04-17 19:42:00.000',80 ),--15,31x3
                    ('Giovanna'  ,'11-998581916'  ,'R. dos Carvalhos, 54 - Jardim Guacu, São Roque - SP, 18132-440, Brasil'                                ,-23.514503,           -47.1419799,        '2021-04-17 20:15:00.000',110),--6,15
                    ('Antonella' ,'11-994231219'  ,'R. Santa Virgínia, 240 - Jardim Villaca, São Roque - SP, 18135-340, Brasil'                            ,-23.5476301,          -47.1214591,        '2021-04-17 21:10:00.000',70 ),--7,26
                    ('Geraldo'   ,'11-998581916'  ,'R. Cláudio de Souza, 129 - Vila Santa Rita, São Roque - SP, 18130-690, Brasil'                         ,-23.5301967,          -47.1269538,        '2021-04-17 21:12:00.000',72 ),--4,23
                    ('Regina'    ,'11-975635521'  ,'R. Maria Guilhermina Lemos, 175-1 - Vila Junqueira, São Roque - SP, 18136-180, Brasil'  		       ,-23.541219,           -47.132667,         '2021-04-17 19:15:00.000',144),--11,7,23
                    ('Murilo'    ,'11-982672827'  ,'R. Leão XIII, 155-35 - Jardim Tanzi, São Roque - SP'       										       ,-23.524887,           -47.134738,         '2021-04-18 19:07:00.000',138),--1,7,35
                    ('Alan'      ,'11-994475231'  ,'R. Rotary Club, 78-230 - Jardim Florida, São Roque - SP, 18133-050, Brasil'      		               ,-23.520360,           -47.134009,         '2021-04-18 19:32:00.000',130),--11,38
                    ('Jucemar'   ,'11-954895383'  ,'R. Maestro Porfírio Taváres, 335 - Jardim Maria Trindade, São Roque - SP, 18133-410, Brasil'           ,-23.518490227225822,  -47.12525971233845, '2021-04-18 19:29:00.000',55 ),--5,
                    ('Marcos'    ,'11-954895355'  ,'R. José Gômide de Castro, 127 - Jardim Maria Trindade, São Roque - SP, 18133-400, Brasil'              ,-23.51821231456105,   -47.126943469047546,'2021-04-18 19:40:00.000',130),--11,38
                    ('Cintia'    ,'11-954895355'  ,'R. Manoel Lessa, 119 - Jardim Marieta, São Roque - SP, 18131-418, Brasil'                              ,-23.529431,           -47.155002,         '2021-04-18 20:04:00.000',66 ),--16
                    ('Francisco' ,'11-954895355'  ,'R. Marília, 415 - Vila Nova Sao Roque, São Roque - SP, 18131-250, Brasil'                              ,-23.524842,           -47.150880,         '2021-04-18 20:16:00.000',66 ),--15,33x2
                    ('Gilberto'  ,'11-965654604'  ,'R. Prof. Joaquim Firmino de Lima, 126 - Jardim Villaca, São Roque - SP, 18135-270, Brasil'             ,-23.553444,           -47.122278,         '2021-04-18 20:31:00.000',64 ),--14,27
                    ('Lucas'     ,'11-945480521'  ,'R. Diamante, 140 - Parque Alianca, São Roque - SP, 18136-450, Brasil'                                  ,-23.552795,           -47.136505,         '2021-04-18 20:52:00.000',70 ),--7,26
                    ('Flávio'    ,'11-901684184'  ,'R. das Petúnias, 101-1 - Vila Amaral, São Roque - SP, 18136-300, Brasil'                               ,-23.549896,           -47.133317,         '2021-04-18 21:10:00.000',65 ),--13,24
                    ('Carol'     ,'11-998450054'  ,'R. Ismênia Rosa, 105-37 - Jardim Meny, São Roque - SP, 18130-010, Brasil'                              ,-23.538560,           -47.135605,         '2021-04-18 21:25:00.000',79 ),--2,28*3
                    ('Rafaela'   ,'11-905497032'  ,'R. Amador Marquês da Silva, 140 - Vila Marques, São Roque - SP, 18130-545, Brasil'                     ,-23.536331,           -47.139187,         '2021-04-18 21:48:00.000',80 ),--10,26
                    ('Monique'   ,'11-909484094'  ,'Rua Marechal Deodoro da Fonseca, 347-289 - Centro, São Roque - SP, 18130-120, Brasil'                  ,-23.534433,           -47.133388,         '2021-04-18 21:53:00.000',84 ),--13,28*4
                    ('Joana'     ,'11-954984030'  ,'Av. Tiradentes, 148 - Centro, São Roque - SP, 18130-470, Brasil'                                       ,-23.529127,           -47.134633,         '2021-04-18 22:13:00.000',70 ),--7,26
                    ('Roberto'   ,'11-990508455'  ,'R. Marino Camurça, 22-110 - Centro, São Roque - SP, 18130-515, Brasil'                                 ,-23.526368,           -47.132784,         '2021-04-18 22:20:00.000',85 ),--6,36
                    ('Denis'     ,'11-998780150'  ,'R. Epaminondas de Oliveira, 289-133 - Centro, São Roque - SP, 18130-505, Brasil'                       ,-23.524873,           -47.134002,         '2021-04-18 22:43:00.000',51 ),--12
                    ('Gerusa'    ,'11-989044087'  ,'R. Cap. Fernão Paes de Barros, 36-182 - Jardim Bela Vista, São Roque - SP, 18134-150, Brasil'          ,-23.523166,           -47.130158,         '2021-04-18 22:57:00.000',62 ),--8	
                    ('Jonathan'  ,'11-999984098'  ,'R. das Rosas, 31-1 - Jardim Sao Jose, São Roque - SP, 18133-280, Brasil'                               ,-23.516259,           -47.133037,         '2021-04-18 23:05:00.000',53 ),--14
                    ('Rogerio'   ,'11-998904123'  ,'R. Alm. Barroso, 20 - Vila Sao Rafael, São Roque - SP, 18131-490, Brasil'                              ,-23.532720,           -47.149614,         '2021-04-18 23:09:00.000',85 ),--6,36
			    	('Sabrina'   ,'11-991413514'  ,'R. Honorio M. de Moraes, 100 - Esplanada Mendes Moraes, São Roque - SP, 18130-760, Brasil'             ,-23.5342766,          -47.1392441,        '2021-04-20 19:20:00.000',104),--12, 14
			    	('Tânia'     ,'11-996823512'  ,'R. Amador Bueno, 56 - Centro, São Roque - SP, 18130-320, Brasil'                                       ,-23.5306357,          -47.146874,         '2021-04-20 19:30:00.000',79 ),--1, 37
			    	('Fernando'  ,'11-985613579'  ,'R. Barão de Piratininga, 186 - Centro, São Roque - SP, 18130-270, Brasil'                              ,-23.5336901,          -47.1475721,        '2021-04-20 19:38:00.000',50 ),--15
			    	('Fernando'  ,'11-996399847'  ,'R. Barão de Piratininga, 78 - Centro, São Roque - SP, 18130-270, Brasil'                               ,-23.5327386,          -47.1471933,        '2021-04-20 19:45:00.000',55 ),--5
			    	('Daniel'    ,'11-996399847'  ,'Rua Ângelo Meneguesso, 240 - Centro, São Roque - SP, 18130-375, Brasil'                                ,-23.5322257,          -47.1480169,        '2021-04-20 19:47:00.000',70 ),--10
			    	('Thiago'    ,'11-996921807'  ,'R. Manoel José Ferreira - Marmeleiro, São Roque - SP, 18120-000, Brasil'      				           ,-23.535409,           -47.160054,         '2021-04-20 20:18:00.000',78 ),--10,25
			    	('Renata'    ,'11-996324678'  ,'R. Maestro Porfírio Taváres, 102-298 - Jardim Maria Trindade, São Roque - SP, Brasil'      		       ,-23.518529,           -47.126278,         '2021-04-20 20:36:00.000',80 ),--15,28x2,29x2
			    	('André'     ,'11-994475231'  ,'R. Epaminondas de Oliveira, 12-132 - Centro, São Roque - SP, 18130-505, Brasil'      		           ,-23.526265,           -47.134675,         '2021-04-20 21:03:00.000',126),--17,40
					('Murilo'    ,'11-956484181'  ,'R. Santa Virgínia, 315 - Jardim Villaca, São Roque - SP, 18135-340, Brasil'       					   ,-23.547706,           -47.120138,         '2021-04-21 19:07:00.000',84 ),--13,28*4
					('Renata'    ,'11-998015105'  ,'R. Santa Pedrina, 81 - Jardim Villaca, São Roque - SP, 18135-410, Brasil'       					   ,-23.545578,           -47.122103,         '2021-04-21 19:30:00.000',53 ),--14
					('Henrique'  ,'11-991565408'  ,'R. Francisco Tagliassachi, 2-142 - Jardim Rene, São Roque - SP, 18135-030, Brasil'                     ,-23.538927,           -47.129393,         '2021-04-21 20:15:00.000',55 ),--5,
					('Ana'       ,'11-995980441'  ,'R. Padre Marçal, 452-524 - Centro, São Roque - SP, 18130-100, Brasil'       						   ,-23.535004,           -47.133883,         '2021-04-21 20:46:00.000',110),-- 6,15
					('Lucas'     ,'11-995640944'  ,'Rua Antônio Cavaglieri, 60 - Centro, São Roque - SP, 18130-065, Brasil'       						   ,-23.533455,           -47.139830,         '2021-04-21 20:57:00.000',81 ),--10.27
					('Gustavo'   ,'11-990108421'  ,'R. Prof. Júlio César de Oliveira, 99-1 - Vila Aguiar, São Roque - SP, 18130-630, Brasil'       	       ,-23.531569,           -47.127880,         '2021-04-21 21:21:00.000',70 ),--6,26
					('Pedro'     ,'11-999948451'  ,'R. Comendador Inocêncio, 89 - Centro, São Roque - SP, 18130-480, Brasil'       				           ,-23.528421,           -47.134957,         '2021-04-21 21:43:00.000',62 ),--12,27
					('Julia'     ,'11-990216548'  ,'R. Rotary Club, 78-230 - Jardim Florida, São Roque - SP, 18133-050, Brasil'       					   ,-23.520307,           -47.133916,         '2021-04-21 22:38:00.000',58 ), --15,25
					('Neuza'     ,'11-996510841'  ,'Rua Sabatini Alceste, 148-678, São Roque - SP, 18133-340, Brasil'       					           ,-23.513787,           -47.132785,         '2021-04-21 22:56:00.000',66 ),--5,18,19
			    	('Adriana'   ,'11-956712343'  ,'Rua Sabatini Alceste, 58, São Roque - SP, 18133-340, Brasil'                                           ,-23.514590173507546,  -47.13417571038008 ,'2021-04-22 19:10:00.000',65 ),--5,22
			    	('Cintia'    ,'11-954738465'  ,'Rua Msr A Morais 55 - Vila Mike, São Roque - SP, 18136-220, Brasil'                                    ,-23.5432211821392,    -47.13324632495642 ,'2021-04-22 19:50:00.000',66 ),--5,27
			    	('Luana'     ,'11-923436543'  ,'R. Santa Augusta, 43 - Jardim Villaca, São Roque - SP, 18135-360, Brasil'                              ,-23.547008816208614,  -47.11882844567299 ,'2021-04-22 20:20:00.000',60 ),--15,22
			    	('Yzoroku'   ,'11-967344221'  ,'R. Júlio Xavier Ferreira, 133 - Jardim Maria Trindade, São Roque - SP, 18133-440, Brasil'              ,-23.51949642602654,   -47.12623938918114 ,'2021-04-22 20:30:00.000',76 ),--8,19*2
			    	('Constantin','11-911234434'  ,'R. Minas Gerais, 245 - Vila Irene, São Roque - SP, 18132-080, Brasil'                                  ,-23.524010853023483,  -47.138444781303406,'2021-04-22 20:40:00.000',60 ),--7
			    	('Joaquim'   ,'11-974866443'  ,'R. João XXIII, 67 - Centro, São Roque - SP, 18130-180, Brasil'                                         ,-23.53264086288481,   -47.13515404611825 ,'2021-04-22 20:45:00.000',100),--11,36
			    	('Kyome'     ,'11-945555567'  ,'R. São José, 205 - Jardim Sao Jose, São Roque - SP, 18133-255, Brasil'                                 ,-23.51485518160395,   -47.13278565555811 ,'2021-04-22 21:10:00.000',103),--1,31*4
			    	('Pamela'    ,'11-954757773'  ,'Av. Antonio Pannellini, 211 - Taboão, São Roque - SP, 18135-131, Brasil'                               ,-23.54373509944832,   -47.1220538020134  ,'2021-04-22 21:30:00.000',54 ),--9
			    	('Gilmar'    ,'11-964667774'  ,'Av. das Palmeiras, 355 - Jardim Suiça Paulista, São Roque - SP, 18136-780, Brasil'                     ,-23.54111846486106,   -47.143758572638035,'2021-04-22 21:35:00.000',70 ),--10
			    	('Laercio'   ,'11-955774443'  ,'R. Barão do Rio Branco, 448 - Vila Junqueira, São Roque - SP, 18130-020, Brasil'                       ,-23.538849115392434,  -47.13492874056101 ,'2021-04-22 21:48:00.000',61 ),--12,22
			    	('Gisele'    ,'11-957473521'  ,'R. João Colo, 20 - Parque Primavera, São Roque - SP, 18135-590, Brasil'                                ,-23.560308470268833,  -47.11494058370591 ,'2021-04-22 22:30:00.000',53 ),--14
			    	('Raimundo'  ,'11-911122348'  ,'São Tibúrcio, 96 - Jardim Villaca, São Roque - SP, 18135-260, Brasil'                                  ,-23.554321287649234,  -47.12225899100303 ,'2021-04-22 22:45:00.000',136),--17*38
			    	('Flavio'    ,'11-946987896'  ,'R. Santa Leocádia, 98 - Jardim Villaca, São Roque - SP, 18135-310, Brasil'                             ,-23.545953342682566,  -47.12087094783783 ,'2021-04-22 23:30:00.000',50 ),--15
					('Tiago'     ,'11-966644523'  ,'R. Padre Antônio Viêira, 74 - Paisagem Colonial, São Roque - SP, 18136-730, Brasil'                    ,-23.560269132348232,  -47.146134339272976,'2021-04-23 18:30:00.000',50 ),--15
					('Sergio'    ,'11-973322445'  ,'R. Tancredo Neves, 183 - Jardim Boa Vista, São Roque - SP, 18132-400, Brasil'                          ,-23.518228300703676,  -47.14435502886772, '2021-04-23 19:10:00.000',52 ),--3
					('Cicero'    ,'11-979898674'  ,'R. João Paulo I, 209 - Jardim Mosteiro, São Roque - SP, 18135-490, Brasil'                             ,-23.54766287359399,   -47.117252983152866,'2021-04-23 19:50:00.000',55 ),--5
					('Marcela'   ,'11-900048582'  ,'R. Gov. Carvalho Pinto, 535 - Jardim Boa Vista, São Roque - SP, 18132-380, Brasil'                     ,-23.51784309561113,   -47.145707197487354,'2021-04-23 19:55:00.000',60 ),--7
					('Ricardo'   ,'11-955830586'  ,'R. João Paulo I, 209 - Jardim Mosteiro, São Roque - SP, 18135-490, Brasil'                             ,-23.54766287359399,   -47.117252983152866,'2021-04-23 20:05:00.000',70 ),--10
					('Silmara'   ,'11-944455667'  ,'BR-272, 1328 - Taboão, São Roque - SP, 18135-125, Brasil'                                              ,-23.542411573883093,  -47.125645279884345,'2021-04-23 20:10:00.000',51 ),--12
					('Silmara'   ,'11-944455667'  ,'BR-272, 1328 - Taboão, São Roque - SP, 18135-125, Brasil'                                              ,-23.542411573883093,  -47.125645279884345,'2021-04-23 20:30:00.000',50 ),--15
			    	('Luciana'   ,'11-954895356'  ,'R. João XXIII, 64 - Centro, São Roque - SP, 18130-180, Brasil'                                         ,-23.53264086288481,   -47.13515404611825, '2021-04-23 20:35:00.000',108),--7,28*6
                    ('Patrícia'  ,'11-905747585'  ,'R. Ida, 118 - Vila Santo Antonio, São Roque - SP, 18133-290, Brasil'                                   ,-23.515310182660063,  -47.13280007243156, '2021-04-23 20:50:00.000',85 ),--11,10
					('Anthony'   ,'11-997362682'  ,'Av. Campo Limpo, 89-1 - Vila Nova Sao Roque, São Roque - SP, 18131-320, Brasil'       			       ,-23.525430,           -47.151320,         '2021-04-23 21:20:00.000',60 ),--6
                    ('Lucas'     ,'11-994475231'  ,'R. Bento Antônio Pereira, 160-246 - Jardim Bela Vista, São Roque - SP, 18134-180, Brasil'              ,-23.521224,           -47.130670,         '2021-04-23 21:39:00.000',60 ),--15,22
			    	('Lucio'     ,'11-954895368'  ,'Av. Guilherme de Almeida, 80 - Sao Roque, São Roque - SP, 18135-660, Brasil'                           ,-23.559611757072517,  -47.12792918086051, '2021-04-23 21:42:00.000',78 ),--15,4*32
			    	('alesandro' ,'11-954895377'  ,'R. Santa Augusta, 42 - Jardim Villaca, São Roque - SP, 18135-360, Brasil'                              ,-23.547008816208614,  -47.11882844567299, '2021-04-23 21:45:00.000',55 ),--15,18
                    ('Joaquim'   ,'11-998581916'  ,'Av. Guilherme de Almeida, 271 - Jardim Santa Maria, São Roque - SP, 18135-660, Brasil'                 ,-23.5612862,          -47.1270003,        '2021-04-23 21:50:00.000',106),-- 17,35
			    	('alesandro' ,'11-954895377'  ,'R. Santa Augusta, 42 - Jardim Villaca, São Roque - SP, 18135-360, Brasil'                              ,-23.547008816208614,  -47.11882844567299, '2021-04-23 22:30:00.000',55 ),--15,18
			    	('Thiago'    ,'11-954895387'  ,'R. das Rosas, 110 - Jardim Sao Jose, São Roque - SP, 18133-280, Brasil'                                ,-23.515013817285826,  -47.13141404092311, '2021-04-23 22:40:00.000',92 ),--6,29*4
					('Elisa'     ,'11-972384848'  ,'R. João Pinto Splendore, 150, São Roque - SP, 18133-300, Brasil'       							       ,-23.513574,           -47.129846,         '2021-04-23 22:55:00.000',52 ),--3
			    	('José'      ,'11-954895361'  ,'R. Duque de Caxias, 240 - Centro, São Roque - SP, 18130-150, Brasil'                                   ,-23.53361221845325,   -47.13631343096495, '2021-04-23 23:40:00.000',54 ),--9
			    	('Jair'      ,'11-954895365'  ,'R. Tamandaré, 63 - Vila Sao Rafael, São Roque - SP, 18131-500, Brasil'                                 ,-23.532264614370607,  -47.1506505087018,  '2021-04-24 19:10:00.000',138),--8, 16,22
			    	('Clecio'    ,'11-954895366'  ,'R. Primeiro-Sargento A Aparecido Pereira, 350 - Jardim Conceiçao, São Roque - SP, 18136-490, Brasil'   ,-23.551010563733737,  -47.136614844202995,'2021-04-24 19:12:00.000',60 ),--15,22
			    	('Maria'     ,'11-954895367'  ,'R. Padre Antônio Viêira, 71 - Paisagem Colonial, São Roque - SP, 18136-730, Brasil'                    ,-23.560269132348232,  -47.146134339272976,'2021-04-24 19:18:00.000',68 ),--7,25
			    	('Lucio'     ,'11-954895368'  ,'Av. Guilherme de Almeida, 80 - Sao Roque, São Roque - SP, 18135-660, Brasil'                           ,-23.559611757072517,  -47.12792918086051, '2021-04-24 19:22:00.000',78 ),--15,4*32
			    	('Daniela'   ,'11-954895368'  ,'R. São Tibúrcio, 93 - Jardim Villaca, São Roque - SP, 18135-260, Brasil'                               ,-23.554321287649234,  -47.12225899100303, '2021-04-24 19:30:00.000',51 ),--12,
			    	('Samara'    ,'11-954895369'  ,'R. João Colo, 17 - Parque Primavera, São Roque - SP, 18135-590, Brasil'                                ,-23.560308470268833,  -47.11494058370591, '2021-04-24 19:33:00.000',64 ),--5,24
			    	('Lindalvo'  ,'11-938541048'  ,'R. São Joaquim, 100 - Sao Roque, São Roque - SP, 18130-220, Brasil'                                    ,-23.534602010104486,  -47.138254679739475,'2021-04-24 19:15:00.000',151),--11,12,36
			    	('Andre'     ,'11-956021428'  ,'R. Tomás Antônio Gonzaga, 325 - Paisagem Colonial, São Roque - SP, 18136-700, Brasil'                  ,-23.557902381564233,  -47.14839577674865 ,'2021-04-24 19:40:00.000',71 ),--15, 28x3
			    	('Geraldo'   ,'11-976362387'  ,'R. Primeiro-Sargento A Aparecido Pereira, 100 - Jardim Conceicao, São Roque - SP, 18136-490, Brasil'   ,-23.55038080370918,   -47.138280160725124,'2021-04-24 19:41:00.000',66 ),--13,22
			    	('Ana'       ,'11-954895379'  ,'R. Ten. Francisco Luís de Campos, 231 - Vila Junqueira, São Roque - SP, 18136-120, Brasil'             ,-23.53865854112339,   -47.133923918008804,'2021-04-24 19:48:00.000',58 ),--2
			    	('Celma'     ,'11-954895389'  ,'R. São José, 205 - Jardim Sao Jose, São Roque - SP, 18133-255, Brasil'                                 ,-23.51485518160395,   -47.13278565555811, '2021-04-24 19:55:00.000',52 ),--3,
			    	('Helio'     ,'11-954895390'  ,'BR-272, 1325 - Taboão, São Roque - SP, 18135-125, Brasil'                                              ,-23.542411573883093,  -47.125645279884345,'2021-04-24 20:03:00.000',50 ),--15,
			    	('Robson'    ,'11-954895391'  ,'R. Minas Gerais, 240 - Vila Irene, São Roque - SP, 18132-080, Brasil'                                  ,-23.524010853023483,  -47.138444781303406,'2021-04-24 20:08:00.000',110),--11,31*4
			    	('Nicolle'   ,'11-972828484'  ,'Av. Gérson Nastri, 163-197 - Vila Santa Rita, São Roque - SP, 18130-700, Brasil'      			       ,-23.530424,           -47.128567,         '2021-04-24 20:19:00.000',61 ),--12,22
			    	('Otavio'    ,'11-976559877'  ,'R. Barra Bonita, 2-64 - Vila Nova Sao Roque, São Roque - SP, 18131-215, Brasil'      			       ,-23.527752,           -47.153366,         '2021-04-24 20:39:00.000',67 ),--14,28x2
  					('Roberta'   ,'11-981539703'  ,'Rua Sabatini Alceste, 133-9, São Roque - SP, 18133-340, Brasil'                                        ,-23.515077,           -47.134355,         '2021-04-25 19:20:00.000',55 ),--15,18
  					('Augusto'   ,'11-981539703'  ,'R. Santa Quitéria, 563-441 - Vila Irene, São Roque - SP, 18132-050, Brasil'                            ,-23.532236,           -47.152230,         '2021-04-25 19:35:00.000',151),--11,12,36
  					('Pedro'     ,'11-981539703'  ,'R. Leão XIII, 155-35 - Jardim Tanzi, São Roque - SP, Brasil'                                           ,-23.525177,           -47.134857,         '2021-04-25 20:01:00.000',50 ),--15,
  					('Thiago'    ,'11-981539703'  ,'R. Cláudio de Souza, 100-166 - Vila Santa Rita, São Roque - SP, 18130-690, Brasil'                     ,-23.530144,           -47.126313,         '2021-04-25 20:10:00.000',103),--1,31*4
  					('Vitor'     ,'11-981539703'  ,'Rua Quirino Aguiar, 82-188 - Vila Aguiar, São Roque - SP, Brasil'                                      ,-23.532598,           -47.128380,         '2021-04-25 20:35:00.000',66 ),--15,33x2
  					('Joana'     ,'11-981539703'  ,'R. São Joaquim, 63 - Centro, São Roque - SP, 18130-220, Brasil'                                        ,-23.533837,           -47.140717,         '2021-04-25 20:37:00.000',61 ),--12,22
  					('Natalia'   ,'11-981539703'  ,'R. Santana, 151 - Vila Marques, São Roque - SP, 18130-555, Brasil'                                     ,-23.536701,           -47.138714,         '2021-04-25 21:05:00.000',125),--5,7,22
  					('Vitoria'   ,'11-981539703'  ,'R. Padre Marçal, 452-524 - Centro, São Roque - SP, 18130-100, Brasil'                                  ,-23.534879,           -47.133910,         '2021-04-25 21:36:00.000',53 ),--1,
  					('Julia'     ,'11-981539703'  ,'Av. São Luíz, 1023 - Jardim Villaca, São Roque - SP, 18135-150, Brasil'                                ,-23.552405,           -47.121602,         '2021-04-25 21:53:00.000',92 ),--6,29*4
  					('Amanda'    ,'11-981539703'  ,'Av. São Roque, 215-159 - Estacao, São Roque - SP, Brasil'                                              ,-23.536309,           -47.139911,         '2021-04-25 22:07:00.000',75 ),--9,32*3
  					('Leticia'   ,'11-981539703'  ,'Tv. Guanabara, 53 - Vila Irene, São Roque - SP, 18132-060, Brasil'                                     ,-23.523682,           -47.139178,         '2021-04-25 22:23:00.000',52 ),--3
  					('Renata'    ,'11-981539703'  ,'R. Rotary Club, 78-230 - Jardim Florida, São Roque - SP, 18133-050, Brasil'                            ,-23.520185,           -47.133804,         '2021-04-25 22:34:00.000',54 ),--9
  					('Adriana'   ,'11-981539703'  ,'Rua Sabatini Alceste, 148-678, São Roque - SP, 18133-340, Brasil'                                      ,-23.513803,           -47.132790,         '2021-04-25 22:39:00.000',55 ),--15,18
  					('Claudinei' ,'11-981539703'  ,'R. José Gômide de Castro, 212 - Jardim Maria Trindade, São Roque - SP, 18133-400, Brasil'              ,-23.517929,           -47.125772,         '2021-04-25 22:48:00.000',66 ),--5,18,19
  					('Paulo'     ,'11-981539703'  ,'R. Pedro Abibe, 23 - Jardim Brasil, São Roque - SP, 18133-110, Brasil'                                 ,-23.516082,           -47.130281,         '2021-04-25 23:03:00.000',66 ),--16
  					('Vinicius'  ,'11-981539703'  ,'R. Ida, 166 - Vila Santo Antonio, São Roque - SP, 18133-290, Brasil'                                   ,-23.515194,           -47.132554,         '2021-04-25 23:15:00.000',120),--15,10
  					('Antonio'   ,'11-981539703'  ,'R. Condor, 96 - Jardim Carambei, São Roque - SP, 18132-240, Brasil'                                    ,-23.521754,           -47.141358,         '2021-04-25 23:18:00.000',268),--1,7x2,8,22,24,28x2
  					('Vicente'   ,'11-981539703'  ,'R. México, 121 - Vila Sao Rafael, São Roque - SP, 18131-453, Brasil'                                   ,-23.532236,           -47.152230,         '2021-04-25 23:36:00.000',60 ),--3,25
			    	('Gerson'    ,'11-954895358'  ,'R. Barão do Rio Branco, 445 - Vila Junqueira, São Roque - SP, 18130-020, Brasil'                       ,-23.538849115392434,  -47.13492874056101, '2021-04-27 19:10:00.000',70 ),--10
			    	('Mariano'   ,'11-954895359'  ,'R. Tomás Antônio Gonzaga, 247 - Paisagem Colonial, São Roque - SP, 18136-700, Brasil'                  ,-23.556905081914525,  -47.14863214641809, '2021-04-27 19:10:00.000',142),--8,14,29*2,27
			    	('Cristiane' ,'11-954895360'  ,'Av. João Pessoa, 378 - Centro, São Roque - SP, 18130-290, Brasil'                                      ,-23.532246785574436,  -47.13871601969004, '2021-04-27 19:15:00.000',76 ),--16,18
			    	('José'      ,'11-954895361'  ,'R. Duque de Caxias, 240 - Centro, São Roque - SP, 18130-150, Brasil'                                   ,-23.53361221845325,   -47.13631343096495, '2021-04-27 20:20:00.000',54 ),--9
			    	('Lucas'     ,'11-954895362'  ,'R. Bento Antônio Pereira, 108 - Jardim Bela Vista, São Roque - SP, 18134-180, Brasil'                  ,-23.522456259856284,  -47.13113375008106, '2021-04-27 21:03:00.000',60 ),--6
                    ('Henrique'  ,'11-991565408'  ,'R. Francisco Tagliassachi, 2-142 - Jardim Rene, São Roque - SP, 18135-030, Brasil'                     ,-23.538927,           -47.129393,         '2021-04-28 19:15:00.000',55 ),--5
                    ('João'      ,'11-991565408'  ,'Rua Cardeal, 57-19, São Roque - SP, Brasil'                                                            ,-23.507192,           -47.147232,         '2021-04-28 19:30:00.000',66 ),--16
                    ('Marcia'    ,'11-991565408'  ,'R. Vale Do Bom Jesus, 261, São Roque - SP, 18132-445, Brasil'                                          ,-23.505245,           -47.137536,         '2021-04-28 20:05:00.000',79 ),--2,28*3
                    ('Roberval'  ,'11-991565408'  ,'R. João Pinto Splendore, 226, São Roque - SP, 18133-300, Brasil'                                       ,-23.513029,           -47.129512,         '2021-04-28 20:35:00.000',110),--11,31*4
                    ('Juliana'   ,'11-991565408'  ,'R. Alfredo Haak, 26-100, São Roque - SP, Brasil'                                                       ,-23.513692,           -47.128504,         '2021-04-28 21:42:00.000',60 ),--3,25
                    ('Flavia'    ,'11-991565408'  ,'R. José Dias Thomaz, 95-27 - Vila Santa Rita, São Roque - SP, Brasil'                                  ,-23.530288,           -47.127442,         '2021-04-28 21:59:00.000',54 ),--9
                    ('Aline'     ,'11-991565408'  ,'Av. Gérson Nastri, 163-197 - Vila Santa Rita, São Roque - SP, 18130-700, Brasil'                       ,-23.530697,           -47.129190,         '2021-04-28 22:23:00.000',138),--1,7,35
                    ('Marcelo'   ,'11-991565408'  ,'R. Manoel Vilaça, 86-152 - Vila Santa Isabel, São Roque - SP, 18136-020, Brasil'                       ,-23.539408,           -47.139357,         '2021-04-28 22:50:00.000',53 ),--1,
					('Odair'     ,'11-954895361'  ,'R. Santa Leocádia, 95 - Jardim Villaca, São Roque - SP, 18135-310, Brasil'                             ,-23.545953342682566,  -47.12087094783783, '2021-04-29 19:30:00.000',74 ),--4,27
			    	('Luiz'      ,'11-954895362'  ,'R. das Papoulas, 568 - Vila Santa Rosalia, São Roque - SP, 18136-185, Brasil'                          ,-23.54702510621119,   -47.13165711611509, '2021-04-29 19:30:00.000',85 ),--5,30*3
			    	('Joel'      ,'11-954895365'  ,'Rua Msr A Morais 52 - Vila Mike, São Roque - SP, 18136-220, Brasil'                                    ,-23.5432211821392,    -47.13324632495642, '2021-04-29 19:42:00.000',82 ),--8,31,22
			    	('Maria'     ,'11-954895365'  ,'R. José Bonifácio de Andrada e Silva, 150 - Jardim Meny, São Roque - SP, 18130-005, Brasil'            ,-23.53514147415779,   -47.13589802384377, '2021-04-29 19:43:00.000',56 ),--13,
			    	('José'      ,'11-954895368'  ,'Av. Antonio Pannellini, 208 - Taboão, São Roque - SP, 18135-131, Brasil'                               ,-23.54373509944832,   -47.1220538020134,  '2021-04-29 19:48:00.000',126),--17,39
			    	('Pedro'     ,'11-954895364'  ,'R. Irineu Silveira, 121 - Vila Junqueira, São Roque - SP, 18136-100, Brasil'                           ,-23.540818469127807,  -47.13398527354001, '2021-04-29 19:49:00.000',53 ),--1,
			    	('alesandro' ,'11-954895371'  ,'R. Santa Augusta, 42 - Jardim Villaca, São Roque - SP, 18135-360, Brasil'                              ,-23.547008816208614,  -47.11882844567299, '2021-04-29 19:59:00.000',55 ),--15,18
			    	('Mauro'     ,'11-954895372'  ,'Av. Antônio Maria Picena, 139 - Vila Junqueira, São Roque - SP, 18136-040, Brasil'                     ,-23.540026673823945,  -47.13616892695426, '2021-04-29 20:13:00.000',54 ),--9,
			    	('Ana'       ,'11-954895373'  ,'R. Ten. Francisco Luís de Campos, 231 - Vila Junqueira, São Roque - SP, 18136-120, Brasil'             ,-23.53865854112339,   -47.133923918008804,'2021-04-29 20:15:00.000',70 ),--7,22
                    ('Osmar'     ,'11-954895374'  ,'Rua Sabatini Alceste, 55, São Roque - SP, 18133-340, Brasil'                                           ,-23.514590173507546,  -47.13417571038008, '2021-04-29 22:59:00.000',54 ),--9
			    	('Thiago'    ,'11-954895375'  ,'R. das Rosas, 110 - Jardim Sao Jose, São Roque - SP, 18133-280, Brasil'                                ,-23.515013817285826,  -47.13141404092311, '2021-04-29 23:10:00.000',92 ),--6,29*4
			    	('Celma'     ,'11-954895376'  ,'R. São José, 205 - Jardim Sao Jose, São Roque - SP, 18133-255, Brasil'                                 ,-23.51485518160395,   -47.13278565555811, '2021-04-29 23:20:00.000',52 ),--3,
			    	('Helio'     ,'11-954895377'  ,'BR-272, 1325 - Taboão, São Roque - SP, 18135-125, Brasil'                                              ,-23.542411573883093,  -47.125645279884345,'2021-04-29 23:40:00.000',50 ),--15,
			    	('Robson'    ,'11-954895378'  ,'R. Minas Gerais, 240 - Vila Irene, São Roque - SP, 18132-080, Brasil'                                  ,-23.524010853023483,  -47.138444781303406,'2021-04-29 23:50:00.000',110),--11,31*4
					('Regina'    ,'11-975635521'  ,'R. Maria Guilhermina Lemos, 175-1 - Vila Junqueira, São Roque - SP, 18136-180, Brasil'  		       ,-23.541219,           -47.132667,         '2021-04-30 19:15:00.000',125),--5,7,22
					('Guilherme' ,'11-987337822'  ,'R. Ten. Francisco Luís de Campos, 170-284 - Vila Junqueira, São Roque - SP, 18136-120, Brasil'         ,-23.538750,           -47.134115,         '2021-04-30 19:27:00.000',70 ),--8,25
					('Samuel'    ,'11-999737290'  ,'R. Primeiro de Maio, 40 - Estacao, São Roque - SP, 18131-025, Brasil'       					       ,-23.534235,           -47.141057,         '2021-04-30 19:59:00.000',123),--13,15,22,28
					('Lara'      ,'11-975377282'  ,'R. Goiás, 151-1 - Vila Irene, São Roque - SP, 18132-070, Brasil'      							       ,-23.523077,           -47.138289,         '2021-04-30 20:05:00.000',192),--3,6,7,22x2
					('Murilo'    ,'11-982672827'  ,'R. Leão XIII, 155-35 - Jardim Tanzi, São Roque - SP'       										       ,-23.524887,           -47.134738,         '2021-04-30 20:07:00.000',138),--1,7,35
					('Mariana'   ,'11-972838287'  ,'R. Bento Antônio Pereira, 157-1 - Jardim Bela Vista, São Roque - SP, 18134-180, Brasil'      	       ,-23.522280,           -47.131112,         '2021-04-30 20:25:00.000',121),--2,14
					('Beatriz'   ,'11-973728822'  ,'R. Francisco da Silva Pontes, 139 - Jardim Florida, São Roque - SP, 18133-040, Brasil'       	       ,-23.520116,           -47.132904,         '2021-04-30 20:29:00.000',167),--16,17,22,26
					('Isaque'    ,'11-963737826'  ,'R. Chad Kaid, 176 - Jardim Sao Jose, São Roque - SP, 18133-250, Brasil'      					       ,-23.515384,           -47.130244,         '2021-04-30 20:36:00.000',134),--5,10,23
					('Anthony'   ,'11-997362682'  ,'Av. Campo Limpo, 89-1 - Vila Nova Sao Roque, São Roque - SP, 18131-320, Brasil'       			       ,-23.525430,           -47.151320,         '2021-04-30 20:42:00.000',60 ),--6
					('Elisa'     ,'11-972384848'  ,'R. João Pinto Splendore, 150, São Roque - SP, 18133-300, Brasil'       							       ,-23.513574,           -47.129846,         '2021-04-30 20:48:00.000',52 ),--3
					('Nicolle'   ,'11-972828484'  ,'Av. Gérson Nastri, 163-197 - Vila Santa Rita, São Roque - SP, 18130-700, Brasil'      			       ,-23.530424,           -47.128567,         '2021-04-30 20:49:00.000',61 ),--12,22
                    ('Elaine'    ,'11-994542875'  ,'R. Lívio Tagliassachi, 260 - Jardim Boa Vista, São Roque - SP, 18132-370, Brasil'                      ,-23.5173022,          -47.142984,         '2021-04-30 22:00:00.000',62 ),--14,23
                    ('João'      ,'11-954895354'  ,'R. Paulino Hermílio de Campos, 58 - Centro, São Roque - SP, 18130-385, Brasil'                         ,-23.53009716835891,   -47.13880117982625, '2021-04-30 22:20:00.000',60 ),--3,25
					('Regina'    ,'11-975635521'  ,'R. Maria Guilhermina Lemos, 175-1 - Vila Junqueira, São Roque - SP, 18136-180, Brasil'  		       ,-23.541219,           -47.132667,         '2021-04-30 23:15:00.000',125),--5,7,22
					('Guilherme' ,'11-987337822'  ,'R. Ten. Francisco Luís de Campos, 170-284 - Vila Junqueira, São Roque - SP, 18136-120, Brasil'         ,-23.538750,           -47.134115,         '2021-04-30 23:27:00.000',70 ),--8,25
					('Samuel'    ,'11-999737290'  ,'R. Primeiro de Maio, 40 - Estacao, São Roque - SP, 18131-025, Brasil'       					       ,-23.534235,           -47.141057,         '2021-04-30 23:53:00.000',123),--13,15,22,28
					('Lara'      ,'11-975377282'  ,'R. Goiás, 151-1 - Vila Irene, São Roque - SP, 18132-070, Brasil'      							       ,-23.523077,           -47.138289,         '2021-04-30 23:59:00.000',192) --3,6,7,22x2

Go

Select * from Pedidos
Go



Insert Into PedidoProduto (CodPedido, CodProduto, Quantidade, ValorUnitario, ValorTotal)
					Values  (  1 ,11  ,1  ,53  ,53),
                            (  1 ,40  ,1  ,45  ,45),
                            (  2 , 3  ,1  ,52  ,52),
                            (  2 , 6  ,1  ,60  ,60),
                            (  2 ,25  ,1  , 8  , 8),
                            (  3 ,11  ,1  ,75  ,75),
                            (  3 ,11  ,1  ,75  ,75),
                            (  4 , 7  ,1  ,60  ,60),
                            (  4 ,28  ,6  , 7  , 7),
                            (  5 , 5  ,1  ,55  ,55),
                            (  6 ,10  ,1  ,70  ,70),
                            (  7 ,16  ,1  ,66  ,66),
                            (  7 ,18  ,1  , 5  , 5),
                            (  8 , 8  ,1  ,62  ,62),
                            (  8 ,14  ,1  ,63  ,63),
                            (  8 ,29  ,2  , 8  , 8),
                            (  8 ,27  ,1  ,11  ,11),
                            (  9 , 9  ,1  ,54  ,54),
                            ( 10 , 3  ,1  ,52  ,52),
                            ( 11 ,15  ,1  ,50  ,50),
                            ( 12 ,15  ,1  ,50  ,50),
                            ( 12 ,22  ,1  ,10  ,10),
                            ( 13 , 2  ,1  ,58  ,58),
                            ( 14 ,15  ,1  ,50  ,50),
                            ( 14 ,22  ,1  ,10  ,10),
                            ( 15 , 8  ,1  ,62  ,62),
                            ( 15 ,25  ,1   ,8  , 8),
                            ( 16 ,15  ,1  ,50  ,50),
                            ( 16 ,32  ,4  , 7  ,28),
                            ( 17 ,12  ,1  ,51  ,51),
                            ( 18 ,15  ,1  ,50  ,50),
                            ( 18 ,26  ,1  ,10  ,10),
                            ( 19 , 2  ,1  ,58  ,58),
                            ( 19 ,22  ,1  ,10  ,10),
                            ( 20 , 4  ,1  ,63  ,63),
                            ( 20 ,27  ,1  ,11  ,11),
                            ( 21 , 5  ,1  ,55  ,55),
                            ( 21 ,30  ,3  ,10  ,30),
                            ( 22 , 8  ,1  ,62  ,65),
                            ( 22 ,31  ,1  ,10  ,10),
                            ( 22 ,22  ,1  ,10  ,10),
                            ( 23 ,13  ,1  ,56  ,56),
                            ( 24 ,17  ,1  ,81  ,81),
                            ( 24 ,39  ,1  ,45  ,45),
                            ( 25 , 1  ,1  ,53  ,53),
                            ( 26 ,15  ,1  ,50  ,50),
                            ( 26 ,18  ,1  , 5  , 5),
                            ( 27 , 9  ,1  ,54  ,54),
                            ( 28 , 7  ,1  ,60  ,60),
                            ( 28 ,22  ,1  ,10  ,10),
                            ( 29 , 1  ,1  ,53  ,53),
                            ( 30 , 7  ,1  ,60  ,60),
                            ( 30 ,27  ,1  ,11  ,11),
                            ( 31 ,15  ,1  ,50  ,50),
                            ( 32 , 5  ,1  ,55  ,55),
                            ( 33 ,11  ,1  ,75  ,75),
                            ( 33 ,39  ,1  ,45  ,45),
                            ( 34 ,13  ,1  ,56  ,56),
                            ( 35 ,11  ,1  ,75  ,75),
                            ( 35 ,35  ,1  ,25  ,25),
                            ( 36 , 9  ,1  ,54  ,54),
                            ( 37 , 6  ,1  ,60  ,60),
                            ( 37 ,29  ,4  , 8  , 8),
                            ( 38 , 3  ,1  ,52  ,52),
                            ( 39 ,15  ,1  ,50  ,50),
                            ( 40 ,11  ,1  ,75  ,75),
                            ( 40 ,31  ,4  ,10  ,40),
                            ( 41 ,15  ,1  ,50  ,50),
                            ( 41 , 7  ,1  ,60  ,60),
                            ( 41 ,22  ,1  ,10  ,10),
                            ( 42 ,16  ,1  ,66  ,66),
                            ( 42 ,36  ,1  ,25  ,25),
                            ( 43 ,12  ,1  ,51  ,51),
                            ( 43 ,13  ,1  ,56  ,56),
                            ( 43 ,27  ,1  ,11  ,11),
                            ( 44 ,14  ,1  ,63  ,63),
                            ( 44 ,23  ,1  , 9  , 9),
                            ( 45 , 9  ,1  ,54  ,54),
                            ( 45 , 3  ,1  ,52  ,52),
                            ( 45 ,15  ,1  ,50  ,50),
                            ( 45 ,22  ,1  ,10  ,10),
                            ( 45 ,31  ,3  ,10  ,30),
                            ( 46 ,17  ,1  ,81  ,81),
                            ( 46 ,35  ,1  ,25  ,25),
                            ( 47 , 6  ,1  ,60  ,60),
                            ( 47 ,15  ,1  ,50  ,50),
                            ( 48 , 7  ,1  ,60  ,60),
                            ( 48 ,26  ,1  ,10  ,10),
                            ( 49 , 4  ,1  ,63  ,63),
                            ( 49 ,23  ,1  , 9  , 9),
                            ( 50 , 1  ,1  ,53  ,53),
                            ( 50 ,14  ,1  ,63  ,63),
                            ( 51 , 5  ,1  ,55  ,55),
                            ( 51 ,15  ,1  ,50  ,50),
                            ( 51 ,33  ,3  , 8  ,24),
                            ( 52 , 5  ,1  ,55  ,55),
                            ( 53 , 5  ,1  ,55  ,55),
                            ( 54 , 7  ,1  ,60  ,60),
                            ( 55 , 9  ,1  ,54  ,54),
                            ( 56 , 9  ,1  ,54  ,54),
                            ( 57 ,14  ,1  ,63 ,63),
                            ( 57 ,23  ,1  , 9  , 9),
                            ( 58 , 3  ,1  ,52  ,52),
                            ( 58 ,25  ,1  , 8  , 8),
                            ( 59 , 5  ,1  ,55  ,55),
                            ( 59 , 7  ,1  ,60  ,60),
                            ( 59 ,22  ,1  ,10  ,10),
                            ( 60 , 8  ,1  ,62  ,62),
                            ( 60 ,25  ,1  , 8  , 8),
                            ( 61 ,13  ,1  ,56  ,56),
                            ( 61 ,15  ,1  ,50  ,50),
                            ( 61 ,22  ,1  ,10  ,10),
                            ( 61 ,28  ,1  , 7 , 7),
                            ( 62 , 3  ,1  ,52  ,52),
                            ( 62 , 6  ,1  ,60  ,60),
                            ( 62 , 7  ,1  ,60  ,60),
                            ( 62 ,22  ,2  ,10  ,10),
                            ( 63 , 1  ,1  ,53  ,53),
                            ( 63 , 7  ,1  ,60  ,60),
                            ( 63 ,35  ,1  ,25  ,25),
                            ( 64 , 2  ,1  ,58  , 5),
                            ( 64 ,14  ,1  ,63  ,63),
                            ( 65 ,16  ,1  ,66  ,66),
                            ( 65 ,17  ,1  ,81  ,81),
                            ( 65 ,22  ,1  ,10  ,10),
                            ( 65 ,26  ,1  ,10  ,10),
                            ( 66 , 5  ,1  ,55  ,55),
                            ( 66 ,10  ,1  ,70  ,70),
                            ( 66 ,23  ,1  , 9  , 9),
                            ( 67 , 6  ,1  ,60  ,60),
                            ( 68 , 3  ,1  ,52  ,52),
                            ( 69 ,12  ,1  ,51  ,51),
                            ( 69 ,22  ,1  ,10  ,10),
                            ( 70 , 2  ,1  ,58  , 5),
                            ( 70 , 5  ,1  ,55  ,55),
                            ( 70 , 7  ,1  ,60  ,60),
                            ( 70 ,13  ,1  ,56  ,56),
                            ( 70 ,22  ,1  ,10  ,10),
                            ( 70 ,24  ,1  , 9  , 9),
                            ( 70 ,25  ,1  , 8  , 8),
                            ( 71 ,15  ,1  ,50  ,50),
                            ( 72 ,13  ,1  ,56  ,56),
                            ( 72 ,26  ,1  ,10  ,10),
                            ( 73 , 5  ,1  ,55  ,55),
                            ( 73 ,28  ,4  , 7  , 7),
                            ( 74 , 7  ,1  ,60  ,60),
                            ( 74 ,31  ,2  ,10  ,20),
                            ( 75 ,11  ,1  ,75  ,75),
                            ( 75 ,28  ,2  , 7  , 7),
                            ( 76 ,16  ,1  ,66  ,66),
                            ( 76 ,27  ,1  ,11  ,11),
                            ( 77 ,10  ,1  ,70  ,70),
                            ( 77 ,25  ,1  ,8   ,8),
                            ( 78 ,15  ,1  ,50  ,50),
                            ( 78 ,28  ,2  , 7  , 7),
                            ( 78 ,29  ,2  , 8  , 8),
                            ( 79 ,17  ,1  ,81  ,81),
                            ( 79 ,40  ,1  ,45  ,45),
                            ( 80 , 3  ,1  ,52  ,52),
                            ( 80 ,25  ,1  , 8  , 8),
                            ( 81 ,13  ,1  ,56  ,56),
                            ( 82 , 8  ,1  ,62  ,62),
                            ( 83 ,10  ,1  ,70  ,70),
                            ( 84 , 9  ,1  ,54  ,54),
                            ( 84 ,34  ,2  , 9  ,18),
                            ( 85 , 1  ,1  ,53  ,53),
                            ( 85 ,35  ,1  ,25  ,25),
                            ( 86 , 8  ,1  ,62  ,62),
                            ( 86 ,16  ,1  ,66  ,66),
                            ( 86 ,29  ,2  , 8  , 8),
                            ( 86 ,32  ,2  , 7  ,14),
                            ( 87 , 5  ,1  ,55  ,55),
                            ( 87 ,28  ,5  , 7  , 7),
                            ( 88 ,15  ,1  ,50  ,50),
                            ( 88 ,22  ,1  ,10  ,10),
                            ( 89 ,11  ,1  ,75  ,75),
                            ( 89 ,38  ,1  ,55  ,55),
                            ( 90 ,17  ,1  ,81  ,81),
                            ( 90 ,40  ,1  ,45  ,45),
                            ( 91 , 7  ,1  ,60  ,60),
                            ( 91 , 8  ,1  ,62  ,62),
                            ( 92 ,11  ,1  ,75  ,75),
                            ( 92 ,12  ,1  ,51  ,51),
                            ( 92 ,36  ,1  ,25  ,25),
                            ( 93 ,15  ,1  ,50  ,50),
                            ( 94 ,13  ,1  ,56  ,56),
                            ( 94 ,22  ,1  ,10  ,10),
                            ( 95 , 2  ,1  ,58  ,58),
                            ( 96 , 5  ,1  ,55  ,55),
                            ( 97 ,12  ,1  ,51  ,51),
                            ( 97 ,23  ,1  , 9  , 9),
                            ( 98 ,17  ,1  ,81  ,81),
                            ( 98 ,22  ,1  ,10  ,10),
                            ( 99 ,11  ,1  ,75  ,75),
                            ( 99 ,10  ,1  ,70  ,70),
                            (100 ,15  ,1  ,50  ,50),
                            (101 ,15  ,1  ,50  ,50),
                            (101 ,22  ,1  ,10  ,10),
                            (102 , 7  ,1  ,60 ,60),
                            (102 ,22  ,1  ,10  ,10),
                            (103 , 9  ,1  ,54  ,54),
                            (103 ,32  ,3  , 7  ,21),
                            (104 ,14  ,1  ,63  ,63),
                            (105 , 8  ,1  ,62  ,62),
                            (106 , 6  ,1  ,60  ,60),
                            (107 ,10  ,1  ,70  ,70),
                            (107 ,26  ,1  ,10  ,10),
                            (108 ,15  ,1  ,50  ,50),  
                            (109 , 2  ,1  ,58  ,58),
                            (109 ,28  ,3  , 7  , 7),
                            (110 , 3  ,1  ,52  ,52),
                            (111 , 8  ,1  ,62  ,62),
                            (111 ,14  ,1  ,63  ,63),
                            (111 ,29  ,2  , 8  , 8),
                            (111 ,27  ,1  ,11  ,11),
                            (112 ,14  ,1  ,63  ,63),
                            (113 ,15  ,1  ,50  ,50),
                            (113 ,22  ,1  ,10  ,10),
                            (114 , 9  ,1  ,54  ,54),
                            (115 ,16  ,1  ,66  ,66),
                            (115 ,22  ,1  ,10  ,10),
                            (116 , 3  ,1  ,52  ,52),
                            (117 ,13  ,1  ,56  ,56),
                            (117 ,18  ,1  , 5  , 5),
                            (117 ,19  ,1  , 6  , 6),
                            (118 ,16  ,1  ,66  ,66),
                            (119 , 2  ,1  ,58  ,58),
                            (120 ,13  ,1  ,56  ,56),
                            (121 ,13  ,1  ,56  ,56),
                            (121 ,29  ,2  , 8  , 8),
                            (122  , 7  ,1 ,60  ,60),
                            (122 ,22  ,1  ,10  ,10),
                            (123 , 1  ,1  ,53  ,53),
                            (124 ,15  ,2  ,50  ,50),
                            (124 , 7  ,1  ,60  ,60),
                            (124 ,13  ,1  ,56  ,56),
                            (124 ,22  ,2  ,10  ,10),
                            (125 ,15  ,1  ,50  ,50),
                            (126 , 5  ,1  ,55  ,55),
                            (126 ,30  ,3  ,10  ,30),
                            (127 , 8  ,1  ,62  ,62),
                            (127 ,31  ,1  ,10  ,10),
                            (127 ,22  ,1  ,10  ,10),
                            (128 ,13  ,1  ,56  ,56),
                            (129 ,13  ,1  ,56  ,56),
                            (130 , 6  ,1  ,60  ,60),
                            (131 ,12  ,1  ,51  ,51),
                            (131 , 1  ,1  ,53  ,53),
                            (131 ,23  ,1  , 9  , 9),
                            (132 , 9  ,1  ,54  ,54),
                            (133 ,15  ,1  ,50  ,50),
                            (134 ,15  ,1  ,50  ,50),
                            (134 ,33  ,2  , 8  ,15),
                            (135 , 7  ,1  ,60  ,60),
                            (136 , 2  ,1  ,58  ,58),
                            (136 ,29  ,2  , 8 , 8),
                            (137 , 1  ,1  ,53  ,53),
                            (137 , 9  ,1  ,54  ,54),
                            (137 ,27  ,1  ,11  ,11),
                            (138 , 3  ,1  ,52  ,52),
                            (138 ,25  ,1  , 8  , 8),
                            (139 ,13  ,1  ,56  ,56),
                            (139 ,26  ,1  ,10  ,10),
                            (140 ,13  ,1  ,56  ,56),
                            (140 ,18  ,1  , 5  , 5),
                            (140 ,19  ,1  , 6  , 6),
                            (141 ,11  ,1  ,75  ,75),
                            (141 ,12  ,1  ,51  ,51),
                            (141 ,35  ,1  ,25  ,25),
                            (141 ,36  ,1  ,25  ,25),
                            (142 , 5  ,1  ,55  ,55),
                            (142 ,18  ,1  , 5  , 5),
                            (142 ,19  ,1  , 6  , 6),
                            (143 , 1  ,1  ,53  ,53),
                            (143 , 2  ,1  ,58  ,58),
                            (143 , 5  ,1  ,55  ,55),
                            (143 ,27  ,1  ,11 ,11),
                            (143 ,36  ,1  ,25  ,25),
                            (144  ,7  ,1  ,60  ,60),
                            (144 ,29  ,2  , 8  , 8),
                            (145 , 8  ,1  ,62  ,62),
                            (145 , 9  ,1  ,54  ,54),
                            (145 ,39  ,1  ,45  ,45),
                            (146 , 1  ,1  ,53  ,53),
                            (146 , 7  ,2  ,60  ,60),
                            (146 , 8  ,1  ,62  ,62),
                            (146 ,22  ,1  ,10  ,10),
                            (146 ,24  ,1  , 9  , 9),
                            (146 ,28  ,2  , 7  , 7),
                            (147 , 7  ,1  ,60  ,60),
                            (148 ,12  ,1  ,51  ,51),
                            (148 ,13  ,1  ,56  ,56),
                            (148 ,27  ,1  ,11  ,11),
                            (149 ,11  ,1  ,75  ,75),
                            (150 , 6  ,1  ,60  ,60),
                            (150 ,36  ,1  ,25  ,25),
                            (151 , 7  ,1  ,60  ,60),
                            (152 ,15  ,1  ,50  ,50),
                            (153 ,16  ,1  ,66  ,66),
                            (154 , 7  ,1  ,60  ,60),
                            (155 , 2  ,1  ,58  ,58),
                            (155 ,19  ,1  , 6  , 6),
                            (156 ,15  ,1  ,50  ,50),
                            (156 ,25  ,1  , 8  , 8),
                            (157 , 1  ,1  ,53  ,53),
                            (157 , 4  ,1  ,63  ,63),
                            (157 ,26  ,1  ,10  ,10),
                            (158 , 5  ,1  ,55  ,55),
                            (158 ,28  ,5  , 7  , 7),
                            (159 , 5  ,1  ,55  ,55),
                            (159 ,12  ,1  ,51  ,51),
                            (159 ,28  ,5  , 7  , 7),
                            (160 ,14  ,1  ,63  ,63),
                            (160 ,18  ,1  , 5  , 5),
                            (161 ,16  ,1  ,66  ,66),
                            (161 ,35  ,1  ,25  ,25),
                            (162 , 1  ,1  ,53  ,53),
                            (162 ,26  ,1  ,10  ,10),
                            (163 ,15  ,1  ,50  ,50),
                            (163 ,29  ,2  , 8 , 8),
                            (164 , 2  ,1  ,58  ,58),
                            (164 , 7  ,1  ,60  ,60),
                            (164 ,23  ,1  , 9  , 9),
                            (165 , 7  ,1  ,60 ,60),
                            (165 ,22  ,1  ,10  ,10),
                            (166 ,13  ,1  ,56  ,56),
                            (166 ,24  ,1  , 9  , 9),
                            (167 ,16  ,1  ,66  ,66),
                            (167 ,33  ,4  , 8  ,32),
                            (168 ,17  ,1  ,81  ,81),
                            (168 ,39  ,1  ,45  ,45),
                            (169 ,10  ,1  ,70 ,70),
                            (169 ,26  ,1  ,10  ,10),
                            (170 ,15  ,1  ,50  ,50),
                            (171 ,14  ,1  ,63  ,63),
                            (172 , 5  ,1  ,55  ,55),
                            (172 ,30  ,5  ,10  ,50),
                            (173 , 6  ,1  ,60  ,60),
                            (174 , 1  ,1  ,53  ,53),
                            (175 , 7  ,1  ,60  ,60),
                            (176 , 7  ,1  ,60  ,60),
                            (176 ,26  ,1  ,10  ,10),
                            (177 , 9  ,1  ,54  ,54),
                            (178 ,12  ,1  ,51  ,51),
                            (178 ,27  ,1  ,11  ,11),
                            (179 ,14  ,1  ,63  ,63),
                            (179 ,27  ,1  ,11  ,11),
                            (180 ,15  ,1  ,50  ,50),
                            (180 ,26  ,1  ,10  ,10),
                            (181 , 4  ,1  ,63  ,63),
                            (181 ,27  ,1  ,11  ,11),
                            (182 , 8  ,1  ,62  ,62),
                            (182 ,29  ,3  , 8  , 8),
                            (183 ,15  ,1  ,50  ,50),
                            (183 ,10  ,1  ,70  ,70),
                            (184 , 5  ,1  ,55  ,55),
                            (185 ,15  ,1  ,50  ,50),
                            (185 ,26  ,1  ,10  ,10),
                            (186 ,12  ,1  ,51  ,51),
                            (187 ,13  ,1  ,56  ,56),
                            (187 ,28  ,4  , 7 , 7),
                            (188 , 2  ,1  ,58  ,58),
                            (188 ,27  ,1  ,11  ,11),
                            (189 , 6  ,1  ,60  ,60),
                            (189 ,26  ,1  ,10  ,10),
                            (190 ,12  ,1  ,51  ,51),
                            (190 ,11  ,1  ,75  ,75),
                            (191 , 5  ,1  ,55  ,55),
                            (192 ,10  ,1  ,70  ,70),
                            (192 ,27  ,1  ,11  ,11),
                            (193 , 2  ,1  ,58  ,58),
                            (193 ,28  ,3  , 7  , 7),
                            (194 ,15  ,1  ,50  ,50),
                            (195 ,17  ,1  ,81  ,81),
                            (195 ,38  ,1  ,55  ,55),
                            (196 ,15  ,1  ,50  ,50),
                            (196 ,31  ,3  ,10  ,30),
                            (197 , 6  ,1  ,60  ,60),
                            (197 ,15  ,1  ,50  ,50),
                            (198 , 7  ,1  ,60  ,60),
                            (198 ,26  ,1  ,10  ,10),
                            (199 , 4  ,1  ,63  ,63),
                            (199 ,23  ,1  , 9  , 9),
                            (200 ,11  ,1  ,75  ,75),
                            (200 , 7  ,1  ,60  ,60),
                            (200 ,23  ,1  , 9  , 9),
                            (201 , 1  ,1  ,53  ,53),
                            (201 , 7  ,1  ,60  ,60),
                            (201 ,35  ,1  ,25  ,25),
                            (202 ,11  ,1  ,75 ,75),
                            (202 ,38  ,1  ,55  ,55),
                            (203 ,5   ,1  ,55  ,55),
                            (204 ,11  ,1  ,75  ,75),
                            (204 ,38  ,1  ,55  ,55),
                            (205 ,16  ,1  ,66  ,66),
                            (206 ,15  ,1  ,50  ,50),
                            (206 ,33  ,2  , 8  ,16),
                            (207 ,14  ,1  ,63  ,63),
                            (207 ,27  ,1  ,11  ,11),
                            (208 , 7  ,1  ,60  ,60),
                            (208 ,26  ,1  ,10  ,10),
                            (209 ,13  ,1  ,56  ,56),
                            (209 ,24  ,1  , 9  , 9),
                            (210 , 2  ,1  ,58  ,58),
                            (210 ,28  ,3  , 7  , 7),
                            (211 ,10  ,1  ,70  ,70),
                            (211 ,26  ,1  ,10  ,10),
                            (212 ,13  ,1  ,56  ,56),
                            (212 ,28  ,4  , 7  , 7),
                            (213 , 7  ,1  ,60  ,60),
                            (213 ,26  ,1  ,10  ,10),
                            (214 , 6  ,1  ,60  ,60),
                            (214 ,36  ,1  ,25  ,25),
                            (215 ,12  ,1  ,51  ,51),
                            (216 , 8  ,1  ,62  ,62),
                            (217 ,14  ,1  ,63  ,63),
                            (218 , 6  ,1  ,60  ,60),
                            (218 ,36  ,1  ,25  ,25),
                            (219 ,12  ,1  ,51  ,51),
                            (219 ,14  ,1  ,63  ,63),
                            (220 , 1  ,1  ,53  ,53),
                            (220 ,37  ,1  ,26  ,26),
                            (221 ,15  ,1  ,50  ,50),
                            (222 , 5  ,1  ,55  ,55),
                            (223 ,10  ,1  ,70  ,70),
                            (224 ,10  ,1  ,70  ,70),
                            (224 ,25  ,1  , 8  , 8),
                            (225 ,15  ,1  ,50  ,50),
                            (225 ,28  ,2  , 7  , 7),
                            (225 ,29  ,2  , 8  , 8),
                            (226 ,17  ,1  ,81  ,81),
                            (226 ,40  ,1  ,45  ,45),
                            (227 ,13  ,1  ,56  ,56),
                            (227 ,28  ,4  , 7  , 7),
                            (228 ,14  ,1  ,63  ,63),
                            (229 , 5  ,1  ,55  ,55),
                            (230 ,6   ,1  ,60  ,60),
                            (230 ,15  ,1  ,50  ,50),
                            (231 ,10  ,1  ,70 ,70),
                            (231 ,27  ,1  ,11 ,11),
                            (232  ,6  ,1  ,60  ,60),
                            (232 ,26  ,1  ,10  ,10),
                            (233 ,12  ,1  ,51  ,51),
                            (233 ,26  ,1  ,10  ,10),
                            (234 ,15  ,1  ,50  ,50),
                            (234 ,25  ,1  , 8  , 8),
                            (235 , 5  ,1  ,55  ,55),
                            (235 ,18  ,1  , 5  , 5),
                            (235 ,19  ,1  , 6  , 6),
                            (236 , 5  ,1  ,55  ,55),
                            (236 ,22  ,1  ,10  ,10),
                            (237 ,5   ,1  ,55  ,55),
                            (237 ,27  ,1  ,11  ,11),
                            (238 ,15  ,1  ,50  ,50),
                            (238 ,22  ,1  ,10  ,10),
                            (239 ,8   ,1  ,62  ,62),
                            (239 ,19  ,2  , 6  ,12),
                            (240 , 7  ,1  ,60  ,60),
                            (241 ,11  ,1  ,75  ,75),
                            (241 ,36  ,1  ,25  ,25),
                            (242 , 1  ,1  ,53  ,53),
                            (242 ,31  ,4  ,10  ,40),
                            (243 , 9  ,1  ,54  ,54),
                            (244 ,10  ,1  ,70  ,70),
                            (245 ,12  ,1  ,51  ,51),
                            (245 ,22  ,1  ,10  ,10),
                            (246 ,14  ,1  ,63  ,63),
                            (247 ,17  ,1  ,81  ,81),
                            (247 ,38  ,1  ,55  ,55),
                            (248 ,15  ,1  ,50  ,50),
                            (249 ,15  ,1  ,50  ,50),
                            (250 , 3  ,1  ,52  ,52),
                            (251 , 5  ,1  ,55  ,55),
                            (252 , 7  ,1  ,60  ,60),
                            (253 ,10  ,1  ,70  ,70), 
                            (254 ,12  ,1  ,51  ,51),  
                            (255 ,15  ,1  ,50  ,50),  
                            (256 , 7  ,1  ,60  ,60),
                            (256 ,28  ,6  , 7  , 7),
                            (257 ,11  ,1  ,75  ,75),
                            (257 ,10  ,1  ,70  ,70),
                            (258 , 6  ,1  ,60  ,60),
                            (259 ,15  ,1  ,50  ,50),
                            (259 ,22  ,1  ,10  ,10),
                            (260 ,15  ,1  ,50  ,50),
                            (260 ,32  ,4  , 7  ,28),
                            (261 ,15  ,1  ,50  ,50),
                            (261 ,18  ,1  , 5  , 5),
                            (262 ,17  ,1  ,81  ,81),
                            (262 ,35  ,1  ,25  ,25),
                            (263 ,15  ,1  ,50  ,50),
                            (263 ,18  ,1  , 5  , 5),
                            (264 , 6  ,1  ,60  ,60),
                            (264 ,29  ,4  , 8  , 8),
                            (265 , 3  ,1  ,52  ,52),
                            (266 , 9  ,1  ,54  ,54),
                            (267 , 8  ,1  ,62  ,62),
                            (267 ,16  ,1  ,66  ,66),
                            (267 ,22  ,1  ,10  ,10),
                            (268 ,15  ,1  ,50  ,50),
                            (268 ,22  ,1  ,10  ,10),
                            (269 , 7  ,1  ,60  ,60),
                            (269 ,25  ,1  , 8  , 8),
                            (270 ,15  ,1  ,50  ,50),
                            (270 ,32  ,4  , 7  ,28),
                            (271 ,12  ,1  ,51  ,51),
                            (272 , 5  ,1  ,55  ,55),
                            (272 ,24  ,1  , 9  , 9),
                            (273 ,11  ,1  ,75 ,75),
                            (273 ,12  ,1  ,51  ,51),
                            (273 ,36  ,1  ,25  ,25),
                            (274 ,15  ,1  ,50  ,50),
                            (274 ,28  ,3  , 7 , 7),
                            (275 ,13  ,1  ,56  ,56),
                            (275 ,22  ,1  ,10  ,10),
                            (276 , 2  ,1  ,58  ,58),
                            (277 , 3  ,1  ,52  ,52),
                            (278 ,15  ,1  ,50  ,50),
                            (279 ,11  ,1  ,75  ,75),
                            (279 ,31  ,4  ,10  ,40),
                            (280 ,12  ,1  ,51  ,51),
                            (280 ,22  ,1  ,10  ,10),
                            (281 ,14  ,1  ,63  ,63),
                            (281 ,28  ,2  , 7  , 7),
                            (282 ,15  ,1  ,50  ,50),
                            (282 ,18  ,1  , 5  , 5),
                            (283 ,11  ,1  ,75  ,75),
                            (283 ,12  ,1  ,51  ,51),
                            (283 ,36  ,1  ,25  ,25),
                            (284 ,15  ,1  ,50  ,50),
                            (285 , 1  ,1  ,53  ,53),
                            (285 ,31  ,4  ,10  ,40),
                            (286 ,15  ,1  ,50  ,50),
                            (286 ,33  ,2  , 8  ,16),
                            (287 ,12  ,1  ,51  ,51),
                            (287 ,22  ,1  ,10  ,10),
                            (288 , 5  ,1  ,55  ,55),
                            (288 , 7  ,1  ,60  ,60),
                            (288 ,22  ,1  ,10  ,10),
                            (289 , 1  ,1  ,53  ,53),
                            (290 , 6  ,1  ,60  ,60),
                            (290 ,29  ,4  , 8  , 8),
                            (291 , 9  ,1  ,54  ,54),
                            (291 ,32  ,3  , 7  ,21),
                            (292 , 3  ,1  ,52  ,52),
                            (293 ,9   ,1  ,54  ,54),
                            (294 ,15  ,1  ,50  ,50),
                            (294 ,18  ,1  , 5  , 5),
                            (295 , 5  ,1  ,55  ,55),
                            (295 ,18  ,1  , 5  , 5),
                            (295 ,19  ,1  , 6  , 6),
                            (296 ,16  ,1  ,66  ,66),
                            (297 ,15  ,1  ,50  ,50),
                            (297 ,10  ,1  ,70  ,70),
                            (298 , 1  ,1  ,53  ,53),
                            (298 , 7  ,2  ,60  ,60),
                            (298 , 8  ,1  ,62  ,62),
                            (298 ,22  ,1  ,10  ,10),
                            (298 ,24  ,1  , 9  , 9),
                            (298 ,28  ,2  , 7  , 7),
                            (299 , 3  ,1  ,52  ,52),
                            (299 ,25  ,1  , 8  , 8),
                            (300 ,10  ,1  ,70  ,70),
                            (301 , 8  ,1  ,62  ,62),
                            (301 ,14  ,1  ,63  ,63),
                            (301 ,29  ,2  , 8  , 8),
                            (301 ,27  ,1  ,11  ,11),
                            (302 ,16  ,1  ,66  ,66),
                            (302 ,18  ,1  , 5  , 5),
                            (303 ,9   ,1  ,54  ,54),
                            (304 , 6  ,1   ,60 ,60),
                            (305 , 5  ,1  ,55  ,55),
                            (306 ,16  ,1  ,66  ,66),
                            (307 , 2  ,1  ,58  ,58),
                            (307 ,28  ,3  , 7  , 7),
                            (308 ,11  ,1  ,75  ,75),
                            (308 ,31  ,4  ,10  ,40),
                            (309 ,3   ,1  ,52  ,52),
                            (309 ,25  ,1  , 8  , 8),
                            (310 , 9  ,1  ,54  ,54),
                            (311 ,1   ,1  ,53  ,53),
                            (311 ,7   ,1  ,60  ,60),
                            (311 ,35  ,1  ,25  ,25),
                            (312 , 1  ,1  ,53  ,53),
                            (313 , 4  ,1  ,63  ,63),
                            (313 ,27  ,1  ,11  ,11),
                            (314 , 5  ,1  ,55  ,55),
                            (314 ,30  ,3  ,10  ,30),
                            (315 , 8  ,1  ,62  ,62),
                            (315 ,31  ,1  ,10  ,10),
                            (315 ,22  ,1  ,10  ,10),
                            (316 ,13  ,1  ,56  ,56),
                            (317 ,17  ,1  ,81  ,81),
                            (317 ,39  ,1  ,45  ,45), 
                            (318 , 1  ,1  ,53  ,53),
                            (319 ,15  ,1  ,50  ,50),
                            (319 ,18  ,1  , 5  , 5),
                            (320 , 9  ,1  ,54  ,54),
                            (321 , 7  ,1  ,60  ,60),
                            (321 ,22  ,1  ,10  ,10),
                            (322 , 9  ,1  ,54  ,54),
                            (323 , 6  ,1  ,60  ,60),
                            (323 ,29  ,4  , 8  , 8),
                            (324 , 3  ,1  ,52  ,52),
                            (325 ,15  ,1  ,50  ,50),
                            (326 ,11  ,1  ,75 ,75),
                            (326 ,31  ,4  ,10  ,40),
                            (327 , 5  ,1  ,55  ,55),
                            (327 , 7  ,1  ,60 ,60),
                            (327 ,22  ,1  ,10  ,10),
                            (328 , 8  ,1  ,62  ,62),
                            (328 ,25  ,1  , 8  , 8),
                            (329 ,13  ,1  ,56  ,56),
                            (329 ,15  ,1  ,50  ,50),
                            (329 ,22  ,1  ,10  ,10),
                            (329 ,28  ,1  , 7  , 7),
                            (330 , 3  ,1 ,52   ,52),
                            (330 , 6  ,1  ,60  ,60),
                            (330 , 7  ,1  ,60  ,60),
                            (330 ,22  ,2  ,10  ,10),
                            (331 , 1  ,1  ,53  ,53),
                            (331 , 7  ,1  ,60  ,60),
                            (331 ,35  ,1  ,25  ,25),
                            (332 , 2  ,1  ,58  ,58),
                            (332 ,14  ,1  ,63  ,63),
                            (333 ,16  ,1  ,66  ,66),
                            (333 ,17  ,1  ,81  ,81),
                            (333 ,22  ,1  ,10  ,10),
                            (333 ,26  ,1  ,10  ,10),
                            (334 , 5  ,1  ,55  ,55),
                            (334 ,10  ,1  ,70  ,70),
                            (334 ,23  ,1  , 9  , 9),
                            (335 , 6  ,1  ,60  ,60),
                            (336 , 3  ,1  ,52  ,52),
                            (337 ,12  ,1  ,51  ,51),
                            (337 ,22  ,1  ,10  ,10),
                            (338 ,14  ,1  ,63  ,63),
                            (338 ,23  ,1  , 9  , 9),
                            (339 , 3  ,1  ,52  ,52),
                            (339 ,25  ,1  , 8  , 8),
                            (340 , 5  ,1  ,55  ,55),
                            (340 , 7  ,1  ,60  ,60),
                            (340 ,22  ,1  ,10  ,10),
                            (341 , 8  ,1  ,62  ,62),
                            (341 ,25  ,1  , 8  , 8),
                            (342 ,13  ,1  ,56  ,56),
                            (342 ,15  ,1  ,50  ,50),
                            (342 ,22  ,1  ,10  ,10),
                            (342 ,28  ,1  , 7  , 7),
                            (343 , 3  ,1  ,52  ,52),
                            (343 , 6  ,1  ,60  ,60),
                            (343 , 7  ,1  ,60 ,60),
                            (343 ,22  ,2  ,10  ,10)
Go      
