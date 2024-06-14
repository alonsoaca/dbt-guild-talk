select *, {{ dbt_date.now() }} as load_timestamp 
from {{ ref('stg_timesheets') }}