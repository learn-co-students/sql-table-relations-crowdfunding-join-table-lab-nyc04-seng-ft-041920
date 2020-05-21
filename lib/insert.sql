-- CREATE TABLE users (id INTEGER PRIMARY KEY, name TEXT, age INTEGER);
-- CREATE TABLE pledges (id INTEGER PRIMARY KEY, amount INTEGER, user_id TEXT, project_id INTEGER);


-- insert.sql
--   has 20 users (FAILED - 1)
--   has 30 pledges (FAILED - 3

-- names have been fictionalized to represent crypto twitter in ICO season

INSERT INTO users (id, name, age) VALUES
(1, "crypto_shill", 19),
(2, "satoshi_", 20),
(3, "_nakamoto", 22),
(4, "crypto_cheryl", 24),
(5, "bitcoin_jesus", 30),
(6, "sh*tcoin_federation", 25),
(7, "yellow_lambo", 18),
(8, "wen_moon", 27),
(9, "feelin_bullish", 32),
(10, "Deleted Account", 41),
(11, "boomdart", 22),
(12, "crypto_zombie", 15),
(13, "crypto_kitty", 20),
(14, "meta_musk", 34),
(15, "whale__", 26),
(16, "crypto_bets", 29),
(17, "tesla_calls_at_420", 24),
(18, "crypto_mom", 55),
(19, "finance_bot", 33),
(20, "white_paper", 27);


INSERT INTO projects (id, title, category, funding_goal, start_date, end_date) VALUES
(1, "æternity", "Blockchain", 10000, "December 2016", "June 2017"),
(2, "Aragon", "Blockchain", 11000, "January 2017", "May 2017"),
(3, "Bancor Protocol", "Blockchain", 12000, "September 2016", "June 2017"),
(4, "Basic Attention Token", "Blockchain", 13000, "March 2016", "May 2017"),
(5, "Cosmos", "Blockchain", 14000, "May 2015", "April 2017"),
(6, "Ethereum", "Blockchain", 15000, "April 2010", "September 2014"),
(7, "Gnosis", "Blockchain", 30000, "February 2015", "April 2017"),
(8, "Tezos", "Blockchain", 35000, "July 2016", "July 2017"),
(9, "Augur", "Blockchain", 40000, "August 2012", "October 2015"),
(10, "The DAO", "Blockchain", 45000, "September 2013", "May 2016");

INSERT INTO pledges (id, amount, user_id, project_id) VALUES
(1, 739, 14, 7),
(2, 972, 8, 9),
(3, 467, 17, 5),
(4, 298, 12, 4),
(5, 253, 19, 1),
(6, 194, 5, 7),
(7, 646, 6, 4),
(8, 544, 16, 3),
(9, 46, 19, 9),
(10, 527, 8, 8),
(11, 561, 13, 2),
(12, 996, 12, 4),
(13, 507, 14, 10),
(14, 531, 5, 4),
(15, 483, 11, 3),
(16, 500, 10, 6),
(17, 803, 20, 2),
(18, 247, 18, 7),
(19, 975, 13, 1),
(20, 707, 15, 3),
(21, 229, 9, 1),
(22, 397, 11, 4),
(23, 862, 4, 3),
(24, 629, 3, 8),
(25, 719, 1, 10),
(26, 350, 2, 4),
(27, 739, 7, 10),
(28, 904, 9, 9),
(29, 966, 8, 3),
(30, 586, 6, 9);
