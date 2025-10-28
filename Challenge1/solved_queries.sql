/******************************************************
MySQL Challenge 1 -- Queries solution
******************************************************/

USE magist;

/******************************************************
1. Database Overview 
******************************************************/

-- 1.1. How many orders are there in the dataset?
SELECT COUNT(order_id) AS Total_Oders FROM orders;

	# Option 2 : 
	SELECT count(*) AS Total_Oders FROM orders;


-- 1.2.	Are the orders actually delivered?
SELECT 
	COUNT(order_id) AS Total_Status,
	order_status 
FROM orders
WHERE order_status="delivered";

	# Option 2 Usefull to see if there are typos
	SELECT 
		count(order_id) AS Total_Status,
		order_status 
	FROM orders
	GROUP BY order_status;


-- 1.3.	Is Magist experiencing user growth?
SELECT 
    YEAR(order_purchase_timestamp) AS year_,
    COUNT(DISTINCT customer_id) AS unique_customers
FROM orders
GROUP BY YEAR(order_purchase_timestamp)
ORDER BY YEAR(order_purchase_timestamp);

	#Option 2: Grouping per Month&Year
	SELECT 
		YEAR(order_purchase_timestamp) AS year_,
		MONTH(order_purchase_timestamp) AS month_,
		COUNT(customer_id)
	FROM     orders
	GROUP BY year_ , month_
	ORDER BY year_ , month_;


-- 1.4.	How many products are there in the products table?
SELECT COUNT(DISTINCT product_id) AS Total_products FROM products; -- 32951


-- 1.5.	Which are the categories with most products?
SELECT 
	count(DISTINCT product_id) AS Total_products,
    product_category_name AS Category
 FROM products
 GROUP BY Category
 ORDER BY Total_products DESC;
 
 
-- 1.6.	How many of products were present in actual transactions?
SELECT COUNT(DISTINCT product_id) AS n_products 
FROM order_items
WHERE order_item_id > 0; -- 32951


-- 1.7.	What’s the price for the most expensive and cheapest products?
SELECT 
	max(price) AS most_expensive,
    min(price) AS cheapest 
FROM order_items;


-- 1.8.	What are the highest and lowest payment values?
SELECT
	max(payment_value) AS highest_payment,
    min(payment_value) AS lowest_payment
FROM order_payments;

-- Option 2: Maximum someone has paid for an order:
SELECT SUM(payment_value) AS highest_order 
FROM order_payments
GROUP BY order_id
ORDER BY highest_order DESC
LIMIT 1;


/******************************************************
2. Products Analysis
******************************************************/

-- 2.1.	What categories of tech products does Magist have?
## Based on an initial scan of the product categories, we've identified the key terms linked to ENIAC's products.
## You can refine this list by adding or removing categories as needed.

SELECT DISTINCT pct.product_category_name_english
FROM products p
LEFT JOIN product_category_name_translation pct
	ON p.product_category_name = pct.product_category_name
WHERE pct.product_category_name_english IS NOT NULL
  AND (
        pct.product_category_name_english LIKE '%audio%' OR
        pct.product_category_name_english LIKE '%electronics%' OR
        pct.product_category_name_english LIKE '%computers%' OR
        pct.product_category_name_english LIKE '%pc%' OR
        pct.product_category_name_english LIKE '%tablet%' OR
        pct.product_category_name_english LIKE '%print%' OR
         pct.product_category_name_english LIKE '%console%' OR
        pct.product_category_name_english LIKE '%telephony%'
      )
ORDER BY pct.product_category_name_english;


-- 2.2.	How many products of these tech categories have been sold (within the time window of the database snapshot)?
SELECT COUNT(DISTINCT(oi.product_id)) AS tech_products_sold
FROM order_items oi
LEFT JOIN products p 
	USING (product_id)
LEFT JOIN product_category_name_translation pt
	USING (product_category_name)
WHERE product_category_name_english = "audio"
OR product_category_name_english =  "computers"
OR product_category_name_english =  "computers_accessories"
OR product_category_name_english =  "consoles_games"
OR product_category_name_english =  "electronics"
OR product_category_name_english =  "fixed_telephony"
OR product_category_name_english =  "pc_gamer"
OR product_category_name_english =  "tablets_printing_image"
OR product_category_name_english =  "telephony"; -- !! Total: 3823

-- 2.3.	What percentage do tech categories represent from the overall number of products sold?
SELECT COUNT(DISTINCT(product_id)) AS products_sold
FROM order_items; -- !! 32951
-- PERCENTAGE
SELECT 3823 / 32951 *100; -- 11.6%


-- 2.4.	What’s the average price of the products being sold?
SELECT ROUND(AVG(price),2) FROM order_items;


-- 2.5.	Are expensive tech products popular?
## ! In this context, ‘popular’ does not refer to how many types of products exist, but rather how many times they were purchased or how many were sold.

SELECT COUNT(oi.product_id) AS Total_products, 
	CASE 
		WHEN price > 1000 THEN "Expensive"
		WHEN price > 100 THEN "Mid-range"
		ELSE "Cheap"
	END AS "price_range"
FROM order_items oi
LEFT JOIN products p
	ON p.product_id = oi.product_id
LEFT JOIN product_category_name_translation pt
	USING (product_category_name)
WHERE pt.product_category_name_english 
		IN ("audio",
		"computers",
        "computers_accessories", 
        "consoles_games",
        "electronics", 
        "fixed_telephony", 
        "pc_gamer",  
        "tablets_printing_image",
        "telephony")
GROUP BY price_range
ORDER BY 1 DESC;


/******************************************************
3. Seller Analysis
******************************************************/

-- 3.1.	How many months of data are included in the Magist database?
SELECT 
    TIMESTAMPDIFF(MONTH,
        MIN(order_purchase_timestamp),
        MAX(order_purchase_timestamp))
FROM orders; -- !! 25 Months

-- 3.2.	How many sellers are there? 
SELECT COUNT(DISTINCT seller_id) FROM sellers; -- 3095


-- 3.3.	How many Tech sellers are there? 
SELECT
 COUNT(DISTINCT seller_id) as Total_sellers 
FROM sellers
LEFT JOIN order_items USING (seller_id)
LEFT JOIN products p USING (product_id)
LEFT JOIN product_category_name_translation pt USING (product_category_name)
WHERE
    pt.product_category_name_english 
    IN ("audio",
		"computers",
        "computers_accessories", 
        "consoles_games",
        "electronics", 
        "fixed_telephony", 
        "pc_gamer",  
        "tablets_printing_image",
        "telephony"); -- 486

-- 3.4.	What percentage of overall sellers are Tech sellers?
SELECT 486/3095 * 100;
-- 15.7%


-- 3.5.	What is the total amount earned by all sellers? 
SELECT
  SUM(oi.price) AS total_earned
FROM order_items oi
LEFT JOIN orders o USING (order_id)
WHERE o.order_status 
	NOT IN ('unavailable' , 'canceled'); -- 13 494 400.74

-- 3.6.	What is the total amount earned by all Tech sellers?
SELECT
 SUM(price) AS total_earned
FROM order_items oi 
LEFT JOIN orders o USING (order_id)
LEFT JOIN products p USING (product_id)
LEFT JOIN product_category_name_translation pt USING (product_category_name)
WHERE
	o.order_status NOT IN ('unavailable' , 'canceled')
    AND
    pt.product_category_name_english 
    IN ("audio",
		"computers",
        "computers_accessories", 
        "consoles_games",
        "electronics", 
        "fixed_telephony", 
        "pc_gamer",  
        "tablets_printing_image",
        "telephony"); -- 1 878 962
    

-- 3.7.	Can you calculate the average monthly income of all sellers? 
SELECT 13494400.74/3095/25; -- 174.4


-- 3.8.	Can you calculate the average monthly income of Tech sellers?
SELECT 1878962.78/486/25; -- 154.6


-- 3.9 What percentage of total sales comes from tech products?

SELECT 1878962.78 / 13494400.74 * 100;  -- 13.9%


/******************************************************
4. Delivery Performance
******************************************************/

-- 4.1.	What's the average time between the order being placed and the product being delivered?
SELECT AVG(DATEDIFF(order_delivered_customer_date, order_purchase_timestamp)) FROM orders; -- 12.5 days


-- 4.2.	How many orders are delivered on time vs orders delivered with a delay?
SELECT 
    CASE 
        WHEN DATEDIFF(order_estimated_delivery_date, order_delivered_customer_date) > 0 THEN 'Delayed' 
        ELSE 'On time'
    END AS delivery_status, 
COUNT(DISTINCT order_id) AS orders_count
FROM orders 
WHERE order_status = 'delivered'
AND order_estimated_delivery_date IS NOT NULL
AND order_delivered_customer_date IS NOT NULL
GROUP BY delivery_status;
	-- on time 7999
    -- delayed 88471

-- 4.3.	Is there any pattern for delayed orders, e.g. big products being delayed more often?
SELECT
    CASE 
        WHEN DATEDIFF(order_estimated_delivery_date, order_delivered_customer_date) >= 100 THEN "> 100 day Delay"
        WHEN DATEDIFF(order_estimated_delivery_date, order_delivered_customer_date) >= 7 AND DATEDIFF(order_estimated_delivery_date, order_delivered_customer_date) < 100 THEN "1 week to 100 day delay"
        WHEN DATEDIFF(order_estimated_delivery_date, order_delivered_customer_date) > 3 AND DATEDIFF(order_estimated_delivery_date, order_delivered_customer_date) < 7 THEN "4-7 day delay"
        WHEN DATEDIFF(order_estimated_delivery_date, order_delivered_customer_date) >= 1  AND DATEDIFF(order_estimated_delivery_date, order_delivered_customer_date) <= 3 THEN "1-3 day delay"
        WHEN DATEDIFF(order_estimated_delivery_date, order_delivered_customer_date) > 0  AND DATEDIFF(order_estimated_delivery_date, order_delivered_customer_date) < 1 THEN "less than 1 day delay"
        WHEN DATEDIFF(order_estimated_delivery_date, order_delivered_customer_date) <= 0 THEN 'On time' 
    END AS "delay_range", 
    AVG(product_weight_g) AS weight_avg,
    MAX(product_weight_g) AS max_weight,
    MIN(product_weight_g) AS min_weight,
	COUNT(DISTINCT a.order_id) AS orders_count
FROM orders a
LEFT JOIN order_items b
    USING (order_id)
LEFT JOIN products c
    USING (product_id)
WHERE order_estimated_delivery_date IS NOT NULL
AND order_delivered_customer_date IS NOT NULL
AND order_status = 'delivered'
GROUP BY delay_range; 
-- 
/******************************************************
Our initial analysis indicates that product physical size does not correlate significantly with delivery delays. 
What other hypotheses should we consider? Here are a few ideas to explore:

Inconsistent Seller Logistics: 
- Are delays concentrated in specific sellers? 
- Are certain categories (e.g., furniture, electronics) more affected by seller-specific issues?

Temporal & Seasonal Bottlenecks
- Do delays increase during holidays?
- Do they decrease as sellers gain experience? 
- Is there a "weekend effect" on processing speed?"
******************************************************/
