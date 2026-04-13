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
