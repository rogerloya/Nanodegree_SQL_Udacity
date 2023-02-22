/*Quiz ORDER BY*/
/*1*/
SELECT id, occurred_at, total_amt_usd
FROM orders
ORDER BY occurred_at
LIMIT 10;

/*2*/
SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd DESC
LIMIT 5;

/*3*/
SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd
LIMIT 20;


/*Quiz ORDER BY Part II*/
/*1*/
SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY account_id, total_amt_usd DESC;

/*2*/
SELECT id, account_id, total_amt_usd
FROM orders
ORDER BY total_amt_usd DESC, account_id;

/*quiz: WHERE*/
/*1*/
SELECT *
FROM orders
WHERE gloss_amt_usd > 1000
LIMIT 5;

/*2*/
SELECT *
FROM orders
WHERE total_amt_usd < 500
LIMIT 10;

/*quiz: WHERE with Non-Numeric*/
/*1*/
SELECT name, website, primary_poc
FROM accounts
WHERE name = 'Exxon Mobil';

/*quiz: Arithmetic Operations*/
/*1*/
SELECT id, account_id, standard_amt_usd/standard_qty
FROM orders
LIMIT 10;

/*2*/
SELECT id, account_id,
   poster_amt_usd/(standard_amt_usd + gloss_amt_usd + poster_amt_usd) AS post_per
FROM orders
LIMIT 10;

/*Quiz: LIKE*/
/*1*/
SELECT name
FROM accounts
WHERE name LIKE 'C%'

/*2*/
SELECT name
FROM accounts
WHERE NAME LIKE '%one%'

/*3*/
SELECT name
FROM accounts
WHERE NAME LIKE '%s'

/*QUIZ: IN*/
/*1*/
SELECT name, primary_poc, sales_rep_id
FROM accounts
WHERE name IN ('Walmart', 'Target', 'Nordstrom');

/*2*/
SELECT *
FROM web_events
WHERE channel IN ('organic', 'adwords');

/*QUIZ: AND BETWEEN*/
/*1*/
SELECT *
FROM orders
WHERE standard_qty > 1000
AND poster_qty = 0 AND gloss_qty = 0;

/*2*/
SELECT *
FROM accounts
WHERE name NOT LIKE 'C%'
AND name LIKE '%s';

/*3*/
SELECT occurred_at, gloss_qty
FROM orders
WHERE gloss_qty BETWEEN 24 AND 29;

/*4*/
SELECT *
FROM web_events
WHERE channel IN ('organic','adwords')
AND occurred_at BETWEEN '2016-01-01'
AND '2016-01-01'
ORDER BY occurred_at DESC;

/*Quiz: OR*/
/*1*/
SELECT id
FROM orders
WHERE gloss_qty > 4000
OR poster_qty > 4000;

/*2*/
SELECT *
FROM orders
WHERE standard_qty = 0
AND (poster_qty > 1000 OR gloss_qty > 1000);

/*3*/
SELECT *
FROM accounts
WHERE (name LIKE 'C%' OR name LIKE 'W%')
AND (primary_poc LIKE '%ana%' or primary_poc like '%Ana%')
AND primary_poc NOT LIKE '%eana%';
