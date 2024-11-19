-- Create Database
CREATE DATABASE ProjectDB;
USE ProjectDB;

-- Table: Customer
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    contact_info VARCHAR(50),
    address VARCHAR(150)
);

-- Table: Account
CREATE TABLE Account (
    account_id INT PRIMARY KEY,
    balance DECIMAL(10, 2) NOT NULL,
    account_type VARCHAR(50) NOT NULL,
    customer_id INT,
    FOREIGN KEY (customer_id) REFERENCES Customer(customer_id)
);

-- Table: TransactionHistory
CREATE TABLE TransactionHistory (
    transaction_id INT PRIMARY KEY,
    account_id INT,
    amount DECIMAL(10, 2),
    transaction_date DATE,
    transaction_type VARCHAR(50),
    FOREIGN KEY (account_id) REFERENCES Account(account_id)
);

-- Table: Branch
CREATE TABLE Branch (
    branch_id INT PRIMARY KEY,
    branch_name VARCHAR(100),
    address VARCHAR(150),
    contact_number VARCHAR(20)
);

-- Table: Banker
CREATE TABLE Banker (
    banker_id INT PRIMARY KEY,
    banker_name VARCHAR(100),
    branch_id INT,
    FOREIGN KEY (branch_id) REFERENCES Branch(branch_id)
);

-- Table: Loan
CREATE TABLE Loan (
    loan_id INT PRIMARY KEY,
    amount DECIMAL(10, 2) NOT NULL,
    interest_rate DECIMAL(5, 2),
    loan_type VARCHAR(50),
    account_id INT,
    FOREIGN KEY (account_id) REFERENCES Account(account_id)
);

-- Table: CreditCard
CREATE TABLE CreditCard (
    card_id INT PRIMARY KEY,
    card_number VARCHAR(16) UNIQUE NOT NULL,
    expiry_date DATE,
    credit_limit DECIMAL(10, 2),
    account_id INT,
    FOREIGN KEY (account_id) REFERENCES Account(account_id)
);

-- Inserting Random Data into Customer
INSERT INTO Customer VALUES (1, 'John Doe', '123-456-7890', '123 Elm St');
INSERT INTO Customer VALUES (2, 'Jane Smith', '987-654-3210', '456 Oak St');
INSERT INTO Customer VALUES (3, 'Michael Brown', '222-333-4444', '789 Pine St');
INSERT INTO Customer VALUES (4, 'Emily Davis', '111-222-3333', '101 Maple Ave');
INSERT INTO Customer VALUES (5, 'Chris Wilson', '444-555-6666', '202 Birch St');
INSERT INTO Customer VALUES (6, 'Jessica Martinez', '333-444-5555', '303 Cedar Rd');
INSERT INTO Customer VALUES (7, 'Daniel Garcia', '777-888-9999', '404 Walnut Blvd');
INSERT INTO Customer VALUES (8, 'Sarah Lee', '888-999-0000', '505 Spruce Ct');
INSERT INTO Customer VALUES (9, 'David Anderson', '666-777-8888', '606 Fir Ln');
INSERT INTO Customer VALUES (10, 'Sophia Thompson', '555-666-7777', '707 Oakwood Dr');

-- Inserting Random Data into Account
INSERT INTO Account VALUES (1, 1500.00, 'Savings', 1);
INSERT INTO Account VALUES (2, 2500.00, 'Checking', 2);
INSERT INTO Account VALUES (3, 3200.00, 'Savings', 3);
INSERT INTO Account VALUES (4, 4100.00, 'Checking', 4);
INSERT INTO Account VALUES (5, 2750.00, 'Savings', 5);
INSERT INTO Account VALUES (6, 3100.00, 'Checking', 6);
INSERT INTO Account VALUES (7, 1950.00, 'Savings', 7);
INSERT INTO Account VALUES (8, 5000.00, 'Checking', 8);
INSERT INTO Account VALUES (9, 4300.00, 'Savings', 9);
INSERT INTO Account VALUES (10, 3800.00, 'Checking', 10);

-- Inserting Random Data into TransactionHistory
INSERT INTO TransactionHistory VALUES (1, 1, 200.00, '2024-10-10', 'Deposit');
INSERT INTO TransactionHistory VALUES (2, 2, 150.00, '2024-10-12', 'Withdrawal');
INSERT INTO TransactionHistory VALUES (3, 3, 500.00, '2024-10-15', 'Deposit');
INSERT INTO TransactionHistory VALUES (4, 4, 300.00, '2024-10-18', 'Withdrawal');
INSERT INTO TransactionHistory VALUES (5, 5, 250.00, '2024-10-20', 'Deposit');
INSERT INTO TransactionHistory VALUES (6, 6, 400.00, '2024-10-21', 'Withdrawal');
INSERT INTO TransactionHistory VALUES (7, 7, 100.00, '2024-10-23', 'Deposit');
INSERT INTO TransactionHistory VALUES (8, 8, 350.00, '2024-10-24', 'Withdrawal');
INSERT INTO TransactionHistory VALUES (9, 9, 600.00, '2024-10-25', 'Deposit');
INSERT INTO TransactionHistory VALUES (10, 10, 450.00, '2024-10-27', 'Withdrawal');

-- Inserting Random Data into Branch
INSERT INTO Branch VALUES (1, 'Downtown Branch', '789 Maple Ave', '555-1234');
INSERT INTO Branch VALUES (2, 'Uptown Branch', '321 Pine Ave', '555-5678');
INSERT INTO Branch VALUES (3, 'East Side Branch', '654 Willow St', '555-4321');
INSERT INTO Branch VALUES (4, 'West End Branch', '876 Oak Blvd', '555-8765');
INSERT INTO Branch VALUES (5, 'Central Branch', '987 Elm Cir', '555-2345');
INSERT INTO Branch VALUES (6, 'North Branch', '123 Cedar Rd', '555-3456');
INSERT INTO Branch VALUES (7, 'South Branch', '234 Birch Ln', '555-4567');
INSERT INTO Branch VALUES (8, 'Suburban Branch', '345 Pine Ct', '555-5679');
INSERT INTO Branch VALUES (9, 'Metro Branch', '456 Spruce Ave', '555-6789');
INSERT INTO Branch VALUES (10, 'Riverside Branch', '567 River Dr', '555-7890');

-- Inserting Random Data into Banker
INSERT INTO Banker VALUES (1, 'Alice Brown', 1);
INSERT INTO Banker VALUES (2, 'Bob Green', 2);
INSERT INTO Banker VALUES (3, 'Cathy White', 3);
INSERT INTO Banker VALUES (4, 'Dan Black', 4);
INSERT INTO Banker VALUES (5, 'Eva Gray', 5);
INSERT INTO Banker VALUES (6, 'Frank Blue', 6);
INSERT INTO Banker VALUES (7, 'Grace Red', 7);
INSERT INTO Banker VALUES (8, 'Hank Gold', 8);
INSERT INTO Banker VALUES (9, 'Ivy Silver', 9);
INSERT INTO Banker VALUES (10, 'Jack Copper', 10);

-- Inserting Random Data into Loan
INSERT INTO Loan VALUES (1, 5000.00, 3.5, 'Home Loan', 1);
INSERT INTO Loan VALUES (2, 10000.00, 5.0, 'Car Loan', 2);
INSERT INTO Loan VALUES (3, 7500.00, 4.0, 'Personal Loan', 3);
INSERT INTO Loan VALUES (4, 12000.00, 6.5, 'Business Loan', 4);
INSERT INTO Loan VALUES (5, 3000.00, 2.5, 'Student Loan', 5);
INSERT INTO Loan VALUES (6, 8000.00, 4.8, 'Car Loan', 6);
INSERT INTO Loan VALUES (7, 15000.00, 7.0, 'Mortgage', 7);
INSERT INTO Loan VALUES (8, 2500.00, 3.0, 'Payday Loan', 8);
INSERT INTO Loan VALUES (9, 4000.00, 3.7, 'Home Loan', 9);
INSERT INTO Loan VALUES (10, 5500.00, 5.2, 'Education Loan', 10);

-- Inserting Random Data into CreditCard
INSERT INTO CreditCard VALUES (1, '1234567812345678', '2026-05-31', 5000.00, 1);
INSERT INTO CreditCard VALUES (2, '8765432187654321', '2025-11-30', 10000.00, 2);
INSERT INTO CreditCard VALUES (3, '1122334411223344', '2027-01-15', 7500.00, 3);
INSERT INTO CreditCard VALUES (4, '4433221144332211', '2024-09-20', 8000.00, 4);
INSERT INTO CreditCard VALUES (5, '5566778855667788', '2026-08-18', 9000.00, 5);
INSERT INTO CreditCard VALUES (6, '6677889966778899', '2028-02-25', 11000.00, 6);
INSERT INTO CreditCard VALUES (7, '7788990077889900', '2029-12-10', 4500.00, 7);
INSERT INTO CreditCard VALUES (8, '9988776699887766', '2025-03-14', 12000.00, 8);
INSERT INTO CreditCard VALUES (9, '2233445522334455', '2027-07-23', 6500.00, 9);
INSERT INTO CreditCard VALUES (10, '3344556633445566', '2024-06-05', 7000.00, 10);

-- Use Case Queries
-- 1. Retrieve all customers with their account balances
SELECT c.customer_name, a.balance 
FROM Customer c
JOIN Account a ON c.customer_id = a.customer_id;

-- 2. Retrieve transaction history for a specific account
SELECT t.transaction_id, t.amount, t.transaction_date, t.transaction_type
FROM TransactionHistory t
WHERE t.account_id = 1;

-- 3. Find all loans with interest rates higher than 4%
SELECT loan_id, amount, interest_rate 
FROM Loan 
WHERE interest_rate > 4.0;

-- 4. List all bankers working at 'Downtown Branch'
SELECT b.banker_name 
FROM Banker b
JOIN Branch br ON b.branch_id = br.branch_id
WHERE br.branch_name = 'Downtown Branch';

-- 5. Retrieve all credit card details for a specific account
SELECT card_number, expiry_date, credit_limit
FROM CreditCard
WHERE account_id = 2;

-- 6. Calculate the total amount of all transactions for a specific account
SELECT SUM(amount) AS total_amount
FROM TransactionHistory
WHERE account_id = 1;

-- 7. List all customers who have a loan amount greater than $5000
SELECT c.customer_name, l.amount 
FROM Customer c
JOIN Account a ON c.customer_id = a.customer_id
JOIN Loan l ON a.account_id = l.account_id
WHERE l.amount > 5000.00;

-- 8. List all branches and the number of bankers in each branch
SELECT br.branch_name, COUNT(b.banker_id) AS banker_count
FROM Branch br
JOIN Banker b ON br.branch_id = b.branch_id
GROUP BY br.branch_name;

-- 9. Find all transactions that are withdrawals
SELECT transaction_id, amount, transaction_date 
FROM TransactionHistory 
WHERE transaction_type = 'Withdrawal';

-- 10. Retrieve all accounts with a balance greater than $3000
SELECT account_id, balance 
FROM Account 
WHERE balance > 3000.00;

-- Example Query: Find customers who are associated with accounts handled by bankers in different branches
SELECT c.customer_name
FROM Customer c
JOIN Account a ON c.customer_id = a.customer_id
JOIN Banker b ON a.account_id = b.account_id
JOIN Branch br ON b.branch_id = br.branch_id
GROUP BY c.customer_name
HAVING COUNT(DISTINCT br.branch_id) > 1;

 --TOP 5 customers with loan amount
SELECT TOP 5 c.customer_id, c.customer_name, SUM(l.amount) AS total_loan_amount
FROM Customer c
JOIN Account a ON c.customer_id = a.customer_id
JOIN Loan l ON a.account_id = l.account_id
GROUP BY c.customer_id, c.customer_name
ORDER BY total_loan_amount DESC

--Query to Find the Most Active Banker in Terms of Transactions Managed
SELECT TOP 1 b.banker_id, b.banker_name, COUNT(th.transaction_id) AS transaction_count
FROM Banker b
JOIN Account a ON b.banker_id = a.account_id
JOIN TransactionHistory th ON a.account_id = th.account_id
GROUP BY b.banker_id, b.banker_name
ORDER BY transaction_count DESC

--Query to Calculate the Average Loan Amount by Loan Type
SELECT l.loan_type, AVG(l.amount) AS average_loan_amount
FROM Loan l
GROUP BY l.loan_type;



