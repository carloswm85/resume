-- MySQL Workbench Forward Engineering
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
SET @OLD_SQL_MODE=@@SQL_MODE,
SQL_MODE='ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR
_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION';
-- -----------------------------------------------------
-- Schema art_gallery
-- -----------------------------------------------------
DROP SCHEMA IF EXISTS `art_gallery` ;
-- -----------------------------------------------------
-- Schema art_gallery
-- -----------------------------------------------------
CREATE SCHEMA IF NOT EXISTS `art_gallery` DEFAULT CHARACTER SET utf8mb4 COLLATE
utf8mb4_0900_ai_ci ;
USE `art_gallery` ;
-- -----------------------------------------------------
-- Table `art_gallery`.`artist`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `art_gallery`.`artist` ;
CREATE TABLE IF NOT EXISTS `art_gallery`.`artist` (
`artist_id` INT NOT NULL AUTO_INCREMENT,
`fname` VARCHAR(20) NOT NULL,
`mname` VARCHAR(20) NULL DEFAULT NULL,
`lname` VARCHAR(25) NOT NULL,
`dob` INT NOT NULL,
`dod` INT NULL DEFAULT NULL,
`country` VARCHAR(25) NOT NULL,
`local_artist` ENUM('y', 'n') NULL DEFAULT NULL,
PRIMARY KEY (`artist_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;
-- -----------------------------------------------------
-- Table `art_gallery`.`artwork`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `art_gallery`.`artwork` ;
CREATE TABLE IF NOT EXISTS `art_gallery`.`artwork` (
`artwork_id` INT NOT NULL AUTO_INCREMENT,
`title` VARCHAR(50) NOT NULL,
`artyear` INT NOT NULL,
`period` VARCHAR(25) NULL DEFAULT NULL,
`arttype` VARCHAR(20) NULL DEFAULT NULL,
`artfile` VARCHAR(25) NOT NULL,
`artist_id` INT NOT NULL,
PRIMARY KEY (`artwork_id`),
INDEX `fk_artwork_artist1_idx` (`artist_id` ASC) VISIBLE,
CONSTRAINT `fk_artwork_artist1`
FOREIGN KEY (`artist_id`)
REFERENCES `art_gallery`.`artist` (`artist_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;
-- -----------------------------------------------------
-- Table `art_gallery`.`keyword`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `art_gallery`.`keyword` ;
CREATE TABLE IF NOT EXISTS `art_gallery`.`keyword` (
`keyword_id` INT NOT NULL AUTO_INCREMENT,
`keyword` VARCHAR(15) NOT NULL,
PRIMARY KEY (`keyword_id`))
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8;
-- -----------------------------------------------------
-- Table `art_gallery`.`artwork_has_keyword`
-- -----------------------------------------------------
DROP TABLE IF EXISTS `art_gallery`.`artwork_has_keyword` ;
CREATE TABLE IF NOT EXISTS `art_gallery`.`artwork_has_keyword` (
`artwork_id` INT NOT NULL,
`keyword_id` INT NOT NULL,
PRIMARY KEY (`artwork_id`, `keyword_id`),
INDEX `fk_artwork_has_keyword_keyword1_idx` (`keyword_id` ASC) VISIBLE,
INDEX `fk_artwork_has_keyword_artwork1_idx` (`artwork_id` ASC) VISIBLE,
CONSTRAINT `fk_artwork_has_keyword_artwork1`
FOREIGN KEY (`artwork_id`)
REFERENCES `art_gallery`.`artwork` (`artwork_id`),
CONSTRAINT `fk_artwork_has_keyword_keyword1`
FOREIGN KEY (`keyword_id`)
REFERENCES `art_gallery`.`keyword` (`keyword_id`))
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8;
SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
-- Beginning of INSERT statements, by Gabriel Cánepa (CIT111 Spring 2021)
USE art_gallery;
INSERT INTO artist (fname, mname, lname, dob, dod, country, local_artist)
VALUES
('Vincent', NULL, 'van Gogh', '1853', '1890', 'France', 'n'),
('Rembrandt', 'Harmenszoon', 'van Rijn', '1606', '1669', 'Netherlands', 'n'),
('Leonardo', NULL, 'da Vinci', '1452', '1519', 'Italy', 'n'),
('Venture', 'Lonzo', 'Coy', '1965', NULL, 'United States', 'y'),
('Deborah', NULL, 'Gill', '1970', NULL, 'United States', 'y'),
('Claude', NULL, 'Monet', '1840', '1926', 'France', 'n'),
('Pablo', NULL, 'Picasso', '1904', '1973', 'Spain', 'n'),
('Michelangelo', 'di Lodovico', 'Simoni', '1475', '1564', 'Italy', 'n');
-- Uncomment the following line to select everything from the artist table
-- SELECT * FROM artist;
INSERT INTO artwork (title, artyear, period, arttype, artfile, artist_id)
VALUES
('Irises', 1889, 'Impressionism', 'Oil', 'irises.jpg', 1), -- van Gogh
('The Starry Night', 1889, 'Post-Impressionism', 'Oil', 'starrynight.jpg', 1) -- van Gogh
('Sunflowers', 1888, 'Post-Impressionism', 'Oil', 'sunflowers.jpg', 1), -- van Gogh
('Night Watch', 1642, 'Baroque', 'Oil', 'nightwatch.jpg', 2), -- Rembrandt
('Storm on the Sea of Galilee', 1633, 'Dutch Golden Age', 'Oil', 'stormgalilee.jpg', 2), -- Rembrandt
('Head of a Woman', 1508, 'High Renaissance', 'Oil', 'headwoman.jpg', 3), -- da Vinci
('Last Supper', 1498, 'Renaissance', 'Tempra', 'lastsupper.jpg', 3), -- da Vinci
('Mona Lisa', 1517, 'Renaissance', 'Oil', 'monalisa.jpg', 3), -- da Vinci
('Hillside Stream', 2005, 'Modern', 'Oil', 'hillsidestream.jpg', 4), -- Coy
('Old Barn', 1992, 'Modern', 'Oil', 'oldbarn.jpg', 4), -- da Vinci
('Beach Baby', 1999, 'Modern', 'Watercolor', 'beachbaby.jpg', 5), -- Gill
('Women in the Garden', 1866, 'Impressionism', 'Oil', 'womengarden.jpg', 6), -- Monet
('Old Guitarist', 1904, 'Modern', 'Oil', 'guitarist.jpg', 7); -- Picasso
-- Uncomment the following line to select everything from the artwork table
-- SELECT * FROM artwork;
INSERT INTO keyword (keyword)
VALUES
('flowers'),
('blue'),
('landscape'),
('girl'),
('people'),
('battle'),
('boat'),
('water'),
('Christ'),
('food'),
('baby'),
('food');
-- Uncomment the following line to select everything from the keyword table
-- SELECT * FROM keyword;
INSERT INTO artwork_has_keyword
VALUES
(1, 1),
(2, 2),
(2, 3),
(3, 1),
(4, 4),
(4, 5),
(4, 6),
(5, 5),
(5, 7),
(5, 8),
(5, 9),
(6, 4),
(6, 5),
(7, 5),
(7, 9),
(7, 10),
(8, 4),
(8, 5),
(9, 3),
(9, 8),
(10, 3),
(11, 5),
(11, 8),
(11, 11),
(12, 1),
(12, 3),
(12, 5),
(13, 2),
(13, 5);
-- Uncomment the following line to select everything from the artist_has_keyword
table
-- SELECT * FROM artwork_has_keyword;