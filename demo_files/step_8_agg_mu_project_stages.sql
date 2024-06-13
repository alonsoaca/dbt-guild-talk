{% set project_stage_names = ["WAR", "Active", "Lost"] %}

select
    mu,
    {% for project_stage_name in project_stage_names %}
    count(case when project_stage_name = '{{project_stage_name}}' then project_id end) as {{project_stage_name}}_count,
    {% endfor %}
    count(project_id) as total_count
from {{ ref('dim_project') }}
group by 1