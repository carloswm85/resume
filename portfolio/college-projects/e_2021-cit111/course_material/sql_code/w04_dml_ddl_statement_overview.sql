-- This code is examples of what we will be learning the rest of the 
-- semester. Students don't need to understand all the code,
-- just have some exposure to what a few DDL and DML statement look like

-- DDL statement to manage objects like databases, tables, columns
CREATE DATABASE hymns;

USE hymns;

-- DDL creating a new table in the hymns database
CREATE TABLE hymn (
  hymn_num INT NOT NULL,
  title VARCHAR(45) NOT NULL,
  first_line VARCHAR(60) NOT NULL,
  PRIMARY KEY (`hymn_num`));

CREATE TABLE composer (
  comp_id INT NOT NULL,
  lname VARCHAR(45) NOT NULL,
  fname VARCHAR(45) NOT NULL,
  PRIMARY KEY (comp_id));

CREATE TABLE topic (
  topic_id INT NOT NULL,
  topic VARCHAR(45) NULL,
  PRIMARY KEY (`topic_id`));

CREATE TABLE IF NOT EXISTS hymn_topic (
  topic_id INT NOT NULL,
  hymn_num INT NOT NULL,
  PRIMARY KEY (topic_id, hymn_num),
  INDEX fk_topic_has_hymn_hymn1_idx (hymn_num ASC),
  INDEX fk_topic_has_hymn_topic1_idx (topic_id ASC),
  CONSTRAINT fk_topic_has_hymn_topic1
    FOREIGN KEY (topic_id)
    REFERENCES hymns.topic (topic_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_topic_has_hymn_hymn1
    FOREIGN KEY (hymn_num)
    REFERENCES hymns.hymn (hymn_num)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

CREATE TABLE IF NOT EXISTS hymn_composer (
  comp_id INT NOT NULL,
  hymn_num INT NOT NULL,
  PRIMARY KEY (comp_id, hymn_num),
  INDEX fk_composer_has_hymn_hymn1_idx (hymn_num ASC),
  INDEX fk_composer_has_hymn_composer1_idx (comp_id ASC),
  CONSTRAINT fk_composer_has_hymn_composer1
    FOREIGN KEY (comp_id)
    REFERENCES hymns.composer (comp_id)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION,
  CONSTRAINT fk_composer_has_hymn_hymn1
    FOREIGN KEY (hymn_num)
    REFERENCES hymns.hymn (hymn_num)
    ON DELETE NO ACTION
    ON UPDATE NO ACTION);

-- DML managing the data in the tables
INSERT INTO composer VALUES 
(1, 'Bennett', 'Wallace'),
(2, 'Beesley', 'Ebenezer'),
(3, 'Cannon', 'Tracy'),
(4, 'Converse', 'Charles'),
(5, 'Curtis', 'Theodore'),
(6, 'Davies', 'Walford'),
(7, 'Davis', 'John'),
(8, 'de Jong', 'Gerrit'),
(9, 'Fowler', 'Williams'),
(10, 'Green', 'Carolee'),
(11, 'Johnson', 'Joel'),
(12, 'Lewis', 'Freeman'),
(13, 'Morton', 'Mary Ann'),
(14, 'Phelps', 'William'),
(15, 'Pratt', 'Parley'),
(16, 'Richards', 'William'),
(17, 'Schreiner', 'Alexander'),
(18, 'Smyth', 'Richard'),
(19, 'Stephens', 'Evan'),
(20, 'Swain', 'Joseph'),
(21, 'Tucker', 'Henry'),
(22, 'Tullidge', 'John'),
(23, 'Vaughan Williams', 'Ralph');

INSERT INTO hymn VALUES
(1, 'The Morning Breaks','The morning breaks the shadows flee'),
(2, 'The Spirit of God', 'The Spirit of God like a fire is burning'),
(3, 'Now Let Us Rejoice', 'Now let us rejoice in the day of salvation'),
(4, 'Truth Eternal', 'Truth eternal truth divine in thine ancient fulness shine'),
(5, 'High on the Mountain Top', 'High on the mountain top a banner is unfurled'),
(6, 'Redeemer of Israel', 'Redeemer of Israel our only delight'),
(7, 'Israel, Israel, God is Calling', 'Israel, Israel, God is calling'),
(8, 'Awake and Arise', 'Awake and arise, O ye slumber nations'),
(9, 'Come, Rejoice', 'Come, rejoice the Kin of glory speak to earth again'),
(10, 'Come, Sing to the Lord', 'Come sing to the Lord his name to praise'),
(11, 'What Was Witnessed in the Heavens?', 'What was witnessed in the heavens?'),
(12, 'Twas Witnessed in the Morning Sky', 'Twas witnessed in the morning key'),
(13, 'An Angel from on High', 'An angel from on high the long long silence broke'),
(14, 'Sweet Is The Peace the Gospel Brings', 'Sweet is the peace the gospel brings'),
(15, 'I Saw a Mighty Angel Fly', 'I saw a mighty angel fly'),
(16, 'What Glorious Scenes Mine Eyes Behold', 'What glorious scenes mine eyes behold'),
(17, 'Awake, Ye Saints of God, Awake', 'Awake ye Saints of God awake'),
(18, 'The Voice of God Again is Heard', 'The voice of God again is heard'),
(19, 'We Thank Thee, O God for a Prophet', 'We thank thee, O God for a prophet'),
(20, 'God of Power, God of Right', 'God of power God of right');


INSERT INTO topic VALUES
(1, 'Assurance'),
(2, 'Book of Mormon'),
(3, 'Chastity'),
(4, 'Enduring to the End'),
(5, 'Faith'),
(6, 'Gathering of Israel'),
(7, 'Genealogy and Temple Work'),
(8, 'God the Father'),
(9, 'Gratitude'),
(10, 'Guidance'),
(11, 'Holy Ghost'),
(12, 'Hope'),
(13, 'Jesus Christ-Savior'),
(14, 'Jesus Christ-Second Coming'),
(15, 'Jesus Christ-Shepherd'),
(16, 'Joseph Smith'),
(17, 'Joy'),
(18, 'Leadership'),
(19, 'Mercy'),
(20, 'Millennium'),
(21, 'Missionary Work'),
(22, 'Music and Song'),
(23, 'Peace'),
(24, 'Praise'),
(25, 'Prayer'),
(26, 'Preparedness'),
(27, 'Priesthood'),
(28, 'Prophets'),
(29, 'Restoration of the Gospel'),
(30, 'Revelation'),
(31, 'Truth'),
(32, 'Unity'),
(33, 'Wisdom and Knowledge'),
(34, 'Worship'),
(35, 'Youth'),
(36, 'Zion');

INSERT INTO hymn_topic VALUES
(1, 14),
(2, 16),
(3, 14),
(4, 3),
(5, 17),
(5, 3),
(6, 7),
(6, 6),
(6, 1),
(6, 16),
(7, 5),
(7, 11),
(8, 14),
(9, 19),
(10, 20),
(11, 2),
(12, 19),
(13, 9),
(14, 15),
(14, 7),
(14, 3),
(14, 6),
(14, 2),
(15, 6),
(16, 10),
(16, 4),
(17, 9),
(17, 3),
(17, 18),
(18, 20),
(19, 14),
(20, 3),
(20, 2),
(21, 18),
(21, 12),
(21, 11),
(22, 8),
(22, 10),
(23, 8),
(23, 14),
(24, 10),
(24, 2),
(25, 17),
(26, 17),
(27, 10),
(27, 20),
(27, 4),
(27, 12),
(28, 10),
(28, 12),
(28, 19),
(29, 13),
(29, 8),
(29, 9),
(29, 10),
(29, 5),
(29, 15),
(29, 1),
(29, 2),
(29, 18),
(29, 4),
(29, 12),
(29, 19),
(29, 16),
(29, 11),
(30, 2),
(30, 4),
(30, 16),
(31, 8),
(31, 9),
(31, 15),
(31, 1),
(31, 4),
(32, 17),
(32, 3),
(33, 14),
(33, 4),
(34, 2),
(35, 20),
(36, 7),
(36, 1);

INSERT INTO hymn_composer VALUES
(1, 20),
(2, 5),
(2, 16),
(3, 9),
(3, 20),
(4, 7),
(5, 8),
(6, 12),
(7, 11),
(8, 10),
(9, 19),
(10, 8),
(11, 5),
(12, 6),
(13, 14),
(14, 2),
(14, 3),
(14, 6),
(15, 1),
(15, 4),
(15, 13),
(16, 12),
(17, 4),
(18, 7),
(19, 11),
(19, 17),
(19, 18),
(20, 6),
(21, 2),
(21, 3),
(22, 13),
(23, 15);

-- All SELECTS are DML 
-- We aren't creating, altering or deleting databases, 
-- tables or columns, just retrieving data.
-- things like UPDATE and DELETE that we will see in a few weeks
-- would also be DML - it is manipulating the data in the table or columns
-- but not changing the structure of the table or columns.
-- With SELECT no data is being changed, just retrieved.

-- What is the title of hymn #18?
SELECT title 
FROM hymn 
WHERE hymn_num = 18;

-- What's the first name of the composer with the last name Pratt?
SELECT fname
FROM composer
WHERE lname = 'Pratt';

-- Which hymns are associate with the topic Truth?
SELECT title
FROM hymn 
  JOIN hymn_topic
    ON hymn.hymn_num = hymn_topic.hymn_num
  JOIN topic
    ON hymn_topic.topic_id = topic.topic_id
WHERE topic = 'Truth';

-- What's the hymns composed by Parley Pratt?
SELECT title
FROM hymn
  JOIN hymn_composer
    ON hymn.hymn_num = hymn_composer.hymn_num
  JOIN composer
    ON hymn_composer.comp_id = composer.comp_id
WHERE fname= 'Parley'AND lname = 'Pratt';

-- How many hymns are about Jesus?
SELECT COUNT(title)
FROM hymn 
  JOIN hymn_topic
    ON hymn.hymn_num = hymn_topic.hymn_num
  JOIN topic
    ON hymn_topic.topic_id = topic.topic_id
WHERE topic LIKE 'Jesus%';

-- What many hymns fit into each topic?
SELECT topic, COUNT(title)
FROM hymn 
  JOIN hymn_topic
    ON hymn.hymn_num = hymn_topic.hymn_num
  JOIN topic
    ON hymn_topic.topic_id = topic.topic_id
GROUP BY topic;

-- DDL droping an object, in this case the entire database
DROP DATABASE hymns;