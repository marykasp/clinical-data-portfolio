# Aggregate Functions with SQL

## Syntax

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
