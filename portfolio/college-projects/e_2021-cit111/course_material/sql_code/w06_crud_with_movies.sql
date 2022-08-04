CREATE DATABASE mdb;

USE mdb;

CREATE TABLE actors (actor_id INT NOT NULL AUTO_INCREMENT,
	last_name VARCHAR(30) NOT NULL,
    first_name VARCHAR(25) NOT NULL,
    PRIMARY KEY(actor_id));
    
SELECT * FROM actors;

INSERT INTO actors VALUES
	(NULL, 'Hanks', 'Tom'),
    (NULL, 'Allen', 'Tim');

INSERT INTO actors VALUES
	(DEFAULT, 'Potts', 'Annie');

INSERT INTO actors (last_name, first_name) VALUES
	('Fisher', 'Carrie');

CREATE TABLE movies (movie_id INT NOT NULL AUTO_INCREMENT,
	title VARCHAR(45) NOT NULL,
    rating ENUM('G','PG','PG-13'),
    r_year YEAR NOT NULL,
    studio VARCHAR(45),
	PRIMARY KEY(movie_id));

SELECT * FROM movies;

INSERT INTO movies VALUES
	(DEFAULT, 'Toy Story', 'G', '1995', 'Pixar');

-- Or
INSERT INTO movies (title, rating, r_year, studio) VALUES
	('Toy Story', 'G', '1995', 'Pixar');

-- Or
INSERT INTO movies (title, r_year) VALUES
	('Toy Story', '1995');

UPDATE actors 
SET first_name = 'Tommy'
WHERE last_name = 'Hanks';

-- better to use primary key
UPDATE actors 
SET first_name = 'Tommy'
WHERE actor_id = 1;

DELETE FROM actors
WHERE actor_id = 1;

DROP TABLE actors;

DROP DATABASE mdb;

-- to run after you forward engineer an empty database
INSERT INTO actors VALUES
    (1,'Hanks', 'Tom'), 
    (2,'Allen', 'Tim'),
    (3,'Potts', 'Annie'),
    (4,'Fisher', 'Carrie'),
    (5,'Hamill', 'Mark'),
    (6,'Ford', 'Harrison');
    
SELECT * FROM actors;

INSERT INTO movies VALUES
    (1, 'Toy Story', 'G', '1995', 'Pixar'),
    (2, 'Toy Story 3', 'G', '2010', 'Pixar'),
    (3, 'Star Wars', 'PG', '1977', 'Lucas');
    
SELECT * FROM movies;

-- inserting data into a linking table
INSERT INTO cast VALUES
    (1, 1), -- Tom Hanks in Toy Story
    (1, 2), -- Tom Hanks in Toy Story 3
    (2, 1), -- Tim Allen in Toy Story
    (2, 2), -- Tim Allen in Toy Story 3
    (3, 1), -- Annie Potts in Toy Story
    (4, 3), -- Carrie Fisher in Star Wars
    (5, 3), -- Mark Hamill in Star Wars
    (6, 3); -- Harrison Ford in Star Wars
