# Crowdfunding SQL

## Learning Goals

* Identify table example  
* Create a new table, records, and queries

## Identify Table Example

`SQL` is a programming language that allows you to "nest" statements inside each
other. Let's quickly consider an example using grocery data.

### Create a Grocery Table

```sql
CREATE TABLE groceries (id INTEGER PRIMARY KEY, name TEXT, quantity INTEGER, aisle INTEGER);

INSERT INTO groceries VALUES (1, "Apples", 2, 1);
INSERT INTO groceries VALUES (2, "Oranges", 4, 2);
INSERT INTO groceries VALUES(3, "Peaches", 6, 3);
```

### Selecting Data from the Grocery Table

Given the example SQL above, we'd be able to run a query like

```sql
SELECT * FROM groceries;
```

And get back the inserted data (represented in a table below)

```text
id                 name        quantity      aisle
------------    ----------  ----------  ----------  
1                Apples          2          1
2                Oranges         4          2
3                Peaches         6          3
```

### `SUM`

`SUM` will return the total of the column you select. In this case, the total
number of items in the `groceries` column is 12.

```sql
SELECT SUM(quantity) FROM groceries;
```

### Returns

```sql
SUM(quantity)
-------------
12
```

To make it a little more useful we can `GROUP BY` the aisle that the items are
in and `ORDER BY` the sum of the `aisle`.

```sql
SELECT aisle, SUM(quantity) FROM groceries GROUP BY aisle ORDER BY SUM(quantity);
```

### Returns

```sql
aisle    SUM(quantity)
-------  --------------
1           2
2           4
3           6
```

## Instructions

In this lab, you have two tasks - first, you will need to create three tables in
`lib/create.sql`, and populate them with data in `lib/insert.sql`. Then, you
will need to write the necessary SQL statements inside the methods in
`lib/sql_queries.rb` that would allow you to query data from your newly created
tables.

## Create New Table, Records and Queries

Now we're going to create a schema based on the following information:

* A project has a title, a category, a funding goal, a start date, and an end date.
* A user has a name and an age
* A pledge has an amount. It belongs to a user, and it also belongs to a project.

### Create the Tables

In the `create.sql` file, model your tables. You should have a table for
projects, users, and pledges.

### Insert Records into Database

Within the `insert.sql` file, insert 10 projects, 20 users, and 30 pledges into the database.

### Write the Queries

Write SQL queries as strings in `lib/sql_queries` in each of the provided methods.

Run `learn` as you go and read the test messages for additional guidance.

## Resources

* [Seldom Blog](http://blog.seldomatt.com/) - [About SQL Joins: The 3 Ring Binder Model](http://blog.seldomatt.com/blog/2012/10/17/about-sql-joins-the-3-ring-binder-model/)
* [Coding Horror](http://blog.codinghorror.com/) - [A Visual Explanation of SQL Joins](http://blog.codinghorror.com/a-visual-explanation-of-sql-joins/)
* [Geeky is Awesome](http://geekyisawesome.blogspot.com/) - [SQL Joins Tutorial](http://geekyisawesome.blogspot.com/2011/03/sql-joins-tutorial.html)

<p data-visibility='hidden'>View <a href='https://learn.co/lessons/sql-crowdfunding-lab' title='SQL Crowdfunding Lab'>SQL Crowdfunding Lab</a> on Learn.co and start learning to code for free.</p>

## Notes
1. `selects_the_titles_of_all_projects_and_their_pledge_amounts_alphabetized_by_title`

```SQL
SELECT projects.title, SUM(pledges.amount) -- return the project title + total sum of the pledges they got.
-- the sum is really cool, so it looked for what project was matched to what pledge by project_id
-- and æternity did in fact get $1,457
FROM projects -- ultimately we want to grab this information from projects
JOIN pledges -- but to get the pledge amount, we want to make a join table
ON projects.id = pledges.project_id -- and this is how select knows what to match for.
GROUP BY projects.title;  -- sorts alphabetically
```

title      | SUM(pledges.amount)
---------- | -------------------
Aragon     | 1364               
Augur      | 2508               
Bancor Pro | 3562               
Basic Atte | 3218               
Cosmos     | 467                
Ethereum   | 500                
Gnosis     | 1180               
Tezos      | 1156               
The DAO    | 1965               
æternity   | 1457

2. `selects_the_user_name_age_and_pledge_amount_for_all_pledges_alphabetized_by_name`

```sql
SELECT users.name, users.age, SUM(pledges.amount)
-- same as above, return the name and age from users, and you want the pledge amount for each user
FROM users -- from users, we want this information
JOIN pledges -- but create a join table with pledges
ON users.id = pledges.user_id -- because we want the pledges that match with a particular user ID
GROUP BY users.name; -- and then sort it alphabetically
```

name            |age        |SUM(pledges.amount)
--------------- |---------- |-------------------
Deleted Account |41         |500                
_nakamoto       |22         |629                
bitcoin_jesus   |30         |725                
boomdart        |22         |880                
crypto_bets     |29         |544                
crypto_cheryl   |24         |862                
crypto_kitty    |20         |1536               
crypto_mom      |55         |247                
crypto_shill    |19         |719                
crypto_zombie   |15         |1294               
feelin_bullish  |32         |1133               
finance_bot     |33         |299                
meta_musk       |34         |1246               
satoshi_        |20         |350                
sh*tcoin_federa |25         |1232               
tesla_calls_at_ |24         |467                
wen_moon        |27         |2465               
whale__         |26         |707                
white_paper     |27         |803                
yellow_lambo    |18         |739   

3. `selects_the_titles_and_amount_over_goal_of_all_projects_that_have_met_their_funding_goal`

```SQL
SELECT projects.title, (SUM(pledges.amount) - projects.funding_goal) -- simple to return the names
-- but the sum had to grab from the pledge amount and subtract from the funding goal.
FROM projects -- ultimately need to take this from projects
JOIN pledges -- but join with pledges
ON projects.id = pledges.project_id -- where a project id is matched with a project_id
GROUP BY projects.title sort them alphabetically
HAVING (SUM(pledges.amount) - projects.funding_goal) >= 0;
-- you can't use WHERE here, it's only for non-aggregates.
-- but show the results having a pledge amount over the funding goal, so long as they are >= 0
-- because the projects with an amount lower than 0 (negative AF) haven't been fulfilled.
-- funding_goal being met is ok though.
```

The result?
`[2020-05-21 01:46:45 +0000] Success. 0 rows retrieved`
Oops. This was intended. But these projects did so well. Landed on Wikipedia for the most money raised in crowdfunding.

4. `selects_user_names_and_amounts_of_all_pledges_grouped_by_name_then_orders_them_by_the_summed_amount`

```SQL
SELECT users.name, SUM(pledges.amount) -- return the user name, return the sum of their pledge
FROM users
JOIN pledges
ON users.id = pledges.user_id
GROUP BY users.name
ORDER BY SUM(pledges.amount);
```

name       |SUM(pledges.amount)
---------- |-------------------
wen_moon   |2465               
crypto_kit |1536               
crypto_zom |1294               
meta_musk  |1246               
sh*tcoin_f |1232               
feelin_bul |1133               
boomdart   |880                
crypto_che |862                
white_pape |803                
yellow_lam |739                
bitcoin_je |725                
crypto_shi |719                
whale__    |707                
_nakamoto  |629                
crypto_bet |544                
Deleted Ac |500                
tesla_call |467                
satoshi_   |350                
finance_bo |299                
crypto_mom |247

5. `selects_the_category_names_and_pledge_amounts_of_all_pledges_in_the_music_category`

*Didn't return anything here for me, I've got no music projects.*
