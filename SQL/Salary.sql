SELECT -- salary 
 s.first_name, s.position,
    COUNT(DISTINCT date) AS days_worked,
    COUNT(DISTINCT date) * 8 * sal_per_hour AS gross_pay 
FROM orders o
JOIN staff s ON o.staff_id = s.id
GROUP BY s.first_name, s.position, s.sal_per_hour 
ORDER BY gross_pay DESC
;

