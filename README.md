# SQL Server – Transact-SQL 

## 📌 Overview
This repository contains practical SQL labs implemented using Microsoft SQL Server.

The project demonstrates database design, data manipulation, and analytical querying using Transact-SQL (T-SQL).

All queries were written and tested using SQL Server Management Studio (SSMS).

---

## 🛠 Tools & Technologies
- Microsoft SQL Server
- SQL Server Management Studio (SSMS)
- Transact-SQL (T-SQL)

---

## 📂 Databases Used
- Company Database
- ITI Database
- AdventureWorks Database

---

# 🧩 Lab01 – Database Creation

In this lab, I:
- Created database schema
- Designed table relationships
- Built ER diagram
- Inserted sample data

### Database Diagram
<img src="diagram.png" width="700">

> Full implementation available in `Lab01_DB_Creation.sql`

---

# 🔗 Lab02 – Joins

In this lab, I implemented different JOIN operations to retrieve related data from multiple tables.

### Example Query:

```sql
SELECT e.Fname, e.Lname, d.Dname
FROM Employee e
JOIN Department d
ON e.Dno = d.Dnumber;
```

> Full solutions available in `Lab02_Joins.sql`

---

# 📊 Lab03 – Grouping & Aggregation

This lab covers:
- COUNT, SUM, AVG
- GROUP BY
- HAVING clause
- Aggregated analysis per department

### Example Query:

```sql
SELECT Dno, COUNT(*) AS Employee_Count
FROM Employee
GROUP BY Dno;
```

> Full solutions available in `Lab03_Grouping.sql`

---

# ⚙ Lab04 – Advanced T-SQL

This lab includes:
- Subqueries
- Calculated columns
- Conditional filtering
- Advanced data manipulation queries

### Example Query:

```sql
SELECT Fname + ' ' + Lname AS Full_Name,
       Salary * 12 AS Annual_Salary
FROM Employee
WHERE Salary > 1000;
```

> Full solutions available in `Lab04_TSQL.sql`

---

## 🚀 Skills Demonstrated

- Writing complex SELECT queries
- Performing multi-table JOIN operations
- Using GROUP BY and aggregate functions
- Implementing calculated columns
- Working with relational database schemas
- Writing structured and readable SQL code

---

## 📈 Future Improvements
- Implement window functions
- Add ranking queries
- Create small analytical reporting queries
- Connect SQL results to Power BI dashboard
