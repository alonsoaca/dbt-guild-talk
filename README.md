# dbt-demo
dbt demo for guild talks with databricks

## Create environment
Create virtual environment with required python versio, at this time it is: 3.8.19. This could be with Anaconda or other virtual environment manager like pipenv.

Using anaconda:

```
conda create --name dbt-demo-guild-talk python=3.8.19
```

## Activate environment

Activate environment.

```
conda activate dbt-demo-guild-talk
```

## Install Required Libraries

Install required libraries.

```
pip install dbt-databricks
```

## Initialize project for tutorial

For this demo, we followed this [tutorial](https://docs.getdbt.com/guides/manual-install?step=1). They main tasks are:

### Create a new git repo, in this case we used Github

Create a new repo using this link: https://github.com/new. In this case I named it: dbt-guild-talk

### Clone repo to local environment
```
git clone https://github.com/alonsoaca/dbt-guild-talk.git
```

### Go into the git repo
```
cd dbt-guild-talk/
```

### Initialize the project using dbt command:

Initialize the project and follow the instruccions.

```
dbt init silver_delivery
```


### Resources:
- Learn more about dbt [in the docs](https://docs.getdbt.com/docs/introduction)
- Check out [Discourse](https://discourse.getdbt.com/) for commonly asked questions and answers
- Join the [chat](https://community.getdbt.com/) on Slack for live discussions and support
- Find [dbt events](https://events.getdbt.com) near you
- Check out [the blog](https://blog.getdbt.com/) for the latest news on dbt's development and best practices
- Tutorial that we followed [here](https://docs.getdbt.com/guides/manual-install?step=1)
- Databricks connection setup [here](https://docs.databricks.com/en/partners/prep/dbt.html)
- Schedule run in databricks [here](https://docs.getdbt.com/guides/how-to-use-databricks-workflows-to-run-dbt-cloud-jobs?step=1)
