DROP TABLE IF EXISTS question_follows;
DROP TABLE IF EXISTS question_likes;
DROP TABLE IF EXISTS replies;
DROP TABLE IF EXISTS questions;
DROP TABLE IF EXISTS users;

PRAGMA foreign_keys = ON;

CREATE TABLE users (
id INTEGER PRIMARY KEY,
fname VARCHAR(250) NOT NULL,
lname VARCHAR(250) NOT NULL
);

INSERT INTO users (fname, lname) 
    VALUES ('Gigi', 'Bocking'),
           ('Danika', 'Hallatt'),
           ('Chiquia', 'Morrieson');

CREATE TABLE questions (
id INTEGER PRIMARY KEY,
title VARCHAR(250) NOT NULL,
body TEXT NOT NULL,
author_id INTEGER NOT NULL,

FOREIGN KEY (author_id) REFERENCES users(id)
);

INSERT INTO questions (title, body, author_id)
VALUES  ('Gigis question', 'Please help me understand how to write SQL', 
        (SELECT 1 
        FROM users 
        WHERE users.fname = 'Gigi' AND users.lname = 'Bocking')),
        
        ('Danikas question', 'How to create database', 
        (SELECT 2
        FROM users
        WHERE users.fname = 'Danika' AND users.lname = 'Hallatt')),
        
        ('Chiquias question', 'Who do you think will win the World Series?', 
        (SELECT 3
        FROM users
        WHERE users.fname = 'Chiquia' AND users.lname = 'Morrieson'));


CREATE TABLE question_follows (
id INTEGER PRIMARY KEY,
user_id INTEGER NOT NULL,
question_id INTEGER NOT NULL,


FOREIGN KEY (user_id) REFERENCES users(id),
FOREIGN KEY (question_id) REFERENCES questions(id)
);

INSERT INTO question_follows (user_id, question_id)
    VALUES  ((SELECT users.id FROM users WHERE fname = 'Gigi' AND lname = 'Bocking'),
            (SELECT questions.id FROM questions WHERE title = 'Gigis question')),
        
            ((SELECT users.id FROM users WHERE fname = 'Danika' AND lname = 'Hallatt'),
            (SELECT questions.id FROM questions WHERE title = 'Danikas question')),

            ((SELECT users.id FROM users WHERE fname = 'Chiquia' AND lname = 'Morrieson'),
            (SELECT questions.id FROM questions WHERE title = 'Chiquias question')
        );

CREATE TABLE replies (
id INTEGER PRIMARY KEY,
question_id INTEGER NOT NULL,
parent_reply_id INTEGER,
author_id INTEGER NOT NULL,
body TEXT NOT NULL,

FOREIGN KEY (question_id) REFERENCES questions(id),
FOREIGN KEY (parent_reply_id) REFERENCES replies(id),
FOREIGN KEY (author_id) REFERENCES users(id)
);

INSERT INTO replies (question_id, parent_reply_id, author_id, body)
VALUES ((SELECT questions.id FROM questions WHERE title = 'Gigis question'), 
        NULL, 
        (SELECT users.id FROM users WHERE fname = 'Gigi' AND lname = 'Bocking'), 
        'SQL is cool'),

        ((SELECT questions.id FROM questions WHERE title = 'Danikas question'), 
        NULL, 
        (SELECT users.id FROM users WHERE fname = 'Danika' AND lname = 'Hallatt'), 
        'DBs are easy'),

        ((SELECT questions.id FROM questions WHERE title = 'Chiquias question'), 
        NULL, 
        (SELECT users.id FROM users WHERE fname = 'Chiquia' AND lname = 'Morrieson'), 
        'RedSox');


CREATE TABLE question_likes (
    id INTEGER PRIMARY KEY,
    user_like_id INTEGER NOT NULL,
    user_question_id INTEGER NOT NULL,

    FOREIGN KEY (user_like_id) REFERENCES users(id),
    FOREIGN KEY (user_question_id) REFERENCES questions(id)
);



INSERT INTO question_likes (user_like_id, user_question_id)
VALUES ((SELECT users.id FROM users WHERE fname = 'Gigi' AND lname = 'Bocking'),
        (SELECT questions.id FROM questions WHERE title = 'Gigis question')),

        ((SELECT users.id FROM users WHERE fname = 'Danika' AND lname = 'Hallatt'),
        (SELECT questions.id FROM questions WHERE title = 'Danikas question'));