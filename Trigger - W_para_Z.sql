CREATE TRIGGER W_para_Z
   ON  W
   AFTER INSERT
   AS 
BEGIN
insert into Z  (a, b) 
values 
(2+(select c from INSERTED), 
 2+(select d from INSERTED))

END
