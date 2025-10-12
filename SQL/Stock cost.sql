SELECT ing.ing_name, -- month 
ROUND(SUM((ing.ing_price / ing.ing_weight) * inv.actual_qty), 2) AS cost 
FROM inventory inv 
JOIN ingredients ing ON inv.ing_id = ing.id
WHERE note = 'pending_delivery'
GROUP BY ing.ing_name
ORDER BY cost DESC
;

SELECT ing.ing_name, -- by month 
DATE_FORMAT(date, '%Y-%m') AS month,
ROUND(SUM((ing.ing_price / ing.ing_weight) * inv.actual_qty), 2) AS cost 
FROM inventory inv 
JOIN ingredients ing ON inv.ing_id = ing.id
WHERE note = 'pending_delivery'
GROUP BY  month, ing.ing_name
ORDER BY  ing.ing_name, month
;