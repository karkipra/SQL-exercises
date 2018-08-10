CREATE TABLE students (id INTEGER PRIMARY KEY,
  first_name TEXT,
  last_name TEXT,
  email TEXT,
  phone TEXT,
  birthdate TEXT);

  INSERT INTO students (first_name, last_name, email, phone, birthdate)
  VALUES ("Peter", "Rabbit", "peter@rabbit.com", "555-6666", "2002-06-24");
  INSERT INTO students (first_name, last_name, email, phone, birthdate)
  VALUES ("Alice", "Wonderland", "alice@wonderland.com", "555-4444", "2002-07-04");

  CREATE TABLE student_grades (id INTEGER PRIMARY KEY,
    student_id INTEGER,
    test TEXT,
    grade INTEGER);

    INSERT INTO student_grades (student_id, test, grade)
    VALUES (1, "Nutrition", 95);
    INSERT INTO student_grades (student_id, test, grade)
    VALUES (2, "Nutrition", 92);
    INSERT INTO student_grades (student_id, test, grade)
    VALUES (1, "Chemistry", 85);
    INSERT INTO student_grades (student_id, test, grade)
    VALUES (2, "Chemistry", 95);

    SELECT * FROM student_grades;

    /* cross join */
    SELECT * FROM student_grades, students;

    /* implicit inner join */
    SELECT * FROM student_grades, students
    WHERE student_grades.student_id = students.id;

    /* explicit inner join - JOIN */
    SELECT students.first_name, students.last_name, students.email, student_grades.test, student_grades.grade FROM students
    JOIN student_grades
    ON students.id = student_grades.student_id
    WHERE grade > 90;


/*=========================================================================================================*/    


    CREATE TABLE students (
      id INTEGER PRIMARY KEY,
      name TEXT,
      email TEXT,
      teacher_id INTEGER);

      CREATE TABLE teachers (
        id INTEGER PRIMARY KEY,
        name TEXT,
        email TEXT);

        INSERT INTO teachers (name, email)
        VALUES ("Socrates", "soc@rat.es");
        INSERT INTO teachers (name, email)
        VALUES ("Maria Montessori", "maria@montessori.com");

        INSERT INTO students (name, email, teacher_id)
        VALUES ("Antisthenes", "jr@winston.com", 1);
        INSERT INTO students (name, email, teacher_id)
        VALUES ("Xenophon", "xenophon@greece.com", 1);
        INSERT INTO students (name, email, teacher_id)
        VALUES ("Plato", "plato@greece.com", 1);
        INSERT INTO students (name, email, teacher_id)
        VALUES ("Larry", "larry@page.com", 2);
        INSERT INTO students (name, email, teacher_id)
        VALUES ("Sergey", "larry@page.com", 2);
        INSERT INTO students (name, email, teacher_id)
        VALUES ("Ray", "ray@bradbury.com", NULL);

        /* Show students next to their teachers */
        SELECT students.name, teachers.name AS teacher_name
        FROM students
        JOIN teachers
        ON students.teacher_id = teachers.id;

        /* Show students next to their teachers,
        even if they don't have a teacher assigned
        */
        SELECT students.name, teachers.name AS teacher_name
        FROM students
        LEFT OUTER JOIN teachers
        ON students.teacher_id = teachers.id;
        
        /*=========================================================================================================*/
        
        CREATE TABLE students (id INTEGER PRIMARY KEY AUTOINCREMENT,
    first_name TEXT,
    last_name TEXT,
    email TEXT,
    phone TEXT,
    birthdate TEXT,
    buddy_id INTEGER);

INSERT INTO students 
    VALUES (1, "Peter", "Rabbit", "peter@rabbit.com", "555-6666", "2002-06-24", 2);
INSERT INTO students 
    VALUES (2, "Alice", "Wonderland", "alice@wonderland.com", "555-4444", "2002-07-04", 1);
INSERT INTO students 
    VALUES (3, "Aladdin", "Lampland", "aladdin@lampland.com", "555-3333", "2001-05-10", 4);
INSERT INTO students 
    VALUES (4, "Simba", "Kingston", "simba@kingston.com", "555-1111", "2001-12-24", 3);
    
SELECT id, first_name, last_name, buddy_id FROM students;

/* self join */
SELECT students.first_name, students.last_name, buddies.email as buddy_email
    FROM students
    JOIN students buddies
    ON students.buddy_id = buddies.id;
