CREATE TRIGGER Z_para_W 
   ON  Z
   AFTER INSERT
   AS 
BEGIN
insert into W  (c, d) 
values 
(1+(select a from INSERTED), 
1+(select  b from INSERTED))

END

