# COVID_19
A Look at Covid 19 cases in United States of America


### PROJECT OVERVIEW
This project looks at Covid 19 statistics in USA from January 2024 to May 2024. A lot of sql queries were done to explore and understand the data. 


### DATA SOURCE
This data is gotten from "Covid_19_US" file 


### TOOLS
- Excel
- SQL

### UNDERSTANDING THE DATA STRUCTURE


![Screenshot 2024-06-26 005354](https://github.com/NStanley0524/Covid_19-SQL/assets/169830658/2d6b93c5-06e9-47d9-b17f-8e56bda56de6)


This data is made up of 4 **Columns** and 18 **Rows**. The columns are thus:

**S/N**: This is the Serial number of the cases

**Date**: This is the dates the cases were recorded.

**Cases**: This is the number of covid 19 cases recorded in Brazil

**Deaths**: This represents the number of deaths from each case

### DATA EXPLORATION
SQL queries were used on this dataset inorder to answer a lot of business questions. To get the full code, [Click here](https://github.com/NStanley0524/Covid_19-SQL/blob/main/Covid%20sql%20USA.sql).

To understand the dataset, i pulled out all the records with the code below

```sql
SELECT * FROM covid19_usa;
```



Outlined below are the key steps and SQL quesries used to explore the data and answer some business questions:



**1. WHAT ARE THE TOTAL NUMBER OF COVID 19 CASES FOR EACH MONTH?**

The following query was used:

```sql
SELECT DISTINCT
    (MONTHNAME(date)) AS Month, SUM(cases) AS 'Total cases'
FROM
    covid19_usa
GROUP BY MONTHNAME(date)
ORDER BY SUM(cases) DESC;
```



The result here shows that May has the highest number of cases in each month, January nad February had 0 cases. "*Monthname*" was used to extract the month in each case.



**2. WHAT ARE THE TOTAL NUMBER OF DEATHS FOR EACH MONTH?**

The following query was used:

```sql
SELECT DISTINCT
    (MONTHNAME(date)) AS Month, SUM(deaths) AS 'Total deaths'
FROM
    covid19_usa
GROUP BY MONTHNAME(date)
ORDER BY SUM(deaths) DESC;
```



The resulthere shows May to also top tghe death rankings.



**3. WHAT PERCENTAGE OF PEOPLE DIED FROM EACH CASES?**

To answer the following question, the below query was used. Death percentage was calculated by dividing the number of deaths by the number of cases and multiplying the result by 100.

```sql
SELECT DISTINCT
    (MONTHNAME(date)) AS Month,
    SUM(cases) AS Cases,
    SUM(Deaths) AS Death,
    (SUM(deaths) / SUM(cases)) * 100 AS 'Death Percentage'
FROM
    covid19_usa
GROUP BY MONTHNAME(date);
```



From this query, it can be seen that **April** has the highest percentage of deaths from cases with a **7.10%** compared to May with **6.23%**. What to be noted here is that although April didnt have the highest cases nor deaths, more people died from the cases in April than in May 



**4. HOW MANY PEOPLE SURVIVED FROM THE CASES?**

```sql
SELECT 
    date, cases, deaths, (cases - deaths) AS 'Survived'
FROM
    covid19_usa;
```



The code below shows the nummber of people that survived from each cases.



**5. HOW DOES THE PERCENTAGE OF PEOPLE THAT SURVIVED COMPARES TO THE DEATHS?**

The below query answers the question

```sql
SELECT 
    date,
    cases,
    deaths,
    (deaths / cases) * 100 AS 'percentage Death',
    ((cases - deaths) / cases) * 100 AS 'Percentage Survived'
FROM
    covid19_usa;
```



This query compares the percentage of people that survived the cases to the percentage of people thhat died from the cases.



**6. SUMMARIZE YOUR FINDING BY MONTHS**

```sql
SELECT DISTINCT
    (MONTHNAME(date)) AS Month,
    SUM(cases) AS Cases,
    SUM(deaths) AS Deaths,
    (SUM(deaths) / SUM(cases)) * 100 AS 'Death Percentage',
    (SUM(cases - deaths) / SUM(cases)) * 100 AS 'Percentage Survived'
FROM
    covid19_usa
GROUP BY MONTHNAME(date);
```



### RECOMMENDATION
1. Covid 19 rates are still increasing and so are the deaths. Efforts should be made towards curbing this growing problem

2. Authorities should use this data as a reference point to understand the health and wellbeing of their society.



### CONCLUSION
The business questions asked helped to uncover some insights on the covid 19 cases in Brazil and this will help Authorities and Organisations to further look into the various ways to mitigate this problems.  
