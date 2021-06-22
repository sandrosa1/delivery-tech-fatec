Use delivery
Go


-------------Allan-------    



------------Carol---------
-- Utilizando Funções defindas pelo Usuário (User Defined Functions)
-- Função Multi-Statement para retornar todos os itens de Pedidos feitos por cliente .
CREATE FUNCTION F_RetornaPedidosPorCliente(@CodigoCliente Int)
RETURNS @Resultado Table
		(CodigoProdutoPedido Int,
		Categoria Varchar(50),
		NomeProduto Varchar (50),
		Quantidade INT,
		NomeCliente Varchar(50),
		MomentoPedido DateTime)
AS
BEGIN
 INSERT @Resultado
 SELECT PE.CodigoProdutoPedido, PR.CategoriaProduto, PR.NomeProduto, PE.QuantidadePedido,CL.NomeCliente, CL.MomentoPedido
 FROM tb_Pedido PE INNER JOIN tb_Cliente CL
				 ON PE.CodigoClientePedido = CL.CodigoCliente
				 INNER JOIN tb_Produto PR
				 ON PR.CodigoProduto = PE.CodigoProdutoPedido
 WHERE PE.CodigoClientePedido = @CodigoCliente
 RETURN
END
GO

-- Listando todos os produtos pedidos pelo cliente e a data
SELECT * FROM F_RetornaPedidosPorCliente(111)
GO

-- Mostrando a quantidade total de pedidos realizados até o momento pelo cliente
SELECT SUM(Quantidade) AS 'Quantidade de itens pedidos' FROM F_RetornaPedidosPorCliente(111) 
GO

-- Mostrando a quantidade total de pedidos realizados após determinada data
SELECT SUM(Quantidade) AS 'Quantidade de itens pedidos' FROM F_RetornaPedidosPorCliente(111) 
where MomentoPedido >= CONVERT(DATETIME, '2021-04-01' )
GO

-- Função Multi-Statement para retornar todos itens de Pedidos por Bairro.
CREATE FUNCTION F_RetornaPedidosPorBairro(@Bairro Varchar(30))
RETURNS @Regioes Table
		(CodigoEndereco Int,
		 Bairro Varchar(30),
		 TipoLogradouro Varchar(5),
		 Logradouro Varchar(100),
		 MomentoPedido DateTime,
		 CategoriaProduto Varchar(50),
		 NomeProduto Varchar(50),
		 Quantidade INT)
AS
BEGIN
 INSERT @Regioes
 SELECT EN.CodigoEndereco, EN.Bairro, EN.TipoLogradouro, EN.Logradouro, CL.MomentoPedido, PR.CategoriaProduto, PR.NomeProduto, PE.QuantidadePedido
 FROM tb_Endereco EN INNER JOIN tb_Cliente CL
					 ON EN.CodigoEndereco = CL.CodigoEndereco
					 INNER JOIN tb_Pedido PE
					 ON CL.CodigoCliente = PE.CodigoClientePedido
					 INNER JOIN tb_Produto PR
					 ON PE.CodigoProdutoPedido = PR.CodigoProduto
WHERE EN.Bairro = @Bairro
RETURN
END
GO

-- Mostra os itens pedidos por bairro
SELECT * FROM F_RetornaPedidosPorBairro('Centro')
GO

-- Mostra o número de itens pedidos por bairro
SELECT SUM(Quantidade) AS 'Quantidade de itens pedidos' FROM F_RetornaPedidosPorBairro('Centro')
GO

----------Nestor----------




----------Rafael-------------

-- Verificando os produtos que mais foram pedidos
Select B.NomeProduto, B.TipoProduto, Count(A.CodigoProdutoPedido) as Ocorrencia
			from dbo.tb_Pedido A
					Inner Join dbo.tb_Produto B on  B.CodigoProduto = A.CodigoProdutoPedido
					Group by B.NomeProduto, B.TipoProduto
					Order By [Ocorrencia] Desc

Go

-- Verificando os produtos que foram menos foram pedidos --
Select B.NomeProduto, B.TipoProduto, Count(A.CodigoProdutoPedido) as Ocorrencia
			from dbo.tb_Pedido A
					Inner Join dbo.tb_Produto B on  B.CodigoProduto = A.CodigoProdutoPedido
					Group by B.NomeProduto, B.TipoProduto
					Order By [Ocorrencia] Asc

Go

-- Verificando a Pizza mais pedida --
Select B.NomeProduto, B.TipoProduto, Count(A.CodigoProdutoPedido) as Ocorrencia
			from dbo.tb_Pedido A
					Inner Join dbo.tb_Produto B on  B.CodigoProduto = A.CodigoProdutoPedido
					Where B.TipoProduto = 'Massas'
					Group by B.NomeProduto, B.TipoProduto
					Order By [Ocorrencia] Desc

Go

-- Verificando a Bebida mais Pedida -- 
Select B.NomeProduto, B.TipoProduto, Count(A.CodigoProdutoPedido) as Ocorrencia
			from dbo.tb_Pedido A
					Inner Join dbo.tb_Produto B on  B.CodigoProduto = A.CodigoProdutoPedido
					Where B.TipoProduto = 'Bebidas'
					Group by B.NomeProduto, B.TipoProduto
					Order By [Ocorrencia] Desc

Go

-- Verificando o valor total arrecadado dos Produtos mais pedidos
Select B.CodigoProduto, B.NomeProduto, Count(A.CodigoProdutoPedido) as Ocorrencia,B.ValorUnitarioProduto as 'Valor Unitário', SUM(A.ValorUnitarioPedido) as 'Total Arrecadado'
			from dbo.tb_Pedido A
					Inner Join dbo.tb_Produto B on  B.CodigoProduto = A.CodigoProdutoPedido
					Group by B.NomeProduto, B.TipoProduto, B.CodigoProduto,B.ValorUnitarioProduto
					Order By [Ocorrencia] Desc

Go


-- Total de Venda diária --
Select  DAY(A.MomentoPedido) as Dia, MONTH(A.MomentoPedido) as Mes, Sum(B.ValorTotalPedido) as TotalVendaDia 
			from dbo.tb_Cliente A
					Inner Join dbo.tb_Pedido B on  B.CodigoClientePedido = A.CodigoCliente
					Group by DAY(A.MomentoPedido), MONTH(A.MomentoPedido)
Go


-- Total de Venda Mensal --
Select   MONTH(A.MomentoPedido) as Mes, Sum(B.ValorTotalPedido) as TotalVendaMes
			from dbo.tb_Cliente A
					Inner Join dbo.tb_Pedido B on  B.CodigoClientePedido = A.CodigoCliente
					Group by  MONTH(A.MomentoPedido)
Go





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
Select Top 5 TipoProduto, NomeProduto, ValorUnitarioProduto  As [Mais Caros]
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
Select SUM(ValorTotalPedido) As [Valor Total] From V_MelhorCliente
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
