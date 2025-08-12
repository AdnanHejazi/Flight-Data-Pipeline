

{{ config(materialized='table') }}

WITH parent_query
AS
(
SELECT
    F.amount, 
    D.country
FROM
    workspace.gold.FactBookings F
LEFT JOIN
    workspace.gold.DimAirports D
ON
    F.DimAirportsKey = D.DimAirportsKey
)

SELECT country, sum(amount) AS total_amount
FROM parent_query
GROUP BY country

-- where id is not null
