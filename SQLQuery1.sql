
--Select the contact name, customer id, and company name of all Customers in London

select contactname, customerid,	companyName
from Customers

--Select all available columns in the Suppliers tables that have a FAX number.
select* from Suppliers
where fax is not null

--Select a list of customers id’s from the Orders table with required dates between Jan 1, 1997 and Jan 1, 1998 
--and with freight under 100 units.
select customerid, orderdate, freight
from Orders
where RequiredDate BETWEEN '1997-01-01' AND '1998-01-01'
and freight < 100

--Select a list of company names and contact names of all the Owners from the Customer table from Mexico, Sweden and Germany.

select CompanyName, ContactName from customers
where Country = 'Mexico'
	or country = 'Sweden'
	or country  = 'Germany'

select CompanyName, ContactName from customers
where Country IN ('Mexico', 'Sweden', 'Germany')

--Count the number of discontinued products in the Products table.
select* from Products
where Discontinued in (1)
select Count(*) 
from Products
where Discontinued in (1)

--Select a list of category names and descriptions of all categories beginning with 'Co' from the Categories table.

select* from Categories
select* from Categories
where CategoryName Like 'Co%'

--Select all the company names, city, country and postal code from the Suppliers table with the word 'rue' in their address.
--The list should be ordered alphabetically by company name.
SELECT CompanyName, City, Country, PostalCode FROM Suppliers 
SELECT CompanyName, City, Country, PostalCode, Address FROM Suppliers order by companyName ASC;
SELECT CompanyName, City, Country, PostalCode, Address FROM Suppliers 
where address like '%rue%' order by companyName ASC;



--Select the product id and the total quantities ordered for each product id in the Order Details table.
select* from [Order Details]


--Select the customer name and customer address of all customers with orders 
--that shipped using Speedy Express.
select* from Shippers
select* from Customers
select* from Orders
--1st solution
Select Shippers.*, Customers.*, Orders.*
from customers
lEFT JOIN Orders ON ORDERS.Customerid = customers.customerid
lEFT JOIN Shippers on Shippers.ShipperID = Orders.shipvia
where ShipperID = '1'


--2nd solution
Select Shippers.*, Customers.*, Orders.*
from customers
lEFT JOIN Orders ON ORDERS.Customerid = customers.customerid
lEFT JOIN Shippers on Shippers.ShipperID = Orders.shipvia
where shippers.CompanyName = 'Speedy Express'


--Select a list of Suppliers containing company name, contact name, contact title and region description.

select CompanyName, ContactName, region  from suppliers
select* from  Region

--Select all product names from the Products table that are condiments.
select * from Categories
select * from Products
select Categories.*, Products.*
from  Products
LEFT JOIN categories on categories.CategoryID = Products.Categoryid
where CategoryID = 'Condiments'

select Categories.*, Products.*
from  Products
LEFT JOIN categories on categories.CategoryID = Products.Categoryid
where categories.CategoryID = '1'



--Select a list of customer names who have no orders in the Orders table.
select * from [Order Details]
select * from Customers
select* from Orders

 select Customers.*, Orders.*
From Customers	
left join Orders on orders.CustomerID = Customers.CustomerID 
where Orderid is null






--Select a complete list of company names from the Shippers table. 
--Include freight totals rounded to the nearest whole number for each shipper from the Orders table for those shippers with orders.

Select* from Shippers
Select* from Orders


Select shippers.*, orders.*
from Shippers
left join Orders on orders.ShipVia = Shippers.ShipperID

--By using Join
Select   Shippers.CompanyName, Shippers.ShipperID, 
	   SUM(orders.Freight) total_frieght
	from 
	shippers
	join
	orders
	on
	orders.ShipVia = Shippers.ShipperID
	group by
	shippers.ShipperID,
	Shippers.CompanyName

-- simple and using subquery
select Shippers.CompanyName, Shippers.ShipperID, (select SUm(Freight) FROM orders where orders.ShipVia = Shippers.ShipperID) Total_frieght
FROM shippers


--Select all employee first and last names from the Employees table by combining the 2 columns aliased as 'DisplayName'.
--The combined format should be 'LastName, FirstName'.
  Select  concat(LastName, firstname) as displayed_Name ,Employees.*from Employees

  
--Write an SQL query to display the ProductID,  ProductName, UnitPrice from Products table in decreasing order of the UnitPrice

select* from Products
Select productid, ProductName, unitprice from Products order by UnitPrice desc 

--Write an SQL query to display all the distinct CategoryName in Categories table.
Select* from Categories
Select CategoryName from Categories


--Write an SQL query to count the total number of unique OrderId in Order Details table

Select* from Orders
select count(orderid) from Orders


--Write an SQL query to display the OrderID, Employee Full Name (example: Mr. John Doe), Customer Company Name and OrderDate
--in such a way that the Latest Order is displayed at the top.
select * from Customers
Select* from Employees
select* from Orders
select 