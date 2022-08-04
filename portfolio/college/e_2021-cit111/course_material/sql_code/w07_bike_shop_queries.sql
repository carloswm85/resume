
/*  (SEE BELOW FOR POSSIBLE ANSWERS)
	
1. I need a list of all the customers with Gmail email accounts because there 
   is a new Google application that can interface with them through their 
   email that we’d like to contact them and invite them to use it.

2. Haro called and wants to discount all their bikes by 20%. Please get me 
   the name of the bikes from Haro (brand_id 2) and show the original price 
   and then a column with the sales price with a readable column header.

3. We need to see the order number and order date from all orders at Santa 
   Cruz Bikes (store_id 1) but I don’t need to see the orders made by Mireya 
   Copeland who’s staff_id is 2.  Just Fabiola, Genna and Virgie’s orders 
   (everyone else who works there).

4. I need all the order numbers and order dates for the month of February 2017.

5. We need to clear out all our frame specific bikes and Women’s bikes. They 
   are not selling well and we will be displaying them in our annual sidewalk 
   sale. Find all the bike product name with ‘Frame’ or ‘Frameset’ in the name 
   or the word “Women’s” 

6. We need all the bikes product names that start with A-H and whose list price 
   is more than 299.99 or exactly 299.99. Sort them by product name. We will 
   need to inventory those bikes first during inventory. 
*/

-- Here are some possible answers:
  -- 1.
  SELECT first_name, last_name, email
  FROM customer
  WHERE email LIKE '%gmail%';
  -- OR
  SELECT first_name, last_name, email
  FROM customer
  WHERE email REGEXP 'gmail';
  
  -- 2.
  SELECT product_name, list_price, list_price -(list_price *.20) AS sale_price
  FROM product
  WHERE brand_id = 2;
  
  -- 3.
  SELECT cust_order_id, order_date
  FROM cust_order
  WHERE store_id = 1 AND NOT staff_id = 2; -- 184 rows returned
  
  -- 4.
  SELECT cust_order_id, order_date
  FROM cust_order
  WHERE order_date BETWEEN '2017-02-01' AND '2017-02-28';  
  
  -- 5.
  SELECT product_name
  FROM product
  WHERE product_name LIKE '%Frame%' OR product_name LIKE '%Women%';
  -- 52 rows returned if they put AND there is only one
  -- OR
  SELECT product_name
  FROM product
  WHERE product_name REGEXP 'Frame' OR product_name REGEXP 'Women';
  
  -- 6.
  SELECT product_name, list_price
  FROM product
  WHERE product_name < 'I' AND list_price >= 299.99
  ORDER BY product_name;
