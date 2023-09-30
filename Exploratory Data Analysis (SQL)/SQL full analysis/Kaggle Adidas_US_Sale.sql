-----------------------
-- Addias US Analysis--
-----------------------
begin tran

SELECT *
FROM dbo.Kaggle_Adidas_US_Sale



-- *********************
-- Data Cleaning and checking
-- *********************

-- Delete the first two rows
DELETE TOP(2) fROM dbo.Kaggle_Adidas_US_Sale

-- Change the column name
EXEC sp_rename 'dbo.Kaggle_Adidas_US_Sale.F1', 'Retailer', 'COLUMN';
EXEC sp_rename 'dbo.Kaggle_Adidas_US_Sale.Adidas Sales Database', 'Retailer ID', 'COLUMN';
EXEC sp_rename 'dbo.Kaggle_Adidas_US_Sale.F3', 'Invoice Date', 'COLUMN';
EXEC sp_rename 'dbo.Kaggle_Adidas_US_Sale.F4', 'Region', 'COLUMN';
EXEC sp_rename 'dbo.Kaggle_Adidas_US_Sale.F5', 'State', 'COLUMN';
EXEC sp_rename 'dbo.Kaggle_Adidas_US_Sale.F6', 'City', 'COLUMN';
EXEC sp_rename 'dbo.Kaggle_Adidas_US_Sale.F7', 'Product', 'COLUMN';
EXEC sp_rename 'dbo.Kaggle_Adidas_US_Sale.F8', 'Price per Unit', 'COLUMN';
EXEC sp_rename 'dbo.Kaggle_Adidas_US_Sale.F9', 'Units Sold', 'COLUMN';
EXEC sp_rename 'dbo.Kaggle_Adidas_US_Sale.F10', 'Total Sales', 'COLUMN';
EXEC sp_rename 'dbo.Kaggle_Adidas_US_Sale.F11', 'Operating Profit', 'COLUMN';
EXEC sp_rename 'dbo.Kaggle_Adidas_US_Sale.F12', 'Operating Margin', 'COLUMN';
EXEC sp_rename 'dbo.Kaggle_Adidas_US_Sale.F13', 'Sales Method', 'COLUMN'

-- Delete the first row
DELETE TOP(1) fROM dbo.Kaggle_Adidas_US_Sale

--CHECK NULL data
SELECT * FROM dbo.Kaggle_Adidas_US_Sale
WHERE 'Retailer' IS NULL
OR 'Retailer ID' IS NULL
OR 'Invoice Date' IS NULL
OR 'Region' IS NULL
OR 'State' IS NULL
OR 'City' IS NULL
OR 'Price per Unit' IS NULL
OR 'Units Sold' IS NULL
OR 'Total Sales' IS NULL
OR 'Operating Profit' IS NULL
OR 'Operating Margin' IS NULL
OR 'Sales Method' IS NULL

-- COUNT NULL Data
SELECT 
    SUM(CASE WHEN [Retailer] IS NULL THEN 1 ELSE 0 END) AS Retailer_Null_Count,
	SUM(CASE WHEN [Retailer ID] IS NULL THEN 1 ELSE 0 END) AS Retailer_ID_Null_Count,
	SUM(CASE WHEN [Invoice Date] IS NULL THEN 1 ELSE 0 END) AS Invoice_Date_Null_Count,
	SUM(CASE WHEN [Region] IS NULL THEN 1 ELSE 0 END) AS Region_Null_Count,
    SUM(CASE WHEN [State] IS NULL THEN 1 ELSE 0 END) AS State_Null_Count,
    SUM(CASE WHEN [City] IS NULL THEN 1 ELSE 0 END) AS City_Null_Count,
    SUM(CASE WHEN [Product] IS NULL THEN 1 ELSE 0 END) AS Product_Null_Count,
    SUM(CASE WHEN [Price per Unit] IS NULL THEN 1 ELSE 0 END) AS Price_per_Unit_Null_Count,
    SUM(CASE WHEN [Units Sold] IS NULL THEN 1 ELSE 0 END) AS Units_Sold_Null_Count,
    SUM(CASE WHEN [Total Sales] IS NULL THEN 1 ELSE 0 END) AS Total_Sales_Null_Count,
    SUM(CASE WHEN [Operating Profit] IS NULL THEN 1 ELSE 0 END) AS Operating_Profit_Null_Count,
    SUM(CASE WHEN [Operating Margin] IS NULL THEN 1 ELSE 0 END) AS Operating_Margin_Null_Count,
    SUM(CASE WHEN [Sales Method] IS NULL THEN 1 ELSE 0 END) AS Sales_Method_Null_Count
FROM dbo.Kaggle_Adidas_US_Sale

-- Check data Type

EXEC sp_help [dbo.Kaggle_Adidas_US_Sale]


-- Change Data Type we need

ALTER TABLE dbo.Kaggle_Adidas_US_Sale
ALTER COLUMN [Units Sold] INT

ALTER TABLE dbo.Kaggle_Adidas_US_Sale
ALTER COLUMN [Retailer ID] INT

ALTER TABLE dbo.Kaggle_Adidas_US_Sale
ALTER COLUMN [Invoice Date] DATE



-- *********************
-- Sales Analysis
-- *********************

-- 1. What is the total revenue generated over year?
SELECT DATENAME(YEAR, [Invoice Date]) AS 'YEAR',SUM ([Total Sales]) AS [Total Revenue]
FROM dbo.Kaggle_Adidas_US_Sale
GROUP BY DATENAME(YEAR, [Invoice Date])


--3.What are the top5 product over year?

--2020
SELECT TOP 5 [Product], SUM ([Total Sales]) AS [Total Sale]
FROM dbo.Kaggle_Adidas_US_Sale
WHERE DATENAME(YEAR, [Invoice Date]) = 2020
GROUP BY [Product]
ORDER BY SUM ([Total Sales]) DESC

--2021

SELECT TOP 5 [Product], SUM ([Total Sales]) AS [Total Sale]
FROM dbo.Kaggle_Adidas_US_Sale
WHERE DATENAME(YEAR, [Invoice Date]) = 2021
GROUP BY [Product]
ORDER BY SUM ([Total Sales]) DESC


-- 4.What is the average daily sales value by retailer?

--2020
SELECT [Retailer], AVG ([Total Sales]) AS [Average Daily Sales]
FROM dbo.Kaggle_Adidas_US_Sale
WHERE DATENAME(YEAR, [Invoice Date]) = 2020
GROUP BY [Retailer]
ORDER BY AVG ([Total Sales]) DESC

--2021
SELECT [Retailer], AVG ([Total Sales]) AS [Average Daily Sales]
FROM dbo.Kaggle_Adidas_US_Sale
WHERE DATENAME(YEAR, [Invoice Date]) = 2021
GROUP BY [Retailer]
ORDER BY AVG ([Total Sales]) DESC


-- *********************
-- Customer Analysis
-- *********************

-- 1.What are the top region/ state/ city for sales?

--2020

--Region
SELECT TOP 1 [Region], SUM ([Total Sales]) AS [Total Sale]
FROM dbo.Kaggle_Adidas_US_Sale
WHERE DATENAME(YEAR, [Invoice Date]) = 2020
GROUP BY [Region]
ORDER BY SUM ([Total Sales]) DESC

--State

SELECT TOP 1 [State], SUM ([Total Sales]) AS [Total Sale]
FROM dbo.Kaggle_Adidas_US_Sale
WHERE DATENAME(YEAR, [Invoice Date]) = 2020
GROUP BY [State]
ORDER BY SUM ([Total Sales]) DESC


-- City

SELECT TOP 1 [City], SUM ([Total Sales]) AS [Total Sale]
FROM dbo.Kaggle_Adidas_US_Sale
WHERE DATENAME(YEAR, [Invoice Date]) = 2020
GROUP BY [City]
ORDER BY SUM ([Total Sales]) DESC


--2021

--Region
SELECT TOP 1 [Region], SUM ([Total Sales]) AS [Total Sale]
FROM dbo.Kaggle_Adidas_US_Sale
WHERE DATENAME(YEAR, [Invoice Date]) = 2021
GROUP BY [Region]
ORDER BY SUM ([Total Sales]) DESC

--State

SELECT TOP 1 [State], SUM ([Total Sales]) AS [Total Sale]
FROM dbo.Kaggle_Adidas_US_Sale
WHERE DATENAME(YEAR, [Invoice Date]) = 2021
GROUP BY [State]
ORDER BY SUM ([Total Sales]) DESC


-- City

SELECT TOP 1 [City], SUM ([Total Sales]) AS [Total Sale]
FROM dbo.Kaggle_Adidas_US_Sale
WHERE DATENAME(YEAR, [Invoice Date]) = 2021
GROUP BY [City]
ORDER BY SUM ([Total Sales]) DESC


-- 2.What Sales methods are the top 3 for sales?

--2020

SELECT TOP 3 [Sales Method], SUM ([Total Sales]) AS [Total Sale]
FROM dbo.Kaggle_Adidas_US_Sale
WHERE DATENAME(YEAR, [Invoice Date]) = 2020
GROUP BY [Sales Method]
ORDER BY SUM ([Total Sales]) DESC

--2021

SELECT TOP 3 [Sales Method], SUM ([Total Sales]) AS [Total Sale]
FROM dbo.Kaggle_Adidas_US_Sale
WHERE DATENAME(YEAR, [Invoice Date]) = 2020
GROUP BY [Sales Method]
ORDER BY SUM ([Total Sales]) DESC

-- *********************
-- Product Analysis
-- *********************

--1. Which categories of product are the most popular


SELECT TOP 3 [Product], SUM ([Units Sold]) AS [Total units sold]
FROM dbo.Kaggle_Adidas_US_Sale
WHERE DATENAME(YEAR, [Invoice Date]) = 2020
GROUP BY [Product]
ORDER BY SUM ([Units Sold]) DESC

--2.Men¡¦s or Female¡¦s product is more popular?

--2020
SELECT 
    [Product by Gender],
    [Year],
    SUM([Units Sold]) AS [Total units sold]
FROM (
    SELECT 
        CASE
            WHEN [Product] LIKE 'Men%' THEN 'Men'
            WHEN [Product] LIKE 'Women%' THEN 'Women'
        END AS [Product by Gender],
        DATENAME(YEAR, [Invoice Date]) AS [Year],
        [Units Sold]
    FROM dbo.Kaggle_Adidas_US_Sale
) AS subquery
GROUP BY 
    [Product by Gender],
    [Year]
ORDER BY 
    [Year] ;


--3.What are the average product ordered ?

SELECT 
DATENAME(YEAR, [Invoice Date]) AS [Year], AVG([Units Sold]) AS [Average Unit sold]
FROM dbo.Kaggle_Adidas_US_Sale
GROUP BY DATENAME(YEAR, [Invoice Date])
ORDER BY DATENAME(YEAR, [Invoice Date])


-- *********************
-- Profitability Analysis
-- *********************

--1.What is the Operating margin for different product or categories?

SELECT
    t1.[Product],
    t1.[2020 Operating Margin %],
    t2.[2021 Operating Margin %]
FROM
    (SELECT
        [Product],
        AVG([Operating Profit] / NULLIF([Total Sales], 0) * 100) AS [2020 Operating Margin %]
    FROM dbo.Kaggle_Adidas_US_Sale
    WHERE DATENAME(YEAR, [Invoice Date]) = '2020'
    GROUP BY [Product]) AS t1
JOIN
    (SELECT
        [Product],
        AVG([Operating Profit] / NULLIF([Total Sales], 0) * 100) AS [2021 Operating Margin %]
    FROM dbo.Kaggle_Adidas_US_Sale
    WHERE DATENAME(YEAR, [Invoice Date]) = '2021'
    GROUP BY [Product]) AS t2
ON t1.[Product] = t2.[Product];

---------------By categories----------------4 tables join


SELECT
    t1.[Categories],
    t1.[2020 Men Operating Margin %],
    t2.[2020 Women Operating Margin %],
	t3.[2021 Men Operating Margin %],
	t4.[2021 Women Operating Margin %]

--t1-----------------------------------------------------------------------------------------
FROM(
		SELECT 
				[Categories],
				AVG([Operating Profit] / NULLIF([Total Sales], 0) * 100) AS [2020 Men Operating Margin %]
		FROM			(SELECT 
							CASE
								WHEN [Product] LIKE 'Men%' THEN 'Men'
								WHEN [Product] LIKE 'Women%' THEN 'Women'
							END AS [Product by Gender],
							CASE
								WHEN [Product] LIKE '%Apparel%' THEN 'Apparel'
								WHEN [Product] LIKE '%Footwear%' THEN 'Footwear'
							END AS [Categories],
							DATENAME(YEAR, [Invoice Date]) AS [Year],
							[Operating Profit],
							[Total Sales]
						FROM dbo.Kaggle_Adidas_US_Sale
		) AS subquery
		WHERE	[Year] = '2020'
		AND	[Product by Gender] = 'Men'
		GROUP BY [Categories]
) AS t1

--t2-----------------------------------------------------------------------------
JOIN(
		SELECT 
				[Categories],
				AVG([Operating Profit] / NULLIF([Total Sales], 0) * 100) AS [2020 Women Operating Margin %]
		FROM			(SELECT 
							CASE
								WHEN [Product] LIKE 'Men%' THEN 'Men'
								WHEN [Product] LIKE 'Women%' THEN 'Women'
							END AS [Product by Gender],
							CASE
								WHEN [Product] LIKE '%Apparel%' THEN 'Apparel'
								WHEN [Product] LIKE '%Footwear%' THEN 'Footwear'
							END AS [Categories],
							DATENAME(YEAR, [Invoice Date]) AS [Year],
							[Operating Profit],
							[Total Sales]
						FROM dbo.Kaggle_Adidas_US_Sale
		) AS subquery
		WHERE	[Year] = '2020'
		AND	[Product by Gender] = 'Women'
		GROUP BY [Categories]
) AS t2

ON t1.[Categories] = t2.[Categories]

--t3-----------------------------------------------------------------------------

JOIN(
		SELECT 
				[Categories],
				AVG([Operating Profit] / NULLIF([Total Sales], 0) * 100) AS [2021 Men Operating Margin %]
		FROM			(SELECT 
							CASE
								WHEN [Product] LIKE 'Men%' THEN 'Men'
								WHEN [Product] LIKE 'Women%' THEN 'Women'
							END AS [Product by Gender],
							CASE
								WHEN [Product] LIKE '%Apparel%' THEN 'Apparel'
								WHEN [Product] LIKE '%Footwear%' THEN 'Footwear'
							END AS [Categories],
							DATENAME(YEAR, [Invoice Date]) AS [Year],
							[Operating Profit],
							[Total Sales]
						FROM dbo.Kaggle_Adidas_US_Sale
		) AS subquery
		WHERE	[Year] = '2021'
		AND	[Product by Gender] = 'Men'
		GROUP BY [Categories]
) AS t3

ON t2.[Categories] = t3.[Categories]

--t4--------------------------------------------------------------------------
JOIN(
		SELECT 
				[Categories],
				AVG([Operating Profit] / NULLIF([Total Sales], 0) * 100) AS [2021 Women Operating Margin %]
		FROM			(SELECT 
							CASE
								WHEN [Product] LIKE 'Men%' THEN 'Men'
								WHEN [Product] LIKE 'Women%' THEN 'Women'
							END AS [Product by Gender],
							CASE
								WHEN [Product] LIKE '%Apparel%' THEN 'Apparel'
								WHEN [Product] LIKE '%Footwear%' THEN 'Footwear'
							END AS [Categories],
							DATENAME(YEAR, [Invoice Date]) AS [Year],
							[Operating Profit],
							[Total Sales]
						FROM dbo.Kaggle_Adidas_US_Sale
		) AS subquery
		WHERE	[Year] = '2021'
		AND	[Product by Gender] = 'Women'
		GROUP BY [Categories]
) AS t4

ON t3.[Categories] = t4.[Categories];




-- 2. How does profitability vary different Sales methods?


--2020

SELECT	[Sales Method],
		AVG([Operating Margin]*100) AS [2020 Operating Margin %]
FROM	dbo.Kaggle_Adidas_US_Sale
WHERE	DATENAME(YEAR, [Invoice Date]) = '2020'
GROUP BY [Sales Method]
ORDER BY [Sales Method]
		

--2021

SELECT	[Sales Method],
		AVG([Operating Margin]*100) AS [2021 Operating Margin %]
FROM	dbo.Kaggle_Adidas_US_Sale
WHERE	DATENAME(YEAR, [Invoice Date]) = '2021'
GROUP BY [Sales Method]
ORDER BY [Sales Method]

-- rollback
commit