/* Marvel Heroes and Villains
 Based on the website http://marvel.wikia.com/Main_Page
 with popularity data from http://observationdeck.io9.com/something-i-found-marvel-character-popularity-poll-cb-1568108064
 and power grid data from http://marvel.wikia.com/Power_Grid#Power
 Collected by: https://www.khanacademy.org/profile/Mentrasto/
 */

CREATE TABLE marvels (ID INTEGER PRIMARY KEY,
    name TEXT,
    popularity INTEGER,
    alignment TEXT,
    gender TEXT,
    height_m NUMERIC,
    weight_kg NUMERIC,
    hometown TEXT,
    intelligence INTEGER,
    strength INTEGER,
    speed INTEGER,
    durability INTEGER,
    energy_Projection INTEGER,
    fighting_Skills INTEGER);

INSERT INTO marvels VALUES(1, "Spider Man", 1, "Good", "Male", 1.78, 75.75, "USA", 4, 4, 3, 3, 1, 4);
INSERT INTO marvels VALUES(2, "Iron Man", 20, "Neutral", "Male", 1.98, 102.58, "USA", 6, 6, 5, 6, 6, 4);
INSERT INTO marvels VALUES(3, "Hulk", 18, "Neutral", "Male", 2.44, 635.29, "USA", 6, 7, 3, 7, 5, 4);
INSERT INTO marvels VALUES(4, "Wolverine", 3, "Good", "Male", 1.6, 88.46, "Canada", 2, 4, 2, 4, 1, 7);
INSERT INTO marvels VALUES(5, "Thor", 5, "Good", "Male", 1.98, 290.3, "Norway", 2, 7, 7, 6, 6, 4);
INSERT INTO marvels VALUES(6, "Green Goblin", 91, "Bad", "Male", 1.93, 174.63, "USA", 4, 4, 3, 4, 3, 3);
INSERT INTO marvels VALUES(7, "Magneto", 11, "Neutral", "Male", 1.88, 86.18, "Germany", 6, 3, 5, 4, 6, 4);
INSERT INTO marvels VALUES(8, "Thanos", 47, "Bad", "Male", 2.01, 446.79, "Titan", 6, 7, 7, 6, 6, 4);
INSERT INTO marvels VALUES(9, "Loki", 32, "Bad", "Male", 1.93, 238.14, "Jotunheim", 5, 5, 7, 6, 6, 3);
INSERT INTO marvels VALUES(10, "Doctor Doom", 19, "Bad", "Male", 2.01, 188.24, "Latveria", 6, 4, 5, 6, 6, 4);
INSERT INTO marvels VALUES(11, "Jean Greay", 8, "Good", "Female", 1.68, 52.16, "USA", 3, 2, 7, 7, 7, 4);
INSERT INTO marvels VALUES(12, "Rogue", 4, "Good", "Female", 1.73, 54.43, "USA", 7, 7, 7, 7, 7, 7);

INSERT INTO marvels VALUES(13, "Nastya", 2, "Bad", "Female", 1.53, 50.55, "Russia", 7, 7, 7, 7, 7, 7);

/* BASE DATA */
SELECT * FROM marvels;

/*AVG, MIN and MAX */
SELECT
    AVG(height_m) as avg_ht,
    AVG(weight_kg) as avg_wt,
    AVG(intelligence) as avg_int,
    AVG(strength) as avg_str,
    AVG(speed) as avg_sp,
    AVG(durability) as avg_dur,
    AVG(energy_Projection) as avg_enr,
    AVG(fighting_Skills) as avg_fig
FROM marvels;
SELECT
    MIN(height_m) as min_ht,
    MIN(weight_kg) as min_wt,
    MIN(intelligence) as min_int,
    MIN(strength) as min_str,
    MIN(speed) as min_sp,
    MIN(durability) as min_dur,
    MIN(energy_Projection) as min_enr,
    MIN(fighting_Skills) as min_fig
FROM marvels;

SELECT
    MAX(height_m) as max_ht,
    MAX(weight_kg) as max_wt,
    MAX(intelligence) as max_int,
    MAX(strength) as max_str,
    MAX(speed) as max_sp,
    MAX(durability) as max_dur,
    MAX(energy_Projection) as max_enr,
    MAX(fighting_Skills) as max_fig
FROM marvels;

/* Grouping by gender, alignment, popularity*/
SELECT COUNT(gender) as num_by_genders, gender FROM marvels GROUP BY gender;

SELECT COUNT(alignment) as num_by_alignment, alignment FROM marvels GROUP BY alignment;

SELECT name, popularity as popularity_rankings FROM marvels
    ORDER BY popularity;

/*Grouping by CASE*/
SELECT name, CASE
    WHEN height_m > 1.80 THEN "tall"
    WHEN height_m > 1.60 THEN "normal"
    ELSE "short"
END "height_rankings" FROM marvels;

SELECT name, CASE
    WHEN weight_kg > 150 THEN "super-heavy"
    WHEN weight_kg > 100 THEN "heavy"
    WHEN weight_kg > 60 THEN "normal"
    ELSE "light"
END "weight_rankings" FROM marvels;
