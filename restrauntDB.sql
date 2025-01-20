create database restraunt;

use restraunt;

CREATE TABLE items (
  itemid text,
  iname text,
  price numeric(5,2),
  dateadded date
);
INSERT INTO items
VALUES
('CHKSD','Chicken Salad',2.85,'1998-11-13'),
('FRTSD','Fruit Salad',3.45,'2000-05-06'),
('GDNSD','Garden Salad',0.99,'2001-03-02'),
('MILSD','Millennium Salad',NULL,'2002-08-16'),
('SODA','Soda',0.99,'2003-02-06'),
('WATER','Water',0.00,'2002-05-19'),
('FRPLT','Fruit Plate',3.99,'2000-09-02');



CREATE TABLE ingredients (
  ingredientid CHAR(5),
  iname VARCHAR(25),
  unit CHAR(10),
  unitprice numeric(5,2),
  foodgroup VARCHAR(25),
  inventory int,
  vendorid CHAR(5)
);

INSERT INTO ingredients
VALUES
('CHESE','Cheese','scoop',0.03,'Milk',150,'DNDRY'),
('CHIKN','Chicken','strip',0.45,'Meat',120,'DNDRY'),
('CRUTN','Crouton','piece',0.01,'Bread',400,'EDDRS'),
('GRAPE','Grape','piece',0.01,'Fruit',300,'FRTR'),
('LETUS','Lettuce','bowl',0.01,'Vegetable',200,'VGRUS'),
('PICKL','Pickle','slice',0.04,'Vegetable',800,'VGRUS'),
('SCTDR','Secret Dressing','ounce',0.03,'NULL',120,'NULL'),
('TOMTO','Tomato','slice',0.03,'Fruit',15,'VGRUS'),
('WATER','Water','glass',0.06,NULL,NULL,'SPWTR'),
('SODA','Soda','glass',0.69,NULL,5000,'SPWTR'),
('WTRML','Watermelon','piece',0.02,'Fruit',NULL,'FRTR'),
('ORNG','Orange','slice',0.05,'Fruit',10,'FRTR');


update ingredients
set vendorid=null
where ingredientid='SCTDR'

CREATE TABLE vendors(
  vendorid char(5),
  companyname varchar(30),
  repfname varchar(20),
  replname varchar(20),
  referredby char(5)
);

INSERT INTO vendors
VALUES
('VGRUS','Veggies_R_Us','Candy','Corn',null),
('DNDRY','Don''s Dairy','Marla','Milker','VGRUS'),
('FLVCR','Flavorful Creams','Sherman','Sherbert','VGRUS'),
('FRTFR','"Fruit Eating" Friends','Gilbert','Grape','FLVCR'),
('EDDRS','Ed''s Dressings','Sam','Sauce','FRTFR'),
('SPWTR','Spring Water Supply','Gus','Hing','EDDRS');


CREATE TABLE madewith (
  itemid char(5),
  ingredientid char(5),
  quantity int
);

INSERT INTO madewith
VALUES
('CHKSD','CHESE',2),
('CHKSD','CHIKN',4),
('CHKSD','LETUS',1),
('CHKSD','SCTDR',1),
('FRTSD','GRAPE',10),
('FRTSD','WTRML',5),
('GDNSD','LETUS',4),
('GDNSD','TOMTO',8),
('FRPLT','WTRML',10),
('FRPLT','GRAPE',10),
('FRPLT','CHESE',10),
('FRPLT','CRUTN',10);

INSERT INTO madewith
VALUES
('FRPLT','TOMTO',8),
('WATER','WATER',1),
('SODA','SODA',1),
('FRPLT','ORNG',10);


select*
from madewith

create table meals(mealid char(5),iname char(15));

insert into meals
values('CKSDS','Chicken N Suds'),
       ('VGNET','Vegan Eatin');

	   

CREATE TABLE partof (
  mealid char(5),
  itemid char(5),
  quantity integer,
  discount decimal(5,2)
);

INSERT INTO partof
VALUES
('CKSDS','CHKSD',1,0.02),
('CKSDS','SODA',1,0.10),
('VGNET','GDNSD',1,0.03),
('VGNET','FRTSD',1,0.01),
('VGNET','WATER',1,0.00);

select*
from partof;

CREATE TABLE ads (
  slogan varchar(50)
);

INSERT INTO ads
VALUES
('Grazing in style'),
(NULL),
('Bovine friendly and heart smart'),
('Where the grazin''s good'),
('The grass is greener here'),
('Welcome to the "other side"');




CREATE TABLE menuitems (
  menuitemid char(5),
  iname varchar(20),
  price numeric(5,2)
);

INSERT INTO menuitems
VALUES
('CHKSD','Chicken Salad',2.85),
('CKSDS','Chicken N Suds',3.68),
('FRPLT','Fruit Plate',3.99),
('FRTSD','Fruit Salad',3.45),
('GDNSD','Garden Salad',0.99),
('MILSD','Millennium Salad',NULL),
('SODA','Soda',0.99),
('VGNET','Vegan Eatin''',4.38),
('WATER','Water',0.00);



create table orders(
ordernumber int,
linenumber int,
storeid char(5),
menuitemid char(5),
price numeric(5,2),
transaction_time datetime)



INSERT INTO orders
VALUES
(1,1,'FIRST','FRTSD',3.45,'2005-01-26 13:46:04.188'),
(1,2,'FIRST','WATER',0.00,'2005-01-26 13:46:19.188'),
(1,3,'FIRST','WATER',0.00,'2005-01-26 13:46:34.188'),
(2,1,'FIRST','CHKSD',2.85,'2005-01-26 13:47:49.188'),
(3,1,'FIRST','SODA',0.99,'2005-01-26 13:49:04.188'),
(3,2,'FIRST','FRPLT',3.99,'2005-01-26 13:49:19.188'),
(3,3,'FIRST','VGNET',4.38,'2005-01-26 13:49:34.188'),
(1,1,'#2STR','CKSDS',3.68,'2005-01-26 14:02:04.188'),
(1,2,'#2STR','CHKSD',2.85,'2005-01-26 14:02:19.188'),
(1,3,'#2STR','SODA',0.99,'2005-01-26 14:02:34.188'),
(1,4,'#2STR','GDNSD',0.99,'2005-01-26 14:02:49.188'),
(2,1,'#2STR','CHKSD',2.85,'2005-01-26 14:04:04.188'),
(2,2,'#2STR','SODA',0.99,'2005-01-26 14:04:19.188'),
(3,1,'#2STR','CHKSD',2.85,'2005-01-26 14:05:34.188'),
(3,2,'#2STR','FRPLT',3.99,'2005-01-26 14:05:49.188'),
(3,3,'#2STR','GDNSD',0.99,'2005-01-26 14:06:04.188'),
(1,1,'NDSTR','WATER',0.00,'2005-01-26 14:14:04.188'),
(1,2,'NDSTR','FRPLT',3.99,'2005-01-26 14:14:19.188'),
(2,1,'NDSTR','GDNSD',0.99,'2005-01-26 14:15:34.188'),
(3,1,'NDSTR','VGNET',4.38,'2005-01-26 14:16:49.188'),
(3,2,'NDSTR','FRPLT',3.99,'2005-01-26 14:17:04.188'),
(3,3,'NDSTR','FRTSD',3.45,'2005-01-26 14:17:19.188'),
(3,4,'NDSTR','SODA',0.99,'2005-01-26 14:17:34.188'),
(1,1,'CASTR','CHKSD',2.85,'2005-01-26 14:22:04.188'),
(1,2,'CASTR','GDNSD',0.99,'2005-01-26 14:22:19.188'),
(2,1,'CASTR','SODA',0.99,'2005-01-26 14:23:34.188'),
(2,2,'CASTR','FRTSD',3.45,'2005-01-26 14:23:49.188'),
(2,3,'CASTR','SODA',0.99,'2005-01-26 14:24:04.188'),
(2,4,'CASTR','VGNET',4.38,'2005-01-26 14:24:19.188'),
(3,1,'CASTR','VGNET',4.38,'2005-01-26 14:25:34.188'),
(3,2,'CASTR','FRPLT',3.99,'2005-01-26 14:25:49.188'),
(3,3,'CASTR','FRTSD',3.45,'2005-01-26 14:26:04.188'),
(3,4,'CASTR','WATER',0.00,'2005-01-26 14:26:19.188'),
(3,5,'CASTR','CHKSD',2.85,'2005-01-26 14:26:34.188');
  

CREATE TABLE stores(
  storeid char(5),
  address varchar(25),
  city varchar(25),
  state char(2),
  zip char (10),
  manager varchar(41)
);



