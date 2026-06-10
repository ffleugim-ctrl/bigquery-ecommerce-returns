SELECT 
  p.category,
  COUNT(oi.order_id) AS total_devolvidos
FROM `bigquery-public-data.thelook_ecommerce.order_items` oi
JOIN `bigquery-public-data.thelook_ecommerce.products` p
  ON oi.product_id = p.id
WHERE oi.status = 'Returned'
GROUP BY p.category
ORDER BY total_devolvidos DESC;
