with timesheets as (
    select * from {{ ref('stg_timesheets') }}
),

oa_users as (
    select * from {{ ref('stg_oa_users') }}
),

customer as (
    select * from {{ ref('stg_customer') }}
),

project_stage as (
    select * from {{ ref('stg_project_stage') }}
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
            coalesce(e.project_stage_name,'Unknown') as project_stage_name,
            coalesce(b.full_name, 'Unknown') as project_owner_name,
            a.customer_id,
            coalesce(d.customer_name, 'Unknown') as customer_name,
            coalesce(d.mu, 'Unknown') as mu,
            c.min_time_sheet_date,
            c.max_time_sheet_date,
            {{ dbt_date.now() }} as load_timestamp
    from bronze_oa.v_oa_project_latest as a
        left join oa_users b on (a.user_id = b.user_id)
        left join projects_timesheets c on (a.id = c.project_id)
        left join customer d on (a.customer_id = d.customer_id)
        left join project_stage e on (a.project_stage_id = e.project_stage_id)
)

select * from projects