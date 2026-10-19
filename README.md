# Learn SQL for Hospitality Analytics

A free, hands-on SQL series built from nearly a decade in hotel revenue and commercial operations.
One tool at a time. Short lessons. Interactive demos you can click through.

**Live demo:** https://moo242.github.io/learn-sql-hospitality-analytics/

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

---

## The interactive tool

`index.html` is a single-file demo with no install and no dependencies.

- Toggle columns for `SELECT`
- Choose an `ORDER BY` column and flip `ASC` / `DESC`
- Turn `LIMIT` on and off and change the number
- Watch the query, the step-by-step logic and the result table update live

To run it locally, download `index.html` and open it in any browser.

The data (`hotel_performance`, 12 hotels) is **fictional sample data** made up for teaching. It is not real property data.

---

## Roadmap

| Lesson | Topic | Status |
| --- | --- | --- |
| 1 | SELECT, FROM, ORDER BY, LIMIT | Done |
| 2 | WHERE: filtering rows | Next |

---

## About

I’m **Mohamed Al Razek**, a Business Applications Analyst with a background in hotel revenue management, based in Dubai. I’m still learning and building, and I’m sharing what I learn to help others starting out. I’m not a content creator, just here to share and support.

- LinkedIn: https://www.linkedin.com/in/mohamed-al-razek-950a00104/
- GitHub: https://github.com/MOO242

If this helped you, a star on the repo is appreciated.
