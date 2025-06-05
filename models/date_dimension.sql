WITH CTE AS (
select
TO_TIMESTAMP(date) AS date,
DATE(TO_TIMESTAMP(date)) AS DATE_date,
HOUR(TO_TIMESTAMP(date)) AS HOUR_date,
CASE 
WHEN DAYNAME(TO_TIMESTAMP(date)) in ('Sat','Sun')
THEN 'WEEKEND'
ELSE 'BUSINESSDAY'
END AS DAY_TYPE,
CASE WHEN MONTH(TO_TIMESTAMP(date)) in (12,1,2)
    THEN 'WINTER'
    WHEN MONTH(TO_TIMESTAMP(date)) in (3,4,5)
    THEN 'SPRING'
    WHEN MONTH(TO_TIMESTAMP(date)) in (6,7,8)
    THEN 'SUMMER'
    ELSE 'AUTUMN' 
    END AS STATION_OF_YEAR
from
{{ source('demo'  , 'air_quality') }}
)
select 
*
from CTE