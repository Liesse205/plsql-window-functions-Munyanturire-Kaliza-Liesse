# plsql-window-functions-Munyanturire-Kaliza-Liesse
Names: Munyanturire Kaliza Liesse
ID: 28410
Database development with pl/sql Assignment
## Step 1: Problem Definition
•	Business Context: A mid-sized commercial retailer company in the department of sales and marketing analytics in the consumer electronics and gadgets industry selling products like phones, laptops, headphones and smart watches across different regions in Rwanda.

•	Data Challenge: The Company struggles in finding insights into the best performing products in different regions and time periods. The company also wants to keep track of customer purchasing trends, sales growth and prediction of future demands.

•	Expected Outcome
 Generate insights on: 
	Top performing products based on regions to improve regional sales strategies
	Sales trends and rate of Sales growth
	Customer segmentation for personalized promotional campaigns.

## Step 2: Success Criteria
Measurable Goals
1.	Top 5 products per region/quarter-RANK()
To determine the top 5 products which generate the most revenue in each region or quarter the RANK () function will be used.
2.	Running monthly sales totals-SUM() OVER()
To track cumulative sales revenue across the year to understand the total progress towards the overall annual targets. 
3.	Month-over-month growth-LAG() LEAD()
To calculate the  percentage change in sales from the previous month to quickly identify periods of rapid growth or decline which could be a result of promotional effectiveness. 
4.	Customer quartiles-NTILE()
To group customers into quartiles (top spenders, high spenders, medium spenders and low spenders) based on their revenue contribution to enhance marketing strategies based on the particular segments.
5.	3-Month moving averages-AVG() OVER()
To even out short-term fluctuations and easily predict longer-term sales trends of the moving average values compared with actual monthly sales which is essential for budget planning.

Step 3: Database Schema

![table](https://github.com/Liesse205/plsql-window-functions-Munyanturire-Kaliza-Liesse/blob/main/Step%203%20table.png?raw=true)
