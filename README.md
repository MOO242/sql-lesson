# Learn SQL for Hospitality Analytics

A free, hands-on SQL series built from nearly a decade in hotel revenue and commercial operations.
Short lessons, real hospitality examples (hotels, RevPAR, ADR, reservations), and interactive demos you can click through.

**Live demo:** [moo242.github.io/learn-sql-hospitality-analytics](https://moo242.github.io/sql-lessons/)

**Works in:** Snowflake and PostgreSQL. Every query in this series runs in both, and dialect differences are called out where they matter.

---

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

- Toggle columns for `SELECT`
- Choose an `ORDER BY` column and flip `ASC` / `DESC`
- Turn `LIMIT` on and off and change the number
- Watch the query, the step-by-step logic, and the result table update live

To run it locally, download `index.html` and open it in any browser.

The data (`hotel_performance`, 12 hotels) is **fictional sample data** created for teaching. It is not real property data.

---

## Roadmap

| # | Lesson | Topics | Status |
| --- | --- | --- | --- |
| 1 | The four keywords | `SELECT`, `FROM`, `ORDER BY`, `LIMIT` | ✅ Done |
| 2 | Filtering rows | `WHERE`, comparison operators | 🔜 Next |
| 3 | Combining conditions | `AND`, `OR`, `NOT` | Planned |
| 4 | Ranges, lists, and patterns | `BETWEEN`, `IN`, `LIKE`, `ILIKE` | Planned |
| 5 | Unique rows | `DISTINCT` | Planned |
| 6 | How SQL really runs | Execution order | Planned |
| 7 | Snowflake vs PostgreSQL | Dialect differences | Planned |
| 8 | Defining tables | Data types, `CREATE`, `ALTER`, `DROP` | Planned |
| 9 | Changing data | `INSERT`, `UPDATE`, `DELETE` | Planned |
| 10 | Joining tables | `INNER`, `LEFT`, `RIGHT`, `FULL JOIN` | Planned |
| 11 | Finding what’s missing | Anti joins | Planned |
| 12 | Special joins | `CROSS JOIN`, self joins | Planned |
| 13 | Multi-table joins | Join fan-out | Planned |
| 14 | Stacking results | `UNION`, `UNION ALL` | Planned |
| 15 | Reconciliation | `EXCEPT`, `INTERSECT` | Planned |
| 16 | String functions | `TRIM`, `UPPER`, `CONCAT` | Planned |
| 17 | Numeric functions | `ROUND`, safe division | Planned |
| 18 | Working with dates | Date parts, formatting, date math | Planned |
| 19 | Conditional logic | `CASE` | Planned |
| 20 | Handling NULLs | `COALESCE`, `NULLIF` | Planned |

---

## About

I’m **Mohamed Al Razek**, a Business Applications Analyst based in Dubai, with nearly a decade in hotel revenue management, reservations, and commercial operations. This series teaches SQL the way it’s used in real hospitality analytics, one practical lesson at a time.

- LinkedIn: Mohamed Al Razek
- GitHub: MOO242

If this series helps you, a ⭐ on the repo is appreciated.
