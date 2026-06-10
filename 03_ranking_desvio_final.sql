WITH resumo_categorias AS (
  SELECT
    p.category,
    COUNT(oi.order_id) AS total_geral,
    COUNTIF(oi.status = 'Returned') AS total_devolvidos,
    ROUND((COUNTIF(oi.status = 'Returned') / COUNT(oi.order_id)) * 100, 2) AS taxa_devolucao
  FROM `bigquery-public-data.thelook_ecommerce.order_items` oi
  JOIN `bigquery-public-data.thelook_ecommerce.products` p
    ON oi.product_id = p.id
  GROUP BY p.category
),
com_media AS (
  SELECT
    category,
    total_geral,
    total_devolvidos,
    taxa_devolucao,
    ROUND(AVG(taxa_devolucao) OVER (), 2) AS media_generica,
    ROUND(taxa_devolucao - AVG(taxa_devolucao) OVER (), 2) AS desvio_da_media,
    ROW_NUMBER() OVER (ORDER BY taxa_devolucao DESC) AS ranking
  FROM resumo_categorias
  WHERE total_geral > 1000
)

SELECT *
FROM com_media
ORDER BY ranking ASC
