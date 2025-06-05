select 
*
from {{ source('demo', 'top_100_saas_companies') }}
