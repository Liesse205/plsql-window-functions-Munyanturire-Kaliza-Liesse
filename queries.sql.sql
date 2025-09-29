---Create Customers Table
CREATE TABLE Customers(
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR2(110) NOT NULL,
    region VARCHAR2(50)
    );
    
---Create Products Table
CREATE TABLE Products(
    product_id INT PRIMARY KEY,
    product_name VARCHAR2(150) NOT NULL,
    category VARCHAR2(50),
    price NUMBER(10,3)
    );
    
---Create Transactions Table
CREATE TABLE Transactions(
    transaction_id INT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    sale_date DATE,
    quantity INT,
    revenue NUMBER(12,3),
    CONSTRAINT fk_customer FOREIGN KEY(customer_id)REFERENCES Customers(customer_id),
    CONSTRAINT fk_product FOREIGN KEY(product_id)REFERENCES Products(product_id)
    );

   
---Insertion of data into tables
---Insert Customers
   INSERT INTO Customers(customer_id,customer_name,region)VALUES(501,'Umuhire Anne','Nyamasheke');
   INSERT INTO Customers(customer_id,customer_name,region)VALUES(502,'Ganza Bryan','Gasabo');
   INSERT INTO Customers(customer_id,customer_name,region)VALUES(503,'Nshuti Vincent','Bugesera');
   INSERT INTO Customers(customer_id,customer_name,region)VALUES(504,'Kaze Fleur','Nyanza');
   INSERT INTO Customers(customer_id,customer_name,region)VALUES(505,'Nyiramana Esperance','Kicukiro');
   INSERT INTO Customers(customer_id,customer_name,region)VALUES(506,'Isimbi Bonita','Kicukiro');


---Insert Products
   INSERT INTO Products(product_id,product_name,category,price)VALUES(101,'Samsung Galaxy A25','Smartphone',290000);
   INSERT INTO Products(product_id,product_name,category,price)VALUES(102,'HP – ProBook 450 G9','Laptop',920000); 
   INSERT INTO Products(product_id,product_name,category,price)VALUES(103,'Sony – WH-CH510','Accessories',200000);
   INSERT INTO Products(product_id,product_name,category,price)VALUES(104,'Macbook air 2020 Apple M1','Laptop',1050000);
   INSERT INTO Products(product_id,product_name,category,price)VALUES(105,'Amazfit Bip 6 Smart Watch','Wearable',70000);
   INSERT INTO Products(product_id,product_name,category,price)VALUES(106,'ASUS 2023 Vivobook 14','Laptop',456000);
   
   
---Insert Transactions
    INSERT INTO Transactions(transaction_id,customer_id,product_id,sale_date,quantity,revenue) 
    VALUES(2001,501,101,TO_DATE('2025-06-15','YYYY-MM-DD'),1,290000);
    
    INSERT INTO Transactions(transaction_id,customer_id,product_id,sale_date,quantity,revenue) 
    VALUES(2002,502,102,TO_DATE('2025-06-20','YYYY-MM-DD'),1,920000);
    
    INSERT INTO Transactions(transaction_id,customer_id,product_id,sale_date,quantity,revenue) 
    VALUES(2003,501,103,TO_DATE('2025-07-05','YYYY-MM-DD'),2,400000);
    
    INSERT INTO Transactions(transaction_id,customer_id,product_id,sale_date,quantity,revenue) 
    VALUES(2004,503,105,TO_DATE('2025-07-10','YYYY-MM-DD'),1,70000);
    
    INSERT INTO Transactions(transaction_id,customer_id,product_id,sale_date,quantity,revenue)
    VALUES(2005,505,106,TO_DATE('2025-8-1','YYYY-MM-DD'),1,456000);
    
    INSERT INTO Transactions(transaction_id,customer_id,product_id,sale_date,quantity,revenue) 
    VALUES(2006,504,104,TO_DATE('2025-08-8','YYYY-MM-DD'),1,1050000);
    
    INSERT INTO Transactions(transaction_id,customer_id,product_id,sale_date,quantity,revenue) 
    VALUES(2007,506,101,TO_DATE('2025-08-19','YYYY-MM-DD'),1,290000);
    
    INSERT INTO Transactions(transaction_id,customer_id,product_id,sale_date,quantity,revenue) 
    VALUES(2008,503,103,TO_DATE('2025-08-25','YYYY-MM-DD'),1,200000);

SELECT
    transaction_id,
    customer_id,
    revenue,
    ROW_NUMBER() OVER (ORDER BY revenue) AS row_number
FROM Transactions;

SELECT
    transaction_id,
    customer_id,
    revenue,
    RANK() OVER (ORDER BY revenue) AS rank_value
FROM Transactions;

SELECT 
    transaction_id,
    customer_id,
    revenue,
    DENSE_RANK() OVER (ORDER BY revenue) AS dense_rank_value
FROM Transactions;

SELECT
    transaction_id,
    customer_id,
    revenue,
    PERCENT_RANK() OVER (ORDER BY revenue) AS percent_rank_value
FROM Transactions;

SELECT 
    transaction_id,
    customer_id,
    revenue,
    SUM(revenue) OVER (ORDER BY transaction_id) AS running_total
FROM Transactions;

SELECT 
    transaction_id,
    customer_id,
    revenue,
    AVG(revenue) OVER (ORDER BY transaction_id) AS running_avg
FROM Transactions;

SELECT 
    transaction_id,
    customer_id,
    revenue,
    MIN(revenue) OVER (ORDER BY transaction_id) AS min_so_far
FROM Transactions;

SELECT 
    transaction_id,
    customer_id,
    revenue,
    MAX(revenue) OVER (ORDER BY transaction_id) AS max_so_far
FROM Transactions;

SELECT 
    transaction_id,
    customer_id,
    sale_date,
    revenue,
    LAG(revenue) OVER (ORDER BY transaction_id) AS previous_revenue
FROM Transactions;

SELECT 
    transaction_id,
    customer_id,
    sale_date,
    revenue,
    LEAD(revenue) OVER (ORDER BY transaction_id) AS next_revenue
FROM Transactions;

SELECT 
    transaction_id,
    customer_id,
    revenue,
    NTILE(4) OVER (ORDER BY revenue) AS quartile
FROM Transactions;

SELECT 
    transaction_id,
    customer_id,
    revenue,
    CUME_DIST() OVER (ORDER BY revenue) AS cumulative_distribution
FROM Transactions;
