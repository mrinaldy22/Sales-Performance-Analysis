# 📊 PT Sejahtera Bersama - Sales Performance Analysis (2020-2021)

**Role:** Business Intelligence Analyst Intern (Bank Muamalat x Rakamin Academy)  
**Tools Used:** Microsoft Excel, SQL (Google BigQuery), Looker Studio

## 📌 Project Overview
PT Sejahtera Bersama is a retail company specializing in technology hardware and digital educational products. The management needed to evaluate their sales performance from January 2020 to December 2021. The main objective of this project is to build an interactive dashboard to monitor key metrics and provide data-driven strategic recommendations to maintain and boost overall revenue.

## 🗄️ Data Preparation & Modeling
The raw data consists of 4 relational tables: `Customers`, `Orders`, `Products`, and `ProductCategory`. 
Data extraction and transformation were performed using **Google BigQuery** to consolidate these datasets into a single Master Table. 

```sql
-- Example of Data Consolidation Query
WITH table_master AS (
  SELECT 
    o.Date AS order_date,                
    pc.CategoryName AS Category_Name,      
    p.ProdName AS product_name,           
    p.Price AS product_price,             
    o.Quantity AS order_qty,              
    (p.Price * o.Quantity) AS total_sales, 
    SPLIT(c.CustomerEmail, '#')[OFFSET(0)] AS cust_email, -- Data Cleaning
    c.CustomerCity AS cust_city
  FROM `pbi.Customers` c
  JOIN `pbi.Orders` o ON c.CustomerID = o.CustomerID
  JOIN `pbi.Products` p ON o.ProdNumber = p.ProdNumber
  JOIN `pbi.ProductCategory` pc ON p.Category = pc.CategoryID
)
SELECT * FROM table_master ORDER BY 1 ASC;
```
📈 Dashboard Visualization
The clean dataset was then connected to Looker Studio to build an interactive end-to-end performance dashboard.
([dashboard.png])

🔗 [Click here to view the interactive Looker Studio Dashboard](https://lookerstudio.google.com/reporting/57cd44b6-bba2-4a3e-8891-7a5243e8a6f8)

💡 Key Business Insights
Product Performance: Hardware products (Robots, Drones) are the primary revenue drivers, while digital products (eBooks, Training Videos) generate the highest transaction volume.

Geographical Trends: Sales are highly concentrated in top-tier markets like Washington and Houston, revealing significantly low market penetration in cities like Miami and Springfield.

Seasonality: Historical data shows consistent seasonal buying trends, with noticeable sales peaks occurring around mid-year and year-end.

🎯 Strategic Recommendations
Implement Product Bundling: Launch a cross-selling strategy by bundling high-volume digital products with high-value hardware to increase the Average Order Value (AOV).

Deploy Geo-Targeted Campaigns: Launch localized marketing campaigns to improve brand presence in underperforming cities, while sustaining VIP loyalty programs in dominant markets.

Proactive Seasonal Planning: Proactively align inventory and marketing budgets 1-2 months ahead of historical peak periods to fully maximize revenue potential.
