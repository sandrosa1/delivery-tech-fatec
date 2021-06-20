Use delivery
Go


-------------Allan-------    



------------Carol---------




----------Nestor----------




----------Rafael-------------





---------Sandro-----------


-- Listando todos os clientes e seus pedidos  --
Select * From tb_Cliente C Inner Join tb_Pedido P On C.CodigoCliente = P.CodigoCliente
Go


--Calculando o valor total de cada pedido--
Select * From tb_Cliente C
Cross Apply (Select SUM(ValorTotal) AS Somatoria From tb_Pedido P
                        Where C.CodigoCliente = P.CodigoCliente) As R
Go

--Consultando o Valor do faturamento bruto do Mes--
Select SUM(ValorTotal) As [Faturamento do Mês] From tb_Pedido
Go


--Calculando o tamanho da tabela de pedido--
Exec sp_spaceused 'tb_Pedido'
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
--Descobrindo nosso melhor cliente---
Create View V_MelhorCliente
As
Select NomeCliente, TelefoneCliente, TipoLogradouro, Logradouro, Numero, Bairro
From tb_Cliente  C Inner Join tb_Endereco E
On C.CodigoCliente = E.CodigoEndereco
Go

Select TelefoneCliente, Count(1) ocorrencias From V_MelhorCliente Group By TelefoneCliente
Having Count(1)  > 1
Order By 2 Desc
Go

Select * From V_MelhorCliente
Where TelefoneCliente = '11-997362682'
order by NomeCliente
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

Select * From V_MelhorCliente
Where TelefoneCliente = '11-997362682'
order by NomeCliente
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

