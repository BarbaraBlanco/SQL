CREATE TRIGGER Venda_atualiza_estoque
ON Venda
AFTER INSERT
AS
BEGIN
update dbo.Produto
set quant_emestoque = quant_emestoque - (select quant from inserted)
END