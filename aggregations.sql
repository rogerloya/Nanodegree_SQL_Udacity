/*QUIZ: SUM*/
/*1*/
SELECT SUM (poster_qty) AS total_poster_sales
FROM orders;

/*2*/
SELECT SUM (standard_qty) AS total_standard_sales
FROM orders;

/*3*/
SELECT SUM (total_amt_usd) AS total_dollar_sales
FROM orders;

/*4*/
SELECT standard_amt_usd + gloss_amt_usd AS total_standard_gloss
FROM orders;

/*5*/
SELECT (SUM(standard_amt_usd)/SUM(standard_qty)) AS st
FROM orders;

/*QUIZ MIN MAX AVG*/
/*1*/
SELECT MIN(occurred_at)
FROM orders;

/*2*/
SELECT occurred_at
FROM orders
ORDER BY occurred_at
LIMIT 1;

/*3*/
SELECT MAX(occurred_at)
FROM web_events;

/*4*/
SELECT occurred_at
FROM web_events
ORDER BY occurred_at DESC
LIMIT 1;

/*5*/
SELECT AVG(standard_amt_usd) sta,
AVG(standard_qty) stq,
AVG(poster_amt_usd) pa,
AVG(poster_qty) pq,
AVG(gloss_amt_usd) gla,
AVG(gloss_qty) glq
FROM orders;

/*6*/
SELECT *
FROM (SELECT total_amt_usd
      FROM orders
      ORDER BY total_amt_usd
      LIMIT 3457) AS Table1
ORDER BY total_amt_usd DESC
LIMIT 2;

/*QUIZ: GROUP BY*/
/*1*/
SELECT a.name, MIN(o.occurred_at)
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.name

SELECT a.name, o.occurred_at
FROM accounts a
JOIN orders o
ON a.id = o.account_id
ORDER BY occurred_at
LIMIT 1;
/*2*/
SELECT a.name, SUM(o.total_amt_usd) ts
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.name

/*3*/
SELECT w.occurred_at, w.channel, a.name
FROM web_events w
JOIN accounts a
ON a.id = w.account_id
ORDER BY w.occurred_at DESC
LIMIT 1;

/*4*/
SELECT channel, COUNT(*)
FROM web_events
GROUP BY channel
ORDER BY COUNT(*) DESC;

/*5*/
SELECT a.primary_poc, w.occurred_at
FROM web_events w
JOIN accounts a
ON a.id = w.account_id
ORDER BY w.occurred_at
LIMIT 1;

/*6*/
SELECT a.name, MIN(o.total_amt_usd) so
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.name
ORDER BY so

/*7*/
SELECT COUNT(a.sales_rep_id), s.region_id
FROM accounts a
JOIN sales_reps s
ON a.sales_rep_id = s.id
GROUP BY s.region_id;

SELECT r.name, COUNT(*) num_reps
FROM region r
JOIN sales_reps s
ON r.id = s.region_id
GROUP BY r.name
ORDER BY num_reps;

/*QUIZ: GROUP BY PART II*/
/*1*/
SELECT a.name, ROUND(AVG(standard_qty),2) st,
ROUND(AVG(gloss_qty),2) gl, ROUND(AVG(poster_qty),2) ps
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.name;

/*2*/
SELECT a.name, ROUND(AVG(standard_amt_usd),2) st,
ROUND(AVG(gloss_amt_usd),2) gl, ROUND(AVG(poster_amt_usd),2) ps
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.name;

/*3*/
SELECT s.name, w.channel, COUNT(*) occ
FROM sales_reps s
JOIN accounts a
ON s.id = a.sales_rep_id
JOIN web_events w
ON a.id = w.account_id
GROUP BY s.name, w.channel
ORDER BY occ DESC;

SELECT s.name, w.channel, COUNT(*) num_events
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
JOIN sales_reps s
ON s.id = a.sales_rep_id
GROUP BY s.name, w.channel
ORDER BY num_events DESC;
/*4*/
SELECT r.name region_name, w.channel, COUNT(*) occ
FROM region r
JOIN sales_reps s
ON r.id = s.region_id
JOIN accounts a
ON s.id = a.sales_rep_id
JOIN web_events w
ON a.id = w.account_id
GROUP BY r.name, w.channel
ORDER BY occ DESC;

/*QUIX: Having*/
/*1*/



SELECT s.id, s.name, COUNT(*) num_accounts
FROM accounts a
JOIN sales_reps s
ON s.id = a.sales_rep_id
GROUP BY s.id, s.name
HAVING COUNT(*) > 5
ORDER BY num_accounts;
/*2*/
SELECT a.id, a.name, COUNT(*) over_20
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
HAVING COUNT(*) > 20
ORDER BY over_20 DESC;

/*3*/
same as 2 with LIMIT

/*4*/
SELECT a.id, a.name, SUM(total_amt_usd)
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
HAVING SUM(total_amt_usd) > 30000
ORDER BY SUM(total_amt_usd) DESC;

/*5*/
SELECT a.id, a.name, SUM(total_amt_usd)
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
HAVING SUM(total_amt_usd) < 1000
ORDER BY SUM(total_amt_usd) DESC;

/*6*/
SELECT a.id, a.name, SUM(total_amt_usd)
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
ORDER BY SUM(total_amt_usd) DESC
LIMIT 1;

/*7*/
SELECT a.id, a.name, SUM(total_amt_usd)
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
ORDER BY SUM(total_amt_usd)
LIMIT 1;

/*8*/
SELECT a.id, a.name, w.channel, COUNT(*) use_of_channel
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
GROUP BY a.id, a.name, w.channel
HAVING COUNT(*) > 6 AND w.channel = 'facebook'
ORDER BY use_of_channel;

/*9*/
SELECT a.id, a.name, w.channel, COUNT(*) num_chan
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
GROUP BY a.id, a.name, w.channel
HAVING COUNT(*) > 6 AND w.channel = 'facebook'
ORDER BY num_chan DESC
LIMIT 1;

/*10*/
SELECT a.id, a.name, w.channel, COUNT(*) num_chan
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
GROUP BY a.id, a.name, w.channel
ORDER BY num_chan DESC
LIMIT 10;



