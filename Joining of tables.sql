SELECT *
FROM line_item
JOIN products
ON line_item.sku = products.sku
limit 10;


#Query 1 join line_item and product table
SELECT line_item.sku, 
	line_item.product_quantity, 
	line_item.date, 
    line_item.unit_price, 
    products.name_en,
    products.price
FROM line_item
JOIN products
ON line_item.sku = products.sku
limit 10;

SELECT l.sku, 
	l.product_quantity, 
	l.date, 
    l.unit_price, 
    p.name_en,
    p.price
FROM line_item l
JOIN products p
ON l.sku = p.sku
limit 10;

##Query 2 Extend your previous query 
#by adding a column with the difference in price. 
#Name that column price_difference.
SELECT l.sku, 
	l.product_quantity, 
	l.date, 
    l.unit_price, 
    p.name_en,
    p.price,
    p.price-l.unit_price AS price_difference
FROM line_item l
JOIN products p
ON l.sku = p.sku
limit 10;

#Query 3. Build a query that outputs the price difference that you just calculated, 
#grouping products by category. Round the result.
SELECT l.sku, 
	l.product_quantity, 
	l.date, 
    l.unit_price, 
    p.name_en,
    p.price,
   ROUND(p.price-l.unit_price) AS price_difference
FROM line_item l
JOIN products p
ON l.sku = p.sku
GROUP BY 
 p.manual_categories;

#Query 4..Create the same query as before 
#(calculating the price difference between the line_item and the products tables,
#but now grouping by brands instead of categories.
SELECT l.sku, 
	l.product_quantity, 
	l.date, 
    l.unit_price, 
    p.name_en,
    p.price,
    ROUND (p.price-l.unit_price) AS price_difference
FROM line_item l
JOIN products p
ON l.sku = p.sku
GROUP BY 
 p.brand
limit 10;

#Query 5..Let's focus on the brands with a big price difference: 
#run the same query as before, but now limiting the results to 
#only brands with an avg_price_dif of more than 50000.
# Order the results by avg_price_dif (bigger to smaller).
SELECT l.sku, 
	l.product_quantity, 
	l.date, 
    l.unit_price, 
    p.name_en,
    p.price,
    ROUND (avg(p.price-l.unit_price)) AS avg_price_diff
FROM line_item l
JOIN products p
ON l.sku = p.sku
GROUP BY 
 p.brand
HAVING
 avg_price_diff > 50000
ORDER BY
 avg_price_diff DESC;
 
 #Query 6. First, we will connect each product (sku) from the line_item table
 #to the orders table. 
 #We only want sku that have been in any order. 
 #This table will contain duplicates, 
 
 SELECT 
 l.sku, o.*
 FROM line_item l
 JOIN orders o
 ON l.id_order = o.id_order
 limit 5;
 
 
 #7 #Now, add to the previous query 
 #the brand and the category from the products table to this query
SELECT 
l.sku, p.brand, p.manual_categories, o.*
 FROM line_item l
 JOIN orders o
 ON l.id_order = o.id_order
JOIN products p
ON l.sku = p.sku
limit 5;


##to keep only Cancelled orders. group the results from the previous query, 
#first by category and then by brand,
#adding in both cases a count so we know which categories
##and which brands are most times present in Cancelled orders.
SELECT 	l.sku, 
		p.manual_categories,
	    p.brand, o.*,
		COUNT(*)
FROM line_item l
JOIN orders o
ON l.id_order = o.id_order
JOIN products p
ON  l.sku = p.sku
WHERE o.state = 'Cancelled'
GROUP BY p.manual_categories, p.brand
ORDER BY p.manual_categories, p.brand
LIMIT 5;



