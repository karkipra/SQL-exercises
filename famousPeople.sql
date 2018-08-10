/* ============== project: famous people ============== */
/* ==================================================== */

/* 
    this sql project deals with creating a database of 
    famous people and relations between them 
    database from: https://github.com/aaiss1/KA-SQL           -Projects/blob/master/Famous%20People.dbf 
*/
    
    
/* ============== creating database ============== */

create table stars (
    id integer primary key autoincrement,
    name text,
    age integer,
    gender text,
    marriage text);
    
    insert into stars (name, age, gender, marriage) values ("lil pump", 17, "m", "no");
    insert into stars (name, age, gender, marriage) values ("jake paul", 20, "m", "no");
    insert into stars (name, age, gender, marriage) values ("iosif dzhugashvili", 74, "m", "yes");
     insert into stars (name, age, gender, marriage) values ("lil xan", 21, "m", "no");
     insert into stars (name, age, gender, marriage) values ("john cena", 40, "m", "yes");
     insert into stars (name, age, gender, marriage) values ("amanda bynes", 31, "f", "no");
     insert into stars (name, age, gender, marriage) values ("rachel zoe", 46, "f", "yes");
     insert into stars (name, age, gender, marriage) values ("jennifer aniston", 46, "f", "yes");
     insert into stars (name, age, gender, marriage) values ("hugh laurie", 58, "m", "yes");
    insert into stars (name, age, gender, marriage) values ("jennifer aniston", 48, "f", "yes");
    insert into stars (name, age, gender, marriage) values ("christina aguilera", 36, "f", "no");
    insert into stars (name, age, gender, marriage) values ("selena gomez", 25, "f", "no");
    insert into stars (name, age, gender, marriage) values ("queen latifah", 47, "f", "no");
    insert into stars (name, age, gender, marriage) values ("tiger woods", 41, "m", "no");
  insert into stars (name, age, gender, marriage) values ("the weeknd", 27, "m", "no");

create table typeofceleb (
    id integer primary key autoincrement,
    name text,
    type text);
    
    insert into typeofceleb (name, type) values ("lil pump", "rapper");
    insert into typeofceleb (name, type) values ("jake paul", "rapper");
    insert into typeofceleb (name, type) values ("iosif dzhugashvili", "political figure");
     insert into typeofceleb (name, type) values ("lil xan", "rapper");
     insert into typeofceleb (name, type) values ("john cena", "actor");
     insert into typeofceleb (name, type) values ("amanda bynes", "actor");
     insert into typeofceleb (name, type) values ("rachel zoe", "painter");
     insert into typeofceleb (name, type) values ("jennifer aniston", "actor");
     insert into typeofceleb (name, type) values ("hugh laurie", "actor");
    insert into typeofceleb (name, type) values ("jennifer aniston", "actor");
    insert into typeofceleb (name, type) values ("christina aguilera", "singer");
    insert into typeofceleb (name, type) values ("selena gomez", "singer");
    insert into typeofceleb (name, type) values ("queen latifah", "actor");
    insert into typeofceleb (name, type) values ("tiger woods", "golfer");
  insert into typeofceleb (name, type) values ("the weeknd", "singer");
  
create table celeb_relations(
    id INTEGER PRIMARY KEY AUTOINCREMENT,
    person1_id INTEGER,
    person2_id INTEGER
    );
    
    insert into celeb_relations (person1_id, person2_id) values (1, 5);
    insert into celeb_relations (person1_id, person2_id) values (5, 15);
    insert into celeb_relations (person1_id, person2_id) values (3, 7);
    
    

  
/* ============== queries on database ============== */


/* Base Data */

SELECT * FROM stars;
SELECT * FROM typeofceleb;
SELECT * FROM celeb_relations;

/* Grouping By gender, age range etc. */

SELECT COUNT(*) as Number, marriage as Married FROM stars
    GROUP BY marriage;
    
SELECT COUNT(*) as Number, gender FROM stars
    GROUP BY gender;
    
SELECT name, CASE
    WHEN age > 60 THEN "old"
    WHEN age > 40 THEN "middle-aged"
    WHEN age > 20 THEN "young"
    ELSE "teen"
END "age-range" FROM stars ORDER BY age;

SELECT COUNT(*) as number, type FROM typeofceleb
    GROUP BY type;
    
/* JOINing tables to show friends*/

SELECT a.name as friend_1, b.name as friend_2 from celeb_relations
    JOIN stars a
    ON a.id = celeb_relations.person1_id
    JOIN stars b
    ON b.id = celeb_relations.person2_id
