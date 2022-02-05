CREATE TABLE user_account (
  username VARCHAR(255) PRIMARY KEY CHECK (username SIMILAR TO '[\w.-]+'),
  password_hash VARCHAR(255) NOT NULL,
  email VARCHAR(128) CHECK (email SIMILAR TO '_{1,64}@%.%'),
  mobile_phone VARCHAR(18) CHECK (mobile_phone SIMILAR TO '[\d+-. \(\)]{7,}'),
  privilege_level CHAR(1) NOT NULL
);

CREATE TABLE day_summary (
  day DATE NOT NULL,
  username VARCHAR(255) NOT NULL REFERENCES user_account(username),
  journal VARCHAR(65533),
  day_rating FLOAT4,
  PRIMARY KEY (day, username)
);

CREATE TABLE category (
  category_name VARCHAR(255) NOT NULL,
  username VARCHAR(255) NOT NULL REFERENCES user_account(username),
  display_color CHAR(7) NOT NULL CHECK (display_color SIMILAR TO '#[\dABCDEFabcdef]{6}'),
  PRIMARY KEY (category_name, username)
);

CREATE TABLE habit (
  habit_id SERIAL PRIMARY KEY,
  title VARCHAR(255) NOT NULL,
  description VARCHAR(65533),
  timed BOOL NOT NULL,
  ratable BOOL NOT NULL,
  category_name VARCHAR(255) NOT NULL,
  username VARCHAR(255) NOT NULL,
  FOREIGN KEY (category_name, username) REFERENCES category(category_name, username)
);

CREATE TABLE habit_instance (
  habit_id SERIAL NOT NULL REFERENCES habit(habit_id),
  day DATE NOT NULL,
  username VARCHAR(255) NOT NULL REFERENCES user_account(username),
  complete BOOL NOT NULL,
  time_spent INTERVAL HOUR TO SECOND (0),
  habit_rating FLOAT4,
  PRIMARY KEY (habit_id, day, username),
  FOREIGN KEY (day, username) REFERENCES day_summary(day, username)
);
