SELECT
  ecommerce,
  timestamp,
  event,
  user_id,
  event_datetime,
  COUNT(*) OVER (PARTITION BY data.item_category_2, event) AS event_count,
  COUNT(*) OVER (PARTITION BY data.item_category_2,user_id, event) AS user_event_count,
  COUNT(*) OVER (PARTITION BY event) AS total_event_count
FROM `Retail_Store.clean_clickstream_data`,
UNNEST(ecommerce.items) AS data
WHERE event IN ('purchase', 'browse');
