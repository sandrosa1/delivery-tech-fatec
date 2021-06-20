Use delivery
Go


-------------Allan-------    



------------Carol---------




----------Nestor----------




----------Rafael-------------





---------Sandro----------

--Calculando o tamanho das tabelas--
Exec sp_spaceused [tb_Produto]
Exec sp_spaceused [tb_Pedido]
Exec sp_spaceused [tb_Cliente]
Exec sp_spaceused [tb_Endereco]
Go


-- Listando todos os clientes e seus pedidos  --
Select * From tb_Cliente C Inner Join tb_Pedido P On C.CodigoCliente = P.CodigoClientePedido
Go

--Calculando o valor total de cada pedido--
Select * From tb_Cliente C
Cross Apply (Select SUM(ValorTotalPedido) AS [Valor Total do Pedido] From tb_Pedido P
                        Where C.CodigoCliente = P.CodigoClientePedido) As R
Go

--Buscando o cliente que mais gastou em um pedido no delivery--
Select Top 5 NomeCliente, TelefoneCliente, [Mais Gasta] from tb_Cliente C
Cross Apply (Select SUM(ValorTotalPedido) AS [Mais Gasta] From tb_Pedido P
                        Where C.CodigoCliente = P.CodigoClientePedido) As R
						Order By [Mais Gasta] Desc
Go

--Sera que existe outra Bruna ?---
Select * From tb_Cliente C Inner Join tb_Pedido P On C.CodigoCliente = P.CodigoClientePedido
Where C.NomeCliente = 'Bruna'
Go

--Consultando o Valor do faturamento bruto--
Select SUM(ValorTotalPedido) As [Faturamento] From tb_Pedido
Go

---------------------------------------------------------------------------------------------------------------------------------
--	Verificando os Produtos mais caros do estabelecimento

--Aqui Temos um problema---
Select Top 5 NomeProduto, ValorUnitarioProduto  As [Mais Caros]
From tb_Produto
Order By [Mais Caros] Desc
Go

--Verificando através da clausula WITH TIES--
Select Top 5 WITH TIES NomeProduto, ValorUnitarioProduto  As [Mais Caros]
From tb_Produto
Order By [Mais Caros] Desc
Go

--Verificando os 5 Produtos Mais Caros Atraveis do RANK
Select NomeProduto, ValorUnitarioProduto,[Mais Caros]
From(
	Select NomeProduto, ValorUnitarioProduto, RANK() OVER(ORDER BY ValorUnitarioProduto Desc) As [Mais Caros]
	From tb_Produto
	)Dados
Where
	[Mais Caros] <= 5
Go
---------------------------------------------------------------------------------------------------------------------------------
--Descobrindo qual cliente faz mais pedidos---
Create View V_MelhorCliente3
As
Select NomeCliente, TelefoneCliente, MomentoPedido, ValorTotalPedido, TipoLogradouro, Logradouro, Numero, Bairro
From tb_Cliente  C Inner Join tb_Endereco E On C.CodigoCliente = E.CodigoEndereco
					Inner Join tb_Pedido P On C.CodigoCliente = P.CodigoClientePedido
Go

--Buscando qual telefone foi mais disponibilizado
Select TelefoneCliente, Count(1) ocorrencias From V_MelhorCliente3 Group By TelefoneCliente
Having Count(1)  > 1
Order By 2 Desc
Go

--Atravéis do telefone localizamos o cliente
Select * From V_MelhorCliente3
Where TelefoneCliente = '11-997362682'
Go

--Valor total que o cliente j gastou
Select SUM(ValorTotalPedido) As [Valor Total] From V_MelhorCliente2
Where TelefoneCliente = '11-997362682'
Go

---------------------------------------------------------------------------------------------------------------------------------
--Indentificando os bairros que mais consomem --
Create View V_MelhorRegiaoDeConsumo
As
Select Bairro From tb_Endereco
Go

Select Bairro, Count(1) ocorrencias From V_MelhorRegiaoDeConsumo Group By Bairro
Having Count(1)  > 1
Order By 2 Desc
Go

----------------------------------------------------------------------------------------------------------------------------------
--Criando uma visão com os dados pertinentes para a entrega--
Create View V_EnderecoCliente
As
Select NomeCliente, TelefoneCliente, TipoLogradouro, Logradouro, Numero, Bairro
From tb_Cliente C Inner Join tb_Endereco E On C.CodigoCliente = E.CodigoEndereco
Go

--Temos um  problema--
Select * From V_EnderecoCliente
Where NomeCliente = 'Lindalvo'
Go

Select NomeCliente,  TelefoneCliente, Count(1) ocorrencias From tb_Cliente Group By  NomeCliente, TelefoneCliente
Having Count(1)  > 1
Order By 2 Desc
Go

-- Eliminar duplicidade
