SET TRANSACTION ISOLATION LEVEL Read Committed;
BEGIN TRANSACTION
select * from produto
commit;