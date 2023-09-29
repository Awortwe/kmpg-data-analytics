CREATE DATABASE IF NOT EXISTS kmpg;

USE kmpg;

CREATE TABLE customers
(
	customer_id INT PRIMARY KEY AUTO_INCREMENT,
    first_name VARCHAR(30),
    last_name VARCHAR(30),
    gender VARCHAR(10),
    past_3_years_bike_related_purchases INT,
    date_of_birth date,
    job_title VARCHAR(100),
    job_industry_category VARCHAR(100),
    wealth_segment VARCHAR(50),
    deceased_indicator VARCHAR(10),
	owns_car VARCHAR(10),
    tenure INT,
    address VARCHAR(100),
    postcode VARCHAR(10),
    state VARCHAR(30),
    country VARCHAR(50),
    property_valuation INT,
    cust_rank INT,
    cust_value FLOAT(8,5)
);

SELECT * FROM customers;

-- --------------------------- FEATURE ENGINEERING --------------------------------------------
ALTER TABLE customers
ADD COLUMN age INT;

UPDATE customers
SET age = (YEAR(now())-YEAR(date_of_birth));

UPDATE customers
SET deceased_indicator = REPLACE(deceased_indicator, 'N', 'No');

UPDATE customers
SET deceased_indicator = REPLACE(deceased_indicator, 'Y', 'Yes');

SELECT DISTINCT state FROM customers;

UPDATE customers
SET state =
CASE 
WHEN state ='QLD' THEN 'Queensland'
WHEN state = 'NSW' THEN 'New South Wales'
WHEN state = 'VIC' THEN 'Victoria'
END;

ALTER TABLE customers
ADD COLUMN age_group VARCHAR(30);

UPDATE customers
SET age_group =
CASE
WHEN age BETWEEN 0 AND 29 THEN 'Teenager'
WHEN age BETWEEN 30 AND 49 THEN 'Adult'
WHEN age >= 50 THEN 'Senior'
ELSE 'Null'
END;

-- --------------------------- DATA EXPLORATION --------------------------------------------
SELECT * FROM customers;
-- How many unique states does the data have?
SELECT DISTINCT state 
FROM customers;

-- How many customers own a car?
SELECT owns_car, COUNT(*)cnt
FROM customers
GROUP BY owns_car
ORDER BY cnt DESC;

-- How many unique customer job industry category does the data have?
SELECT DISTINCT job_industry_category
FROM customers;

-- How many unique customer wealth segments does the data have?
SELECT DISTINCT wealth_segment
FROM customers;

-- What is the most common customer wealth segment type?
SELECT wealth_segment, COUNT(*)cnt
FROM customers
GROUP BY wealth_segment
ORDER BY cnt DESC; 

-- Which customer wealth segment type buys the most?
SELECT wealth_segment, format(SUM(past_3_years_bike_related_purchases),2)qty
FROM customers
GROUP BY wealth_segment
ORDER BY qty DESC;

-- What is the gender of most of the customers?
SELECT gender, COUNT(*)cnt
FROM customers
GROUP BY gender
ORDER BY cnt DESC;

-- What is the gender distribution per states?
SELECT gender, state, COUNT(*)cnt
FROM customers
GROUP BY gender, state
ORDER BY gender;

-- Which age group of customers give most purchases?
SELECT age_group, format(SUM(past_3_years_bike_related_purchases),2)qty
FROM customers
GROUP BY age_group
ORDER BY qty DESC;

-- Which age group of customers give most purchases per states?
SELECT age_group, state, format(SUM(past_3_years_bike_related_purchases),2)qty
FROM customers
GROUP BY age_group, state
ORDER BY qty DESC;

-- Which state has the best purchases?
SELECT state, format(SUM(past_3_years_bike_related_purchases),2)qty
FROM customers
GROUP BY state
ORDER BY qty DESC; 

-- Which gender has the best purchases?
SELECT gender, format(SUM(past_3_years_bike_related_purchases),2)qty
FROM customers
GROUP BY gender
ORDER BY qty DESC;

-- Which job industry category has the best purchases
SELECT job_industry_category, format(SUM(past_3_years_bike_related_purchases),2)qty
FROM customers
GROUP BY job_industry_category
ORDER BY qty DESC;

-- Which age group of customers have the best tenure?
SELECT age_group, format(sum(tenure),2)Tenure
FROM customers
GROUP BY age_group
ORDER BY Tenure DESC;
