CREATE DATABASE `Library`;
USE Library;
CREATE TABLE `Author` (
    `ID` INT PRIMARY KEY AUTO_INCREMENT,
    `FIO` VARCHAR(50),
    `DateB` DATE,
    `DateD` DATE
);

CREATE TABLE `Genres` (
    `ID` INT PRIMARY KEY AUTO_INCREMENT,
    `GName` VARCHAR(10)
);

CREATE TABLE `Books` (
    `ID` INT PRIMARY KEY AUTO_INCREMENT,
    `AID` INT,
    `Name` VARCHAR(40),
    `Desc` TEXT,
    `DateW` DATE,
    `GenreID` INT,
    FOREIGN KEY (AID)
	REFERENCES `Author`(ID)
	ON UPDATE CASCADE,
    FOREIGN KEY (GenreID)
	REFERENCES `Genres`(ID)
	ON UPDATE CASCADE
);

INSERT INTO `Author`
VALUES(1, 'Agatha Christie Miller', '1890.09.15', '1976.01.12');

INSERT INTO `Author`
VALUES(2, 'Yu Nesbo', '1972.09.15', '2021.01.12');

INSERT INTO `Author`
VALUES(3, 'Hans Christian Andersen', '1805.04.02', '1875.08.04');

INSERT INTO `Author`
VALUES(4, 'Kolin Guver', '1979.12.11', '2021.08.04');

INSERT INTO `Author`
VALUES(5, 'Jane Ostin', '1775.12.16', '1817.07.18');


INSERT INTO `Genres`
VALUES(1,'Romance');

INSERT INTO `Genres`
VALUES(4,'Detective');

INSERT INTO `Genres`
VALUES(2,'Romance');

INSERT INTO `Genres`
VALUES(3,'Classic');


INSERT INTO `Books`
VALUES(1, 1,'Partners in Crime','15 stories','1929.01.01', 4);

INSERT INTO `Books`
VALUES(2, 1,'They Came to Baghdad','almost a spy romance','1951.01.01', 4);

INSERT INTO `Books`
VALUES(3, 2,'Kingdom','In the Norwegian town, lost in the mountains, a sleepy, peaceful life flows.','2021.01.01', 2);

INSERT INTO `Books`
VALUES(4, 4,'Mermaid','Mermaid is Mermaid','1989.01.01', 1);

INSERT INTO `Books`
VALUES(5, 3,'It Ends With Us','Just a romance','2016.08.02', 1);

INSERT INTO `Books`
VALUES(6, 5,'Pride and Prejudice','','1813.01.28', 3);


SELECT `Name`, `DateW`, `GName` FROM `Books`, `genres`
WHERE `DateW` > '1990.01.01' AND `Genres`.`ID` = `Books`.`GenreID`;


SELECT DISTINCT FIO, COUNT(DISTINCT Name) FROM `books`
JOIN `Author` ON `Author`.`ID` = `books`.`AID`
GROUP BY `AID`;


SELECT DISTINCT `Name`, `DateW` FROM `Books`, `Author`
WHERE `AID` = 1
ORDER BY `DateW` DESC;


INSERT INTO `Genres`
VALUES(6, 'Fantastic');
INSERT INTO `Genres`
VALUES(7, 'Comdedy');
SELECT DISTINCT `GName`, `Name` FROM `Genres`
LEFT JOIN `Books` ON `Genres`.`ID` = `Books`.`GenreID`
ORDER BY `GName`;


SELECT `Name`, `FIO`, `GName` FROM `genres`, `Books`, `author`
WHERE `author`.`ID` = `books`.`AID` AND `Books`.`GenreID` = `Genres`.`ID`;


SELECT `FIO` FROM `Author`, `genres`, `books`
WHERE `Author`.`ID` = `Books`.`AID` AND `Books`.`GenreID` = `Genres`.`ID` AND `GName` = 'Detective'
GROUP BY `FIO`, `GName`; 


SELECT `FIO` FROM `Author`, `books`
WHERE `Author`.`ID` = `Books`.`AID` AND `Name` = 'Mermaid'; 


SELECT `GName` FROM `Genres`
LEFT JOIN `books` ON `genres`.`ID` = `books`.`GenreID`
WHERE `books`.`GenreID` IS NULL
GROUP BY `GName`;


SELECT `Name`, `Desc` FROM `Books`, `Author`
WHERE `Author`.`ID` = `Books`.`AID` AND `DateB` Between '1900.01.01' AND '2000.01.01';


SELECT DATEDIFF(MAX(`DateW`), MIN(`DateW`)) / 365 AS `Разница между первой и последней книгой Агаты крсти, в годах:` FROM `books`
WHERE `AID` = 1;


SELECT `FIO` FROM `author`
WHERE `FIO` LIKE 'Y%' AND `DateB` BETWEEN '1972.01.01' AND '1972.12.31';



CREATE VIEW zap_9 
AS SELECT `FIO` FROM `author`
WHERE `FIO` LIKE 'A*' OR `DateB` BETWEEN '1872.01.01' AND '1972.12.31';

SELECT `Name` FROM `zap_9`
WHERE `Name` LIKE 'Mermaid';



UPDATE `books`
SET `DateW` = '2222.12.22'
WHERE `Name` = 'Pride and Prejudice';


DELETE `Books`.* FROM `books`, `genres`
WHERE `books`.`ID` = `genres`.`GenreID` AND `GName` = 'Detective';













