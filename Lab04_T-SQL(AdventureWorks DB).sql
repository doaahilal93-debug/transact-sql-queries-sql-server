--Display the SalesOrderID, ShipDate of the SalesOrderHeader table (Sales schema) to show 
--SalesOrders that occurred within the period ‘7/28/2002’ and ‘7/29/2014’

select SalesOrderID, ShipDate
from sales.SalesOrderHeader
where ShipDate between '2002-7-28' and '2014-7-29'


--Display only Products(Production schema) with a StandardCost below $110.00 
--(show ProductID, Name only)

select ProductID, Name
from Production.Product
where StandardCost <110
and StandardCost is not null


--Display ProductID, Name if its weight is unknown

select ProductID, Name
from Production.Product
where Weight is null


-- Display all Products with a Silver, Black, or Red Color
select *
from Production.Product
where Color like '%silver%'
or Color like '%black%'
or Color like '%red%'


-- Display any Product with a Name starting with the letter B
select *
from Production.Product
where Name like 'B%'


--Run the following Query...
--write query that displays any Product description with underscore value in its description

UPDATE Production.ProductDescription
SET Description = 'Chromoly steel_High of defects'
WHERE ProductDescriptionID = 3

select *
from Production.ProductDescription
where Description like '%[_]%'


--Calculate sum of TotalDue for each OrderDate in Sales.SalesOrderHeader table for the period 
--between  '7/1/2001' and '7/31/2014'

select sum(TotalDue) TotalDue, OrderDate
from Sales.SalesOrderHeader
where OrderDate between '2001-7-1' and '2014-7-31'
group by OrderDate


-- Display the Employees HireDate (note no repeated values are allowed)

select distinct HireDate
from HumanResources.Employee


-- Calculate the average of the unique ListPrices in the Product table

select avg(distinct ListPrice)
from Production.Product


--Display the Product Name and its ListPrice within the values of 100 and 120 
--the list should have the following format "The [product name] is only! [List price]"
--(the list will be sorted according to its ListPrice value)

select 'The '+ Name + ' is only! ' + cast(ListPrice as varchar(20)) 'Products'
from Production.Product
where ListPrice between 100 and 120
order by ListPrice


--Transfer the rowguid,Name,SalesPersonID,Demographics from Sales.
--Store table in a newly created table named [store_Archive]
--Note: Check your database to see the new table and how many rows in it?
select rowguid, Name, SalesPersonID, Demographics
into store_Archive
from Sales.Store

select count(*) from Sales.Store
select count(*) from store_Archive

--Try the previous query but without transferring the data? 
select rowguid, Name, SalesPersonID, Demographics
into store_Archive_Empty
from Sales.Store
where 1=0

select count(*) from Sales.Store
select count(*) from store_Archive_Empty


--Using union statement, retrieve the today’s date in different styles using the convert 
--or format function.

select convert(varchar(40), getdate(), 101) 'Today Date'
union 
select convert(varchar(40), getdate(), 103) 
union
select convert(varchar(40), getdate(), 107) 
union 
select convert(varchar(40), getdate(), 109) 


select FORMAT(getdate(), 'dd/mm/yyyy')
union
select FORMAT(getdate(), 'dddd/mm/yyyy')
union
select FORMAT(getdate(), 'mmmm/dd/yyyy')
union
select FORMAT(getdate(), 'dd/mm/yy')

