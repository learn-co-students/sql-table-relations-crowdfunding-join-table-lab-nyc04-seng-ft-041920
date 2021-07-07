--  insert 10 projects, 20 users, and 30 pledges
INSERT INTO projects (id, title, category, funding_goal, start_date, end_date) VALUES(1,'Apple','tech', 5000000, '20200630', '20201205');
INSERT INTO projects (id, title, category, funding_goal, start_date, end_date) VALUES(2,'Instagram','social', 700, '20200130', '20200205');
INSERT INTO projects (id, title, category, funding_goal, start_date, end_date) VALUES(3,'FB','social', 300000, '20100630', '20111205');
INSERT INTO projects (id, title, category, funding_goal, start_date, end_date) VALUES(4,'Google','engine', 1000000, '20190630', '20191205');
INSERT INTO projects (id, title, category, funding_goal, start_date, end_date) VALUES(5,'Squarespace','web', 5000, '20200630', '20211205');
INSERT INTO projects (id, title, category, funding_goal, start_date, end_date) VALUES(6,'Amazon','shop', 300000, '20010630', '20021205');
INSERT INTO projects (id, title, category, funding_goal, start_date, end_date) VALUES(7,'Shop','shop', 1000000, '20200630', '20201205');
INSERT INTO projects (id, title, category, funding_goal, start_date, end_date) VALUES(8,'Banana','tech', 30000, '20200630', '20201205');
INSERT INTO projects (id, title, category, funding_goal, start_date, end_date) VALUES(9,'Pine','home', 40000, '20200130', '20200205');
INSERT INTO projects (id, title, category, funding_goal, start_date, end_date) VALUES(10,'Tree','home', 5000, '20200630', '20201205');

INSERT INTO users (id, name, age) VALUES 
(1, 'A', 17),
(2, 'B', 14),
(3, 'C', 18),
(4, 'A', 17),
(5, 'B', 14),
(6, 'C', 18),
(7, 'C', 18),
(8, 'A', 17),
(9, 'B', 14),
(10, 'C', 18),
(11, 'A', 17),
(12, 'B', 14),
(13, 'C', 18),
(14, 'A', 17),
(15, 'B', 14),
(16, 'C', 18),
(17, 'C', 18),
(18, 'A', 17),
(19, 'B', 14),
(20, 'C', 18);

INSERT INTO pledges (id, amount, user_id, project_id) VALUES
(1, 10, 1, 2),
(2, 10, 1, 2),
(3, 10, 1, 2),
(4, 10, 1, 2),
(5, 10, 1, 2),
(6, 10, 1, 2),
(7, 10, 1, 2),
(8, 10, 1, 2),
(9, 10, 1, 2),
(10, 10, 1, 2),
(11, 10, 1, 1),
(12, 10, 1, 1),
(13, 10, 1, 1),
(14, 10, 1, 1),
(15, 10, 1, 1),
(16, 10, 1, 1),
(17, 10, 1, 1),
(18, 10, 1, 1),
(19, 10, 1, 1),
(20, 10, 1,12),
(21, 10, 2, 2),
(22, 10, 2, 2),
(23, 10, 2, 2),
(24, 10, 2, 2),
(25, 10, 2, 2),
(26, 10, 2, 2),
(27, 10, 2, 2),
(28, 10, 2, 2),
(29, 10, 2, 2),
(30, 20,2 ,2);
