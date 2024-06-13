{% snapshot dim_project_snapshot %}

{{
    config(
      target_database='at_data_dev',
      target_schema='silver_delivery_dbt',
      unique_key='project_id',
      strategy='timestamp',
      updated_at='load_timestamp'
    )
}}

select * from {{ ref('dim_project') }}

{% endsnapshot %}