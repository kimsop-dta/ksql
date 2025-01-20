use restraunt;

--creating tables book by michael j

 CREATE TABLE sellers (
 vendorid CHAR(5),
 companyname VARCHAR(30) default 'secret',
 repfname VARCHAR(20) default'Mr. or Mrs',
 replname VARCHAR(20),
 referredby CHAR(5),
 dateadded date,
 primary key(vendorid));

 -- In SQL, we specify a foreign key with the REFERENCES column constraint.

 --REFERENCES <referenced table>[(<referenced column>)

 --subquery

 -- Find the vendor ID of Veggies_R_Us

 select vendorid
 from vendors
 where companyname='Veggies_R_Us';

 -- Find the names of ingredients provided by VGRUS

 select*
 from vendors;
 -- combine the two query

 select iname
 from ingredients
 where vendorid =(
 select vendorid
 from vendors
 where companyname='Veggies_R_Us');

 -- Find the name of all ingredients supplied by Veggies_R_Us or Spring Water Supply

 select iname
 from ingredients
 where vendorid in (
 select vendorid
 from vendors
 where companyname in ('Veggies_R_Us','Spring Water Supply'));

 -- Find the company name of all vendors who provide an ingredient with an inventory of inventory fewer than 50

 select companyname
 from vendors
 where vendorid in
 (select  vendorid
 from ingredients
 where inventory<50);

 --Find the average unit price for all items provided by Find the average unit price for all items provided by Veggies_R_Us
 select vendorid
 from vendors
 where companyname='Veggies_R_Us'

 select vendorid,AVG(unitprice) as avg_unitprice
 from ingredients
 where vendorid in (select vendorid
 from vendors
 where companyname='Veggies_R_Us')
 group by vendorid;

 -- Find the names of all vendors referred to us by Veggies_R_Us
 select companyname
 from vendors
 where referredby=
 (select vendorid
 from vendors
 where companyname='Veggies_R_Us');

 -- Find all of the ingredients with an inventory within 25% of the average inventory of the ingredients

 select iname,inventory
 from ingredients
 where inventory between
 (SELECT AVG(inventory) * 0.75
 FROM ingredients)
 AND
 (SELECT AVG(inventory) * 1.25
 FROM ingredients);

 -- Find the companies who were referred by Veggies_R_Us and provide an ingredient in the milk food group
 select companyname
 from vendors
 where referredby in
 (select vendorid
 from vendors
 where companyname='Veggies_R_Us') and vendorid in
(select vendorid
 from ingredients
 where foodgroup='milk');
 
 -- Find the name and price for all items using an ingredient supplied by Veggies_R_Us

 select*
 from items
 where itemid in
(select itemid
 from madewith
 where ingredientid in
 (select ingredientid
 from ingredients
 where vendorid in
 (select vendorid
 from vendors
 where companyname='Veggies_R_Us')));


 -- Find the names and  inventory valuefor all ingredients with an inventory value greater than the total inventory value of all ingredients provided by Veggies_R_Us
 select iname,(inventory*unitprice) as inventory_value
 from ingredients
 where (inventory*unitprice)>
 (select sum (inventory*unitprice)
 from ingredients
 where vendorid in
 (select vendorid
 from vendors
 where companyname='Veggies_R_Us'))

 --For each store, find the total sales of items made with ingredients supplied by
-- Veggies_R_Us.Ignore meals and only consider stores withat least two such item
 