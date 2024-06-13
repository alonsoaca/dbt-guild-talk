with timesheets as (
    select  a.project_id,
            a.`date` as time_sheet_date,
            a.user_id,
            a.hour as hours
    from bronze_oa.v_oa_task_latest as a
),

oa_users as (
    select  a.id as user_id,
        a.name as full_name,
        a.`last` as last_name,
        a.`first` as first_name,
        lower(a.email) as email
    from bronze_oa.v_oa_user_latest as a
),

projects_timesheets as (
    select  a.project_id,
            min(a.time_sheet_date) as min_time_sheet_date,
            max(a.time_sheet_date) as max_time_sheet_date
    from timesheets as a
    group by a.project_id
),

projects as (
    select  a.id as project_id,
            a.name as project_name,
            a.project_stage_id,
            coalesce(b.full_name, 'Unknown') as project_owner_name,
            a.customer_id,
            c.min_time_sheet_date,
            c.max_time_sheet_date
    from bronze_oa.v_oa_project_latest as a
        left join oa_users b on (a.user_id = b.user_id)
        left join projects_timesheets c on (a.id = c.project_id)
)

select * from projects