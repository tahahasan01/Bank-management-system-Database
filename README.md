# Bank-management-system-Database
his project is a comprehensive implementation of a Bank Management System's backend database. It is based on an Entity-Relationship Diagram (ERD) that models key entities, relationships, and constraints. The database is designed to handle various banking functionalities such as account management, loan processing, transaction history, and customer information. The project includes SQL scripts for creating the database schema, inserting sample data, and executing complex use case queries.

ERD Description
The ERD provided in Project Milestone #1 illustrates the relationships between different entities:

Customer: Stores information about customers, including their name, address, and contact details.
Account: Manages various customer accounts and their details.
Branch: Represents the bank's branches.
Loan: Handles information related to loans, including the amount, type, and due dates.
Banker: Represents the bank staff who manage customer accounts and transactions.
TransactionHistory: Keeps a record of deposits, withdrawals, and other transactions.
CreditCard: Manages credit card information linked to customer accounts.
Database Setup
1. Database Creation Script
The provided SQL script creates the database schema based on the ERD. The script includes:

Table Definitions: Tables for Customer, Account, Branch, Loan, Banker, TransactionHistory, and CreditCard.
Primary and Foreign Keys: To ensure data integrity and enforce relationships.
Constraints: Such as NOT NULL, CHECK, UNIQUE, and DEFAULT values where necessary.
2. Sample Data
The SQL script populates each table with at least 10 rows of meaningful dummy data. This sample data is used to demonstrate the functionality of the use case queries.

Use Case Queries
The project includes a variety of SQL queries that demonstrate the system's capabilities:

Retrieve Customers with the Highest Loan Amounts

SELECT c.customer_id, c.customer_name, SUM(l.loan_amount) AS total_loan_amount
FROM Customer c
JOIN Account a ON c.customer_id = a.customer_id
JOIN Loan l ON a.account_id = l.account_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_loan_amount DESC
LIMIT 5;
Find Branches with the Most Accounts

SELECT br.branch_id, br.branch_name, COUNT(a.account_id) AS total_accounts
FROM Branch br
JOIN Banker b ON br.branch_id = b.branch_id
JOIN Account a ON b.account_id = a.account_id
GROUP BY br.branch_id, br.branch_name
ORDER BY total_accounts DESC;
List Accounts with No Recent Transactions (Within the Last Year)

SELECT a.account_id, a.account_balance
FROM Account a
WHERE NOT EXISTS (
    SELECT 1
    FROM TransactionHistory th
    WHERE th.account_id = a.account_id
    AND th.transaction_date >= DATEADD(YEAR, -1, GETDATE())
);
Identify Customers with Multiple Credit Cards

SELECT c.customer_id, c.customer_name, COUNT(cc.card_id) AS credit_card_count
FROM Customer c
JOIN Account a ON c.customer_id = a.customer_id
JOIN CreditCard cc ON a.account_id = cc.account_id
GROUP BY c.customer_id, c.customer_name
HAVING COUNT(cc.card_id) > 1;
Calculate the Average Loan Amount by Loan Type

SELECT l.loan_type, AVG(l.loan_amount) AS average_loan_amount
FROM Loan l
GROUP BY l.loan_type;
List Branches with Loan Totals Exceeding a Threshold

SELECT br.branch_id, br.branch_name, SUM(l.loan_amount) AS total_loan_amount
FROM Branch br
JOIN Banker b ON br.branch_id = b.branch_id
JOIN Account a ON b.account_id = a.account_id
JOIN Loan l ON a.account_id = l.account_id
GROUP BY br.branch_id, br.branch_name
HAVING SUM(l.loan_amount) > 1000000;
Find Accounts with More Withdrawals than Deposits

SELECT a.account_id, 
       (SELECT COUNT(*) 
        FROM TransactionHistory th 
        WHERE th.account_id = a.account_id AND th.transaction_type = 'Withdrawal') AS withdrawals,
       (SELECT COUNT(*) 
        FROM TransactionHistory th 
        WHERE th.account_id = a.account_id AND th.transaction_type = 'Deposit') AS deposits
FROM Account a
HAVING withdrawals > deposits;

Get the Most Active Banker in Terms of Transactions Managed
SELECT b.banker_id, b.banker_name, COUNT(th.transaction_id) AS transaction_count
FROM Banker b
JOIN Account a ON b.account_id = a.account_id
JOIN TransactionHistory th ON a.account_id = th.account_id
GROUP BY b.banker_id, b.banker_name
ORDER BY transaction_count DESC
LIMIT 1;
List All Customers with Overdue Loan Payments

SELECT c.customer_id, c.customer_name, l.loan_id, l.loan_amount, l.due_date
FROM Customer c
JOIN Account a ON c.customer_id = a.customer_id
JOIN Loan l ON a.account_id = l.account_id
WHERE l.due_date < GETDATE() AND l.is_paid = 0;
Get the Average Balance of Accounts by Branch

sql
Copy code
SELECT br.branch_id, br.branch_name, AVG(a.account_balance) AS average_balance
FROM Branch br
JOIN Banker b ON br.branch_id = b.branch_id
JOIN Account a ON b.account_id = a.account_id
GROUP BY br.branch_id, br.branch_name;

How to Use
Clone this repository and import the SQL script into your database system.
Run the script to create the tables and insert sample data.
Execute the use case queries to test the functionality and analyze the results.
Notes
Ensure to use the correct date functions depending on your SQL database system (e.g., GETDATE() for SQL Server, CURRENT_DATE for PostgreSQL).
Adjust the LIMIT clause or use TOP for SQL Server queries if needed.
The sample data provided is for testing purposes and can be modified to suit different scenarios.
Tools Used
Database Management System (DBMS): Please refer to the tools discussed in class, such as MySQL, SQL Server, or PostgreSQL.
Future Enhancements
Add more complex queries involving window functions.
Implement stored procedures for common banking operations.
Develop triggers for automated database actions.
