
Select * 
FROM
line_item;
#1.0
SELECT *
FROM
line_item;


#1.1
SELECT * 
FROM line_item 
LIMIT 0, 10;

#1.2
SELECT sku, unit_price, date
FROM 
line_item
LIMIT 0, 10;


#2.0
SELECT COUNT(*)
FROM
line_item;

#2.1
SELECT 
COUNT(DISTINCT sku)
FROM
line_item;

#3.0
SELECT sku, 
AVG(unit_price)
FROM
line_item
GROUP BY
sku;

#3.1
SELECT sku, 
AVG(unit_price) AS avg_price
FROM
line_item
GROUP BY sku
ORDER BY avg_price DESC;

SELECT sku,
AVG(unit_price) AS avg_price
FROM line_item
GROUP BY sku
ORDER BY avg_price DESC;

#4
select sku, product_quantity
from line_item
order by product_quantity DESC
limit 100;

#5
SELECT COUNT(*)
FROM
orders;


####6
select
distinct state,
count(*)
from orders
group by state;

#7 Select all the orders placed in January of 2017
select *
from orders
where created_date BETWEEN '2017-01-01' and '2017-01-31';

## How many orders were placed in January of 2017?
#8
select count(*)
from orders
where created_date between '2017-01-01' and '2017-01-31';

#9 How many orders were cancelled on January 4th 2017?

select count(*)
from orders
where  state='Cancelled' and (created_date BETWEEN '2017-01-04 00:00:00' and '2017-01-04 23:59:59');

#10 How many orders have been placed each month of the year?
select month(created_date), count(*)
from orders
group by month(created_date);

#11 What is the total amount paid in all the orders?
select sum(total_paid)
from
orders;

#12What is the average amount paid per order?
select AVG(total_paid)
from
orders;

#12.1 Give a result to the previous question with only 2 decimals
SELECT AVG(total_paid), ROUND(AVG(total_paid), 2) AS RoundedPrice
FROM orders;

#13What is the date of the newest order? And the oldest?
select max(created_date), min(created_date)
from orders;

#13.1 What is the day with the highest amount of completed orders
select max(created_date)
from orders;

#(and how many completed orders were placed that day)? 
select
distinct (max(created_date)),
count(*)
from orders;

select *
from orders; 

#########not sure #What is the day with the highest amount paid 
select date(created_date),
sum(total_paid)
from orders
group by date(created_date)
order by sum(total_paid) desc;

select date(created_date),
max(total_paid)
from orders
group by date(created_date)
order by max(total_paid) desc;





#How many products are there?
SELECT COUNT(*)
FROM
products;

select *
from 
products; 

-- How many brands?
select
distinct brand,
count(*)
from products
group by brand;


SELECT 
COUNT(DISTINCT brand)
FROM
products;

-- How many categories?
SELECT 
COUNT(DISTINCT manual_categories)
FROM
products;

-- How many products per brand & products per category?
select 
count(distinct brand),
count(distinct manual_categories)
from
products;

-- What's the average price per brand and the average price per category?

SELECT
AVG(price)
FROM products
group by brand;

select
avg(price)
from products
group by manual_categories;

#e most expensive product per brand and per category?
select
max(price)
from products
group by brand;

select
max(price)
from products
group by manual_categories;






-- What's the name and description of the most expensive product per brand and per category?





