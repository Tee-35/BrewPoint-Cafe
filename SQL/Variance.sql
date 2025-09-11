SELECT -- Total revenue for every catergory each month 
    DATE_FORMAT(o.date, '%Y-%m') AS month,
    i.item_cat,
    ROUND(SUM(o.quantity * i.item_price), 2) AS revenue
FROM orders o
JOIN items i ON o.item_id = i.item_id
GROUP BY month, i.item_cat
ORDER BY month;

SELECT -- budget per catergory 
    i.item_cat,
	ROUND(SUM((o.quantity * i.item_price)/ 12), 2) AS Budget
FROM orders o
JOIN items i ON o.item_id = i.item_id
GROUP BY i.item_cat
ORDER BY i.item_cat;
