# What is SQL?

**SQL (Structured Query Language)** is a programming language designed for managing data in a relational database. It's been around since the 1970s and is the most common method of accessing data in databases today. SQL has a variety of functions that allow its users to read, manipulate, and change data. Though SQL is commonly used by engineers in software development, it's also popular with data analysts for a few reasons:

- It's semantically easy to understand and learn.
- Because it can be used to access large amounts of data directly where it's stored, analysts don't have to copy data into other applications.
- Compared to spreadsheet tools, data analysis done in SQL is easy to audit and replicate. For analysts, this means no more looking for the [cell with the typo in the formula](http://www.washingtonpost.com/blogs/wonkblog/wp/2013/04/16/is-the-best-evidence-for-austerity-based-on-an-excel-spreadsheet-error/).

SQL is great for performing the types of aggregations that you might normally do in an Excel pivot table—sums, counts, minimums and maximums, etc.—but over much larger datasets and on multiple tables at the same time.

# What's a database?

From [Wikipedia](http://en.wikipedia.org/wiki/Database): A database is an organized collection of data.

There are many ways to organize a database and many different types of databases designed for different purposes.

If you've used Excel, you should already be familiar with tables—they're similar to spreadsheets. Tables have rows and columns just like Excel, but are a little more rigid. Database tables, for instance, are always organized by column, and each column must have a unique name. To get a sense of this organization, the image below shows a sample table containing data from the 2010 Academy Awards:

Broadly, within databases, tables are organized in [schemas](http://en.wikipedia.org/wiki/Database_schema). Schemas are defined by usernames, so if your username is databass3000, all of the tables you upload will be stored under the databass3000 schema. For example, if databass3000 uploads a table on fish food sales called `fish_food_sales`, that table would be referenced as `databass3000.fish_food_sales`. You'll notice that all of the tables used in this tutorial series are prefixed with "tutorial." That's because they were uploaded by an account with that username.

Relational databases store data in tables. Tables can grow large and have a multitude of columns and records. Relational database management systems (RDBMSs) use SQL (and variants of SQL) to manage the data in these large tables. The RDBMS you use is your choice and depends on the complexity of your application.

## Common Mistakes with SQL

When you're just starting out with SQL, it's easy to make mistakes. From typos to referencing wrong tables, these common errors can slow you down and lead to frustration.

But don't worry–we're here to help!

In this article, we'll explore some of the most common mistakes beginners make when working with SQL.

Let's get started.

---

Suppose we have a table `Customers` with the following data:

**Customers**

| **customer_id** | **first_name** | **last_name** |
| --------------- | -------------- | ------------- |
| 1               | John           | Doe           |
| 3               | Jane           | Smith         |
| 4               | Michael        | Johnson       |

Now, let's identify the common mistakes people make when working with SQL.

# **1. Using the Wrong Table Name**

A common mistake among beginners and proficient developers is referencing a table that doesn't exist. This often happens due to typos or confusion about table names.

For example, you're trying to retrieve all data from the above table `Customers`.

If you mistakenly write:

```
-- Gives an error

SELECT *
FROM Customer;
```

This results in an error, as the table name `Customer` doesn't exist.

**Correction**

```sql
-- Retrieve all data from Customers

SELECT *
FROM Customers;
```

**Note:** Always verify table names to avoid errors.

---

# **2. Using the Wrong Column Name**

Referencing a column that doesn't exist in the table is another common mistake. The above table `Customers` contains the columns `customer_id`, `first_name`, and `last_name`.

**Example**

```
-- The column "id" does not exist

SELECT id, first_name
FROM Customers;
```

**Correction**

```
-- Correct column name

SELECT customer_id, first_name
FROM Customers;
```

**Note:** Always verify your table and column names before running a query to avoid these errors.

---

# **3. Misspelling Keywords and Identifiers**

SQL is unforgiving with typos. Misspelling keywords like `SELECT`, `FROM`, or table and column names can lead to errors.

**Example**

```
-- SELCT is misspelled

SELCT first_name, last_name
FROM Customers;
```

**Correction**

```
SELECT first_name, last_name
FROM Customers;
```

**Note:** Check for typos before running queries.

---

# **4. Forgetting Commas Between Columns**

Forgetting commas when selecting multiple columns causes syntax errors, making queries fail. Therefore, when selecting multiple columns, we must use a comma.

**Example**

```sql
-- Missing a comma between columns

SELECT first_name last_name
FROM Customers;
```

**Correction**

```sql
-- Include the required comma

SELECT first_name, last_name
FROM Customers;
```

**Note:** Double-check column lists for commas to avoid errors.

---

Mistakes are part of the learning process, so don't get discouraged. By avoiding these common mistakes and with some practice, you'll soon write clean, effective SQL queries confidently.
