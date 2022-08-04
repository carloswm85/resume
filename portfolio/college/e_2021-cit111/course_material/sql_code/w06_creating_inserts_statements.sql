USE art_gallery;

INSERT INTO artist VALUES
  (1, 'Vincent', NULL, 'van Gogh', 1853, 1890, 'France', 'n'),
  (2, 'Rembrant', 'Harmenszoon', 'van Rijn', 1606, 1669, 'Netherlands', 'n'),
  (3, 'Leonardo', NULL, 'da Vinci', 1452, 1519, 'Italy', 'n'),
  (4, 'Venture', 'Lonzo', 'Coy', 1965, NULL, 'United States', 'y'),
  (5, 'Deborah', NULL, 'Gill', 1970, NULL, 'United States', 'y'),
  (6, 'Claude', NULL, 'Monet', 1840, 1926, 'France', 'n'),
  (7, 'Pablo', NULL, 'Picasso', 1904, 1973, 'Spain', 'n'),
  (8, 'Michelangelo', 'di Lodovico', 'Simoni', 1475, 1564, 'Italy', 'n');
  
INSERT INTO artwork VALUES
  (1, 'Irises', 1889, 'Impressionism', 'Oil', 'irises.jpg', 1),
  (2, 'The Starry Night', 1889, 'Post-impressionism', 'Oil', 'starrynight.jpg', 1),
  (3, 'Sunflowers', 1888, 'Post-impressionism', 'Oil', 'sunflowers.jpg', 1),
  (4, 'Night Watch', 1642, 'Baroque', 'Oil', 'nightwatch.jpg', 2),
  (5, 'Storm on the Sea of Galilee', 1633, 'Dutch Golden Age', 'Oil', 'stormgalilee.jpg', 2),
  (6, 'Head of a Woman', 1508, 'High Renaissance', 'Oil', 'headwoman.jpg', 3),
  (7, 'Last Supper', 1498, 'Renaissance', 'Tempra', 'lastsupper.jpg', 3),
  (8, 'Mona Lisa', 1517, 'Renaissance', 'Oil', 'monalisa.jpg', 3),
  (9, 'Hillside Stream', 2005, 'Modern', 'Oil', 'hillsidestream.jpg', 4),
  (10, 'Old Barn', 1992, 'Modern', 'Oil', 'oldbarn.jpg', 4),
  (11, 'Beach Baby', 1999, 'Modern', 'Watercolor', 'beachbaby.jpg', 5),
  (12, 'Women in the Garden', 1866, 'Impressionsim', 'Oil', 'womengarden.jpg', 6),
  (13, 'Old Guitarist', 1904, 'Modern', 'Oil', 'guitarist.jpg', 7);
  

INSERT INTO keyword VALUES
  (1, 'flowers'),
  (2, 'blue'),
  (3, 'landscape'),
  (4, 'girl'),
  (5, 'people'),
  (6, 'food'),
  (7, 'battle'),
  (8, 'boat'),
  (9, 'water'),
  (10, 'Christ'),
  (11, 'baby');
  
INSERT INTO artwork_keyword VALUES
  (1, 1),
  (2, 2),
  (3, 2), 
  (1, 3),
  (4, 4),
  (5, 4),
  (7, 4),
  (8, 5),
  (9, 5),
  (5, 5),
  (10, 5),
  (4, 6),
  (5, 6),
  (6, 7),
  (5, 7),
  (10, 7),
  (4, 8),
  (5, 8),
  (9, 9),
  (3, 9),  
  (3, 10),
  (9, 11),
  (5, 11),
  (11, 11), 
  (3, 12),
  (5, 12),
  (1, 12),
  (2, 13),
  (5, 13);