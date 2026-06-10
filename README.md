# bigquery-ecommerce-returns
O projeto foi dividido em scripts sequenciais para refletir as etapas de maturação da análise e a evolução da lógica de programação em SQL:

01_exploracao_inicial.sql: Análise exploratória inicial dos dados. Foca no entendimento básico da volumetria, utilizando JOIN entre as tabelas de itens de pedidos e produtos, aplicando filtros de status (WHERE oi.status = 'Returned') e agrupamentos por categoria (GROUP BY) para mapear o volume absoluto de devoluções.

02_devolucoes_por_categoria.sql: Introdução à primeira CTE (Common Table Expression). Aqui, a lógica evolui para eliminar o filtro engessado do WHERE e passa a calcular simultaneamente o total geral de pedidos e o total filtrado de devoluções por categoria, usando a inteligência do COUNTIF() para preparar a base do cálculo de taxa proporcional.

03_ranking_desvio_final.sql: A etapa final e mais avançada do projeto. Consolida a análise utilizando CTEs encadeadas e Window Functions. Aplica filtros de corte para eliminar ruídos de baixo volume (WHERE total_geral > 1000), calcula a média geral da plataforma (AVG() OVER()), mede o desvio de cada categoria em relação a essa média e gera um ranking automático de criticidade com o ROW_NUMBER().
