-- Q1. Revenue by region
select region, SUM(sales) as total_revenue
from sales
group by region;

--Q2. Revenue by city
SELECT city, SUM(sales) AS total_revenue
FROM sales
GROUP BY city
ORDER BY total_revenue DESC
limit 5;

--Q3. Revenue by category
SELECT category, SUM(sales) as total_revenue
FROM sales
GROUP BY category
ORDER BY total_revenue DESC;

--Q4. Shipping Type Comparison
select ship_mode, AVG(sales) as avg_revenue
from sales
where ship_mode in ('Standard Class','First Class','Second Class')
group by ship_mode;

--Q5. Customer Segment Type Comparison
select segment, AVG(sales) as avg_revenue
from sales
where segment in ('Consumer', 'Corporate', 'Home Office')
group by segment;

--Q6. Top 5 by total revenue
SELECT 
    product_name, 
    category,
    sub_category,
    SUM(sales) AS total_revenue
FROM sales
GROUP BY product_name, category, sub_category
ORDER BY total_revenue DESC
LIMIT 5;

--Q7. Yearly
SELECT 
    EXTRACT(YEAR FROM order_date) AS year,
    COUNT(order_id) AS total_quantity,
    SUM(sales) AS total_revenue
FROM sales
GROUP BY year
ORDER BY year;

--Q8. Monthly
SELECT
	EXTRACT(MONTH FROM order_date::date) AS month,
	SUM(sales) as total_revenue
FROM sales
where EXTRACT(YEAR FROM order_date::date) = 2018
GROUP BY EXTRACT(MONTH FROM order_date::date)
order by total_revenue desc;

--Q9. In November, desc
SELECT
	product_name, category, sub_category,
	SUM(sales) as total_revenue
from sales
WHERE
	EXTRACT(YEAR FROM order_date::date) = 2018
	AND EXTRACT(MONTH FROM order_date::date) = 11
group by product_name, category, sub_category
order by total_revenue desc
limit 5;

--Q10. In november, asc
SELECT
	product_name, category, sub_category,
	SUM(sales) as total_revenue
from sales
WHERE
	EXTRACT(YEAR FROM order_date::date) = 2018
	AND EXTRACT(MONTH FROM order_date::date) = 11
group by product_name, category, sub_category
order by total_revenue asc
limit 5;