# Introduction
Let's immerse ourselves in the Data job market! We will be focusing on Data Analyst roles,
this project explores top paying jobs, in-demand skills and where high demand meets high salary
in Data Analytics.

SQL Inquires? Check them out here: [project_sql folder](/project_sql/)

# Background
The background for this project was to follow Luke B in finding and navagating the data analysis job market in order to provide insight on the top paying jobs and in demand skills linked with those jobs. in order to find the most in demand skills for the top data jobs.

The link for the course [Luke's SQL Course](https://www.youtube.com/watch?v=7mz73uXD9DA)

### Questions I wanted to answer through my SQL queries were.

1. What are the top paying data analyst jobs?
2. What skills are required for these top paying jobs?
3. What skills are most in demand for data analysts
4. What skills are associated with highest paid salaries.
5. What are the most optimal skills to learn?
# Tools I used
For my deep dive into the data analysts market, I learned and utilized the power of several key tools.

- **SQL**: The main tool for my analysis. Allowing me to query the database and uncover main insights.
- **PostreSQL**: The chosen database management system, ideal for handling the job postings data
- **Visual Studio Code**: My go-to for database management and executing SQL queries.
- **Git & Github**: Essencial for version control and sharing my SQL script and analysis, ensuring collaberation and project tracking.

# The Analysis
Each query for this project is aimed at investigating specific aspects of the data analyst job market. Here is how I approached each question
### 1. Top Paying Jobs
To identify the highest-paying roles. I filtered data analyst positions by average yearly salary and location, focusing on remote jobs. This query highlights the high paying opportunites in the field.

``` SQL
SELECT 
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS webname
    from 
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location ='Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;
```
Here is the breakdown for the top data analyst jobs in 2023:
- **Wide salary range** top 10 paying data analyst roles span from $184,000 to $650,000. indicating significant salary potential in the field.
- **Diverse Employers:** Companies like smartAsset, Meta, and AT&T are among those offering high salaries, showing a broad interest across different industries.
- **Job Title Variety**
There is a high diversity in job titles, from data analysts to director of analytics, reflecting varied roles and specializations within data analytics.
### 2. Skills for Top Paying Jobs
To understand what skills are required for the top-paying jobs, I joined the job postings with the skills data, providing insitghts into what employers value for high-compensation roles.
```sql
SELECT 
    job_id,
    job_title,
    job_location,
    job_schedule_type,
    salary_year_avg,
    job_posted_date,
    name AS webname
    from 
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location ='Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10;
```
Here the breakdown of the most demanded skills for the top 10 highest paying data analyst jobs in 2023.
- SQL is leading with bold count of 8
- Python follows closely with bold count of 7
- Tableau is also highly sought after, with a bold count of 6. Other skills like R, Snowflake, Pandas, and Excel show varying degrees of demand.
### 3. In-Demand Skills for Data Analysts
This query helped identify the skills most frequently requested in job postings, directing focus to areas with high demands.

```sql
SELECT 
    skills,
    COUNT(skills_job_dim.job_id) AS job_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
GROUP BY
    skills
ORDER BY
    job_count DESC
LIMIT 5;
```
Here's the breakdwon of the most demanded skills for data analysts in 2023:
- **SQL** and **Excel** remain fundamental, emphasizing the need for strong foundational skills in data processing and spreadsheet manipulation.
- **Programming** and **Visualization tools** like  **Python , Tableau,** and **Power Bi** are essential pointing towards the increase importance of technical skills in data storytelling and decision support.

| Skill   | Job Count |
|---------|-----------|
| SQL     | 7219 |
| Excel   | 4611 |
| Python  | 4430|
| Tableau | 3745 |
| Power BI| 2609 |
Table of the demand for the top 5 skills in the data analyst postings.
## 4.Skills Based on Salary
Exploring the average salaries associated with different skills revealed which skills are the highest paying
```sql
SELECT 
    skills,
    ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = 'True'
GROUP BY
    skills
ORDER BY
    avg_salary DESC
LIMIT 25
```
Here is the results of the results for the top paying skills for the data analyist role

1. Big Data, Python & ML = High Pay
   - PySpark, Pandas, NumPy, DataRobot, and Scikit-learn show strong demand for large-scale data processing and machine learning skills.

2. Cloud & DevOps Skills Boost Salaries
   - GCP, Kubernetes, Jenkins, GitLab, Bitbucket, and Linux expertise make analysts more valuable due to scalable, automated workflows.

3. Specialized Programming & Data Tools Matter
   - Niche languages (Go, Swift, Scala) and databases/search engines (PostgreSQL, Couchbase, Elasticsearch, MicroStrategy) are highly rewarded.

| Rank | Skill           | Avg Salary ($) |
|:----:|-----------------|---------------:|
| 1    | PySpark         | 208,172        |
| 2    | Bitbucket       | 189,155        |
| 3    | Couchbase       | 160,515        |
| 4    | Watson          | 160,515        |
| 5    | DataRobot       | 155,486        |
| 6    | GitLab          | 154,500        |
| 7    | Swift           | 153,750        |
| 8    | Jupyter         | 152,777        |
| 9    | Pandas          | 151,821        |
| 10   | Elasticsearch   | 145,000        |

Table of the average salary for the top 10 paying skills for data analysts.
### 5. Most Optimal Skills to Learn
Combining insights from demand and salary data, the query aimed to pinpoint skills that are both high in demand and have high salaries, offering a strategic focus for skill develompent.
```sql
WITH skills_demand AS (
    SELECT 
        skills_dim.skill_id,
        skills_dim.skills,
        COUNT(skills_job_dim.job_id) AS demand_count
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True
GROUP BY
    skills_dim.skill_id

), average_salary AS (
    SELECT
        skills_job_dim.skill_id, 
        ROUND(AVG(salary_year_avg), 0) AS avg_salary
FROM job_postings_fact
INNER JOIN skills_job_dim ON job_postings_fact.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
WHERE
    job_title_short = 'Data Analyst'
    AND salary_year_avg IS NOT NULL
    AND job_work_from_home = True
GROUP BY
    skills_job_dim.skill_id
)

SELECT
    skills_demand.skill_id,
    skills_demand.skills,
    demand_count,
    avg_salary
FROM 
    skills_demand
INNER JOIN average_salary ON skills_demand.skill_id = average_salary.skill_id
WHERE
    demand_count > 10
ORDER BY  
    avg_salary DESC,
    demand_count DESC 
LIMIT 25
```
| skill_id | skills | demand_count | avg_salary |
|:-----------|:-----------|:---------------|:-------------|
| 8 | go | 27 | 115320 |
| 234 | confluence | 11 | 114210 |
| 97 | hadoop | 22 | 113193 |
| 80 | snowflake | 37 | 112948 |
| 74 | azure | 34 | 111225 |
| 77 | bigquery | 13 | 109654 |
| 76 | aws | 32 | 108317 |
| 4 | java | 17 | 106906 |
| 194 | ssis | 12 | 106683 |
| 233 | jira | 20 | 104918 |

Table of the most optimal skills for data analysts sorted by salary

- **High-Demand Programming Languages:** 
Python and R stand out for their high demand, with demand counts of 236 and 148 respectively. Despite their high demand, their average salaries are around $101,397 for python and $100,499 for R indicating that proficiency in these languages is highly valued but also widely available.
- **Cloud tools and Technology:** 
Skills in these specialized technologies such as Snowflake, Azure and BigQuery show significant demand with relatively high average salaries, pointing towards the growing importance of cloud platforms and big data technologies in data analysis.
- **Business Intelligence and Visualization tools:** Tableau and Looker, with demand counts of 230 and 49 respectively, and average salaries around $99,288 and $103,795, highlight the critical role of data visualization and business intelligence in deriving actionable insights from data.
- **Database Technologies:** The demand for skills in the traditional and NoSQL databases(Oracle, SQL Server, NoSQL) With average salaries ranging from $97,786 to $104,534, reflects the enduring need for data storage, retrieval and management expertise.
# What I Learned
Throughout this lesson I learned both basic and advance SQL queries.
- **Complex Query Crafting** I learned CTE's and being able to merge different important tables together in order to find insight on problems that needed solving.
-**Data Aggregation** Got used to the GROUP BY and turned COUNT() and AVG() to help summerize my data.
-**Answered Questions Using SQL** I solved real world problems using SQL Queries to turn questions into actionable insights.
# Conclusions

### Insights
1. **Top-Paying Data Analyst Jobs**: The highest-paying jobs for data analysts that allow remote work offer a wide range of salaries, the highest at $650,00!
2. **Skills for Top-Paying Jobs**: High-paying data analyst jobs require advanced proficenct in SQL, suggesting it's a critical skill for earning a top salary.
3. **Most In-Demand Skills**: SQL is also the most demanded skill in the data analyst job market, thus making it essential for job seekers.
4. **Skills with Higher Salaries**: Specializad skills, such as SVN and Solidity, are associated with the highest average salaries, indicating a premium on eiche expertise.
5. **Optimal Skills for Job Market Value** SQL leads in demand and offers for a high average salary, positioning it as one of the most optimal skills for data analysts to learn to maximize their market value.
### Closing Thoughts
This project helped develop my SQL skills and gained insight into the data analyst job market. The findings from the analysis serve as a guide to priortizing skill development and job search efforts. Aspiring data analysts can better position themselves in a competitive job market by focusing on high-demand, high-salary skills. This exploration highlights the importance of continous learning and adaptation to emerging trends in the field of data analytics.