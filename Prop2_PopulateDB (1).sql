/*
drop table client ;
drop table staff ;
drop table viewing ;
drop table property_for_rent ;
drop table registration ;
drop table private_owner ;
drop table lease ;
drop table branch ;
*/



CREATE TABLE branch
(branchno VARCHAR(5)
 ,street VARCHAR(100)
 ,city  VARCHAR(20)
 ,postcode varchar(10)
 ,PRIMARY KEY (branchno) );



CREATE TABLE client
(clientno VARCHAR(5)
 ,fname VARCHAR(8)
 ,lname  VARCHAR(8)
 ,address varchar(35)
 ,tel_no varchar(14)
 ,pref_type char(6)
 ,max_rent int
 ,PRIMARY KEY (clientno) );

create table viewing
( clientno VARCHAR(5)
 ,propertyno varchar(5)
 ,viewdate date
 ,comments varchar(200)
 ,PRIMARY KEY (clientno, propertyno) );

CREATE TABLE private_owner
(ownerno VARCHAR(4)
 ,fname VARCHAR(20)
 ,lname  VARCHAR(20)
 ,address varchar(50)
 ,tel_no varchar(14)
 ,PRIMARY KEY (ownerno) );


create table registration
( clientno VARCHAR(5)
 ,branchno varchar(5)
 ,staffno varchar(5)
 ,datejoined varchar(15)
 ,PRIMARY KEY (clientno, branchno, staffno) );

CREATE TABLE staff
(staffno VARCHAR(5)
 ,fname VARCHAR(15)
 ,lname VARCHAR(15)
 ,position varchar(15)
 ,sex char(1)
 ,dob varchar(15)
 ,salary int
 ,branchno varchar(5)
 ,FOREIGN KEY(branchno) REFERENCES branch(branchno)
 ,PRIMARY KEY (staffno) );





CREATE TABLE property_for_rent
(propertyno VARCHAR(5)
 ,street VARCHAR(15)
 ,city  VARCHAR(10)
 ,postcode varchar(6)
 ,type char(7)
 ,rooms int
 ,rent int 
 ,ownerno varchar(4)
 ,staffno varchar(4)
 ,branchno varchar(5)
 ,FOREIGN KEY(branchno) REFERENCES branch(branchno)
 ,PRIMARY KEY (propertyno) );


create table lease
( lease_no varchar(6) 
,propertyno varchar(4)
,clientno varchar(4)
,rent int
,payment_method char(7)
,deposit int
,paid  char(1)
,rent_start varchar(15)
,rent_finish  varchar(15)
,duratn int) ;





INSERT INTO CLIENT (clientno,fname,lname,address,tel_no,pref_type,max_rent)
VALUES ('CR78','George','Clinton','55 St Louis Dr London JW10FR', '0121-773-3325','House', 500);
INSERT INTO CLIENT VALUES ('CR79','Muhammad','Aslam','10 Queens Rd London KW40FM', '0171-213-2625','House', 700);
INSERT INTO CLIENT VALUES ('CR80','Sean','Hampton','69 Rosco St Burmingham BI21KL', '0565-773-3032','Flat', 300);
INSERT INTO CLIENT VALUES ('CR81','Cyrus','Azarbod','6 Skyline Dr London IN15ZZ', '0181-362-9325','House', 800);
INSERT INTO CLIENT VALUES ('CR82','Leon','Russel','214 Terrible Dr Glasgow GW18PR', '0891-448-5569','Flat', 450);
INSERT INTO CLIENT VALUES ('CR83','Sameul','Sutton','16 Moscut St Preston PC18JK', '0607-524-4532','Flat', 500);
INSERT INTO CLIENT VALUES ('CR84','Lyndi','Clinton','50 Ceasar Bld London JZ10LR', '0171-793-7325','House', 750);
INSERT INTO CLIENT VALUES ('CR85','Kathreen','Joshue','77 Hoffman Dr Manchester MN48NB', '0525-854-4178','House', 900);
INSERT INTO CLIENT VALUES ('CR86','Julia','Roberts','707 Rockford Dr London LK51VD', '0420-568-8544','House', 1500);
INSERT INTO CLIENT VALUES ('CR87','Michael','Jackson','14 Madona Dr Preston DW11FY', '0414-552-6632','House', 1200);
INSERT INTO CLIENT VALUES ('CR88','George','Simpson','25 Charles Dr London YN10BR', '0181-798-7325','Flat', 850);
insert into client values ('CR89','Fredo', 'Satin', '7 Nitro Dr London JK89YE', '0181-507-5151', 'Flat', 550);


/*
DELETE FROM CLIENT WHERE clientno =	 'CR78'	;
DELETE FROM CLIENT WHERE clientno =	 'CR79'	;
DELETE FROM CLIENT WHERE clientno =	 'CR80'	;
DELETE FROM CLIENT WHERE clientno =	 'CR81'	;
DELETE FROM CLIENT WHERE clientno =	 'CR82'	;
DELETE FROM CLIENT WHERE clientno =	 'CR83'	;
DELETE FROM CLIENT WHERE clientno =	 'CR84'	;
DELETE FROM CLIENT WHERE clientno =	 'CR85'	;
DELETE FROM CLIENT WHERE clientno =	 'CR86'	;
DELETE FROM CLIENT WHERE clientno =	 'CR87'	;
DELETE FROM CLIENT WHERE clientno =	 'CR88'	;
DELETE FROM CLIENT WHERE clientno =	 'CR89'	;
*/


INSERT INTO BRANCH (branchno,street,city,postcode)
VALUES ('B008', '12 Paul St', 'Preston', 'PR30JB');
INSERT INTO BRANCH VALUES ('B009', '32 Elizabeth St', 'Burmingham', 'BB17JE');
INSERT INTO BRANCH VALUES ('B010', '24 Koleen Dr', 'Manchester', 'KM41SA');

/*
DELETE FROM BRANCH WHERE BRANCHNO = 'B008';
DELETE FROM BRANCH WHERE BRANCHNO = 'B009';
DELETE FROM BRANCH WHERE BRANCHNO = 'B010';
*/

INSERT INTO STAFF (staffno,fname,lname,position,sex,dob,salary,branchno)
VALUES ('SA5', 'Mark', 'Smith', 'Assistant', 'M', '23-Nov-1974', 10000, 'B008');
INSERT INTO STAFF VALUES ('SA10', 'Brian', 'Sothe', 'Supervisor', 'M', '30-DEC-1964', 17000, 'B008');
INSERT INTO STAFF VALUES ('SL51', 'Maria', 'Brian', 'Assistant', 'F', '15-Oct-1976', 13000, 'B009');
INSERT INTO STAFF VALUES ('SL61', 'Sheela', 'Johnson', 'Manager', 'F', '20-FEB-1969', 33000, 'B009');
INSERT INTO STAFF VALUES ('SA8', 'Jake', 'Austin', 'Assistant', 'M', '03-JAN-1979', 9000, 'B009');
INSERT INTO STAFF VALUES ('SG15', 'Angila', 'Joleen', 'Assistant', 'F', '23-Sep-1976', 12000, 'B010');
INSERT INTO STAFF VALUES ('SG16', 'Fredo   ', 'Satin ', 'Supervisor', 'M', '13-APR-1973', 16000, 'B010');
INSERT INTO STAFF VALUES ('SG17', 'Gyneth', 'Paltrow', 'Assistant', 'F', '07-JAN-1980', 11000, 'B010');




/*
DELETE FROM STAFF WHERE STAFFNO = 'SA5';
DELETE FROM STAFF WHERE STAFFNO = 'SA10';
DELETE FROM STAFF WHERE STAFFNO = 'SL51';
DELETE FROM STAFF WHERE STAFFNO = 'SL61';
DELETE FROM STAFF WHERE STAFFNO = 'SA8';
DELETE FROM STAFF WHERE STAFFNO = 'SG15';
DELETE FROM STAFF WHERE STAFFNO = 'SG16';
DELETE FROM STAFF WHERE STAFFNO = 'SG17';
*/



INSERT INTO PRIVATE_OWNER (ownerno,fname,lname,address,tel_no)
VALUES ('CO51', 'Blair', 'Steven', '2 Style Dr London JZ43KL', '0181-750-2551');
INSERT INTO PRIVATE_OWNER VALUES ('CO63', 'Karen', 'Salem', '14 Janet St Bristol BR43KL', '0121-750-6513');
INSERT INTO PRIVATE_OWNER VALUES ('CO64', 'Teetz', 'Allen', '2 Lookup Dr Manchester GA43', '0131-730-4002');
INSERT INTO PRIVATE_OWNER VALUES('CO65', 'Leon', 'Russel', '15 Cicero St Bristol BR21UT', '0121-631-6262');



/*
DELETE FROM PRIVATE_OWNER WHERE ownerno = 'CO51';
DELETE FROM PRIVATE_OWNER WHERE ownerno = 'CO63';
DELETE FROM PRIVATE_OWNER WHERE ownerno = 'CO64';
DELETE FROM PRIVATE_OWNER WHERE ownerno = 'CO65';
*/


INSERT INTO PROPERTY_FOR_RENT (propertyno,street,city,postcode,type,rooms,rent,ownerno,staffno,branchno)
VALUES ('PG15', '11 Aragon', 'Manchester', 'SA32DC', 'House', 4, 700, 'CO51', 'SG17','B008'); 
INSERT INTO PROPERTY_FOR_RENT VALUES ('PG59', '25 River Dr', 'London', 'YZ32DC', 'House', 8, 1400, 'CO63', 'SA10','B009'); 
INSERT INTO PROPERTY_FOR_RENT VALUES ('PG58', '65 Lori St', 'Burmingham', 'BR22DZ', 'Flat', 3, 500, 'CO63', 'SL51','B010'); 
INSERT INTO PROPERTY_FOR_RENT VALUES ('PG57', '10 Hamilton DR', 'Manchester', 'LO32VC', 'Flat', 5, 700, 'CO64', 'SL61','B008'); 
INSERT INTO PROPERTY_FOR_RENT VALUES ('PG56', '1 Jackson Ht', 'Manchester', 'MA32DC', 'House', 6, 1200, 'CO51', 'SA81','B009'); 
INSERT INTO PROPERTY_FOR_RENT VALUES ('PG71', '23 Lori St', 'Burmingham', 'BR22DZ', 'Flat', 3, 500, 'CO63', 'SL51','B010'); 
-- INSERT INTO PROPERTY_FOR_RENT VALUES ('PG72', '69 Julius St', 'Burmingham', 'BR26DZ', 'Flat', 4, 800, 'CO46','B007', 'SG5'); 
-- INSERT INTO PROPERTY_FOR_RENT VALUES ('PG73', '102 Bernard St', 'Burmingham', 'BR26DX', 'House', 10, 2100, 'CO40','B04', 'SL41'); 
INSERT INTO PROPERTY_FOR_RENT VALUES ('PG74', '304 Michelle St', 'Burmingham', 'BR29ZS', 'House', 3, 600, 'CO51', 'SL51','B010'); 
-- INSERT INTO PROPERTY_FOR_RENT VALUES ('PG75', '98 South Dr', 'London', 'JZ32DC', 'House', 5, 1000, 'CO61', 'SL21','B010'); 
INSERT INTO PROPERTY_FOR_RENT VALUES ('PG76', '7 Dracula St', 'London', 'OP32DC', 'Flat', 3, 400, 'CO64', 'SA8','B008'); 
-- INSERT INTO PROPERTY_FOR_RENT VALUES ('PG77', '25 Harbor Dr', 'Bristol', 'YZ32DC', 'Flat', 2, 350, 'CO93', 'SG16','B009'); 
INSERT INTO PROPERTY_FOR_RENT VALUES ('PG78', '9 Thames Dr', 'London', 'JA32DC', 'House', 4, 700, 'CO64', 'SG17','B010'); 



/*
DELETE FROM PROPERTY_FOR_RENT WHERE propertyno = 'PG15'; 
DELETE FROM PROPERTY_FOR_RENT WHERE propertyno = 'PG59'; 
DELETE FROM PROPERTY_FOR_RENT WHERE propertyno = 'PG58'; 
DELETE FROM PROPERTY_FOR_RENT WHERE propertyno = 'PG57'; 
DELETE FROM PROPERTY_FOR_RENT WHERE propertyno = 'PG56'; 
DELETE FROM PROPERTY_FOR_RENT WHERE propertyno = 'PG71'; 
DELETE FROM PROPERTY_FOR_RENT WHERE propertyno = 'PG72'; 
DELETE FROM PROPERTY_FOR_RENT WHERE propertyno = 'PG73'; 
DELETE FROM PROPERTY_FOR_RENT WHERE propertyno = 'PG74'; 
DELETE FROM PROPERTY_FOR_RENT WHERE propertyno = 'PG75'; 
DELETE FROM PROPERTY_FOR_RENT WHERE propertyno = 'PG76'; 
DELETE FROM PROPERTY_FOR_RENT WHERE propertyno = 'PG77'; 
DELETE FROM PROPERTY_FOR_RENT WHERE propertyno = 'PG78'; 
*/




INSERT INTO LEASE (lease_no,propertyno,clientno,rent,payment_method,deposit,paid,rent_start,rent_finish,duratn)
VALUES ( 10080  ,'PG4'  ,'CR80' , 300  ,'Visa' , 800   ,'Y'  ,'01-JAN-1980'  ,'31-MAR-1985'  , NULL );
INSERT INTO LEASE VALUES ( 10081  ,'PG4'  ,'CR56' , 325  ,'Master' , 850   ,'Y'  ,'01-APR-1985'  ,'30-MAY-1993'  , NULL );
INSERT INTO LEASE VALUES ( 10082  ,'PG4'  ,'CR76' , 350  ,'Cash' , 900   ,'Y'  ,'01-JUL-1995'  ,'31-DEC-2000'  , NULL );
INSERT INTO LEASE VALUES ( 10083  ,'PG4'  ,'CR82' , 350  ,'Cheque' , 700   ,'Y'  ,'15-FEB-01'  ,'30-JAN-03'  , NULL );
INSERT INTO LEASE VALUES ( 10084  ,'PG77'  ,'CR80' , 350  ,'Visa' , 700   ,'Y'  ,'01-APR-1985'  ,'31-DEC-00'  , NULL );
INSERT INTO LEASE VALUES ( 10085  ,'PG77'  ,'CR76' , 350  ,'Master' , 800   ,'Y'  ,'01-JAN-01'  ,'15-FEB-03'  , NULL );
INSERT INTO LEASE VALUES ( 10086  ,'PG36'  ,'CR56' , 375  ,'Cash' , 1000   ,'Y'  ,'01-JUN-1993'  ,'28-FEB-03'  , NULL );
INSERT INTO LEASE VALUES ( 10087  ,'PG76'  ,'CR78' , 400  ,'Cheque' , 800   ,'Y'  ,'02-MAR-1995'  ,'31-OCT-1999'  , NULL );
INSERT INTO LEASE VALUES ( 10088  ,'PG76'  ,'CR83' , 400  ,'Master' , 800   ,'Y'  ,'01-NOV-1999'  ,'30-SEP-02'  , NULL );
INSERT INTO LEASE VALUES ( 10089  ,'PG76'  ,'CR62' , 400  ,'Visa' , 900   ,'Y'  ,'01-OCT-02'  ,'31-JAN-03'  , NULL );
INSERT INTO LEASE VALUES ( 10090  ,'PG16'  ,'CR78' , 400  ,'Cheque' , 800   ,'Y'  ,'01-OCT-1999'  ,'29-SEP-02'  , NULL );
INSERT INTO LEASE VALUES ( 10091  ,'PG58'  ,'CR83' , 500  ,'Cash' , 900   ,'Y'  ,'15-OCT-02'  ,'15-JAN-03'  , NULL );
INSERT INTO LEASE VALUES ( 10092  ,'PG71'  ,'CR62' , 500  ,'Cash' , 900   ,'N'  ,'01-JAN-02'  ,'31-DEC-03'  , NULL );
INSERT INTO LEASE VALUES ( 10093  ,'PG74'  ,'CR79' , 600  ,'Master' , 1200   ,'Y'  ,'01-JAN-1998'  ,'30-SEP-1999'  , NULL );
INSERT INTO LEASE VALUES ( 10094  ,'PG74'  ,'CR74' , 600  ,'Cheque' , 1200   ,'N'  ,'01-OCT-1999'  ,'30-MAR-03'  , NULL );
INSERT INTO LEASE VALUES ( 10095  ,'PG15'  ,'CR84' , 700  ,'Cheque' , 1400   ,'Y'  ,'15-APR-1995'  ,'15-MAR-03'  , NULL );
INSERT INTO LEASE VALUES ( 10096  ,'PG57'  ,'CR81' , 750  ,'Visa' , 1500   ,'Y'  ,'01-JAN-1996'  ,'30-MAY-01'  , NULL );
INSERT INTO LEASE VALUES ( 10097  ,'PG72'  ,'CR81' , 800  ,'Visa' , 1500   ,'Y'  ,'01-JUN-01'  ,'30-JUN-03'  , NULL );
INSERT INTO LEASE VALUES ( 10098  ,'PG75'  ,'CR87' , 1000  ,'Cash' , 2000   ,'Y'  ,'01-APR-1999'  ,'30-OCT-01'  , NULL );
INSERT INTO LEASE VALUES ( 10099  ,'PG75'  ,'CR85' , 1000  ,'Visa' , 2000   ,'Y'  ,'01-NOV-01'  ,'30-MAY-02'  , NULL );
INSERT INTO LEASE VALUES ( 10100  ,'PG56'  ,'CR87' , 1200  ,'Cash' , 2400   ,'N'  ,'01-DEC-01'  ,'28-FEB-03'  , NULL );
INSERT INTO LEASE VALUES ( 10101  ,'PG59'  ,'CR86' , 1400  ,'Visa' , 3000   ,'Y'  ,'01-NOV-1997'  ,'30-NOV-01'  , NULL );
INSERT INTO LEASE VALUES ( 10102  ,'PG73'  ,'CR85' , 2100  ,'Cash' , 4000   ,'N'  ,'01-JUN-02'  ,'30-SEP-02'  , NULL );



/*
DELETE FROM LEASE WHERE LEASE_NO = 10080  ;
DELETE FROM LEASE WHERE LEASE_NO = 10081  ;
DELETE FROM LEASE WHERE LEASE_NO = 10082  ;
DELETE FROM LEASE WHERE LEASE_NO = 10083  ;
DELETE FROM LEASE WHERE LEASE_NO = 10084  ;
DELETE FROM LEASE WHERE LEASE_NO = 10086  ;
DELETE FROM LEASE WHERE LEASE_NO = 10085  ;
DELETE FROM LEASE WHERE LEASE_NO = 10087  ;
DELETE FROM LEASE WHERE LEASE_NO = 10088  ;
DELETE FROM LEASE WHERE LEASE_NO = 10089  ;
DELETE FROM LEASE WHERE LEASE_NO = 10090  ;
DELETE FROM LEASE WHERE LEASE_NO = 10091  ;
DELETE FROM LEASE WHERE LEASE_NO = 10092  ;
DELETE FROM LEASE WHERE LEASE_NO = 10093  ;
DELETE FROM LEASE WHERE LEASE_NO = 10094  ;
DELETE FROM LEASE WHERE LEASE_NO = 10095  ;
DELETE FROM LEASE WHERE LEASE_NO = 10096  ;
DELETE FROM LEASE WHERE LEASE_NO = 10097  ;
DELETE FROM LEASE WHERE LEASE_NO = 10098  ;
DELETE FROM LEASE WHERE LEASE_NO = 10099  ;
DELETE FROM LEASE WHERE LEASE_NO = 10100  ;
DELETE FROM LEASE WHERE LEASE_NO = 10101  ;
DELETE FROM LEASE WHERE LEASE_NO = 10102  ;
*/


INSERT INTO VIEWING (clientno,propertyno,viewdate,comments)
VALUES  ('CR80' ,'PG4' ,'01-DEC-1979' ,'It is good')  ;
INSERT INTO VIEWING VALUES  ('CR56' ,'PG4' ,'01-FEB-1985' ,'We will go for it')  ;
INSERT INTO VIEWING VALUES  ('CR76' ,'PG4' ,'01-JUN-1995' , 'Can you change the color')  ;
INSERT INTO VIEWING VALUES  ('CR82' ,'PG4' ,'15-JAN-01' , 'I like the kitchen the most')  ;
INSERT INTO VIEWING VALUES  ('CR80' ,'PG77' ,'01-JAN-1985' , 'Let us think about it')  ;
INSERT INTO VIEWING VALUES  ('CR76' ,'PG77' ,'01-DEC-00' , 'Wonderful')  ;
INSERT INTO VIEWING VALUES  ('CR56' ,'PG36' ,'01-JUN-1993' , NULL)  ;
INSERT INTO VIEWING VALUES  ('CR78' ,'PG76' ,'02-MAR-1995' , NULL)  ;
INSERT INTO VIEWING VALUES  ('CR83' ,'PG76' ,'01-NOV-1999' , NULL)  ;
INSERT INTO VIEWING VALUES  ('CR62' ,'PG76' ,'01-OCT-02' , NULL)  ;
INSERT INTO VIEWING VALUES  ('CR78' ,'PG16' ,'01-OCT-1999' ,'It is good')  ;
INSERT INTO VIEWING VALUES  ('CR83' ,'PG58' ,'15-OCT-02' , NULL)  ;
INSERT INTO VIEWING VALUES  ('CR62' ,'PG71' ,'01-JAN-02' , 'Wonderful')  ;
INSERT INTO VIEWING VALUES  ('CR79' ,'PG74' ,'01-JAN-1998' , NULL)  ;
INSERT INTO VIEWING VALUES  ('CR74' ,'PG74' ,'01-OCT-1999' , 'Wonderful')  ;
INSERT INTO VIEWING VALUES  ('CR84' ,'PG15' ,'15-APR-1995' ,'It is good')  ;
INSERT INTO VIEWING VALUES  ('CR81' ,'PG57' ,'01-JAN-1996' , NULL)  ;
INSERT INTO VIEWING VALUES  ('CR81' ,'PG72' ,'01-JUN-01' , 'I want to rent it ASAP')  ;
INSERT INTO VIEWING VALUES  ('CR87' ,'PG75' ,'01-APR-1999' , 'I like the kitchen the most')  ;
INSERT INTO VIEWING VALUES  ('CR85' ,'PG75' ,'01-NOV-01' , NULL)  ;
INSERT INTO VIEWING VALUES  ('CR87' ,'PG56' ,'01-DEC-01' , 'I want to rent it ASAP')  ;
INSERT INTO VIEWING VALUES  ('CR86' ,'PG59' ,'01-NOV-1997' , NULL)  ;
INSERT INTO VIEWING VALUES  ('CR85' ,'PG73' ,'01-JUN-02' , 'I like the kitchen the most')  ;



