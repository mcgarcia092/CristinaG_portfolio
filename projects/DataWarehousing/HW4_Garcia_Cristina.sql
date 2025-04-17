
SHOW TABLES;

-- 4.Create a data cube that consists of revenues generated from each city, country combination; order the results in descending order of revenues. Based on your result, which city produced the highest revenues?  

SELECT
    cd.Country,
    cd.City,
    SUM(ft.Revenue) AS total_revenue
FROM
    FactTable ft, CustomerDimension cd
WHERE
ft.CustomerID = cd.CustomerID  
GROUP BY
    cd.Country, cd.City
ORDER BY
    total_revenue DESC;




-- Result: Based on your results, which city produced the highest revenues?  

-- Cunewalde

-- 5.You are interested in understanding the sales trend over time. Please write a query to generate a data cube that would list total revenues in each month over time. 

SELECT
    td.Year,
    td.Month,
    SUM(ft.Revenue) AS total_revenue
FROM
    FactTable ft, TimeDimension td
WHERE
ft.DateID = td.DateID
GROUP BY
    td.Year, td.Month
ORDER BY
    total_revenue DESC;




-- 6.	Generate a data cube that shows product category sales in each quarter of 1997. In order to see if there is clearly sales trend for each product category, you want to show category first and then quarter, and then the quarterly sales of the category.  
SELECT
    pd.CategoryName,
    td.Quarter,
    SUM(ft.Revenue) AS Quartely_Sales
FROM
    FactTable ft
JOIN
    ProductDimension pd ON ft.ProductID = pd.ProductID  
JOIN
    TimeDimension td ON ft.DateID = td.DateID  
WHERE
    td.year = 1997  
GROUP BY
    pd.CategoryName, td.Quarter 
ORDER BY
    pd.CategoryName, td.Quarter;

