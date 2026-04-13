# Aggregate Functions with SQL

### SUM — Summing the rows of a column

```sql
SELECT SUM(column) AS column_sum
  FROM table;
```

### AVG — Computing the average of a column's values

```sql
SELECT AVG(column) AS column_avg
  FROM table;
```

### MIN — Finding the minimum in a column

```sql
SELECT MIN(column) AS column_min
  FROM table;
```

### MAX — Finding the maximum in a column

```sql
SELECT MAX(column) AS column_max
  FROM table;
```

### COUNT(\*) — Counting table rows

```sql
SELECT COUNT(*) AS num_rows
  FROM table;
```

### COUNT(column) — Counting non-null values in a column

```sql
SELECT COUNT(column) AS num_non_empty_values
  FROM table;
```

---

## Concepts

- **Aggregate functions** allow you to run operations that combine several rows into a single result.
- The key difference between **scalar** and **aggregate** functions:
  - **Scalar** — operates on _each row or value_ of a column individually.
  - **Aggregate** — operates on a _collection_ of a column's rows or values.

---

## Resources

- [SQL aggregate functions](https://www.w3schools.com/sql/sql_aggregate_functions.asp)
- [SQL scalar vs aggregate functions](https://www.geeksforgeeks.org/difference-between-aggregate-and-scalar-functions-in-sql/)

# Summary Statistics with SQL

### Aggregating the rows of a column

```sql
SELECT aggregate_function(column) AS new_name
  FROM table;
```

### Computing several summary statistics

```sql
SELECT SUM(column_1) AS column_name_1, AVG(column_2) AS column_name_2, ...
  FROM table;
```

### Computing statistics of computed columns

```sql
SELECT AVG(computed_column) AS avg_runtime
  FROM table;
```

### Combining aggregate and scalar functions

```sql
SELECT ROUND(AVG(column_or_computed_column), 1) AS column_name
  FROM table;
```

### Combining aggregate functions

```sql
SELECT SUM(column) / COUNT(column) AS column_name
  FROM table;
```

### Summarizing statistics under conditions

```sql
SELECT SUM(column_1) AS column_name_1, AVG(column_2) AS column_name_2, ...
  FROM table
 WHERE conditions;
```

---

## Concepts

- **Aggregate functions** allow you to perform operations that combine several rows into a single result.
- Aggregate functions can be used alongside other clauses and functions already covered (e.g. `WHERE`, `ROUND`, arithmetic operators).

---

## Resources

- [SQL aggregate functions](https://www.w3schools.com/sql/sql_aggregate_functions.asp)

# Group Summary Statistics with SQL

### Counting rows by group

```sql
SELECT group_column, COUNT(*) AS num_row
  FROM table
 GROUP BY group_column;
```

### Summing a computed column by group

```sql
SELECT group_column, SUM(column_1 * column_2) AS total
  FROM table
 GROUP BY group_column;
```

### Computing statistics with grouped data under conditions

```sql
SELECT group_column, COUNT(*) AS num_row, AVG(column) AS avg_column
  FROM table
 WHERE conditions
 GROUP BY group_column;
```

### Grouping rows and ordering the result

```sql
SELECT group_column,
       COUNT(*) AS num_row,
       SUM(column) AS sum_column
  FROM table
 GROUP BY group_column
 ORDER BY sum_column DESC,
          num_row DESC
 LIMIT n;
```

### Writing a comprehensive query

```sql
SELECT billing_city,
       COUNT(*) AS num_row,
       SUM(total) AS overall_sale,
       MIN(total) AS min_sale,
       AVG(total) AS avg_sale,
       MAX(total) AS max_sale
  FROM invoice
 WHERE billing_country = 'Canada'
    OR billing_country = 'France'
 GROUP BY billing_city
 ORDER BY overall_sale DESC, num_row DESC
 LIMIT 3;
```

---

## Concepts

- **Aggregate functions** allow operations combining several rows over groups.
- `GROUP BY` splits rows into groups before the aggregate function is applied.

### Clause order (written)

```
SELECT > FROM > WHERE > GROUP BY > ORDER BY > LIMIT
```

### Clause execution order

```
FROM > WHERE > GROUP BY > SELECT > ORDER BY > LIMIT
```

---

## Resources

- [SQL aggregate functions](https://www.w3schools.com/sql/sql_aggregate_functions.asp)

# Multiple Group Summary Statistics with SQL

### Counting rows grouped by several columns

```sql
SELECT group_column_1, group_column_2, COUNT(*) AS num_row
  FROM table
 GROUP BY group_column_1, group_column_2;
```

### Computing statistics grouped by several columns

```sql
SELECT group_column_1, group_column_2,
       AVG(col) AS avg_col,
       MIN(col) AS min_col,
       MAX(col) AS max_col
  FROM table
 GROUP BY group_column_1, group_column_2;
```

### Adding conditions on an aggregated column (`HAVING`)

```sql
SELECT group_column_1, group_column_2,
       AVG(col) AS avg_col,
       MIN(col) AS min_col,
       MAX(col) AS max_col
  FROM table
 GROUP BY group_column_1, group_column_2
HAVING condition_on_aggregated_columns;
```

### Combining `WHERE` and `HAVING` clauses

```sql
SELECT group_column_1, group_column_2,
       AVG(col) AS avg_col,
       MIN(col) AS min_col,
       MAX(col) AS max_col
  FROM table
 WHERE conditions
 GROUP BY group_column_1, group_column_2
HAVING condition_on_aggregated_columns;
```

> **`WHERE` vs `HAVING`**
>
> - `WHERE` filters rows _before_ grouping.
> - `HAVING` filters groups _after_ aggregation — use it when the condition involves an aggregate function (e.g. `HAVING AVG(col) > 10`).

---

## Concepts

- Aggregate functions allow operations combining several rows over groups.
- Rows can be grouped by **multiple columns** simultaneously.

### Clause order (written)

```
SELECT > FROM > WHERE > GROUP BY > HAVING > ORDER BY > LIMIT
```

### Clause execution order

```
FROM > WHERE > GROUP BY > HAVING > SELECT > ORDER BY > LIMIT
```

---

## Resources

- [SQL aggregate functions](https://www.w3schools.com/sql/sql_aggregate_functions.asp)
