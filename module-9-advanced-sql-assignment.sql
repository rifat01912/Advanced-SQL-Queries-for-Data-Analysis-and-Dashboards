CREATE SCHEMA module9_sql;
USE module9_sql;

CREATE TABLE Customers (
  Customer_ID SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  Customer_Name VARCHAR(45) NOT NULL,
  City VARCHAR(45) NOT NULL,
  PRIMARY KEY  (Customer_ID)
)ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;


CREATE TABLE Orders (
  Order_ID SMALLINT UNSIGNED NOT NULL AUTO_INCREMENT,
  Customer_ID SMALLINT UNSIGNED NOT NULL,
  Product VARCHAR(45) NOT NULL,
  Quantity VARCHAR(45) NOT NULL,
  Price VARCHAR(45) NOT NULL,
  PRIMARY KEY  (Order_ID)
)ENGINE=InnoDB DEFAULT CHARSET=UTF8MB4;


 -- Step 1

 INSERT INTO Customers VALUES(Default,'Rifat Islam', 'Dhaka');
 INSERT INTO Customers VALUES(Default,'Hridoy Ahmed', 'Khulna');
 INSERT INTO Customers VALUES(Default,'Akib Javed', 'Rajshahi');
 INSERT INTO Customers VALUES(Default,'Mohammad Faizan', 'Dhaka');
 INSERT INTO Customers VALUES(Default,'Hridoy Qaiyum', 'Barishal');
 INSERT INTO Customers VALUES(Default,'Kingkor Roy', 'Sylhet');
 INSERT INTO Customers VALUES(Default,'Mohammad Shakil', 'Chittagong');
 INSERT INTO Customers VALUES(Default,'Mizanur Rahman', 'Rajshahi');
 INSERT INTO Customers VALUES(Default,'Nabila Islam', 'Rangpur');
 INSERT INTO Customers VALUES(Default,'Rony Ahmed', 'Mymensingh');

select * from Customers;

INSERT INTO Orders VALUES(Default, 1, 'Laptop', '1', '1000');
INSERT INTO Orders VALUES(Default, 2, 'Laptop', '2', '1000');
INSERT INTO Orders VALUES(Default, 3, 'Mobile', '1', '100');
INSERT INTO Orders VALUES(Default, 4, 'Mobile', '2', '100');
INSERT INTO Orders VALUES(Default, 5, 'Tablet', '1', '200');
INSERT INTO Orders VALUES(Default, 6, 'Mouse', '5', '50');
INSERT INTO Orders VALUES(Default, 7, 'Mobile', '2', '100');
INSERT INTO Orders VALUES(Default, 8, 'MousePad', '10', '10');
INSERT INTO Orders VALUES(Default, 9, 'Monitor', '1', '600');
INSERT INTO Orders VALUES(Default, 2, 'Keyboard', '1', '80');
INSERT INTO Orders VALUES(Default, 1, 'Mouse', '7', '50');
INSERT INTO Orders VALUES(Default, 3, 'Mobile', '3', '100');
INSERT INTO Orders VALUES(Default, 4, 'Speakers', '1', '250');
INSERT INTO Orders VALUES(Default, 9, 'PC', '1', '1200');
INSERT INTO Orders VALUES(Default, 8, 'Tablet', '3', '200');
INSERT INTO Orders VALUES(Default, 6, 'Mouse', '1', '50');
INSERT INTO Orders VALUES(Default, 7, 'MousePad', '1', '10');
INSERT INTO Orders VALUES(Default, 4, 'Tablet', '1', '200');
INSERT INTO Orders VALUES(Default, 5, 'Speakers', '1', '250');
INSERT INTO Orders VALUES(Default, 3, 'PC', '10', '1200');

Select * from Orders;

-- Step 2
SELECT Customer_Name,
City,
Product,
Quantity,
Price
FROM Customers
INNER JOIN Orders
ON Customers.Customer_ID = Orders.Customer_ID;

-- Step 3
Select 
Customer_Name,
Any_Value(Product) As Products_Ordered,
Any_Value(Order_Id) As Order_ID_Number
from
customers
left join
orders
on customers.customer_id=orders.customer_id;




-- Step 4
SELECT 
Product, 
sum(price * quantity) AS Total_Sales
from Orders
group by Product
ORDER BY total_sales DESC;

-- Step 5
SELECT
Product,
COUNT(Quantity) as Total_Quantity_Sold
from Orders
group by Product;

-- Step 6
-- Note I used Total Sales 10,000 instead of 100,000 as My highest sales value is 13200 so only one
-- result is being shown which is PC and the value is 13200.
SELECT 
Product, 
sum(price * quantity) AS Total_Sales
from Orders
group by Product
Having Total_sales > 10000;

--  Step 7
SELECT 
Customer_Name, 
sum(price * quantity) AS Total_Sales
from Customers
join orders
on customers.customer_ID=orders.customer_ID
group by Customer_Name;



-- Step 8
 Select
 customers.Customer_Name,
 sum(orders.price * orders.quantity) as Total_Sales
 from Customers
 inner join
 Orders
 on customers.customer_id=orders.customer_id
 group by customers.Customer_Name
 having Total_Sales> (select avg(price*quantity) from orders);

-- Step 9
 Select
 customers.Customer_Name,
 ANY_VALUE(orders.product) as Products,
 sum(orders.price * orders.quantity) as Total_Sales
 from Customers
 left join
 Orders
 on customers.customer_id=orders.customer_id
 group by customers.Customer_Name;




