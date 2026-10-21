In nearly a decade of hotel revenue work, I've learned that the hardest part of a report is rarely the math. It's making sure you're counting the right rows. That's the job of WHERE.

WHERE keeps only the rows that meet a condition.

= equal to <> not equal to

greater than / < less than = greater than or equal to / <= less than or equal to

SELECT confirmation_no, arrival_date, room_revenue FROM reservations WHERE booking_status = 'Confirmed' ORDER BY room_revenue DESC LIMIT 10;

Read it like a sentence: "From reservations, keep only the confirmed ones, then show me the 10 with the highest revenue."

💡 Remember the order from Lesson 1: the database reads FROM, then WHERE, and only then SELECT. That's why you can't use a column alias from SELECT inside WHERE. It doesn't exist yet.

⚠️ Here's the trap I see in real work: WHERE booking_status <> 'Cancelled' looks safe, but it also drops every row where the status is NULL. In SQL, comparing anything to NULL returns "unknown," not true, so those reservations silently disappear from your revenue. Always check for NULLs before you trust a filter.

Snowflake and PostgreSQL behave the same here. Both also accept != as "not equal to," and text values are case-sensitive in both: 'Confirmed' and 'confirmed' don't match.

Next lesson: AND, OR, NOT, and the missing brackets that can overstate revenue.

