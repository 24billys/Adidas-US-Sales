# Adidas Sales Dataset Analysis
Welcome to my Adidas Sales Dataset Analysis project! In this project, I have delved into a comprehensive dataset of Adidas sales, downloaded from Kaggle. The dataset encompasses various aspects of the sales, including revenue, product details, customer information, geographical data, and profitability.

# Table of content
 - [Objective](Adidas-US-Sales/tree/main#objective)
 - [Dataset](main#Dataset)
 - [Key Questions Explored](main#Key_Questions_Explored)
 - [Tools Used](main#Tools_Used)
 - [EDA (SQL)](main#EDA_(SQL))
 - [Data Visualizatioon (Tableau)](main#Data_Visualizatioon_(Tableau))
 - [Key Findings and Limitation](main#Key_Findings_and_Limitation)
 - [Conclusion](main#Conclusion)



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
### Limitation
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

#### Product Analysis
 - Both Appeal abd Footware product sold in 2021 had increase over 3 times than 2020,the % of Footwear product has sightly higher than Appeal product
 - IN 2020 total unit sold of women product is higher compared with men's product, however in 2021, men's product sold had a significatly increase and the total unit sold of men's product is higher than women's
 - The 2020 total product sold are 3 times more than 2021
#### Geographical Analysis

 - In 2020 the sales are just include few cities in US, I cover most of the cities including Hawaii and Alaska
   
#### Seasonal Analysis

 - There is no direct relationship between US holiday and sales, however there were still few holidays received a high sales quatity(i.e. 2020 Chrismas week)

#### Profitability Analysis
 - compare between 2020 and 2021, Men's Apparel, Men's Street Footwear and Women's Street Footwear got a decrease in operating margin, the other product got an increase in operating margin.
 - Specific in Apparel product, men's operating margin was decreased over year and women's was increased from 2020 to 2021
 - Specific in Footwear product, both men's and women's got an increase in operating margin from 2020 to 2021
 - Online store remain the highest operating margin in both 2020 and 2021, Outlet store increased from 37% to 40%, In-store increased from 33% to 36%

## Conclusion
The Key findings can give the stalkholder a clear and valuable insights about the sale performance and distribution on Adidas, for understanding the key product, target customers, key cities and the best selling method. It can lead adidas for increasing their sales and revenues, ultimately produce more profit for company development. However one thing to mention about this dataset, there is a quite large sales amount different between 2020 and 2021. We need to make sure that the data collection is valid and double check with the database we have got when it is in actual scenario.
