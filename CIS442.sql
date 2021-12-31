DROP TABLE S;
DROP TABLE P;
DROP TABLE SP;


CREATE TABLE S(
S# VARCHAR(2) NOT NULL,
SNAME VARCHAR(5),
STATUS NUMBER(2),
CITY VARCHAR(6),
CONSTRAINT S_S#_PK PRIMARY KEY (S#));


CREATE TABLE P(
P# VARCHAR(2) NOT NULL,
PNAME VARCHAR(5),
COLOR VARCHAR(5),
WEIGHT FLOAT,
CITY VARCHAR(6),
CONSTRAINT P_P#_PK PRIMARY KEY(P#));


CREATE TABLE SP(
S# VARCHAR(2) NOT NULL,
P# VARCHAR(2) NOT NULL,
QTY NUMBER(3),
CONSTRAINT SP_S#_P#_PK PRIMARY KEY (S#, P#) ,
CONSTRAINT SP_S#_FK FOREIGN KEY (S#) REFERENCES S(S#),
CONSTRAINT SP_P#_FK FOREIGN KEY (P#) REFERENCES P(P#)
);

/*
grant select on S to public;
grant select on P to public;
grant select on SP to public;
*/

insert into s values (	'S1','Smith',20,'London');
insert into s values (	'S2','Jones',10,'Paris');
insert into s values (	'S3','Black',30,'Paris');
insert into s values (	'S4','Clark',20,'London');
insert into s values (	'S5','Adams',30,'Athens');


insert into p values (	'P1','Nut','Red',12,'London');
insert into p values (	'P2','Bolt','Green',17,'Paris');
insert into p values (	'P3','Screw','Blue',17,'Rom');
insert into p values (	'P4','Screw','Red',14,'London');
insert into p values (	'P5','Cam','Blue',12,'Paris');
insert into p values (	'P6','Cog','Red',19,'London');

insert into sp values (	'S1','P1',300);
insert into sp values (	'S1','P2',200);
insert into sp values (	'S1','P3',400);
insert into sp values (	'S1','P4',200);
insert into sp values (	'S1','P5',100);
insert into sp values (	'S1','P6',100);
insert into sp values (	'S2','P1',300);
insert into sp values (	'S2','P2',400);
insert into sp values (	'S3','P2',200);
insert into sp values (	'S4','P2',200);
insert into sp values (	'S4','P4',300);
insert into sp values (	'S4','P5',400);