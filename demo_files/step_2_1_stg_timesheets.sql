select  a.project_id,
        a.`date` as time_sheet_date,
        a.user_id,
        a.hour as hours
from bronze_oa.v_oa_task_latest as a