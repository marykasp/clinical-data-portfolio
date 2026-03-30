**The SQL `JOIN` statement is used to combine rows from two tables based on a common column and selects records that have matching values in these columns.**

### **Example**

```sql
-- join the Customers and Orders tables
-- based on the common values of their customer_id columns

SELECT Customers.customer_id, Customers.first_name, Orders.item
FROM Customers
JOIN Orders
ON Customers.customer_id = Orders.customer_id;
```

[Run Code](https://www.programiz.com/sql/online-compiler)

**Here, the SQL command joins the `Customers` and `Orders` tables based on the common column, `customer_id` of both tables.**

**The result set will consist of**

- `customer_id` and `first_name` columns from the `Customers` table
- `item` column from the `Orders` table

---

# SQL JOIN Syntax

```sql
SELECT columns_from_both_tables
FROM table1
JOIN table2
ON table1.column1 = table2.column2
```

Here,

- table1 and  are the two tables that are to be joined
  table2
- column1 is the column in  that is related to  in
  table1
  column2
  table2

---

# Example: Join Two Table Based on Common Column

```sql
-- join Customers and Orders tables based on
-- customer_id of Customers and customer column of Orders

SELECT Customers.customer_id, Customers.first_name, Orders.amount
FROM Customers
JOIN Orders
ON Customers.customer_id = Orders.customer;
```

[Run Code](https://www.programiz.com/sql/online-compiler)

Here, the SQL command selects the columns:

- `customer_id` and `first_name` from the `Customers` table
- `amount` from the `Orders` table

The result set will contain those values where there is a match between `customer_id` (of the `Customers` table) and `customer` (of the `Orders` table).

![Join Two Table Based on Common Column](https://www.programiz.com/sites/tutorial2program/files/join-in-sql.png)

**Join Two Table Based on Common Column**

---

# JOIN Multiple Tables

We can also join more than two tables using `JOIN`. For example,

```sql
-- join three tables: Customers, Orders, and Shippings

SELECT Customers.first_name, Orders.item, Shippings.status
FROM Customers
JOIN Orders ON Customers.customer_id = Orders.customer_id
JOIN Shippings ON Customers.customer_id = Shippings.customer;
```

[Run Code](https://www.programiz.com/sql/online-compiler)

This SQL command joins three tables and selects relevant columns from each, based on the matching customer_id.

**Note:** To learn more about how to join multiple tables, visit [SQL Join Multiple Tables](https://www.programiz.com/sql/join-three-tables).

---

# Types of SQL JOINs

In SQL, we have four main types of joins:

- [INNER JOIN](https://www.programiz.com/sql/inner-join)
- [LEFT JOIN](https://www.programiz.com/sql/left-outer-join)
- [RIGHT JOIN](https://www.programiz.com/sql/right-join)
- [FULL OUTER JOIN](https://www.programiz.com/sql/full-outer-join)

---

# **Working of Inner Join**

![SQL INNER JOIN](https://cdn.programiz.pro/course-images/learn-sql-basics/learn-sql-basics-5.2.1.png)

- The `INNER JOIN` keyword joins the `Customers` and `Orders` table based on a condition.
- The `ON` keyword is used to specify the join condition (`Customers.customer_id = Orders.customer_id`), which is based on a common column (`customer_id`).

| **customer_id** | **customer_name** | **city**    |
| --------------- | ----------------- | ----------- |
| 1               | Alice             | New York    |
| 2               | Bob               | Los Angeles |
| 3               | Charlie           | Chicago     |
| 4               | Diana             | Houston     |
| 5               | Eva               | Seattle     |

| **order_id** | **customer_id** | **product_name** | **quantity** |
| ------------ | --------------- | ---------------- | ------------ |
| 101          | 1               | Laptop           | 1            |
| 102          | 3               | Smartphone       | 2            |
| 103          | 4               | Tablet           | 1            |
| 104          | 6               | Monitor          | 3            |

```sql
-- Join the Customers and Orders table
-- Select customer_name, city, and product_name

SELECT Customers.customer_name, Customers.city, Orders.product_name
FROM Customers
INNER JOIN Orders
ON Customers.customer_id = Orders.customer_id;
```

```sql
-- Join the Customers and Orders table
-- Return all the columns
-- Select rows if the product the customer bought was a computer

SELECT Customers.customer_name, Customers.city, Orders.product_name
FROM Customers
INNER JOIN Orders
ON Customers.customer_id = Orders.customer_id
WHERE Customers.city = 'New York';

```

| **customer_name** | **city** | **product_name** |
| ----------------- | -------- | ---------------- |
| Alice             | New York | Laptop           |

## GROUP BY

In the previous chapter, you learned to use aggregate functions to calculate summary values.

For example, you can determine the average purchase amount from a table:

```sql
-- Return the average purchase amount of all customers

SELECT AVG(purchase_amount)
FROM Customers;
```

What if you're asked to find the average purchase amount by country? Simply using the AVG() function isn't enough.

This is where the GROUP BY clause comes in handy in SQL. It helps you answer questions like:

What is the average purchase amount of customers in each country?
What are the highest and lowest purchase amounts in each country?

Let's try grouping the data from the Customers table by different countries.

```sql
-- Group data by different country

SELECT country, purchase_amount
FROM Customers
GROUP BY country;
If you run the code, the output will be:
```

country purchase_amount
Canada 6000
UK 2000
USA 1000

The output shows the country and purchase amount of the first customer in each country, but this isn't a meaningful summary.

Therefore, the `GROUP BY` clause is almost always used in conjunction with aggregate functions such as SUM(), MIN(), COUNT(), etc., to summarize data.

Let's look at examples to see how GROUP BY works with aggregate functions.
