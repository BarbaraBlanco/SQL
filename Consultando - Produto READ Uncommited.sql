SET TRANSACTION ISOLATION LEVEL Read UNCommitted;
BEGIN TRANSACTION
select * from produto
commit;