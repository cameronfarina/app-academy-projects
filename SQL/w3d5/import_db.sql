CREATE TABLE cats( 
id INTEGER PRIMARY KEY,
name TEXT,
color TEXT,
breed TEXT
);

CREATE TABLE toys(           
id Integer PRIMARY KEY,
price FLOAT,
color TEXT,
name TEXT
);

CREATE TABLE cattoys(
id INTEGER,
cat_id INTEGER REFERENCES cats(id),
toy_id INTEGER REFERENCES toys(id)
);


INSERT INTO cats
(id, name, color, breed)
VALUES  (1, 'Tom', 'Orange', 'Persian'),
        (2, 'Gerry', 'Black', 'Scottish' ),
        (3, 'Simon', 'Tan', 'Siamese'),
        (4, 'Henry', 'Blue', 'Munchkin'),
        (5, 'Jim', 'Red', 'Shorthair');

INSERT INTO toys
(id, price, color, name)
VALUES (1, 14.21, 'Brown', 'the washbuckler'),
       (2, 21.99, 'magenta', 'colorful hair ball'),
       (3, 124.99, 'golden', 'the cat o matic 9000'),
       (4, 0.29, 'off-white', 'Questionable quality cat nip'),
       (5, 4.99, 'grey', 'squishy mouse');

INSERT INTO cattoys
(id, cat_id, toy_id)
VALUES (1, 5, 2),
       (2, 3, 3),
       (3, 2, 5),
       (4, 1, 4),
       (5, 4, 1);