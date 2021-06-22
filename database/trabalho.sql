Use delivery
Go

SP_HELP tb_Produto
Go
SP_HELP tb_Pedido
Go
SP_HELP tb_Cliente
Go
SP_HELP tb_Endereco
Go



--Calculando o tamanho das tabelas--
Exec sp_spaceused [tb_Produto]
Exec sp_spaceused [tb_Pedido]
Exec sp_spaceused [tb_Cliente]
Exec sp_spaceused [tb_Endereco]
Go








-- Verificando os produtos que mais foram pedidos
Select B.NomeProduto, B.TipoProduto, Count(A.CodigoProdutoPedido) as Ocorrencia
			from dbo.tb_Pedido A
					Inner Join dbo.tb_Produto B on  B.CodigoProduto = A.CodigoProdutoPedido
					Group by B.NomeProduto, B.TipoProduto
					Order By [Ocorrencia] Desc

Go










-- Verificando os produtos que foram menos foram pedidos --
Select B.NomeProduto, B.TipoProduto, Count(A.CodigoProdutoPedido) As Ocorrencia
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
Select B.CodigoProduto, B.NomeProduto, Count(A.CodigoProdutoPedido) as Ocorrencia,B.ValorUnitarioProduto as 'Valor Unitário', Format(SUM(A.ValorUnitarioPedido),'C','pt-br') as 'Total Arrecadado'
			from dbo.tb_Pedido A
					Inner Join dbo.tb_Produto B on  B.CodigoProduto = A.CodigoProdutoPedido
					Group by B.NomeProduto, B.TipoProduto, B.CodigoProduto,B.ValorUnitarioProduto
					Order By [Ocorrencia] Desc

Go









-- Total de Venda diária --
Select  DAY(A.MomentoPedido) as Dia, MONTH(A.MomentoPedido) as Mes, Format(Sum(B.ValorTotalPedido),'C','pt-br') as TotalVendaDia 
			from dbo.tb_Cliente A
					Inner Join dbo.tb_Pedido B on  B.CodigoClientePedido = A.CodigoCliente
					Group by DAY(A.MomentoPedido), MONTH(A.MomentoPedido)
Go












-- Total de Venda Mensal --
Select   MONTH(A.MomentoPedido) as Mes, Format(Sum(B.ValorTotalPedido),'C','pt-br') as TotalVendaMes
			from dbo.tb_Cliente A
					Inner Join dbo.tb_Pedido B on  B.CodigoClientePedido = A.CodigoCliente
					Group by  MONTH(A.MomentoPedido)
Go









--Buscando Todos so Clientes
--Tems um Problema
Select NomeCliente,  TelefoneCliente From tb_Cliente Group By  NomeCliente, TelefoneCliente
Order By NomeCliente
Go

Select NomeCliente,  TelefoneCliente, Count(1) ocorrencias From tb_Cliente Group By  NomeCliente, TelefoneCliente
Having Count(1)  > 1
Order By ocorrencias
Go

-- Eliminar duplicidade
Select Distinct NomeCliente,  TelefoneCliente From tb_Cliente Group By  NomeCliente, TelefoneCliente
Order By NomeCliente
Go







-- Listando todos os clientes e seus pedidos  --
Select * From tb_Cliente C Inner Join tb_Pedido P On C.CodigoCliente = P.CodigoClientePedido
Go









--Calculando o valor total de cada pedido--

Select * From tb_Cliente C
Cross Apply (Select Format( SUM(ValorTotalPedido),'C','pt-br') AS [Valor Total do Pedido] From tb_Pedido P
                        Where C.CodigoCliente = P.CodigoClientePedido) As R
Go













--Buscando os 5 clientes que mais gastou em um pedido no delivery--
Select Top 5 NomeCliente, TelefoneCliente, Format([Mais Gasta],'C','pt-br')  from tb_Cliente C
Cross Apply (Select SUM(ValorTotalPedido) AS [Mais Gasta] From tb_Pedido P
                        Where C.CodigoCliente = P.CodigoClientePedido) As R
						Order By [Mais Gasta] Desc
Go












--Sera que existe outra Bruna ?---
Select * From tb_Cliente C Inner Join tb_Pedido P On C.CodigoCliente = P.CodigoClientePedido
Where C.NomeCliente = 'Bruna'
Go











Select  NomeCliente, TelefoneCliente, [Mais Gasta] from tb_Cliente C
Cross Apply (Select SUM(ValorTotalPedido) AS [Mais Gasta] From tb_Pedido P
                        Where P.CodigoClientePedido = 146 ) As R
						Where C.CodigoCliente = 146
					       
Go









--Calculando o gasto de cada cliente no delivery atraves de uma CTE
;
With TotalPorCliente (NomeCliente, ValorTotalPedido)
As
(
Select  C.NomeCliente, P.ValorTotalPedido From tb_Cliente C
Inner Join tb_Pedido P On C.CodigoCliente = P.CodigoClientePedido
)
Select NomeCliente, Sum(ValorTotalPedido) AS ValorGasto
From TotalPorCliente
Group by NomeCliente 
Order By ValorGasto Desc
Go







--Descobrindo o perfil?---
Select * From tb_Cliente C Inner Join tb_Pedido P On C.CodigoCliente = P.CodigoClientePedido
Where C.NomeCliente = 'Samuel'
Go










--Consultando o Valor do faturamento bruto--
Select Format((SUM(ValorTotalPedido)),'C','pt-br') As [Faturamento] From tb_Pedido
Go









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








--Descobrindo qual cliente faz mais pedidos---
Create View V_MelhorCliente
As
Select NomeCliente, TelefoneCliente, MomentoPedido, ValorTotalPedido, TipoLogradouro, Logradouro, Numero, Bairro
From tb_Cliente  C Inner Join tb_Endereco E On C.CodigoCliente = E.CodigoEndereco
					Inner Join tb_Pedido P On C.CodigoCliente = P.CodigoClientePedido
Go












Select NomeCliente, Dense_RANK() OVER(ORDER BY MomentoPedido Desc) As Ocorrencias
	From V_MelhorCliente
Go











--Buscando qual telefone foi mais disponibilizado
Select TelefoneCliente, Count(1) ocorrencias From V_MelhorCliente Group By TelefoneCliente
Having Count(1)  > 1
Order By 2 Desc
Go









--Atravéis do telefone localizamos o cliente
Select * From V_MelhorCliente
Where TelefoneCliente = '11-999737290' or TelefoneCliente = '11-987337822'
Go










--Valor total que o cliente j gastou
Select SUM(ValorTotalPedido) As [Valor Total] From V_MelhorCliente
Where TelefoneCliente = '11-987337822'
Go









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
Order By 2
Go






-- Eliminar duplicidade
Select Distinct NomeCliente,  TelefoneCliente From tb_Cliente Group By  NomeCliente, TelefoneCliente
Order By NomeCliente
Go






Select Distinct * From V_EnderecoCliente
Where NomeCliente = 'Lindalvo'
Go







-- Utilizando Funções defindas pelo Usuário (User Defined Functions)
-- Função Multi-Statement  para retornar todos os Pedidos feitos por cliente .
CREATE FUNCTION F_RetornaPedidosPorCliente(@CodigoCliente Int)
RETURNS @Resultado Table
		(CodigoProdutoPedido  Int, 
		NomeCliente Varchar(50),
		MomentoPedido DateTime)
AS
BEGIN
 INSERT @Resultado
 SELECT PE.CodigoProdutoPedido, CL.NomeCliente, CL.MomentoPedido
 FROM tb_Pedido PE INNER JOIN tb_Cliente CL
				 ON PE.CodigoClientePedido = CL.CodigoCliente
 WHERE PE.CodigoClientePedido = @CodigoCliente
 RETURN
END
GO

-- Listando todos os produtos pedidos pelo cliente e a data
select * from F_RetornaPedidosPorCliente(3)
Go

-- Mostrando a quantidade total de pedidos realizados até o momento pelo cliente
select count(*) as 'Quantidade de pedidos realizados' from F_RetornaPedidosPorCliente(3) 
Go

-- Função Multi-Statement para retornar todos os Pedidos por Bairro.
CREATE FUNCTION F_RetornaPedidosPorBairro(@Bairro Varchar(30))
RETURNS @Regioes Table
		(CodigoEndereco Int,
		 Bairro Varchar(30),
		 TipoLogradouro Varchar(5),
		 Logradouro Varchar(100),
		 MomentoPedido DateTime)
AS
BEGIN
 INSERT @Regioes
 SELECT EN.CodigoEndereco, EN.Bairro, EN.TipoLogradouro, EN.Logradouro, CL.MomentoPedido
 FROM tb_Endereco EN INNER JOIN tb_Cliente CL
					 ON EN.CodigoEndereco = CL.CodigoEndereco
					 INNER JOIN tb_Pedido PE
					 ON CL.CodigoCliente = PE.CodigoClientePedido
WHERE EN.Bairro = @Bairro
RETURN
END
GO

select * from F_RetornaPedidosPorBairro('Centro')
Go

select count(*) from F_RetornaPedidosPorBairro('Centro')
Go

