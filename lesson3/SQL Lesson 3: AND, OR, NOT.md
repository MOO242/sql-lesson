# Lesson 3: AND, OR, NOT — Combining Conditions

In nearly a decade of hotel revenue work, I've learned that a query that runs is not the same as a query that's right. The scariest mistakes don't throw an error. They just return the wrong rows.

Most real filters need more than one condition. That's the job of `AND`, `OR` and `NOT`.

---

## What They Do

In reporting we rarely filter on a single condition. We might need confirmed reservations, from a specific market, above a revenue value, from particular market segments.

| Operator | Meaning                              |
|:--------:|--------------------------------------|
| `AND`    | Both conditions must be true         |
| `OR`     | At least one condition must be true  |
| `NOT`    | Reverses a condition                 |

---

## Example

```sql
SELECT confirmation_no,
       hotel_name,
       arrival_date,
       room_revenue,
       market_segment
FROM reservations
WHERE booking_status = 'Confirmed'
  AND country = 'UAE'
  AND (market_segment = 'Transient'
       OR market_segment = 'Group')
ORDER BY room_revenue DESC
LIMIT 10;
```

Read it like a sentence:

> "From reservations, keep only confirmed bookings in the UAE that are either Transient or Group, then show me the 10 with the highest room revenue."

---

## Remember the Order of Evaluation

> [!TIP]
> After comparisons like `=` and `>`, SQL evaluates `NOT` first, then `AND`, then `OR`.
> When `AND` and `OR` appear together, use brackets to make the business logic explicit. Anyone reviewing the query can then see what belongs together.

```sql
AND (market_segment = 'Transient'
     OR market_segment = 'Group')
```

---

## The Missing Brackets Trap

> [!WARNING]
> Here's the trap I see in real work. This looks like "UAE bookings that are Transient or Group":
>
> ```sql
> WHERE country = 'UAE'
>   AND market_segment = 'Transient'
>   OR market_segment = 'Group'
> ```
>
> It isn't. Because `AND` binds tighter than `OR`, SQL reads it as:
>
> ```sql
> WHERE (country = 'UAE' AND market_segment = 'Transient')
>    OR market_segment = 'Group'
> ```
>
> Now every Group booking qualifies, including bookings outside the UAE.
>
> The query runs. There's no syntax error. But the business answer is wrong.
>
> **A query can run successfully and still give you the wrong answer.**

---

## Snowflake vs. PostgreSQL

Both databases behave the same way here:

- Both follow the same `NOT` → `AND` → `OR` precedence, so the queries above work in either one.
- Text comparisons are **case-sensitive**: `'Confirmed'` and `'confirmed'` do not match.

---

## The Interactive Tool

`index.html` is a single-file demo with no install and no dependencies.

**Live demo:** [moo242.github.io/sql-lessons/lesson3](https://moo242.github.io/sql-lessons/lesson3/)

What you can do in it:

- Start from a preset: with brackets, missing brackets, using `NOT`, or `OR` everywhere
- Add `NOT` to any condition and switch between `AND` and `OR`
- Put brackets around any group of conditions
- See the query you wrote next to how SQL actually reads it
- Watch the result table flag rows that wrongly qualify or go missing

**To run it locally:** download `index.html` and open it in any browser.

**To run the SQL yourself:** [`reservations.sql`](reservations.sql) creates the table and loads the sample rows. The query with brackets returns 5 rows. Remove the brackets and it returns 10, because Group bookings from KSA, Qatar and Oman, plus cancelled ones, slip in.

> [!NOTE]
> The data (`reservations`, 16 rows) is fictional sample data created for teaching. It is not real property data.

---

## Next Lesson

**Lesson 4: `BETWEEN`, `IN`, `LIKE`**, three cleaner ways to filter ranges, lists and patterns.
