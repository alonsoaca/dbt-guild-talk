select  a.id as user_id,
        a.name as full_name,
        a.`last` as last_name,
        a.`first` as first_name,
        lower(a.email) as email
from bronze_oa.v_oa_user_latest as a