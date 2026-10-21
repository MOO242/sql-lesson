# Lesson 2: WHERE — Filtering Rows

In nearly a decade of hotel revenue work, I've learned that the hardest part of a report is rarely the math. It's making sure you're counting the right rows.

That's the job of `WHERE`.

---

## What WHERE Does

`WHERE` keeps only the rows that meet a condition.

### Comparison Operators

| Operator | Meaning                  |
|:--------:|--------------------------|
| `=`      | Equal to                 |
| `<>`     | Not equal to             |
| `>`      | Greater than             |
| `<`      | Less than                |
| `>=`     | Greater than or equal to |
| `<=`     | Less than or equal to    |

---

## Example

```sql
SELECT confirmation_no,
       arrival_date,
       room_revenue
FROM reservations
WHERE booking_status = 'Confirmed'
ORDER BY room_revenue DESC
LIMIT 10;
```

Read it like a sentence:

> "From reservations, keep only the confirmed ones, then show me the 10 with the highest revenue."

---

## Remember the Order of Execution

> [!TIP]
> From Lesson 1: the database reads `FROM`, then `WHERE`, and only then `SELECT`.
> That's why you **can't** use a column alias defined in `SELECT` inside `WHERE`. It doesn't exist yet.

---

## The NULL Trap

> [!WARNING]
> Here's the trap I see in real work: `WHERE booking_status <> 'Cancelled'` looks safe, but it also drops every row where the status is `NULL`.
>
> In SQL, comparing anything to `NULL` returns *unknown*, not true. Those reservations silently disappear from your revenue.
>
> **Always check for NULLs before you trust a filter.**

To keep them, handle `NULL` explicitly:

```sql
WHERE booking_status <> 'Cancelled'
   OR booking_status IS NULL
```

---

## Snowflake vs. PostgreSQL

Both databases behave the same way here:

- Both accept `!=` as an alternative to `<>`.
- Text comparisons are **case-sensitive**: `'Confirmed'` and `'confirmed'` do not match.

---

## The Interactive Tool

`index.html` is a single-file demo with no install and no dependencies.

**Live demo:** [moo242.github.io/learn-sql-hospitality-analytics](https://moo242.github.io/sql-lessons/)

What you can do in it:

- Toggle columns for `SELECT`
- Choose an `ORDER BY` column and flip `ASC` / `DESC`
- Turn `LIMIT` on and off and change the number
- Watch the query, the step-by-step logic, and the result table update live

**To run it locally:** download `index.html` and open it in any browser.

> [!NOTE]
> The data (`hotel_performance`, 12 hotels) is fictional sample data created for teaching. It is not real property data.

---

## Next Lesson

**Lesson 3: `AND`, `OR`, `NOT`**, and the missing brackets that can overstate revenue.
