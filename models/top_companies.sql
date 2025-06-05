with top_companies as 
(
    select 
    company_name,
    founded_year,
    g2_rating
    from {{ source('demo', 'top_100_saas_companies') }}
),

company_agg as 

(

    select 
    founded_year,
    count(company_name)
    from top_companies
    group by founded_year

)
select 
* 
from company_agg 