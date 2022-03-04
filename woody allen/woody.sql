CREATE DATABASE woody;
USE woody;
DROP TABLE max_grosser;
CREATE TABLE reception(
year INT,
title VARCHAR(40),
grossed VARCHAR(20),
rotten_tomatoes VARCHAR(3)

);
SELECT *
FROM nominations;
UPDATE reception
SET grossed=RIGHT
(grossed,LENGTH(grossed)-1)
WHERE grossed LIKE '$%';
UPDATE reception
SET grossed=LEFT 
(grossed, LENGTH(grossed)-4)
WHERE grossed like '%[__]';
UPDATE reception
SET grossed=null
WHERE grossed='N/A';
UPDATE reception
SET grossed= replace(grossed,',','');
ALTER TABLE reception
ADD grossed_new int;
UPDATE reception
SET grossed_new= CAST(grossed as unsigned int);
SELECT DATA_TYPE 
FROM INFORMATION_SCHEMA.COLUMNS
WHERE 
     TABLE_SCHEMA = 'woody' AND
     TABLE_NAME   = 'reception' AND 
     COLUMN_NAME  = 'grossed_new'
CREATE TABLE max_grosser(
year int,
title VARCHAR(40),
Box_Office int
);
INSERT INTO max_grosser(year,title, Box_Office)
SELECT year, title,grossed_new
FROM reception
WHERE grossed_new=(SELECT MAX(grossed_new) from reception WHERE year LIKE '201_');
ALTER TABLE max_grosser
ADD year_range VARCHAR(10);
UPDATE max_grosser
SET year_range='2010-2020'
WHERE year LIKE '201_';
DELETE FROM max_grosser 
WHERE year IS NULL;
UPDATE reception
SET rotten_tomatoes=left
(rotten_tomatoes, length(rotten_tomatoes)-1);
ALTER TABLE reception
ADD ratings int;
UPDATE reception
SET ratings=CAST(rotten_tomatoes AS UNSIGNED INT);
ALTER TABLE reception
DROP COLUMN rotten_tomatoes;
CREATE TABLE best_director(
year int,
film varchar(30),
result varchar(15)
);
SELECT COUNT(result)
FROM best_director;
CREATE TABLE best_screenplay(
year int,
film varchar(30),
result varchar(15)
);
CREATE TABLE nominations(
total int,
director int,
screenplay int,
grammy int
);
SELECT @var tot_nom;
SELECT @var tot_nom_2;
SELECT @var tot_nominations;
SELECT @tot_nom:=COUNT(result) FROM best_director;
SELECT @tot_nom_2:=COUNT(result) FROM best_screenplay;
SELECT @total_nominations:=@tot_nom +@tot_nom_2;
INSERT INTO nominations(total, director,screenplay,grammy) values (
@total_nominations,
 @tot_nom,
@tot_nom_2,
3);
DELETE FROM nominations WHERE director IS NULL;
