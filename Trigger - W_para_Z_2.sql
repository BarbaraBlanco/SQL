CREATE TRIGGER W_para_Z_2
   ON  W
   AFTER INSERT
   AS 
BEGIN
If (select max(c) from W) < 15
insert into Z  (a, b) 
values 
(2+(select c from INSERTED), 
 2+(select d from INSERTED))

END
