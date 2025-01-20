create database restraunt;
use restraunt;

create table vendors
(vendorid char(5),companyname varchar(20),repfname varchar(20),
replname varchar(20),refferedby char(5));

create table ingredients(ingredientid char(5),iname varchar(30),units char(5),
unitprice decimal(5,2),foodgroup char(15),inventory int,vendorid char(5));

create table items
(itemid char(5),iname varchar(30),price numeric(5,2),dateadded date);

create table madewith
(itemid char(5),ingedrientid char(5),quantity int);

create table meals
(mealid char(5),name char(10));

create table partof
(mealid char(5),itemid char(5),quantity int,discount dec(2,2));

create table ads(slogan char(50));


create table menuitems
(menuid char(5),name varchar(30),price numeric(5,2));

create table stores
(storeid char(5),street varchar(25),city varchar(25),
state char(2),zip char(2),operator varchar(41));

