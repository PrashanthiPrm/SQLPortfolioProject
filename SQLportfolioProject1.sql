/* 
Covid 19 US-Data Exploration 
*/


Select * 
From PortfolioProject1..USCounties
order by 1,2


-- Select data that we are going to be starting with

Select date,state,county,cases,deaths
From PortfolioProject1..USCounties
order by 1,2

-- Cases vs Deaths

Select date,state,county,cases,deaths, ((try_cast(deaths as int))/nullif(try_cast(cases as int),0))*100 as DeathPercentage
From PortfolioProject1..USCounties
order by state desc

-- Shows likelihood of dying if you contract covid in your county

Select date,state,county,cases,deaths, ((try_cast(deaths as int))/nullif(try_cast(cases as int),0))*100 as DeathPercentage
From PortfolioProject1..USCounties
Where state like '%Georgia%'
order by county


--Counties with Highest Infection Rate 

Select state,county,Max(cases) as HighestInfectionCount
From  PortfolioProject1..USCounties
Group by state,County
order by HighestInfectionCount desc

--Counties with Highest death count

Select state,county,Max(deaths) as HighestDeathsCount
From  PortfolioProject1..USCounties
Group by state,County
order by HighestDeathsCount desc

-- BREAKING THINGS DOWN BY STATE

--States with highest death count

Select state,Max(deaths) as HighestDeathsCount
From  PortfolioProject1..USCounties
Group by state
order by HighestDeathsCount desc

Select state,Max(cases) as HighestCasesCount, Max(deaths) as DeathsCount
From  PortfolioProject1..USCounties
Group by state
order by HighestCasesCount desc

--selecting data from allweeklyexcessdeaths

Select * 
From PortfolioProject1..AllWeeklyExcessDeaths
order by 1,2

-- shows death percentage of population 

Select ["population"], ((cast(cast(["total_deaths"] as numeric) as int))/ (cast(cast(["population"] as numeric) as int)))*100 as PercentDeathPopulation
From PortfolioProject1..AllWeeklyExcessDeaths
order by PercentDeathPopulation desc


-- Showing total of non covid deaths in selected country

Select ["country"], MAX(["non_covid_deaths"]) as TotalNonCovidDeaths
From PortfolioProject1..AllWeeklyExcessDeaths
--Where ["country"] like '%Australia%'
group by ["country"]


--Showing World's total deaths, world's total covid deaths, world's expected deaths, world's excess deaths

Select Sum(cast(cast(["total_deaths"] as numeric) as int)) as WorldTotalDeaths,Sum(cast(cast(["covid_deaths"] as numeric) as int)) as WorldCovidDeaths,
Sum(cast(cast(["expected_deaths"] as numeric) as int)) as WorldExpectedDeaths,Sum(cast(cast(["excess_deaths"] as numeric) as int)) as WorldExcessDeaths
From PortfolioProject1..AllWeeklyExcessDeaths


    
