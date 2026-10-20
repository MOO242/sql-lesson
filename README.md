# Learn SQL for Hospitality Analytics

A free, hands-on SQL series built from nearly a decade in hotel revenue and commercial operations.
Short lessons, real hospitality examples (hotels, RevPAR, ADR, reservations), and interactive demos you can click through.

**Works in:** Snowflake and PostgreSQL. Every query in this series runs in both, and dialect differences are called out where they matter.

▶️ **Watch the lessons:** [YouTube channel](https://www.youtube.com/@MohamedAlRazek)

---

## Who this is for

- Aspiring data analysts who want SQL examples that feel like real work
- Hospitality professionals (revenue, reservations, commercial) moving into analytics
- Anyone who learns better with hotel data than with generic "employees and departments" tables

No prior SQL experience needed. Lesson 1 starts from zero.

---

## A quick taste

From Lesson 1: the top 5 hotels by RevPAR.

```sql
SELECT hotel_name, revpar
FROM hotel_performance
ORDER BY revpar DESC
LIMIT 5;
```

Runs as-is in both Snowflake and PostgreSQL.

---

## How to use this series

1. Watch the lesson on YouTube (each is short and focused on one idea).
2. Open the lesson's SQL file and interactive demo in this repo.
3. Run the queries yourself in Snowflake or PostgreSQL, then change them and see what happens.
4. Move on to the next lesson. Each one builds on the last.

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
| 11 | Finding what's missing | Anti joins | Planned |
| 12 | Special joins | `CROSS JOIN`, self joins | Planned |
| 13 | Multi-table joins | Join fan-out | Planned |
| 14 | Stacking results | `UNION`, `UNION ALL` | Planned |
| 15 | Reconciliation | `EXCEPT`, `INTERSECT` | Planned |
| 16 | String functions | `TRIM`, `UPPER`, `CONCAT` | Planned |
| 17 | Numeric functions | `ROUND`, safe division | Planned |
| 18 | Working with dates | Date parts, formatting, date math | Planned |
| 19 | Conditional logic | `CASE` | Planned |
| 20 | Handling NULLs | `COALESCE`, `NULLIF` | Planned |

New lessons are added as they are released. Star or watch the repo to follow along.

---

## About

I'm **Mohamed Al Razek**, a Business Applications Analyst based in Dubai, with nearly a decade in hotel revenue management, reservations, and commercial operations. This series teaches SQL the way it's used in real hospitality analytics, one practical lesson at a time.

- 🎥 YouTube: [@MohamedAlRazek](https://www.youtube.com/@MohamedAlRazek)
- 💼 LinkedIn: [Mohamed Al Razek](https://www.linkedin.com/in/YOUR-LINKEDIN-HANDLE)
- 🐙 GitHub: [MOO242](https://github.com/MOO242)

If this series helps you, a ⭐ on the repo is appreciated.
