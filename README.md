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

## Step 3: Database Schema

![table](https://github.com/Liesse205/plsql-window-functions-Munyanturire-Kaliza-Liesse/blob/main/Step%203%20table.png?raw=true)
![diagram](https://github.com/Liesse205/plsql-window-functions-Munyanturire-Kaliza-Liesse/blob/main/er%20diagram.png.png?raw=true)

•	One customer can make many transactions
•	One product can appear in many sales (transactions).

After designing the ER Diagram, I’m going to use the Oracle SQL Developer which I connected to the Oracle Database Express Edition to create and populate tables with data, as those tables will be used to show the implementation of window functions.

	Creation of the tables to be populated with data

Below are the queries used for creating the Customers, Products and Transactions Table. 

![tables](https://github.com/Liesse205/plsql-window-functions-Munyanturire-Kaliza-Liesse/blob/main/Table%20creation.png.png?raw=true)

	Populating the created tables with data

1.	Customers Table
   
The table is made up of 6 deference values.

![tables](https://github.com/Liesse205/plsql-window-functions-Munyanturire-Kaliza-Liesse/blob/main/Customers%20table.png.png?raw=true)

2.	Products Table
   
Contains 6 deference values

![tables](https://github.com/Liesse205/plsql-window-functions-Munyanturire-Kaliza-Liesse/blob/main/Products%20table.png.png?raw=true)

3.	Transactions Table
   
The table below includes 8 deference values

![tables](https://github.com/Liesse205/plsql-window-functions-Munyanturire-Kaliza-Liesse/blob/main/Transactions%20table.png.png?raw=true)


	Display of the created tables

  Customers Table

![tables](https://github.com/Liesse205/plsql-window-functions-Munyanturire-Kaliza-Liesse/blob/main/customers%20.png.png?raw=true)  

Products Table

![tables](https://github.com/Liesse205/plsql-window-functions-Munyanturire-Kaliza-Liesse/blob/main/products.png.png?raw=true)


Transactions Table

![tables](https://github.com/Liesse205/plsql-window-functions-Munyanturire-Kaliza-Liesse/blob/main/transactions.png.png?raw=true)

## Step 4: Window Functions Implementation 
1.	Ranking
   
Ranking functions assign a rank, number, or percentage to each row within an ordered set of data.

ROW_NUMBER ()

This function assigns a unique integer to each row starting from 1. In the given case. The ROW_NUMBER function assigns that integer based on the customers’ revenue, starting from the customer who contributed the least amount to the business to the one who contributed the most. Afterwards the results of running the query function are displayed in a table.

Queries

![tables](https://github.com/Liesse205/plsql-window-functions-Munyanturire-Kaliza-Liesse/blob/main/row%20number.png.png?raw=true)

Results

![tables](https://github.com/Liesse205/plsql-window-functions-Munyanturire-Kaliza-Liesse/blob/main/row%20results.png.png?raw=true)

Interpretation: This function assigns a unique, sequential number to each transaction when ordered by revenue (ascending in this output). The primary insight here is simple ordering, confirming that the lowest revenue transaction (2004) is ranked first (1) and the highest (2006) is ranked last (8).

RANK ()

Assigns a rank based on a value. If two rows have the same value (tie), they receive the same rank and the next rank is skipped. As the use case is Top N customers by revenue, customers with equal spending amounts will have the same rank (customer with id 506 and the one with id 501).

Queries

![tables](https://github.com/Liesse205/plsql-window-functions-Munyanturire-Kaliza-Liesse/blob/main/ramk%20value.png.png?raw=true)

Results

![tables](https://github.com/Liesse205/plsql-window-functions-Munyanturire-Kaliza-Liesse/blob/main/rank%20results.png.png?raw=true)

Interpretation: The function successfully assigned the same rank (3) to the two transactions with equal revenue (290,000). Crucially, it then skipped rank 4, assigning the next transaction a rank of 5, clearly demonstrating the function's behavior with ties.

DENSE_RANK ()

This function is similar to RANK but without gaps after ties. The next rank after a tie will be applied to the data.

Queries
![tables](https://github.com/Liesse205/plsql-window-functions-Munyanturire-Kaliza-Liesse/blob/main/dense%20rank.png.png?raw=true)

Results
![tables](https://github.com/Liesse205/plsql-window-functions-Munyanturire-Kaliza-Liesse/blob/main/dense%20rank%20results.png.png?raw=true)

Interpretation: The function above assigns the same rank (3) to the two transactions that share the same revenue (290,000), but it does not skip the next rank, assigning the next unique revenue value (400,000) the next consecutive rank of 4.

PERCENT_RANK ()

This function calculates the relative rank of a row as a percentage. It ranges from 0 to 1. In the case below, PERCENT_RANK () shows us how close each customer’s revenue is compared to others’.

Queries
![tables](https://github.com/Liesse205/plsql-window-functions-Munyanturire-Kaliza-Liesse/blob/main/percent%20rank.png.png?raw=true)

Results
![tables](https://github.com/Liesse205/plsql-window-functions-Munyanturire-Kaliza-Liesse/blob/main/percent%20results.png.png?raw=true)

Interpretation: This output (result) shows the relative standing of each transaction's revenue as a percentile from 0 to 1. The two transactions with revenue 290,000 both have a rank value of approximately 0.286, meaning they are better than 28.6% of the other transaction revenues in the dataset.

2.	Aggregate
The functions in this category allow us to calculate a total, average or extreme value over a defined set of rows while still returning the detail rows.

SUM ()

Calculates the cumulative or running total across the frame. In the case below the function helps us track how much money was made overtime.

Queries
![tables](https://github.com/Liesse205/plsql-window-functions-Munyanturire-Kaliza-Liesse/blob/main/running%20tota.png.png?raw=true)

Results
![tables](https://github.com/Liesse205/plsql-window-functions-Munyanturire-Kaliza-Liesse/blob/main/running%20total%20results.png.png?raw=true)

Interpretation: This running total shows the cumulative sales across all transactions as they occurred chronologically. By the last recorded transaction (2008), the business has accumulated a total revenue of 3,676,000, providing a simple measure of overall financial progress.

AVG ()

Calculates the running average across the frame. Below it is used to measure the average purchase value as more sales occur.

Queries
![tables](https://github.com/Liesse205/plsql-window-functions-Munyanturire-Kaliza-Liesse/blob/main/running%20avg.png.png?raw=true)

Results
![tables](https://github.com/Liesse205/plsql-window-functions-Munyanturire-Kaliza-Liesse/blob/main/running%20avg%20results.png.png?raw=true)

Interpretation: The running average is the average transaction revenue calculated up to and including the current row. This value tends to even out as more transactions are added; the final value (459,500) represents the overall average transaction value across the entire recorded history.

MIN ()

Finds the minimum value within the defined frame. In the use case below the function is applied to identify the cheapest transaction so far compared to others.

Queries
![tables](https://github.com/Liesse205/plsql-window-functions-Munyanturire-Kaliza-Liesse/blob/main/min%20so%20far.png.png?raw=true)

Results
![tables](https://github.com/Liesse205/plsql-window-functions-Munyanturire-Kaliza-Liesse/blob/main/min%20so%20far%20results.png.png?raw=true)

Interpretation: This column tracks the lowest revenue transaction encountered up to the current point in the sequence. The minimum quickly drops to 70,000 at transaction 2004 and remains there, indicating that no next transaction had a lower revenue value.

MAX ()

Finds the maximum value within the defined frame. In the case below it identifies the largest sale so far at any point in the sequence.

Queries
![tables](https://github.com/Liesse205/plsql-window-functions-Munyanturire-Kaliza-Liesse/blob/main/max%20so%20far.png.png?raw=true)

Results
![tables](https://github.com/Liesse205/plsql-window-functions-Munyanturire-Kaliza-Liesse/blob/main/max%20so%20far%20results.png.png?raw=true)

Interpretation: This calculation shows the highest revenue transaction seen so far as the transactions are processed sequentially. The maximum value increases whenever a transaction exceeds the previous highest amount, leading to the max being 1,050,000 at transaction 2006.

3.	Navigation
   
Navigation functions enable retrieving of a value from a row that is positioned at a certain offset (before or after) the current row within the ordered window.

LAG ()

Retrieves the value from the row that precedes the current row. In the case below the function lets us compare a current customer’s purchase with the one before it.

Queries
![tables](https://github.com/Liesse205/plsql-window-functions-Munyanturire-Kaliza-Liesse/blob/main/previous%20revenue.png.png?raw=true)

Results
![tables](https://github.com/Liesse205/plsql-window-functions-Munyanturire-Kaliza-Liesse/blob/main/previous%20revenue%20results.png.png?raw=true)

Interpretation: This navigation function successfully pulls the revenue of the immediately preceding transaction into the current row. This is the crucial first step for period-to-period calculations like day-over-day or month-over-month sales growth.

LEAD ()

Retrieves the value from the row that follows the current row. In this use case it allows us to compare today’s revenue to what the next customer spent.

Queries
![tables](https://github.com/Liesse205/plsql-window-functions-Munyanturire-Kaliza-Liesse/blob/main/next%20revenue.png.png?raw=true)

Results
![tables](https://github.com/Liesse205/plsql-window-functions-Munyanturire-Kaliza-Liesse/blob/main/next%20revenue%20results.png.png?raw=true)

Interpretation: This function pulls the revenue of the immediately following transaction into the current row, allowing for comparison. For the final transaction (2008), the NEXT_REVENUE column is correctly null, as there is no subsequent sale.  

4.	Distribution
   
Distribution functions calculate where a specific row or value falls within the entire ordered set of data.

NTILE (4)

The function divides rows into a specified number of buckets (N) as equally as possible. In this case we are to use N as 4(quartiles), therefore there will be 4 customer segments based on dividing transactions into revenue groups.


Queries
![tables](https://github.com/Liesse205/plsql-window-functions-Munyanturire-Kaliza-Liesse/blob/main/quartile.png.png?raw=true)

Results
![tables](https://github.com/Liesse205/plsql-window-functions-Munyanturire-Kaliza-Liesse/blob/main/quartile%20results.png.png?raw=true)

Interpretation: The NTILE (4) function segments the transactions into four equal groups based on their revenue. Quartile 4 represents the highest revenue transactions (top 25%), while Quartile 1 contains the lowest revenue transactions (bottom 25%), providing a high-level view of revenue distribution.

CUME_DIST

Calculates the cumulative distribution of a value within the ordered window. The result ranges from 0 to 1 and represents the fraction of rows that are less than or equal to the current row's value. The use case below specifies how the function tells us the proportion of customers who spent less than or equal to the given transaction.

Queries
![tables](https://github.com/Liesse205/plsql-window-functions-Munyanturire-Kaliza-Liesse/blob/main/cume-dist.png.png?raw=true)

Results
![tables](https://github.com/Liesse205/plsql-window-functions-Munyanturire-Kaliza-Liesse/blob/main/cume%20dist.results.png?raw=true)

Interpretation: This column shows the fraction of transactions that have a revenue value less than or equal to the current row's revenue. For example, the two transactions with 290,000 revenue have a cumulative distribution of 0.5, meaning 50% of all transactions have revenue less than or equal to 290,000.

## Step 6: Results analysis 

1.	Descriptive – What happened? (patterns, trends, outliers)
   
•	Outlier/Pattern: The Running Total shows that transaction 2006 (revenue 1,050,000) accounts for a high portion of the total, which is confirmed by its high RANK value (8 out of 8 assuming it's the highest). This single purchase is a clear outlier in terms of value.

•	Trend: The Running Average shows the average transaction value starts high (290,000) due to the initial transaction, spikes immediately with transaction 2002 (920,000), and then gradually declines or smooths out to 459,500 by the final transaction, indicating that most sales after the initial period were for lower-priced items than the high-value transactions early on.

•	Ranking: The Quartile analysis  shows that the two highest-revenue transactions (2002 and 2006) fall into Quartile 4, confirming a strong concentration of revenue among a few high-value sales, while the lower four transactions (2004, 2008, 2007, 2001) are split between Quartiles 1 and 2.


2.	Diagnostic – Why? (causes, comparisons, influencing factors)
   
•	Cause of Outlier: The transaction with 1,050,000 revenue (Transaction 2006) is the primary driver of the high MAX_SO_FAR and the rise in the Running Average. This high value suggests the customer (504, Kaze Fleur) purchased a single premium-priced gadget (like a high-end laptop).

•	Timing Comparison (Navigation): By examining the Previous/Next Revenue across the time: the sale of the 920,000 laptop (Transaction 2002) was immediately preceded by a lower sale (290,000). This suggests that the frequency of high-value versus low-value sales is highly inconsistent during this period.

•	Segmentation Insight: The NTILE (4) split indicates that revenue isn't evenly distributed. The business is heavily reliant on the Quartile 4 purchases to boost overall sales volume, while the lower quartiles contribute more to transaction count than to total revenue.


3.	Prescriptive – What next? (recommendations, business actions)
   
•	Customer Retention (Quartile 4): Since Quartile 4 drives the highest revenue, the business should immediately create a loyalty program(like promotions) for customers involved in those high-value transactions (502 and 504) to encourage repeat purchases and maintain the high average transaction size.

•	Inventory & Marketing Adjustment: Focus marketing efforts on accessories and lower-priced items to increase the value of the Quartile 1 and Quartile 2 transactions (which are dominant in the lower quartiles). Analyze the timing of the large 1,050,000 sale (Transaction 2006) and replicate the marketing/promotion strategy used around that date or in that region.

•	Sales Forecasting: Utilize the LAG () function output (Previous Revenue) to calculate actual day-over-day growth rates. Establish growth targets that aim to decrease the frequency of low-value transactions (like 70,000), thereby improving the evened out Running Average.

##Integrity statement

I declare that the work I have submitted is the result of my own effort, created with honesty and responsibility. I have acknowledged all sources used with accuracy and fairness. I commit to upholding the values of integrity, accountability, and respect for knowledge in this submission.

References

1.	Oracle. (n.d.). Analytic functions (SQL language reference). Oracle. Retrieved September 28, 2025, from https://docs.oracle.com/en/database/oracle/oracle-database/21/sqlrf/Analytic-Functions.html

2.	Simplilearn. (2021, July 6). SQL window function | How to write SQL query using RANK, DENSE RANK, LEAD/LAG | SQL queries tutorial [Video]. YouTube. https://www.youtube.com/watch?v=Ww71knvhQ-s&t=393s

3.	Ramakrishnan, R., & Gehrke, J. (2003). Database management systems (3rd ed.). McGraw-Hill. Retrieved from https://scs.dypvp.edu.in/documents/e-books/DMBS/database-management-systems-raghu-ramakrishnan.pdf

4.	Sharma, S. (2022, July 19). How to use window functions in SQL – with example queries. freeCodeCamp. https://www.freecodecamp.org/news/window-functions-in-sql/

5.	GitHub. (n.d.). Git guide. GitHub. Retrieved September 28, 2025, from https://github.com/git-guides

6.	Abdel-Basset, M., Manogaran, G., & Mohamed, M. (2024). Retail strategy using customer segmentation. Journal of Theoretical and Applied Information Technology, 102(22), 3600–3612. https://www.jatit.org/volumes/Vol102No22/25Vol102No22.pdf

7.	Jasiński, P. (2020, April 7). Difference between ROWS and RANGE in window functions. LearnSQL. https://learnsql.com/blog/difference-between-rows-range-window-functions/

8.	Harvard Business School Online. (2020, October 15). What is prescriptive analytics? HBS Online. https://online.hbs.edu/blog/post/prescriptive-analytics

9.	Vertica. (2023). Analytic functions versus aggregate functions. Vertica Documentation. https://docs.vertica.com/23.3.x/en/data-analysis/sql-analytics/analytic-functions-versus-aggregate-functions/

10.	Maniraguha, E. (2025). Database Development with PL/SQL - Lecture 02: Introduction to GitHubs. AUCA

11.	Maniraguha, E. (2025). Database Development with PL/SQL - Lecture 01: Introduction to SQL Command Basics (Recap). AUCA.






