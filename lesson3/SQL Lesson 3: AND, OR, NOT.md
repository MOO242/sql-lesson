# SQL Lesson 3: AND, OR, NOT

Part of **SQL for Hospitality Analytics**. Small logic mistakes can change the entire report.

**Try it live:** [Logic Lab, the interactive tool](https://moo242.github.io/sql-lessons/lesson3/)

All queries work in **Snowflake** and **PostgreSQL**.

## What this lesson covers

| Operator | Meaning |
|---|---|
| `AND` | Both conditions must be true |
| `OR` | At least one condition must be true |
| `NOT` | Reverses a condition |

In hotel revenue work we rarely filter on one condition. We usually need confirmed reservations, from a specific market, above a revenue value, from particular market segments. That is where AND, OR and NOT come in.

## The example query

```sql
SELECT
  confirmation_no,
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

Read it like a sentence: *"From reservations, keep only confirmed bookings in the UAE that are either Transient or Group, then show me the 10 with the highest room revenue."*

## The brackets matter

After comparisons like `=` and `>`, SQL evaluates **NOT first, then AND, then OR**. When AND and OR appear together, add brackets so the business logic is explicit and anyone reviewing the query can see what belongs together.

## The trap: missing brackets

```sql
WHERE country = 'UAE'
  AND market_segment = 'Transient'
  OR market_segment = 'Group'
```

This does **not** mean "UAE bookings that are Transient or Group". Because AND binds tighter than OR, SQL reads it as:

```sql
WHERE (country = 'UAE' AND market_segment = 'Transient')
  OR market_segment = 'Group'
```

Now every Group booking qualifies, including bookings outside the UAE.

The query runs. There is no syntax error. But the business answer is wrong.

**A query can run successfully and still give you the wrong answer.**

## Run it yourself

Sample data is fictional. Works as is in Snowflake and PostgreSQL.

```sql
CREATE TABLE reservations (
  confirmation_no VARCHAR(10),
  hotel_name      VARCHAR(60),
  arrival_date    DATE,
  country         VARCHAR(20),
  market_segment  VARCHAR(20),
  booking_status  VARCHAR(20),
  room_revenue    NUMERIC(10,2)
);

INSERT INTO reservations VALUES
('CN-1001','Palm Crest Hotel Dubai',          '2026-11-01','UAE',  'Transient','Confirmed',18400),
('CN-1002','Skyline Grand DIFC',              '2026-11-02','UAE',  'Group',    'Confirmed',52600),
('CN-1003','Corniche Breeze Abu Dhabi',       '2026-11-03','UAE',  'Corporate','Confirmed', 7900),
('CN-1004','Skyline Grand DIFC',              '2026-11-04','UAE',  'Transient','Cancelled',12300),
('CN-1005','Desert Rose Riyadh',              '2026-11-05','KSA',  'Group',    'Confirmed',41800),
('CN-1006','Pearl Bay Doha',                  '2026-11-06','Qatar','Group',    'Confirmed',36500),
('CN-1007','Nile Terrace Cairo',              '2026-11-07','Egypt','Transient','Confirmed', 6200),
('CN-1008','Oasis Haven Al Ain',              '2026-11-08','UAE',  'Group',    'Confirmed',22100),
('CN-1009','Saadiyat Lumen Abu Dhabi',        '2026-11-09','UAE',  'Transient','Confirmed',15800),
('CN-1010','Red Sea Pavilion Jeddah',         '2026-11-10','KSA',  'Group',    'Cancelled',29900),
('CN-1011','Emirates Gate Hotel',             '2026-11-11','UAE',  'Wholesale','Confirmed', 9400),
('CN-1012','Gulf of Oman Retreat Muscat',     '2026-11-12','Oman', 'Group',    'Confirmed',27300),
('CN-1013','Marina Tide Dubai',               '2026-11-13','UAE',  'Group',    'Cancelled',31200),
('CN-1014','Pyramid View Cairo',              '2026-11-14','Egypt','Corporate','Confirmed', 5100),
('CN-1015','West Bay Regency Doha',           '2026-11-15','Qatar','Transient','Confirmed',24800),
('CN-1016','Green Oasis Dubai',               '2026-11-16','UAE',  'Transient','Confirmed', 8700);
```

Run the example query above. It returns 5 rows. Now remove the brackets:

```sql
SELECT confirmation_no, hotel_name, country, market_segment, booking_status, room_revenue
FROM reservations
WHERE booking_status = 'Confirmed'
  AND country = 'UAE'
  AND market_segment = 'Transient'
  OR market_segment = 'Group'
ORDER BY room_revenue DESC;
```

It returns 10 rows: the same 5, plus 5 Group bookings that should not qualify (two from KSA, one each from Qatar and Oman, and a cancelled one in the UAE). No error, wrong answer.

## Next lesson

BETWEEN, IN and LIKE: three cleaner ways to filter ranges, lists and patterns.

---

Created by **Mohamed Al Razek** · [LinkedIn](https://www.linkedin.com/in/mohamed-al-razek-950a00104/) · [GitHub](https://github.com/MOO242)
