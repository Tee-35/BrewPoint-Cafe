SELECT -- The cost to make each item 
    r.recipe_id,
    ROUND(SUM((i.ing_price / i.ing_weight) * r.quantity), 2) AS drink_cost
FROM recipe r
JOIN ingredients i ON r.ing_id = i.ing_id
GROUP BY r.recipe_id;

ALTER TABLE items -- adding a 'item cost' column to the item table


ADD COLUMN item_cost DECIMAL(10,2);

-- Turn off safe update mode
SET SQL_SAFE_UPDATES = 0;

-- Your update query
UPDATE items i
JOIN (
    SELECT 
        r.recipe_id,
        ROUND(SUM((ing.ing_price / ing.ing_weight) * r.quantity), 2) AS drink_cost
    FROM recipe r
    JOIN ingredients ing ON r.ing_id = ing.ing_id
    GROUP BY r.recipe_id
) AS cost_calc ON i.recipe_id = cost_calc.recipe_id
SET i.item_cost = cost_calc.drink_cost;

-- (Optional) Re-enable safe updates if desired
SET SQL_SAFE_UPDATES = 1;

-- The following values were added manually 

UPDATE items
SET item_cost = 0.30
WHERE item_id = 'IT025';

UPDATE items
SET item_cost = 0.35
WHERE item_id = 'IT026';

UPDATE items
SET item_cost = 0.35
WHERE item_id = 'IT027';

UPDATE items
SET item_cost = 0.35
WHERE item_id = 'IT028';


SELECT * FROM `items`; -- table updated 