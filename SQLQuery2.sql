Select top 5 [dbo].[Sample - Superstore cleaned].[Product_Name],Round(Sum(Sales),2) as Total_Sales 
from 
[dbo].[Sample - Superstore cleaned] 
group by [Product_Name] 
order by Total_Sales desc;


Select count(*) as Total_Rows From [dbo].[Sample - Superstore cleaned];


SELECT Category,
       SUM(Sales) AS Total_Sales
FROM [dbo].[Sample - Superstore cleaned]
GROUP BY Category
ORDER BY Total_Sales DESC;

Select [Region] ,
ROUND(SUM([Sales]),2) AS SALES,
ROUND(SUM([Profit]),2) AS PROFIT 
FROM [dbo].[Sample - Superstore cleaned]
GROUP BY [Region] 
ORDER BY SALES DESC ;


--Only negative rows are included, so it sums only loss transactions, not the full net result.
SELECT TOP 5 [Product_Name],
ROUND(SUM([Profit]),2) AS LOSS
FROM [dbo].[Sample - Superstore cleaned]
WHERE [Profit] <0 
GROUP BY [Product_Name]
ORDER BY LOSS ASC;

--Total net profit of a product, and keeps only products whose final total is negative.
SELECT TOP 5 [Product_Name],
       ROUND(SUM([Profit]), 2) AS Loss
FROM [dbo].[Sample - Superstore cleaned]
GROUP BY [Product_Name]
HAVING SUM([Profit]) < 0
ORDER BY Loss ASC;
                         


SELECT
  YEAR([Order_Date]) AS Year,
  MONTH([Order_Date]) AS Month,
  ROUND(SUM(Sales), 2) AS Monthly_Sales,
  ROUND(SUM(Profit), 2) AS Monthly_Profit
FROM [dbo].[Sample - Superstore cleaned]
GROUP BY YEAR([Order_Date]), MONTH([Order_Date])
ORDER BY year,month;


SELECT
[Sub_Category],
ROUND(SUM([Sales]),2) AS Sales,
ROUND(SUM([Profit]),2) AS Profit,
ROUND(Sum([Profit])/sum([Sales]) *100,1) as Profit_Rate 
from [dbo].[Sample - Superstore cleaned] 
group by [Sub_Category]
order by Profit_Rate;
