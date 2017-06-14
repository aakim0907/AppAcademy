DROP TABLE IF EXISTS users;

CREATE TABLE users (
  id INTEGER PRIMARY KEY,
  fname TEXT NOT NULL,
  lname TEXT NOT NULL
);

DROP TABLE if exists questions;

CREATE TABLE questions (
  id INTEGER PRIMARY KEY,
  title TEXT NOT NULL,
  body TEXT NOT NULL,
  user_id INTEGER NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id)
);

DROP TABLE if exists question_follows;

CREATE TABLE question_follows (
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

DROP TABLE if exists replies;

CREATE TABLE replies (
  id INTEGER PRIMARY KEY,
  question_id INTEGER NOT NULL,
  body TEXT NOT NULL,
  user_id INTEGER NOT NULL,
  parent_reply_id INTEGER,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id),
  FOREIGN KEY (parent_reply_id) REFERENCES replies(id)
);

DROP TABLE if exists question_likes;

CREATE TABLE question_likes (
  user_id INTEGER NOT NULL,
  question_id INTEGER NOT NULL,
  FOREIGN KEY (user_id) REFERENCES users(id),
  FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO
  users (fname, lname)
VALUES
  ('Evelyn', 'Lee'),
  ('Youngeun', 'Kim'),
  ('Leo', 'Liao');

INSERT INTO
  questions (title, body, user_id)
VALUES
  ('Ruby', 'What is Ruby?', (SELECT id FROM users WHERE lname = 'Lee')),
  ('SQL', 'What is SQL?', (SELECT id FROM users WHERE lname = 'Kim'));

INSERT INTO
  question_follows (user_id, question_id)
VALUES
  ((SELECT id FROM users WHERE lname = 'Lee'),
  (SELECT id FROM questions WHERE title = 'SQL')),
  ((SELECT id FROM users WHERE lname = 'Liao'),
  (SELECT id FROM questions WHERE title = 'Ruby'));

INSERT INTO
  replies (question_id, body, user_id, parent_reply_id)
VALUES
  ((SELECT id FROM questions WHERE title = 'Ruby'), 'Thanks for helping with Ruby!',
  (SELECT id FROM users WHERE lname = 'Kim'), NULL),
  ((SELECT id FROM questions WHERE title = 'Ruby'), 'Thanks again!',
  (SELECT id FROM users WHERE lname = 'Liao'),
  (SELECT id FROM replies WHERE body = 'Thanks for helping with Ruby!'));

INSERT INTO
  question_likes (user_id, question_id)
VALUES
  ((SELECT id FROM users WHERE lname = 'Lee'),
  (SELECT id FROM questions WHERE title = 'SQL')),
  ((SELECT id FROM users WHERE lname = 'Liao'),
  (SELECT id FROM questions WHERE title = 'Ruby'));
