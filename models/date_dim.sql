WITH date_dim AS (
  SELECT *,
         EXTRACT(DAY FROM Carlendar_Date) AS day_of_month,
         EXTRACT(DAYOFWEEK FROM Carlendar_Date) AS day_of_week,
         TO_CHAR (Carlendar_Date,'DAY') AS day_name
  FROM {{ ref('date_time') }}
)
SELECT ROW_NUMBER() OVER (ORDER BY Carlendar_Date) AS id,
       Carlendar_Date AS date,
       Cal_Quarter,
       Cal_Year,
       day_of_month,
       day_of_week,
       day_name
FROM date_dim