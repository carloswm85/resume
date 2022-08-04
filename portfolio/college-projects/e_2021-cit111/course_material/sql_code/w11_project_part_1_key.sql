

INSERT INTO college VALUES 
    (1,'Physical Science and Engineering'),
    (2,'College of Business and Communication'),
    (3,'College of Language and Letters');
    
INSERT INTO department VALUES 
    ('CIT','Computer Information Technology',1),
    ('ECON','Economics',2),
    ('HUM','Humanities',3);
    
INSERT INTO course VALUES 
    (1, 111,'Intro to Databases', 3, 'CIT'),
    (2, 150,'Micro Economics', 3, 'ECON'),
    (3, 376,'Classical Heritage', 2, 'HUM'),
    (4, 388,'Econometrics', 4, 'ECON');

INSERT INTO `faculty` VALUES 
    (1,'Morring','Marty','CIT'),
    (2,'Barney','Bill','CIT'),
    (3,'Barrus','Ben','ECON'),
    (4,'Nate','Nathan','ECON'),
    (5,'Jensen','John','HUM');

INSERT INTO `term` VALUES 
    (1,'Fall',2019),
    (2,'Winter',2018);
    
INSERT INTO `student` VALUES 
    (1,'Miller','Paul','M','Dallas','TX','1996-02-22'),
    (2,'Smith','Katie','F','Provo','UT','1995-07-22'),
    (3,'Jones','Kelly','F','Provo','UT','1998-06-22'),
    (4,'Merrill','Devon','M','Mesa','AZ','2000-07-22'),
    (5,'Murdock','Mandy','F','Topeka','KS','1996-11-22'),
    (6,'Adams','Alece','F','Rigby','ID','1997-05-22'),
    (7,'Carlson','Bryce','M','Bozeman','MT','1997-11-22'),
    (8,'Larsen','Preston','M','Decatur','TN','1996-09-22'),
    (9,'Madsen','Julia','F','Rexburg','ID','1998-09-22'),
    (10,'Sorensen','Susan','F','Mesa','AZ','1998-08-09');

INSERT INTO `section` VALUES 
    (1,1,30,1,1,1), -- CIT 111 1 Fall
    (2,1,50,1,4,2), -- ECON 150 1 Fall
    (3,2,50,1,4,2), -- ECON 150 2 Fall
    (4,1,35,1,3,4), -- ECON 388 1 Fall 
    (5,1,30,1,5,3), -- HUM 376 1 Fall
    (6,2,30,2,1,1), -- CIT 111 2 Winter
    (7,3,35,2,2,1), -- CIT 111 3 Winter
    (8,1,50,2,4,2), -- ECON 150 1 Winter
    (9,2,50,2,4,2), -- ECON 150 2 Winter
    (10,1,30,2,5,3); -- HUM 376 1 Winter
    
INSERT INTO `enrollment` VALUES 
    (7,6), 
    (6,7),
    (8,7),
    (10,7),
    (5,4),
    (9,9),
    (4,2),
    (4,3),
    (4,5),
    (5,5),
    (1,1),
    (3,1),
    (9,8),
    (6,10);