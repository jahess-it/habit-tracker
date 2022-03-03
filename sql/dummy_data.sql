INSERT INTO user_account(
	username, password_hash, email, mobile_phone, privilege_level)
	VALUES ('jonsnow', '892kjfa89afn329iafds', 'jon@snow.org', '5555555555', 'b'),
	('jimbob', '29db5ca99fa0584ab67dfd35f9c381101c4ab33c', 'jim@example.com', '+1 (802) 314-1592', 'b');

INSERT INTO day_summary(
	day, username, journal, day_rating)
	VALUES ('2022-01-09', 'jonsnow', 'Today I meditated.', '4.8'),
	(CURRENT_DATE, 'jimbob', NULL, NULL);

INSERT INTO category(
	category_name, username, display_color)
	VALUES ('health', 'jonsnow', '#0000FF'),
	('default', 'jimbob', '#ff0000');

INSERT INTO habit(
	habit_id, title, description, timed, ratable, category_name, username)
	VALUES (1, 'meditation', 'morning meditation', TRUE, TRUE, 'health', 'jonsnow'),
	(2, 'homework', 'finish homework early', TRUE, TRUE, 'default', 'jimbob');

INSERT INTO habit_instance(
	habit_id, day, username, complete, time_spent, habit_rating)
	VALUES (1, '2022-01-09', 'jonsnow', TRUE, '00:20', '4.4'),
	(2, CURRENT_DATE, 'jimbob', FALSE, '02:30', '1.5');
