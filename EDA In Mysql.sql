#Exploratory Data Analysis (EDA) using SQL
create database World_layoffs;

#Check the table structure to understand the schema, data types, and constraints
DESCRIBE layoffs;

#Check the first few rows to get an idea of the data
select * from layoffs limit 10;

#Check for Missing Values
select company,location,industry,total_laid_off,percentage_laid_off,
stage,country,funds_raised_millions,`date`,count(*) as null_count
from layoffs
where  company || location ||industry||total_laid_off||country ||
percentage_laid_off ||`date`||stage||funds_raised_millions is null
group by company,location,industry,total_laid_off,
percentage_laid_off,stage,country,funds_raised_millions,`date`;

# Summary Statistics
select 
max(total_laid_off) as max_total_laid_off,
avg(total_laid_off) as mean_total_laid_off,
min(total_laid_off) as min_total_laid_off,
STDDEV(total_laid_off) as stddev_total_laid_off ,
max(funds_raised_millions) as max_funds_raised_millions,
avg(funds_raised_millions) as mean_funds_raised_millions,
min(funds_raised_millions) as min_funds_raised_millions,
STDDEV(funds_raised_millions) as stddev_funds_raised_millions
from layoffs;

#minimum and maximum of our Date
select min(`date`) as "minimum Date" ,max(`date`) as "maximum Date"
from layoffs;


#Distribution of Categorical Variables
SELECT company,location,industry,total_laid_off,percentage_laid_off,
stage,country,funds_raised_millions, count(*) AS count_value
FROM layoffs
GROUP BY  company,location,industry,total_laid_off,percentage_laid_off
,stage,country,funds_raised_millions
ORDER BY count_value DESC;

#Detect Duplicates
selecT company,location,industry,total_laid_off,percentage_laid_off
,stage,country,funds_raised_millions, count(*) AS count_value
FROM layoffs
GROUP BY company,location,industry,total_laid_off,percentage_laid_off
,stage,country,funds_raised_millions
having count_value>1;

#Time-Based Analysis
select year(`date`) as "Year" ,count(*) as "Total Number"
from layoffs
GROUP BY year(`date`)
order by year(`date`);

#Companies with the most Total Layoffs
select company,sum(total_laid_off)as sum_total_laid_off 
from layoffs
group by company
order by 2 desc;

# what industry who have max_total_laid_off 
select industry,max(total_laid_off)as max_total_laid_off 
from layoffs
group by industry
order by 2 desc;

# what country  have the most sum_total_laid_off 
select country,sum(total_laid_off)as sum_total_laid_off 
from layoffs
group by country
order by 2 desc;

# what stage  have the most sum_total_laid_off 
select stage,sum(total_laid_off)as sum_total_laid_off 
from layoffs
group by stage
order by 2 desc;












