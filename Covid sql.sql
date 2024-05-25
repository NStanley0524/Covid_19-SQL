select * from covid19_brazil;


select distinct(monthname(date)) as Month,sum(cases) as "Total cases"from covid19_brazil
group by monthname(date)
order by sum(cases) desc;


select distinct(monthname(date)) as Month,sum(deaths) as "Total deaths"from covid19_brazil
group by monthname(date)
order by sum(deaths) desc;

select sum(cases) as TotalCases from covid19_brazil;

select sum(deaths) as Totaldeaths from covid19_brazil;

select date,cases as "Number of Cases" from covid19_brazil
where cases = 0;

select date,deaths as "Number of deaths" from covid19_brazil
where deaths = 0;

select monthname(date) as Month,sum(cases) as "Number of Cases" from covid19_brazil
group by monthname(date)
order by 2 desc;

select monthname(date) as Month,sum(deaths) as "Number of deaths" from covid19_brazil
group by monthname(date)
order by 2 desc;

select distinct(monthname(date)) as Month,sum(cases) as Cases,sum(Deaths) as Death,(sum(deaths)/sum(cases))*100 as "Death Percentage"
from covid19_brazil
group by monthname(date);

select  date,cases,deaths,(cases-deaths) as "Survived" from covid19_brazil;

select date,cases,deaths,(deaths/cases)*100 as "percentage Death",((cases-deaths)/cases)*100 as "Percentage Survived" from covid19_brazil;

select distinct(monthname(date)) as Month,sum(cases) as Cases,sum(deaths) as Deaths,(sum(deaths)/sum(cases))*100 as "Death Percentage",(sum(cases-deaths)/sum(cases))*100 as "Percentage Survived"
from covid19_brazil
group by monthname(date);

