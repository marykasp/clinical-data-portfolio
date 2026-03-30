# Organize Records

In the previous chapter, you learned to summarize data using SQL aggregate functions. Now, let's focus on organizing data for better analysis and answering specific questions.

Imagine your manager asks:

Can you sort customers by total spending?
How many customers are there in each country?
Which countries have fewer than three customers?

Can you categorize customers as Target Customer, High Spender, or Low Spender based on their purchases?
To answer these, you need to organize the data—sorting it, grouping it, and even creating new categories. SQL offers powerful tools for these tasks.

## ORDER BY

The ORDER BY clause is used at the end of a SELECT statement to sort the query results in ascending or descending order.

Suppose you're asked to list all customers sorted alphabetically to uniformly organize the records. For example,

```sql
-- Select everything from the Customers table
-- Sort the results by the name column in ascending order

SELECT *
FROM Customers
ORDER BY name;
```

By default, ORDER BY sorts rows in ascending order, so the above query:

```sql
ORDER BY first_name;
is equivalent to

ORDER BY first_name ASC;
```

To sort rows in descending order, you can simply use DESC keyword. We'll explore this in detail after a quick refresher quiz and practice.

Suppose you need to list all the customers based on their purchase amount to rank them from the highest to lowest spenders.

To do this, you need to use the DESC keyword explicitly with the ORDER BY. For example,

```sql
-- Select name and purchase amount from the Customers table
-- Sort by purchase amount in descending order

SELECT name, purchase_amount FROM customers
ORDER BY purchase_amount DESC;
```

### Sorting with Filtering

Suppose you want to retrieve customers from the USA, sorted by their purchase amount from highest to lowest.

For this, you can use the ORDER BY clause alongside the WHERE clause to filter and sort the required rows.

```sql
-- Select name and purchase amount from the Customers table
-- who are from USA
-- Sorted by purchase_amount in descending order

SELECT name, purchase_amount FROM customers
WHERE country = 'USA'
ORDER BY purchase_amount DESC;
```

This SQL query selects the name and purchase_amount of customers from the USA, sorted in descending order by their purchase amount.

### ORDER BY With Multiple Columns

Suppose you need to:

Sort customers by purchase amount, with the highest spenders first.
If two customers have the same purchase amount, sort them alphabetically by name.
In such cases, sorting by multiple columns helps create a more structured and meaningful order.

```sql
-- Sort results by purchase_amount in descending order
-- if there are multiple customers with the same purchase_amount,
-- sort them by name in ascending order

SELECT name, purchase_amount
FROM customers
ORDER BY purchase_amount DESC, name ASC;
```
