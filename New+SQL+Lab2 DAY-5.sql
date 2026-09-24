set Sql_safe_updates =0;

create database BankingDB;
use BankingDB;
CREATE TABLE Customers
(
    CustomerID INT,
    FirstName VARCHAR(50),
    LastName VARCHAR(50),
    Email VARCHAR(100),
    Phone VARCHAR(15)
);

describe Customers;

CREATE TABLE Accounts (
    AccountID INT,
    AccountType VARCHAR(20),
    Balance DECIMAL(10,2)
);

select *from Accounts;

-- Add customerid column to accounts table ---
alter table Accounts add column CustomerID int;



desc Accounts;

desc  customers;

show tables;
show table status;
-- add  'date of birth'  and datatype 'date' to customers  --
alter table  customers add column DateofBirth date;

alter  table customers drop column accountcreationdate;

alter  table customers drop column Balance;

INSERT INTO Customers
(CustomersID, FirstName, LastName, Email, Phone, Date_Of_Birth)
VALUES
(101, 'rohit', 'sharma', 'rohit@gmail.com', '9854103256', '1999-08-10');

-- UPDATE Phone COLUMN IN CUSTOMERS TABLE
-- UPDATE Phone Column in Customers Table

-- set SQL_SAFE_UPDATES =0; THIS Query is use to update data with codes 
UPDATE Customers SET Phone=9309144203 WHERE customerID=101;

UPDATE Customers set Email="rahul_sharma@gmail.com" Where CustomerID=101;








SELECT * FROM Customers;
 insert into Accounts values(201,'Savings',25000.00,101);
 
 desc accounts;
 ---  violates the condition it doesn't accept balance less than 1000 ----
 insert into accounts values(202, 'current'  ,999,102);
 
 
 SELECT * FROM accounts
 
 ;
CREATE TABLE Transactions (
    TransactionID INT,
    TransactionDate DATE,
    Amount DECIMAL(10,2),
    TransactionType VARCHAR(20)
);

CREATE TABLE Branches (
    BranchID INT,
    BranchName VARCHAR(100),
    BranchAddress VARCHAR(200),
    BranchPhone VARCHAR(15)
);

CREATE TABLE AccountBranches ( 
		AssignmentDate DATE
);

CREATE TABLE Loans (
    LoanID INT,
    LoanAmount DECIMAL(10,2),
    InterestRate DECIMAL(5,2),
    StartDate DATE,
    EndDate DATE
);

Describe Accounts;
Describe Transactions;
describe Branches;
describe AccountBranches;
describe Loans;

ALTER TABLE Customers
ADD DateOfBirth DATE;

describe Customers;

ALTER TABLE Customers
MODIFY Phone VARCHAR(20);
desc accounts;
ALTER TABLE Accounts
ADD CONSTRAINT chk_MinBalance
CHECK (balaace >= 1000);

DROP TABLE AccountBranches;

ALTER TABLE Customers
ADD PRIMARY KEY (CustomerID);

ALTER TABLE Accounts
ADD CustomerID INT;
ALTER TABLE Accounts
ADD CONSTRAINT FK_Accounts_Customers
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID);

ALTER TABLE Customers
MODIFY FirstName VARCHAR(50) NOT NULL;

ALTER TABLE Customers
ADD CONSTRAINT uq_Email UNIQUE (Email);


#########################################
-- Add Primary Keys
ALTER TABLE Accounts
ADD CONSTRAINT PK_Accounts
PRIMARY KEY (AccountID);

ALTER TABLE Transactions
ADD CONSTRAINT PK_Transactions
PRIMARY KEY (TransactionID);

ALTER TABLE Branches
ADD CONSTRAINT PK_Branches
PRIMARY KEY (BranchID);

ALTER TABLE Loans
ADD CONSTRAINT PK_Loans
PRIMARY KEY (LoanID);

-- Add Required Columns


ALTER TABLE Transactions
ADD AccountID INT;

ALTER TABLE Loans
ADD CustomerID INT;


ALTER TABLE Transactions
ADD CONSTRAINT FK_Transactions_Accounts
FOREIGN KEY (AccountID)
REFERENCES Accounts(AccountID);

ALTER TABLE Loans
ADD CONSTRAINT FK_Loans_Customers
FOREIGN KEY (CustomerID)
REFERENCES Customers(CustomerID);

ALTER TABLE Accounts
ADD BranchID INT;

ALTER TABLE Accounts
ADD CONSTRAINT FK_Accounts_Branches
FOREIGN KEY (BranchID)
REFERENCES Branches(BranchID);
