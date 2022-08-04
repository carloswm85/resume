CREATE TABLE `category` (
  `category_id` int PRIMARY KEY NOT NULL,
  `name` varchar(50) NOT NULL,
  `description` varchar(250) NOT NULL
);

CREATE TABLE `article` (
  `article_id` int PRIMARY KEY NOT NULL,
  `category_id` int NOT NULL,
  `content_id` int NOT NULL,
  `person_id` int NOT NULL,
  `name` varchar(50) NOT NULL,
  `alphabet` char(1) NOT NULL,
  `subcategory` int NOT NULL,
  `date_article` datetime NOT NULL,
  `date_review` datetime NOT NULL
);

CREATE TABLE `content` (
  `content_id` int PRIMARY KEY NOT NULL,
  `takeaways_id` int,
  `videolist_id` int,
  `related_terms_id` int,
  `related_articles_id` int,
  `definition` text NOT NULL,
  `section_one` text NOT NULL,
  `section_two` text
);

CREATE TABLE `person` (
  `person_id` int PRIMARY KEY NOT NULL,
  `role` enum NOT NULL,
  `profession` varchar(50) NOT NULL,
  `date_birth` date,
  `date_deceased` date
);

CREATE TABLE `takeaways` (
  `takeaways_id` int PRIMARY KEY,
  `takeaway` text NOT NULL
);

CREATE TABLE `videolist` (
  `videolist_id` int PRIMARY KEY,
  `video_id` int NOT NULL
);

CREATE TABLE `video` (
  `video_id` int PRIMARY KEY,
  `name` varchar(255) NOT NULL,
  `description` varchar(50) NOT NULL,
  `length` time NOT NULL
);

CREATE TABLE `related_terms` (
  `related_terms_id` int PRIMARY KEY,
  `name` varchar(255) NOT NULL,
  `description` varchar(50) NOT NULL
);

CREATE TABLE `related_articles` (
  `related_articles_id` int PRIMARY KEY,
  `name` varchar(255) NOT NULL,
  `description` varchar(50) NOT NULL
);

ALTER TABLE `article` ADD FOREIGN KEY (`category_id`) REFERENCES `category` (`category_id`);

ALTER TABLE `content` ADD FOREIGN KEY (`content_id`) REFERENCES `article` (`content_id`);

ALTER TABLE `person` ADD FOREIGN KEY (`person_id`) REFERENCES `article` (`person_id`);

ALTER TABLE `takeaways` ADD FOREIGN KEY (`takeaways_id`) REFERENCES `content` (`takeaways_id`);

ALTER TABLE `videolist` ADD FOREIGN KEY (`videolist_id`) REFERENCES `content` (`videolist_id`);

ALTER TABLE `video` ADD FOREIGN KEY (`video_id`) REFERENCES `videolist` (`video_id`);

ALTER TABLE `related_terms` ADD FOREIGN KEY (`related_terms_id`) REFERENCES `content` (`related_terms_id`);

ALTER TABLE `related_articles` ADD FOREIGN KEY (`related_articles_id`) REFERENCES `content` (`related_articles_id`);
