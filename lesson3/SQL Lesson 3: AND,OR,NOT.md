SQL Lesson 3: AND, OR, NOT



A query can run successfully and still give you the wrong answer.



In hotel revenue and commercial operations, we rarely filter on just one condition. We usually need:



• Confirmed reservations

• From a specific market

• Above a certain revenue value

• From particular market segments



That's where AND, OR, and NOT come in.



AND → both conditions must be true

OR → at least one condition must be true

NOT → reverses a condition



For example:



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



Read it like a sentence:



"From reservations, keep only confirmed bookings in the UAE that are either Transient or Group, then show me the 10 with the highest room revenue."



💡 The important part isn't AND or OR. It's the brackets.



After comparisons like = and >, SQL evaluates NOT first, then AND, then OR. So whenever AND and OR appear together, I add brackets to make the business logic explicit:

AND (market_segment = 'Transient'

     OR market_segment = 'Group')

Anyone reviewing the query can see immediately what belongs together.



⚠️ Now see what happens without them:



WHERE country = 'UAE'

  AND market_segment = 'Transient'

  OR market_segment = 'Group'

It's easy to read that as "UAE bookings that are Transient or Group."

SQL doesn't. Because AND binds tighter than OR, it reads:

WHERE (country = 'UAE' AND market_segment = 'Transient')

  OR market_segment = 'Group'



Now every Group booking qualifies, including the ones outside the UAE.



No syntax error. No warning. Just a wrong number in the report.



That's one of the most important lessons I've learned so far.



The same precedence applies in Snowflake and PostgreSQL, so everything here works in both.



The SQL and an interactive tool to test this yourself are on GitHub. Link in the first comment 👇



Next lesson: BETWEEN, IN, and LIKE, three cleaner ways to filter ranges, lists, and patterns.



#SQL #DataAnalytics #HospitalityAnalytics #RevenueManagement
