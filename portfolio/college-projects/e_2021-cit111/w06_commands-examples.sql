DROP DATABASE w06_mdb_example;
CREATE DATABASE w06_mdb_example;

USE w06_mdb_example;

CREATE TABLE actors (
	actor_id INT NOT NULL AUTO_INCREMENT,
	last_name VARCHAR(30) NOT NULL,
	first_name VARCHAR(25) NOT NULL,
	PRIMARY KEY(actor_id)
	);

INSERT INTO actors VALUES
	(1, 'Hanks', 'Tom'),
    (NULL, 'Allen', 'Tim'),
    (3, 'Ben', 'Affleck');

INSERT into actors VALUES
	(DEFAULT, 'Potts', 'Annie');

INSERT INTO actors (last_name, first_name) VALUES
('Fisher', 'Carrie');

SELECT * FROM actors;

CREATE TABLE movies
	(movie_id INT NOT NULL AUTO_INCREMENT,
    title VARCHAR(45) NOT NULL,
    rating ENUM('G', 'PG', 'PG-13'),
    r_year YEAR NOT NULL,
    studio VARCHAR(45),
    PRIMARY KEY(movie_id)
    );

INSERT INTO movies VALUES
	(DEFAULT, 'Toy Story', 1, 1995, 'Pixar');
    
INSERT INTO movies (title, rating, r_year, studio) VALUES
	('Toy Story 2', 'PG', '2001', 'Pixar');
    
INSERT INTO movies (title, r_year) VALUES
	('Toy Story 3', 2007);

UPDATE actors 
	SET first_name = 'Tommy'
	WHERE actor_id = 1;

SELECT * FROM movies;

DELETE FROM actors
	WHERE actor_id = 1;
    
DROP TABLE actors;