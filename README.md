SQL Lesson 1: the four keywords behind every report I've ever built.

After nearly a decade in hotel revenue and commercial operations, I've learned one thing:

#SQL is the tool in data you really need to master. So I'm starting a series to share what I've learned from applying it to real hospitality analytics projects, one tool at a time. 

Lesson 1: four keywords: SELECT → which columns you want; FROM → which table they live in; ORDER BY → how the rows are sorted; LIMIT → how many rows you keep. 

SELECT hotel_name, revpar FROM hotel_performance ORDER BY revpar DESC LIMIT 5; 

Read it like a sentence: From hotel performance, give me the hotel and its RevPAR, highest first, top 5. 

💡 You write SELECT first, but the database reads FROM first. It loads the table, picks the columns, sorts the rows, and then cuts them down. 

⚠️ Here's why this matters in real work: without ORDER BY, row order isn't guaranteed. 

LIMIT on an unsorted table gives you some hotels, not the top 5 hotels. That's how wrong numbers end up in a leadership deck. I built a small interactive tool so you can watch each step change the query. The link is in the first comment 👇 

Next lesson: WHERE and how to filter rows.

#SQL #DataAnalytics #HospitalityAnalytics #RevenueManagement
