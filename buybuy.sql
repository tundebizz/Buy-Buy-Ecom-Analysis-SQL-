/*. Time-Profit Analysis
1a. Write a query that returns the total profit made by BuyBuy from 1Q11 to 4Q16 (all quarters of every year).*/

SELECT  sales_year, 
CASE
	WHEN sales_date BETWEEN '2011-01-01' AND '2011-03-31' THEN 'Q1 2011'
	WHEN sales_date BETWEEN '2011-04-01' AND '2011-06-30' THEN 'Q2 2011'
	WHEN sales_date BETWEEN '2011-07-01' AND '2011-09-30' THEN 'Q3 2011'
	WHEN sales_date BETWEEN '2011-10-01' AND '2011-12-31' THEN 'Q4 2011'
	WHEN sales_date BETWEEN '2012-01-01' AND '2012-03-31' THEN 'Q1 2012'
	WHEN sales_date BETWEEN '2012-04-01' AND '2012-06-30' THEN 'Q2 2012'
	WHEN sales_date BETWEEN '2012-07-01' AND '2012-09-30' THEN 'Q3 2012'
	WHEN sales_date BETWEEN '2012-10-01' AND '2012-12-31' THEN 'Q4 2012'
	WHEN sales_date BETWEEN '2013-01-01' AND '2013-03-31' THEN 'Q1 2013'
	WHEN sales_date BETWEEN '2013-04-01' AND '2013-06-30' THEN 'Q2 2013'
	WHEN sales_date BETWEEN '2013-07-01' AND '2013-09-30' THEN 'Q3 2013'
	WHEN sales_date BETWEEN '2013-10-01' AND '2013-12-31' THEN 'Q4 2013'
	WHEN sales_date BETWEEN '2014-01-01' AND '2014-03-31' THEN 'Q1 2014'
	WHEN sales_date BETWEEN '2014-04-01' AND '2014-06-30' THEN 'Q2 2014'
	WHEN sales_date BETWEEN '2014-07-01' AND '2014-09-30' THEN 'Q3 2014'
	WHEN sales_date BETWEEN '2014-10-01' AND '2014-12-31' THEN 'Q4 2014'
	WHEN sales_date BETWEEN '2015-01-01' AND '2015-03-31' THEN 'Q1 2015'
	WHEN sales_date BETWEEN '2015-04-01' AND '2015-06-30' THEN 'Q2 2015'
	WHEN sales_date BETWEEN '2015-07-01' AND '2015-09-30' THEN 'Q3 2015'
	WHEN sales_date BETWEEN '2015-10-01' AND '2015-12-31' THEN 'Q4 2015'
	WHEN sales_date BETWEEN '2016-01-01' AND '2016-03-31' THEN 'Q1 2016'
	WHEN sales_date BETWEEN '2016-04-01' AND '2016-06-30' THEN 'Q2 2016'
	WHEN sales_date BETWEEN '2016-07-01' AND '2016-09-30' THEN 'Q3 2016'
	WHEN sales_date BETWEEN '2016-10-01' AND '2016-12-31' THEN 'Q4 2016'
	END AS Quarters, SUM (revenue-cost) AS Total_profit
FROM sales_data
GROUP BY 1,2
ORDER BY 1

--1b. Write queries that return the total profit made by BuyBuy in Q2 of every year from 2011 to 2016.
SELECT 
CASE
	WHEN sales_date BETWEEN '2011-04-01' AND '2011-06-30' THEN 'Q2 2011'
	WHEN sales_date BETWEEN '2012-04-01' AND '2012-06-30' THEN 'Q2 2012'
	WHEN sales_date BETWEEN '2013-04-01' AND '2013-06-30' THEN 'Q2 2013'
	WHEN sales_date BETWEEN '2014-04-01' AND '2014-06-30' THEN 'Q2 2014'
	WHEN sales_date BETWEEN '2015-04-01' AND '2015-06-30' THEN 'Q2 2015'
	WHEN sales_date BETWEEN '2016-04-01' AND '2016-06-30' THEN 'Q2 2016'
	END AS Quarters, SUM  (revenue-cost) AS Total_profit
FROM sales_data
GROUP BY 1
ORDER BY 1
LIMIT 6

--1c. Write a query that returns the annual profit made by BuyBuy from the year 2011 to 2016.
SELECT sales_year, SUM (revenue-cost) AS Annual_Profit
FROM sales_data
GROUP BY 1
ORDER BY 1



--Region-Profit Analysis
--2a. Write 2 queries that return the countries where BuyBuy has made the most profit and also the least profit of all-time. Your query must display both results on the same output.
SELECT *
FROM (SELECT country, SUM (revenue-cost) AS Profit
FROM sales_data
GROUP BY 1
ORDER BY 2 DESC
	 LIMIT 1 ) tmp
UNION ALL
SELECT * 
FROM (SELECT country, SUM (revenue-cost) AS Profit
FROM sales_data
GROUP BY 1
ORDER BY 2 ASC
	 LIMIT 1) tmp1
	 
/* tmp means temporary table or file that exist on 
database to store the table for a period of time*/

--2bi. Write a query that shows the Top-10 most profitable countries for BuyBuy sales operations from 2011 to 2016
SELECT country, SUM (revenue-cost) AS Profit
FROM sales_data
GROUP BY 1
ORDER BY 2 DESC

--2bii. Write a query that shows the Top-10 most profitable states for BuyBuy sales operations from 2011 to 2016
SELECT country, states, SUM (revenue-cost) AS Profit
FROM sales_data
GROUP BY 1, 2
ORDER BY 2 DESC
LIMIT 10

--ci. Write a query that shows the all-time Top-10 least profitable countries for BuyBuy sales operations.
SELECT country, SUM (revenue-cost) AS Profit
FROM sales_data
GROUP BY 1
ORDER BY 2 ASC

--2cii. Write a query that shows the all Top-10 least profitable states for BuyBuy sales operations from 2011 to 2016
SELECT  country, states, SUM (revenue-cost) AS Profit
FROM sales_data
GROUP BY 1,2
ORDER BY 3 ASC
LIMIT 10


--3. Product-Revenue Analysis--
--a. Write a query that ranks all product categories sold by Buybuy, from least amount to the most amount of all-time revenue generated.
SELECT product_category,SUM(revenue) as All_Time_Revenue
FROM sales_data
GROUP BY 1
ORDER BY 2 ASC

--b. Write a query that returns Top-2 product categories offered by Buybuy with an all-time high number of units sold.
SELECT product_category,SUM(order_quantity) as Unit_sold
FROM sales_data
GROUP BY 1
ORDER BY 2 DESC
LIMIT 2

--c. Write a query that shows the Top 10 highest-grossing products sold by BuyBuy based on all-time profits.
SELECT product, SUM (Revenue-cost) AS all_time_profits
FROM sales_data
GROUP BY 1
ORDER BY 2 DESC
LIMIT 10


