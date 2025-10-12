SELECT i.item_name, -- Total revenue per product 
    COUNT(*) AS total_orders,
round(sum(quantity * item_price), 2) AS sales
FROM orders o
JOIN  items i on o.item_id = i.id
GROUP BY i.item_name
Order by sales DESC
;

SELECT i.item_name,  -- Total revenue/cost by month 
        DATE_FORMAT(date, '%Y-%m') AS month,
round(sum(o.quantity * item_price), 2) AS item_sales,
    ROUND(SUM((ing.ing_price / ing.ing_weight) * r.quantity), 2) AS item_cost,
        ROUND((sum(o.quantity * item_price)) - SUM((ing.ing_price / ing.ing_weight) * r.quantity), 2) AS item_profit,
   COUNT(*) AS total_orders
FROM orders o
JOIN  items i on o.item_id = i.id
JOIN  recipe r on i.recipe = r.recipe
JOIN ingredients ing ON r.ing_id = ing.id
GROUP BY i.item_name, month
Order by  month, item_sales DESC
;

SELECT item_cat,  -- Total order by category 
   COUNT(*) AS total_orders,
   round(sum(quantity * item_price), 2) AS sales
FROM orders o
JOIN  items i on o.item_id = i.id
GROUP BY item_cat
ORDER BY sales DESC
;

SELECT item_cat,  -- Total order by category by month 
      DATE_FORMAT(date, '%Y-%m') AS month,
         round(sum(quantity * item_price), 2) AS sales,
   COUNT(*) AS total_orders
FROM orders o
JOIN  items i on o.item_id = i.id
GROUP BY item_cat, month
;


SELECT item_cat, -- Total orders by category at set times 
SUM(CASE WHEN TIME(o.time) BETWEEN '07:00:00' AND '11:59:59' THEN 1 ELSE 0 END) AS Morning,
SUM(CASE WHEN TIME(o.time) BETWEEN '12:00:00' AND '14:59:59' THEN 1 ELSE 0 END) AS Lunch,
SUM(CASE WHEN TIME(o.time) BETWEEN '15:00:00' AND '17:00:00' THEN 1 ELSE 0 END) AS Afternoon
FROM orders o
JOIN  items i on o.item_id = i.id
GROUP BY item_cat 
;

SELECT item_cat, -- Total orders by category at set times by month 
      DATE_FORMAT(date, '%Y-%m') AS month,
SUM(CASE WHEN TIME(o.time) BETWEEN '07:00:00' AND '11:59:59' THEN 1 ELSE 0 END) AS Morning,
SUM(CASE WHEN TIME(o.time) BETWEEN '12:00:00' AND '14:59:59' THEN 1 ELSE 0 END) AS Lunch,
SUM(CASE WHEN TIME(o.time) BETWEEN '15:00:00' AND '17:00:00' THEN 1 ELSE 0 END) AS Afternoon
FROM orders o
JOIN  items i on o.item_id = i.id
GROUP BY item_cat, month
;