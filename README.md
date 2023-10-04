# Adidas Sales Dataset Analysis
Welcome to my Adidas Sales Dataset Analysis project! In this project, I have delved into a comprehensive dataset of Adidas sales, downloaded from Kaggle. The dataset encompasses various aspects of the sales, including revenue, product details, customer information, geographical data, and profitability.

## Objective
The primary objective of this analysis is to gain insights into the sales performance, customer behavior, product popularity, geographical trends, seasonal patterns, and profitability of Adidas products. By utilizing SQL for data manipulation and Tableau for data visualization, I have explored the dataset to answer a series of key questions.

## Dataset
This Dataset can be found on [Kaggle](https://www.kaggle.com/datasets/heemalichaudhari/adidas-sales-dataset), an Adidas sales dataset is a collection of data that includes information on the sales of Adidas products. This type of dataset may include details such as the number of units sold, the total sales revenue, the location of the sales, the type of product sold, and any other relevant information.

## Key Questions Explored
During the analysis, I sought answers to the following questions:

### Sales Analysis
 - What is the total revenue generated over the years? (SQL)
 - What are the top 5 products over the years? (SQL)
 - What is the average daily sales value by retailer? (SQL)
 - What is the peak sales period? (Tableau)

### Customer Analysis
 - What are the top regions, states, and cities for sales? (SQL)
 - Which sales methods are the top 3 for sales? (SQL)

### Geographical Analysis
 - What are the key markets in terms of region, state, and city? (Tableau)
 - Are emerging markets showing growth? (Tableau)

### Seasonal Analysis
 - Are there seasonal trends in sales related to festivals or holidays? (Tableau)


### Profitability Analysis
 - What is the profit margin for different products or categories? (SQL)
 - How does profitability vary across different sales methods? (SQL)

## Tools Used
To perform this analysis, I utilized SQL for data manipulation and exploration, and Tableau for data visualization. These tools allowed me to efficiently analyze the dataset, discover meaningful insights, and present them visually for better understanding.


## EDA (SQL)

The dataset is downloaded in excel format and put into <b>SQL Server Management Studio (SSMS)</b> for data cleaning and wragling which involved handling missing values, standardizing data formats.
Here is the size of the dataset:

![import count](https://github.com/24billys/Adidas-US-Sales/blob/main/import%20counts.PNG)

For the full SQL EDA, please go to [Exploratory Data Analysis (SQL)](https://github.com/24billys/Adidas-US-Sales/tree/main/Exploratory%20Data%20Analysis%20(SQL))

## Data Visualizatioon (Tableau)

Data visualization plays a crucial role in transforming complex datasets into easily understandable visual representations. With Tableau, a powerful data visualization tool, I created visually compelling and interactive dashboards for communicating my insight.

I used Tableau Public for my data visualization, feel free to enter [for more details](https://github.com/24billys/Adidas-US-Sales/tree/main/Data%20Visualization%20(Tableau))
![Dashboard](https://github.com/24billys/Adidas-US-Sales/blob/main/Data%20Visualization%20(Tableau)/Dashboard.PNG)

## Key Findings and Limitation
###Limitation
 - Although this dataset included 2022 data, it shows only the fisrt and the secord of January 2022. It is not enough data for comparing with other year, so I ignored the 2022 data but still keep those data not deleting it.

### Key findings

#### Sales Analysis
 - The total revenue is increased from 182 million in 2020 to 717 million in 2021 which is increased significantly
 - The ranking of top 5 product sold in 2020 is the same of product sold in 2021
 - The sales perfomance of Walmart is the best, however Kohl's and Sports Direct performed not as good as 2020 compare with other retailers
 - The peak Sale period is from Jun 2021 to Dec 2021

#### Customer Analysis
 - In both 2020 and 2021, West region had most sales generated. State and City was New York in 2020 and switched to California and Charleston in 2021
 - In 2020 to 2021, Online shop sales has increased signicificatly. Maybe it dues to the covid breakout changed customers shopping method.


## Conclusion
