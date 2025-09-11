SELECT -- Total revenue for every catergory each month 
    DATE_FORMAT(o.date, '%Y-%m') AS month,
    i.item_cat,
    ROUND(SUM(o.quantity * i.item_price), 2) AS revenue,
    ROUND(SUM(o.quantity * i.item_cost), 2) AS cost,
    ROUND(SUM((o.quantity * i.item_price)-(o.quantity * i.item_cost)), 2) AS profit
FROM orders o
JOIN items i ON o.item_id = i.item_id
GROUP BY month, i.item_cat
ORDER BY month;