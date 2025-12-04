/* What skills are required for top paying Data Analyst roles?
-Use the top paying Data Analyst jobs from your first query
-Add the specific skills required for these roles
-Why? It provides a detailed look at which high-paying jobs demand certain skills,
helping job seekers understand which skills to develop that align with top salaries*/
 
WITH top_paying_jobs AS (
    
SELECT 
    job_id,
    job_title,
    salary_year_avg,
    name AS webname,
    job_location
    from 
    job_postings_fact
LEFT JOIN company_dim ON job_postings_fact.company_id = company_dim.company_id
WHERE
    job_title_short = 'Data Analyst' AND
    job_location ='Anywhere' AND
    salary_year_avg IS NOT NULL
ORDER BY
    salary_year_avg DESC
LIMIT 10
 )

SELECT top_paying_jobs.*,
skills
FROM top_paying_jobs
INNER JOIN skills_job_dim ON top_paying_jobs.job_id = skills_job_dim.job_id
INNER JOIN skills_dim ON skills_job_dim.skill_id = skills_dim.skill_id
ORDER BY
 salary_year_avg DESC

 /* The data below shows that SQL and Python are the top skills in demand, followed by Spark, Hadoop, and Excel
 [
  {
    "job_id": 1180796,
    "job_title": "Data Analyst, Growth",
    "salary_year_avg": "111175.0",
    "webname": "Stripe",
    "job_location": "Canada",
    "skills": "sql"
  },
  {
    "job_id": 1180796,
    "job_title": "Data Analyst, Growth",
    "salary_year_avg": "111175.0",
    "webname": "Stripe",
    "job_location": "Canada",
    "skills": "python"
  },
  {
    "job_id": 1180796,
    "job_title": "Data Analyst, Growth",
    "salary_year_avg": "111175.0",
    "webname": "Stripe",
    "job_location": "Canada",
    "skills": "spark"
  },
  {
    "job_id": 1180796,
    "job_title": "Data Analyst, Growth",
    "salary_year_avg": "111175.0",
    "webname": "Stripe",
    "job_location": "Canada",
    "skills": "hadoop"
  },
  {
    "job_id": 205303,
    "job_title": "Data Analyst, Risk User Experience",
    "salary_year_avg": "111175.0",
    "webname": "Stripe",
    "job_location": "Canada",
    "skills": "sql"
  },
  {
    "job_id": 205303,
    "job_title": "Data Analyst, Risk User Experience",
    "salary_year_avg": "111175.0",
    "webname": "Stripe",
    "job_location": "Canada",
    "skills": "python"
  },
  {
    "job_id": 205303,
    "job_title": "Data Analyst, Risk User Experience",
    "salary_year_avg": "111175.0",
    "webname": "Stripe",
    "job_location": "Canada",
    "skills": "spark"
  },
  {
    "job_id": 205303,
    "job_title": "Data Analyst, Risk User Experience",
    "salary_year_avg": "111175.0",
    "webname": "Stripe",
    "job_location": "Canada",
    "skills": "hadoop"
  },
  {
    "job_id": 409209,
    "job_title": "Data Analyst (VBA, Tableau)",
    "salary_year_avg": "109000.0",
    "webname": "Sun Life",
    "job_location": "Canada",
    "skills": "sql"
  },
  {
    "job_id": 409209,
    "job_title": "Data Analyst (VBA, Tableau)",
    "salary_year_avg": "109000.0",
    "webname": "Sun Life",
    "job_location": "Canada",
    "skills": "python"
  },
  {
    "job_id": 409209,
    "job_title": "Data Analyst (VBA, Tableau)",
    "salary_year_avg": "109000.0",
    "webname": "Sun Life",
    "job_location": "Canada",
    "skills": "vba"
  },
  {
    "job_id": 409209,
    "job_title": "Data Analyst (VBA, Tableau)",
    "salary_year_avg": "109000.0",
    "webname": "Sun Life",
    "job_location": "Canada",
    "skills": "excel"
  },
  {
    "job_id": 409209,
    "job_title": "Data Analyst (VBA, Tableau)",
    "salary_year_avg": "109000.0",
    "webname": "Sun Life",
    "job_location": "Canada",
    "skills": "tableau"
  },
  {
    "job_id": 629221,
    "job_title": "Analytics Engineering Lead",
    "salary_year_avg": "108415.5",
    "webname": "Swiss Re",
    "job_location": "Canada",
    "skills": "python"
  },
  {
    "job_id": 629221,
    "job_title": "Analytics Engineering Lead",
    "salary_year_avg": "108415.5",
    "webname": "Swiss Re",
    "job_location": "Canada",
    "skills": "typescript"
  },
  {
    "job_id": 629221,
    "job_title": "Analytics Engineering Lead",
    "salary_year_avg": "108415.5",
    "webname": "Swiss Re",
    "job_location": "Canada",
    "skills": "spark"
  },
  {
    "job_id": 1232872,
    "job_title": "Analytics Lab Architect",
    "salary_year_avg": "101014.0",
    "webname": "Swiss Re",
    "job_location": "Canada",
    "skills": "azure"
  },
  {
    "job_id": 1232872,
    "job_title": "Analytics Lab Architect",
    "salary_year_avg": "101014.0",
    "webname": "Swiss Re",
    "job_location": "Canada",
    "skills": "databricks"
  },
  {
    "job_id": 995289,
    "job_title": "Operation Data Analyst - Genshin Impact",
    "salary_year_avg": "100500.0",
    "webname": "HoYoverse",
    "job_location": "Canada",
    "skills": "sql"
  },
  {
    "job_id": 995289,
    "job_title": "Operation Data Analyst - Genshin Impact",
    "salary_year_avg": "100500.0",
    "webname": "HoYoverse",
    "job_location": "Canada",
    "skills": "python"
  },
  {
    "job_id": 995289,
    "job_title": "Operation Data Analyst - Genshin Impact",
    "salary_year_avg": "100500.0",
    "webname": "HoYoverse",
    "job_location": "Canada",
    "skills": "sas"
  },
  {
    "job_id": 995289,
    "job_title": "Operation Data Analyst - Genshin Impact",
    "salary_year_avg": "100500.0",
    "webname": "HoYoverse",
    "job_location": "Canada",
    "skills": "excel"
  },
  {
    "job_id": 995289,
    "job_title": "Operation Data Analyst - Genshin Impact",
    "salary_year_avg": "100500.0",
    "webname": "HoYoverse",
    "job_location": "Canada",
    "skills": "sas"
  },
  {
    "job_id": 995289,
    "job_title": "Operation Data Analyst - Genshin Impact",
    "salary_year_avg": "100500.0",
    "webname": "HoYoverse",
    "job_location": "Canada",
    "skills": "spss"
  },
  {
    "job_id": 973984,
    "job_title": "Data Analyst - HoYolab and Content Creator",
    "salary_year_avg": "100500.0",
    "webname": "HoYoverse",
    "job_location": "Canada",
    "skills": "sql"
  },
  {
    "job_id": 973984,
    "job_title": "Data Analyst - HoYolab and Content Creator",
    "salary_year_avg": "100500.0",
    "webname": "HoYoverse",
    "job_location": "Canada",
    "skills": "excel"
  },
  {
    "job_id": 149920,
    "job_title": "Data Analyst 2",
    "salary_year_avg": "99150.0",
    "webname": "Zynga",
    "job_location": "Canada",
    "skills": "sql"
  },
  {
    "job_id": 149920,
    "job_title": "Data Analyst 2",
    "salary_year_avg": "99150.0",
    "webname": "Zynga",
    "job_location": "Canada",
    "skills": "python"
  },
  {
    "job_id": 149920,
    "job_title": "Data Analyst 2",
    "salary_year_avg": "99150.0",
    "webname": "Zynga",
    "job_location": "Canada",
    "skills": "spark"
  },
  {
    "job_id": 149920,
    "job_title": "Data Analyst 2",
    "salary_year_avg": "99150.0",
    "webname": "Zynga",
    "job_location": "Canada",
    "skills": "hadoop"
  },
  {
    "job_id": 149920,
    "job_title": "Data Analyst 2",
    "salary_year_avg": "99150.0",
    "webname": "Zynga",
    "job_location": "Canada",
    "skills": "express"
  },
  {
    "job_id": 149920,
    "job_title": "Data Analyst 2",
    "salary_year_avg": "99150.0",
    "webname": "Zynga",
    "job_location": "Canada",
    "skills": "tableau"
  },
  {
    "job_id": 1201997,
    "job_title": "Data Strategy Product Manager",
    "salary_year_avg": "99150.0",
    "webname": "Kinaxis",
    "job_location": "Canada",
    "skills": "sap"
  }
]*/
