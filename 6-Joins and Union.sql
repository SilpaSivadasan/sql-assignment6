CREATE database CountryDB;
use CountryDB;

-- Create the Country table
CREATE TABLE Country (
    Id INT PRIMARY KEY,
    Country_name VARCHAR(100),
    Population INT,
    Area INT
);

-- Insert rows into Country table
INSERT INTO Country (Id, Country_name, Population, Area)
VALUES
(1, 'India', 1400000000, 3287263),
(2, 'USA', 331000000, 9833517),
(3, 'China', 1440000000, 9596961),
(4, 'Brazil', 213000000, 8515770),
(5, 'Canada', 38000000, 9984670),
(6, 'Australia', 25600000, 7692024),
(7, 'Russia', 146000000, 17098246),
(8, 'Japan', 125800000, 377975),
(9, 'Germany', 83100000, 357022),
(10, 'France', 67000000, 551695);


-- Create the Persons table
CREATE TABLE Persons (
    Id INT PRIMARY KEY,
    Fname VARCHAR(50),
    Lname VARCHAR(50),
    Population INT,
    Rating FLOAT,
    Country_Id INT,
    FOREIGN KEY (Country_Id) REFERENCES Country(Id)
);



-- Insert rows into Persons table
INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id)
VALUES
(1, 'John', 'Doe', 1000, 4.5, 1),
(2, 'Alice', 'Smith', 2000, 4.2, 2),
(3, 'Bob', 'Brown', 1500, 4.7, 3),
(4, 'Emma', 'Jones', 3000, 4.1, 4),
(5, 'Liam', 'Taylor', 2500, 4.6, 5),
(6, 'Sophia', 'Davis', 1800, 4.4, 6),
(7, 'Oliver', 'Wilson', 2200, 4.3, 7),
(8, 'Charlotte', 'Garcia', 1700, 4.8, 8),
(9, 'James', 'Martinez', 1200, 4.0, 9),
(10, 'Mia', 'Rodriguez', 1600, 4.9, 10);


INSERT INTO Country (Id, Country_name, Population, Area)
VALUES
(11, 'Spain', 47000000, 505992);

select * from Country;

SET FOREIGN_KEY_CHECKS = 0;


INSERT INTO Persons (Id, Fname, Lname, Population, Rating, Country_Id)
VALUES
(11, 'Ethan', 'Hunt', 1900, 4.7, 12);



#1 . (1)Perform inner join, Left join, and Right join on the tables. 

SELECT Persons.Id AS Person_Id, Persons.Fname, Persons.Lname, Persons.Rating, Country.Country_name
FROM Persons
INNER JOIN Country
ON Persons.Country_Id = Country.Id;


SELECT Persons.Id AS Person_Id, Persons.Fname, Persons.Lname, Persons.Rating, Country.Country_name
FROM Persons
LEFT JOIN Country
ON Persons.Country_Id = Country.Id;


SELECT Persons.Id AS Person_Id, Persons.Fname, Persons.Lname, Persons.Rating, Country.Country_name
FROM Persons
RIGHT JOIN Country
ON Persons.Country_Id = Country.Id;


# 2)List all distinct country names from both the Country and Persons tables

SELECT Country_name
FROM Country

UNION

SELECT Country_name
FROM Persons
JOIN Country
ON Persons.Country_Id = Country.Id;


# 3 
SELECT Country_name 
FROM Country
UNION ALL
SELECT C.Country_name
FROM Persons P
JOIN Country C ON P.Country_Id = C.Id;

SET SQL_SAFE_UPDATES = 0;


UPDATE Persons
SET Rating = ROUND(Rating);

select * from Persons;










