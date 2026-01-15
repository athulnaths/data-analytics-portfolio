# Query Analysis

-- 01. Total Revenue & Units Sold 
SELECT 
    SUM(revenue_usd) AS total_revenue,
    SUM(units_sold) AS total_units_sold
FROM nike_sales_2024;

-- 02. Total Revenue by Region 
SELECT 
    Region, SUM(Revenue_USD) AS Total_Revenue
FROM
    nike_sales_2024
GROUP BY Region
ORDER BY Total_Revenue DESC;

-- 03. Top 5 Regions by units sold 
SELECT 
    Region, SUM(Units_Sold) AS Total_Units
FROM
    nike_sales_2024
GROUP BY Region
ORDER BY Total_Units DESC
LIMIT 5;

-- 04. Revenue Contribution by Product Line 
SELECT 
    Product_Line, sub_category, SUM(Units_Sold) AS Total_Units, SUM(revenue_usd) AS total_revenue
FROM
    nike_sales_2024
GROUP BY Product_Line, sub_category
ORDER BY Total_Units DESC
LIMIT 10;

-- 05. Revenue by Price Tier
SELECT 
    price_tier,
    SUM(revenue_usd) AS total_revenue,
    ROUND(SUM(revenue_usd) / SUM(units_sold), 2) AS avg_revenue_per_unit
FROM nike_sales_2024
GROUP BY price_tier
ORDER BY total_revenue DESC;


 -- 06. Average online sales percentage for each sub-category 
SELECT 
    Sub_Category,
    AVG(Online_Sales_Percentage) AS Avg_Online_Percentage
FROM
    nike_sales_2024
GROUP BY Sub_Category
ORDER BY Avg_Online_Percentage DESC;

-- 07. Monthly Units Sold by Region
SELECT 
    Month, Region, SUM(Units_Sold) AS Total_Units, SUM(revenue_usd) AS monthly_revenue
FROM
    nike_sales_2024
GROUP BY Month , Region
ORDER BY Month , Total_Units DESC;

-- 08. Seasonal Trends in Units Sold
SELECT 
    Month, SUM(Units_Sold) AS Total_Units
FROM
    nike_sales_2024
GROUP BY Month
ORDER BY FIELD(Month,
        'January',
        'February',
        'March',
        'April',
        'May',
        'June',
        'July',
        'August',
        'September',
        'October',
        'November',
        'December');

-- 09.  Average Online Sales Percentage by Subcategory
SELECT 
    Month, AVG(Online_Sales_Percentage) AS Avg_Online_Sales
FROM
    nike_sales_2024
GROUP BY Month
ORDER BY FIELD(Month,
        'January',
        'February',
        'March',
        'April',
        'May',
        'June',
        'July',
        'August',
        'September',
        'October',
        'November',
        'December');

-- 10. Product Lines with Maximum Revenue in India 
SELECT 
    Product_Line, SUM(Revenue_USD) AS Total_Revenue
FROM
    nike_sales_2024
WHERE
    Region = 'India'
GROUP BY Product_Line
ORDER BY Total_Revenue DESC;

-- 11. Top Regions with Most Affordable Products
SELECT 
    Region, AVG(Retail_Price) AS Avg_Price
FROM
    nike_sales_2024
GROUP BY Region
ORDER BY Avg_Price ASC;

-- 12. Regions with high online sales and high revenue 
SELECT 
    region,
    ROUND(AVG(online_sales_percentage), 2) AS avg_online_sales_pct,
    SUM(revenue_usd) AS total_revenue
FROM
    nike_sales_2024
GROUP BY region
ORDER BY avg_online_sales_pct DESC , total_revenue DESC;

-- 13. Monthly online sales by region 
SELECT 
    region,
    month,
    ROUND(AVG(online_sales_percentage), 2) AS avg_online_sales_pct
FROM
    nike_sales_2024
GROUP BY region , month
ORDER BY region , avg_online_sales_pct DESC;

-- 14. Top online sales regions 
SELECT 
    region,
    ROUND(AVG(online_sales_percentage), 2) AS avg_online_sales_pct
FROM
    nike_sales_2024
GROUP BY region
HAVING AVG(online_sales_percentage) > (SELECT 
        AVG(online_sales_percentage)
    FROM
        nike_sales_2024)
ORDER BY avg_online_sales_pct DESC;

