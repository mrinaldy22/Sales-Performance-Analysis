--Tentukan masing-masing primary key pada 4 dataset penjualan
select * from `pbi.Customers`

alter table `pbi.Customers`
add primary key (CustomerID) not enforced 

select * from `pbi.Orders`

alter table `pbi.Orders`
add primary key (OrderID) not enforced 

select * from `pbi.ProductCategory`

alter table `pbi.ProductCategory`
add primary key (CategoryID) not enforced

select * from `pbi.Products`

alter table `pbi.Products`
add primary key (ProdNumber) not enforced

--Tentukan relationship dari ke-4 table
alter table `pbi.Orders`
add foreign key (CustomerID)
references `pbi.Customers` (CustomerID) not enforced

alter table `pbi.Products`
add foreign key (Category)
references `pbi.ProductCategory` (CategoryID) not enforced

alter table `pbi.Orders`
add foreign key (ProdNumber)
references `pbi.Products` (ProdNumber) not enforced

--master table
with table_master as 
(
select 
  o.Date AS order_date,                
  pc.CategoryName AS Category_Name,     
  p.ProdName AS product_name,           
  p.Price AS product_price,             
  o.Quantity AS order_qty,              
  (p.Price * o.Quantity) AS total_sales,
  SPLIT(c.CustomerEmail, '#')[OFFSET(0)] AS cust_email,
  c.CustomerCity AS cust_city
from `pbi.Customers` c
join `pbi.Orders` o on c.CustomerID = o.CustomerID
join `pbi.Products` p on o.ProdNumber = p.ProdNumber
join `pbi.ProductCategory` pc on p.Category = pc.CategoryID
)
select * from table_master
order by 1 asc






