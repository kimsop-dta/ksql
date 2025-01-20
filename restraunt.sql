#  Find the names of all items

select iname
from items;
# Find the name, item ID, and price of all items

select iname,itemid,price
from items;

#Find the ID and food group of ingredients named Cheese

select ingredientid,foodgroup
from ingredients
where iname='cheese';

# Find the food items added after 1999
select*
from items
where dateadded> 1999;

# Find all items with a name less than or equal to 'garden'

# Find the name of the representative for Don’s Dairy
select repfname,replname
from vendors
where companyname=' Dons Dairy';

#Find the list of vendor representative first names that begin with 'S'
select repfname
from vendors
where repfname like 's%';

#Find the name of all of the food items other than salads
select iname
from items
where not iname like '%salad';

#Findalloftheingredients from the Fruit food group with an inventory greater than 100
select ingredientid,iname
from ingredients
where inventory= 'fruit' and inventory>100;

#Find the name of all ingredients with unit price over $0.40 or with a unit of glass

select iname,unitprice,units
from ingredients
where unitprice>0.40 or units='glass';

# Find the food items that have a name beginning with either F or S that cost less than $3.50
 
 select iname,price
  from items
  where iname like '%f' or iname like '%s' and price<3.50;

# Find the food items costing between $2.50 and $3.5

select iname,price
from items
where price between 2.50 and 3.50;

# Find the food items costing less than $2.50 or more than $3.50
select iname,price
from items
where price not between 2.50 and 3.50;

update vendors
set referredby=NULL
WHERE repfname='candy';

alter table vendors
rename column refferedby to referredby;

SELECT *
 FROM vendors
 where referredby is null;
 
# Find all items with price greater than $0.99
select*
from items
where price>0.99;

#Find all items with price less than or equal to $0.99
select*
from items
where price<=0.99;

#Find all items with no price
select*
from items
where price is null;

# Find the ingredient ID, food group, and inventory for fruits or ingredients with inventory not less than or equal to 2oo
select  ingredientID, foodgroup,inventory 
from ingredients
where foodgroup='fruit'or inventory<=200;

select*
from ingredients;

# Find the value of your pickle inventory if you double your stock of pickles

select ingredientid, inventory*2*unitprice as inventory_value
from ingredients
where iname='pickle';

# Find the inventory value of each ingredient in both dollars and euros

select iname,inventory,unitprice as Dollars,
 ceil(inventory * unitprice * 1.2552) AS euros, 1.2552 AS "Exchange Rate"
 FROM ingredients;
 
 SELECT operator, street || ' ' ||city || ' ' ||state || ' ' || zip
 || ' USA' as mail
 FROM stores;
 
  SELECT concat(SUBSTRING(repfname , 1,1),' ',replname )as Fname
  from vendors;
  
  SELECT iname, POSITION('Salad' IN iname)
 FROM items;
 
 # Find how long each item has been on the menu as of midnight January 2, 20005
 
 select iname,dateadded,date '2005-01-02'-dateadded as menulife
 from items;
 
 #extract example
 select extract(year from dateadded) as year,
 extract(month from dateadded+ interval '30' day) as month
 from items;
 
 # Find the name and inventory value of the ingredients with an inventory value of $10 or more
 
 select iname,inventory*unitprice as inventory_value
 from ingredients
 where inventory*unitprice>=10;
 
  #Find the vendors with the name S. Sauce
  select*
  from (select concat(substring(repfname,1,1),' ',replname) as fullname,companyname) as derivedtable
  
  
  SELECT concat(repfname,' ',replname) AS name,companyname
 FROM vendors
 where  concat(SUBSTRING(repfname FROM 1 FOR 1),' ',replname) =
 'S. Sauce';
 
 # Find all items from least to most expensive
 select iname,price
 from items
 ORDER BY price;
 
 #Find items added in 2001 or later in decreasing order of price
 select itemid,iname,price
 from items
 where extract(year from dateadded)>='2001'
 ORDER BY price;
 
 #Find the name and inventory value of all ingredients ordered by value
 select iname,inventory*unitprice as inventory_value
 from ingredients
 ORDER BY inventory_value ;
 
 select*
 from orders;
 
 #Find the order number, line number, and item ID ordered at #2STR, last order first
 select ordernumber,linenumber,menuitemid
 from orders
 where storeid+'#2STR'
 ORDER BY ordernumber DESC, linenumber ASC;
 
  #Positional ORDER BY example
 SELECT foodgroup, iname, unitprice * inventory AS value
 FROM ingredients
 ORDER BY 1 DESC, 3 DESC;
 