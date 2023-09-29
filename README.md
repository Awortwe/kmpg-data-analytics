## Purposes Of The Project

The major aim of thie project is to gain insight into the customers of Sprocket Central Pty Ltd to understand the which of the customers should be targeted.

## About Data

```sql
-- Create database
CREATE DATABASE IF NOT EXISTS kmpg;

-- Create table
CREATE TABLE IF NOT EXISTS customers(
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
```

### Analysis List
Customer Analysis

> This analysis aims to uncover the different wealth segments, purchase trends and the profitability of each customer segment.

## Approach Used

1. **Feature Engineering:** This will help use generate some new columns from existing ones.

> 1. Add a new column named `age` to help get the values of age_group that is 0-29:Teenager, 30-49:Adult, 50 or more: Senior

> 2. Add a new column named `age_group` that contains the age group of customers who purchased our goods (Teenager, Adult, Senior). This will help answer the question on which age group purchased our goods more.

2. **Exploratory Data Analysis (EDA):** Exploratory data analysis is done to answer the listed questions and aims of this project.

3. **Conclusion:**


## Business Questions To Answer

### Generic Question

1. How many unique states does the data have?
2. How many customers own a car?

### Customer

1. How many unique customer job_title does the data have?
2. How many unique customer wealth segments does the data have?
3. What is the most common customer wealth segment type?
4. Which customer wealth segment type buys the most?
5. What is the gender of most of the customers?
6. What is the gender distribution per states?
7. Which age group of customers give most purchases?
8. Which age group of customers give most purchases per states?
9. Which state has the best purchases?
10. Which gender has the best purchases?
11. Which of the job industry category has the best purchases?