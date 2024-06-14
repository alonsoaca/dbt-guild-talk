
## Initial Setup and test.
1. dbt init silver_delivery

Hostname: adb-1670971521468748.8.azuredatabricks.net
Path: /sql/1.0/warehouses/9175039ed0bdc2a0
Catalog: at_data_dev
Schema: silver_delivery_dbt


2. Explain dbt_project.yml
3. Check everythion is OK dbt debug
4. Overview of sample models
5. Show sample model, sechema, etc.
6. Run sample model and review dbt run or dbt run --full-refresh
7. Run tests dbt test and review results.
8. git add .
9. git commit -m "Initial version of the project"
10. git push

## Demo of delivery

1. Create branch staging
2. Add first version of Dim Projects
2. Separate into staging
3. Clean examples
4. Change Materialization

models:
  silver_delivery:
    +materialized: table
    # Config indicated by + and applies to all files under models/example/
    staging:
      +materialized: view

 5. dbt run --full-refresh

 6. Cleanup databricks

 drop table if exists silver_delivery_dbt.my_first_dbt_model;
 drop view if exists silver_delivery_dbt.my_second_dbt_model;

 6. Add Tests and schema into staging

version: 2

models:
  - name: stg_oa_users
    description: One record per oa user
    columns:
      - name: user_id
        description: Primary key
        data_tests:
          - unique
          - not_null
      - name: full_name
        description: Last name, First Name
        data_tests:
          - not_null

  - name: stg_timesheets
    description: Timesheets for the time spent by every users on the projects they work on.
    columns:
      - name: user_id
        description: User that entered thet timesheet
        data_tests:
          - not_null
      - name: project_id
        data_tests:
          - not_null

 7. Commit change and merge

 8. git checkout main

 9. git checkout pull

 10. Review all changes.

 11. dbt docs generate

 12. dbt docs serve

## Run on Databricks

1. Run through databricks

## Enhance model

1. Create branch git checkout -b "feature/new_datamart"

2. Enhance dim_project, create dim_user and dim_fact.

3. Add final tests and docs.

version: 2

models:
  - name: dim_project
    description: Dimension table for all projects in the company
    columns:
      - name: project_id
        description: Primary key
        data_tests:
          - unique
          - not_null
      - name: project_name
        description: Name of the project
        data_tests:
          - not_null
      - name: customer_name
        description: Customer Name
        data_tests:
          - not_null
      - name: mu
        description: Market Unit
        data_tests:
          - not_null
          - accepted_values:
              values: ['SAM', 'Corporate', 'CIGNA', 'MxCAM', 'West HCN & TMTSW', 'East BFSI & PSE']
      - name: project_stage_name
        description: Name of the project stage.
        data_tests:
          - not_null
          - accepted_values:
              values: ['WAR', 'Lost Opportunity', 'Project Setup', 'Active', 'Closed', 'On-Hold', 'Templates', 'Oppportunity Best Case', 'Committed Opportunity']

  - name: dim_user
    description: Dimension table for all users in the company
    columns:
      - name: user_id
        description: Primary Key
        data_tests:
          - not_null
      - name: full_name
        description: Name of the user in the format of Last Name, First Name
        data_tests:
          - not_null

  - name: fact_time
    description: Fact table for employee and project timesheets.
    columns:
      - name: user_id
        description: User id for the employee that enter the timesheet
        data_tests:
          - not_null
          - relationships:
              to: ref('dim_user')
              field: user_id
      - name: project_id
        description:  Project id for the project timesheet
        data_tests:
          - not_null
          - relationships:
              to: ref('dim_project')
              field: project_id

4. Run and test.

5. dbt docs generate

6. dbt docs serve

7. Commit and merge

8. Run again in dbt.


## Seed example

1. Load Country
2. dbt seed


## Packages example

1. Add package for dates
2. dbt deps
3. Create dim_date
4. Enhance tables for load_ts and show macro functionality

## Jinja example
1. Create Agg for project rev type


## Snapshot example

