SELECT * FROM items; -- Finding out the recipe id for the Hot Chocolate.

SELECT * FROM recipe r -- Finding out the recipe and ingredients quantites for Hot Chocolate.
JOIN ingredients i ON r.ing_id = i.ing_id
Where r.recipe_id = 'HDR-HCH-MD';

SELECT -- Hot Choclate Recipe list and cost per ingredient.
    r.ing_id, r.recipe_id, i.ing_name,
    ROUND(SUM((i.ing_price / i.ing_weight) * r.quantity), 2) AS cost
FROM recipe r
JOIN ingredients i ON r.ing_id = i.ing_id
WHERE r.item_id in ('it013')
GROUP BY r.ing_id,r.recipe_id,i.ing_name
order by r.recipe_id;

                        --     SPACE ADDED HERE   ---

SELECT  -- Revenue, Cost, Profit & Profit_margin for Hot Chocolate per month.
    DATE_FORMAT(o.date, '%Y-%m') AS month,
    i.item_name,
	ROUND(SUM(o.quantity * i.item_price), 2) AS revenue,
    ROUND(SUM(o.quantity * i.item_cost), 2) AS cost,
    ROUND(SUM((o.quantity * i.item_price)-(o.quantity * i.item_cost)), 2) AS profit,
        ROUND(
        (SUM(o.quantity * i.item_price) - SUM(o.quantity * i.item_cost)) 
        / SUM(o.quantity * i.item_price), 
        2 ) AS profit_margin
        FROM orders o
JOIN items i ON o.item_id = i.item_id
WHERE i.item_id IN ('IT013')
GROUP BY month, i.item_id, i.item_name
ORDER BY i.item_id ASC, month ASC;

SELECT -- Cost of the ingredients for HC per month 
   DATE_FORMAT(date, '%Y-%m') AS month,
    i.ing_id, ing.ing_name,
    SUM(i.expected_qty) AS total_expected_qty,
   ROUND((SUM(ing.ing_price/ing.ing_weight) * (i.expected_qty)), 2) AS cost 
    FROM inventory i
JOIN ingredients ing ON i.ing_id = ing.ing_id
WHERE i.ing_id in ('ING005','ING012','ING013') AND i.expected_qty = 3000
GROUP BY month, i.ing_id, ing.ing_price, ing.ing_name, ing.ing_weight
ORDER BY month ASC, i.ing_id ASC;

                                 --     SPACE ADDED HERE   ---

SELECT -- To determine the total amount of servings per ingredient in the inventory per month. 
    DATE_FORMAT(i.date, '%Y-%m') AS month,
    i.ing_id,
    ing.ing_name,
    ROUND(AVG(i.expected_qty / r.quantity), 0) AS AvgTotal
FROM inventory i
JOIN recipe r ON i.ing_id = r.ing_id
JOIN ingredients ing ON i.ing_id = ing.ing_id
WHERE i.ing_id in ('ING005','ING012','ING013') and r.recipe_id = 'HDR-HCH-MD'
GROUP BY month, ing.ing_name, i.ing_id
ORDER BY month ASC, i.ing_id ASC;

SELECT -- Amount of Hot Chocalte sold per month.
    DATE_FORMAT(date, '%Y-%m') AS month,
   sum(quantity) as Amount_sold
FROM orders
where item_id = 'It013'
GROUP BY month
ORDER BY month ASC;