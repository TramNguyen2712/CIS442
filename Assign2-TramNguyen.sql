/*1.	List supplier number and supplier name for those suppliers that have status of 10 or 20*/
select s#,sname 
from S
where status in (10,20);

/*
S# SNAME
-- -----
S1 Smith
S2 Jones
S4 Clark
*/

/*2.	List part number and part name for those parts that their color is Red and their weight between 14 and 17*/
select p#,pname 
from P
where color = 'Red' and weight BETWEEN 14 and 17;

/**
PA PNAME
-- -----
P4 Screw
**/

/*3.	List part number and part name for those parts that have been shipped in quantity greater than 200*/
select p#,pname 
from P
where p# in (select p# from SP 
                where qty > 200
                group by p#)
/*
P# PNAME
-- -----
P1 Nut  
P2 Bolt 
P3 Screw
P4 Screw
P5 Cam  */

/*4.	List supplier number and supplier name for those suppliers that have supplied red color parts*/
select s#,sname
from s
where s# in (select s# from sp join p on sp.p# = p.p# where p.color = 'Red')

/*
S# SNAME
-- -----
S1 Smith
S2 Jones
S4 Clark*/

/*5.	List supplier number, supplier name, and total quantity of all parts they have supplied*/
select sp.s#, s.sname, sum(sp.qty) as total_quantity
from sp join s on sp.s# = s.s#
group by sp.s#,s.sname
order by sp.s#

/*S# SNAME TOTAL_QUANTITY
-- ----- -----------
S1 Smith        1300
S2 Jones         700
S3 Black         200
S4 Clark         900*/

/*6.	List part number and part name and their total quantity that have been shipped*/
select sp.p#, p.pname, sum(sp.qty) as total_quantity
from p join sp on sp.p# = p.p#
group by sp.p#, p.pname
order by sp.p#

/*
P# PNAME TOTAL_QUANTITY
-- ----- --------------
P1 Nut              600
P2 Bolt            1000
P3 Screw            400
P4 Screw            500
P5 Cam              500
P6 Cog              100*/

/*7.	Give supplier name that supplies the maximum quantity of parts. */
select sname
from s 
where s# in (select s# from sp where qty in ( select MAX(qty) from sp))

/*
SNAME
-----
Smith
Jones
Clark*/

/*8.	Give name of the supplier whose supplies red parts and whose weight is greater than 10*/
select sname
from s
where s# in (select s# from sp join p on sp.p# = p.p# where p.color = 'Red' and p.weight > 10)

/*
SNAME
-----
Smith
Jones
Clark*/

/*9.	Give all part numbers that are from the same city. Make sure the result does not have any duplicate*/
select distinct sp.p#
from sp join s 
on sp.s# = s.s#
where sp.s# in (select distinct a.s# from s a inner join s b on a.s# <> b.s# where a.city = b.city)
order by sp.p#

/*
P#
--
P1
P2
P3
P4
P5
P6
*/

/*10.	Give pair of supplier numbers that are from the same city*/
Select a.s#, b.s#
from s a inner join s b 
on a.s# <> b.s#
where a.city = b.city
and a.s# < b.s#
order by a.s#;

/*
S# S#
-- --
S1 S4
S2 S3*/

/*11.	Give part (number and name) that has the minimum quantity*/
select p#, pname
from p
where p# in (select p# from sp where qty in (select MIN(qty) from sp))

/*
P# PNAME
-- -----
P5 Cam  
P6 Cog 
*/

/*12.	Give names of the suppliers who supplies the most parts and suppliers who supplies least parts*/
column supplier format a8
(select s.s# as supplier, count(sp.p#) as number_of_parts
from s join sp
on s.s# = sp.s#
group by s.s#
having count(sp.p#) = (
select MAX(part)
from (select s# as supplier, count(p#) as part from sp group by s#)))
union
(select s.s# as supplier, count(sp.p#) as number_of_parts
from s join sp
on s.s# = sp.s#
group by s.s#
having count(sp.p#) = (
select MIN(part)
from (select s# as supplier, count(p#) as part 
from sp group by s#)))

/*
SUPPLIER NUMBER_OF_PARTS
-------- ---------------
S1                     6
S3                     1                                                           1
*/

/*13.	Give total quantity of all blue parts*/
select p#, sum(qty)
from sp 
where p# in (select p# from p where color = 'Blue')
group by p#

/*
P#   SUM(QTY)
-- ----------
P3        400
P5        500
*/

/*14.	List supplier number and supplier name that are not supplying any part.*/
select s#, sname
from s 
where s# not in (select s# from sp)

/*
S# SNAME
-- -----
S5 Adams
*/

/*15.	Give top and bottom supplier number based on the quantity they supply. */
(select * 
from sp 
order by qty asc 
fetch next 1 rows only) 
union 
(select * 
from sp 
order by qty desc 
fetch next 1 rows only)

/*
S# P#        QTY
-- -- ----------
S1 P3        400
S1 P5        100
*/

/*16.	Give top 3 parts (number and name) that weigh the least. */
select p#, pname 
from p
order by weight asc
fetch first 3 rows only

/*
P# PNAME
-- -----
P1 Nut  
P5 Cam  
P4 Screw
*/

/*17.	Give part number and part name that are not from London and whose color is not blue*/
select p#, pname
from p 
where city not in ('London') and color not in ('Blue')

/*
P# PNAME
-- -----
P2 Bolt
*/

/*18.	Give name of suppliers that supply a red part*/
select distinct s.sname
from s join sp on s.s# = sp.s#
join p on p.p# = sp.p#
where p.color = 'Red'

/*
SNAME
-----
Clark
Smith
Jones
*/

/*19.	Rank suppliers (supplier number and name) based on the total quantity of parts they supply.*/
column supplier_# format a10
column supplier_name format a13
select supplier_#, supplier_name, total_quantity,
rank() over (order by total_quantity desc) "RANK"
from (select sp.s# as supplier_#, s.sname as supplier_name, sum(sp.qty) as total_quantity
from sp join s on sp.s# = s.s#
group by sp.s#, s.sname)

/*
SUPPLIER_# SUPPLIER_NAME TOTAL_QUANTITY       RANK
---------- ------------- -------------- ----------
S1         Smith                   1300          1
S4         Clark                    900          2
S2         Jones                    700          3
S3         Black                    200          4
*/

/*20.	List supplier number for the top 25% of suppliers in terms of total parts supplied*/
select s#, count(p#) as total_parts
from sp  
group by s# 
order by total_parts desc
fetch first 25 percent rows only

/*
S# TOTAL_PARTS
-- -----------
S1           6
*/
