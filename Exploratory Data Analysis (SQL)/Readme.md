# Exploratory Data Analysis (SQL)

## Data Pre-Proceessing

## Result

### Sales Analysis

#### What is the total revenue generated over year?

```sql -- 1. What is the total revenue generated over year?
SELECT DATENAME(YEAR, [Invoice Date]) AS 'YEAR',SUM ([Total Sales]) AS [Total Revenue]
FROM dbo.Kaggle_Adidas_US_Sale
GROUP BY DATENAME(YEAR, [Invoice Date])
``` 


#### What are the top5 product over year?

```sql

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
``` 
#### What is the average daily sales value by retailer?
```sql
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

```

### Customer Analysis

#### What are the top region/ state/ city for sales?
``` sql
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
```

```sql
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
```

#### What Sales methods are the top 3 for sales?
```sql
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
```

### Product Analysis

#### Which categories of product are the most popular(apparel/ footwear)?

```sql
--2020 & 2021
SELECT 
    [Product by categories],
    [Year],
    SUM([Units Sold]) AS [Total units sold]
FROM (
    SELECT 
        CASE
            WHEN [Product] LIKE '%Apparel' THEN 'Apparel'
            WHEN [Product] LIKE '%Footwear' THEN 'Footwear'
        END AS [Product by categories],
        DATENAME(YEAR, [Invoice Date]) AS [Year],
        [Units Sold]
    FROM dbo.Kaggle_Adidas_US_Sale
) AS subquery
GROUP BY 
    [Product by categories],
    [Year]
ORDER BY 
    [Year] ;
```


#### Men’s or Female’s product is more popular?
```sql
--2020 & 2021
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
```


#### What are the average product ordered?

```sql
SELECT 
DATENAME(YEAR, [Invoice Date]) AS [Year], AVG([Units Sold]) AS [Average Unit sold]
FROM dbo.Kaggle_Adidas_US_Sale
GROUP BY DATENAME(YEAR, [Invoice Date])
ORDER BY DATENAME(YEAR, [Invoice Date])
```

### Profitability Analysis

#### What is the profit margin for different product or categories?

##### By Product
```sql
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
```

##### By Categories (4 tables join)

```sql
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
```




#### How does profitability vary different Sales methods?

```sql
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
```
