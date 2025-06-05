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
    {{get_season('DATE')}},
    {{function1('DATE')}}
from
{{ source('demo'  , 'air_quality') }}
)
select 
*
from CTE