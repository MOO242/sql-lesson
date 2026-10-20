
## Lesson 1: the four keywords behind every report

`SELECT` · `FROM` · `ORDER BY` · `LIMIT`

| Keyword | What it does |
| --- | --- |
| `SELECT` | Which columns you want |
| `FROM` | Which table they live in |
| `ORDER BY` | How the rows are sorted |
| `LIMIT` | How many rows you keep |

```sql
SELECT hotel_name, revpar
FROM hotel_performance
ORDER BY revpar DESC
LIMIT 5;
```

Read it like a sentence: *“From hotel performance, give me the hotel and its RevPAR, highest first, top 5.”*

### Two things to remember

- **Written order is not read order.** You write `SELECT` first, but the database reads `FROM` first. It loads the table, picks the columns, sorts the rows, then cuts them down.
- **`LIMIT` needs `ORDER BY`.** Without `ORDER BY`, row order isn’t guaranteed. `LIMIT` on an unsorted table gives you *some* hotels, not the *top* hotels. That’s how wrong numbers end up in a leadership deck.

> **Dialect note:** Snowflake also accepts `SELECT TOP 5`, but PostgreSQL does not. This series uses `LIMIT` so every query runs in both.
> 

---

## The interactive tool

`index.html` is a single-file demo with no install and no dependencies.

**Live demo:** [moo242.github.io/learn-sql-hospitality-analytics](https://moo242.github.io/sql-lessons/)

- Toggle columns for `SELECT`
- Choose an `ORDER BY` column and flip `ASC` / `DESC`
- Turn `LIMIT` on and off and change the number
- Watch the query, the step-by-step logic, and the result table update live

To run it locally, download `index.html` and open it in any browser.

The data (`hotel_performance`, 12 hotels) is **fictional sample data** created for teaching. It is not real property data.

---
