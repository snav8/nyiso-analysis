-- Databricks notebook source
--Get average price of electricity by zone
SELECT 
  zone, 
  ROUND(AVG(lbmp), 2) AS average_price
FROM nyiso_dayahead_lbmp
GROUP BY zone;

-- COMMAND ----------

--See max prices for zones over time
SELECT 
  DATE(time_stamp) AS date, 
  zone, 
  MAX(LBMP) AS peak_price
FROM nyiso_dayahead_lbmp
WHERE time_stamp >= '2023-01-01' --limit results to more recent dates so no data is truncated after 10000 rows
GROUP BY date, zone

-- COMMAND ----------

--Get total congestion costs over time
SELECT 
  DATE_FORMAT(time_stamp, 'yyyy-MM') AS month_year, 
  ROUND(SUM(marginal_cost_congestion), 2) AS total_congestion_cost
FROM nyiso_dayahead_lbmp
GROUP BY month_year;

-- COMMAND ----------

--Get average Marginal Costs of Losses per hour
SELECT 
  HOUR(time_stamp) AS hour, 
  zone,
  AVG(marginal_cost_losses) AS avg_loss_cost
FROM nyiso_dayahead_lbmp
GROUP BY hour, zone
ORDER BY hour

-- COMMAND ----------

-- See trends of energy cost so far for Sept 2024
SELECT 
  time_stamp, 
  ROUND((lbmp + marginal_cost_losses + marginal_cost_congestion), 2) AS total_energy_cost
FROM nyiso_dayahead_lbmp
WHERE MONTH(time_stamp) = 9 AND YEAR(time_stamp) = 2024
ORDER BY time_stamp

-- COMMAND ----------

-- Get yearly price volatility by zone
SELECT  
  YEAR(time_stamp) AS year,
  zone,
  ROUND(STDDEV(lbmp), 2) AS price_volatility
FROM nyiso_dayahead_lbmp
GROUP BY year, zone
ORDER BY year
