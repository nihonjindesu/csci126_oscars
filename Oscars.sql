-- Academy Awards Entity
CREATE TABLE
  AcademyAwards (
    ceremony_year int,
    ceremony_number int PRIMARY KEY
  );

INSERT INTO
  AcademyAwards
VALUES
  (1928, 1),
  (1929, 2),
  (1930, 3);

-- Department Entity
CREATE TABLE
  Department (category_id VARCHAR(255) PRIMARY KEY);

INSERT INTO
  Department
VALUES
  ('Actor'),
  ('Actress'),
  ('Art Direction');

-- Person Entity
CREATE TABLE
  Person (name VARCHAR(255) PRIMARY KEY);

INSERT INTO
  Person
VALUES
  ('Richard Barthelmess'),
  ('Emil Jannings'),
  ('Louise Dresser'),
  ('Janet Gaynor'),
  ('Gloria Swanson'),
  ('Rochus Gliese'),
  ('William Cameron Menzies'),
  ('Harry Oliver'),
  ('George Bancroft'),
  ('Warner Baxter'),
  ('Chester Morris'),
  ('Paul Muni'),
  ('Lewis Stone'),
  ('Ruth Chatterton'),
  ('Betty Compson'),
  ('Jeanne Eagels'),
  ('Corinne Griffith'),
  ('Bessie Love'),
  ('Mary Pickford'),
  ('Hans Dreier'),
  ('Cedric Gibbons'),
  ('Mitchell Leisen'),
  ('George Arliss'),
  ('Wallace Beery'),
  ('Maurice Chevalier'),
  ('Ronald Colman'),
  ('Lawrence Tibbett'),
  ('Nancy Carroll'),
  ('Greta Garbo'),
  ('Norma Shearer'),
  ('Herman Rosse'),
  ('Jack Okey');

-- Film Entity
CREATE TABLE
  Film (title VARCHAR(255) PRIMARY KEY, released_year int);

INSERT INTO
  Film
VALUES
  ('The Noose', 1928),
  ('The Last Command', 1928),
  ('A Ship Comes In', 1928),
  ('7th Heaven', 1928),
  ('Sadie Thompson', 1928),
  ('Sunrise', 1928),
  ('The Dove', 1928),
  ('Thunderbolt', 1929),
  ('In Old Arizona', 1929),
  ('Alibi', 1929),
  ('The Valiant', 1929),
  ('The Patriot', 1929),
  ('Madame X', 1929),
  ('The Barker', 1929),
  ('The Letter', 1929),
  ('The Divine Lady', 1929),
  ('The Broadway Melody', 1929),
  ('Coquette', 1929),
  ('The Bridge of San Luis Rey', 1929),
  ('Dynamite', 1929),
  ('Street Angel', 1929),
  ('Disraeli', 1930),
  ('The Green Goddess', 1930),
  ('The Big House', 1930),
  ('The Big Pond', 1930),
  ('The Rogue Song', 1930),
  ('The Devil''s Holiday', 1930),
  ('Sarah and Son', 1930),
  ('Anna Christie', 1930),
  ('The Divorcee', 1930),
  ('Their Own Desire', 1930),
  ('The Trespasser', 1930),
  ('Bulldog Drummond', 1930),
  ('King of Jazz', 1930),
  ('The Love Parade', 1930),
  ('Sally', 1930),
  ('The Vagabond King', 1930);

-- Winner Entity (Weak Entity)
CREATE TABLE
  Winner (
    name VARCHAR(255),
    film VARCHAR(255),
    ceremony int,
    department VARCHAR(255),
    FOREIGN KEY (name, film) REFERENCES Person_Film (person, film),
    FOREIGN KEY (ceremony, department) REFERENCES AcademyAwards_Department (ceremony, department)
  );

INSERT INTO
  Winner
VALUES
  ('Emil Jannings', 'The Last Command', 1, 'Actor'),
  ('Janet Gaynor', '7th Heaven', 1, 'Actress'),
  (
    'William Cameron Menzies',
    'The Dove',
    1,
    'Art Direction'
  ),
  ('Warner Baxter', 'In Old Arizona', 2, 'Actor'),
  ('Mary Pickford', 'Coquette', 2, 'Actress'),
  (
    'Cedric Gibbons',
    'The Bridge of San Luis Rey',
    2,
    'Art Direction'
  ),
  ('George Arliss', 'Disraeli', 3, 'Actor'),
  ('Norma Shearer', 'The Divorcee', 3, 'Actress'),
  (
    'Herman Rosse',
    'King of Jazz',
    3,
    'Art Direction'
  );

-- Many to Many: AcademyAwards and Department
CREATE TABLE
  AcademyAwards_Department (
    ceremony int,
    department VARCHAR(255),
    PRIMARY KEY (ceremony, department),
    FOREIGN KEY (ceremony) REFERENCES AcademyAwards (ceremony_number),
    FOREIGN KEY (department) REFERENCES Department (category_id)
  );

INSERT INTO
  AcademyAwards_Department
VALUES
  (1, 'Actor'),
  (1, 'Actress'),
  (1, 'Art Direction'),
  (2, 'Actor'),
  (2, 'Actress'),
  (2, 'Art Direction'),
  (3, 'Actor'),
  (3, 'Actress'),
  (3, 'Art Direction');

-- Many to Many: Department and Person
CREATE TABLE
  Department_Person (
    name varchat (255),
    ceremony int,
    department varchart (255),
    PRIMARY KEY (name, ceremony, department),
    FOREIGN KEY (ceremony, department) REFERENCES AcademyAwards_Department (ceremony, department),
    FOREIGN KEY (name) REFERENCES Person (name)
  );

INSERT INTO
  Department_Person
VALUES
  ('Richard Barthelmess', 1, 'Actor'),
  ('Emil Jannings', 1, 'Actor'),
  ('Louise Dresser', 1, 'Actress'),
  ('Janet Gaynor', 1, 'Actress'),
  ('Gloria Swanson', 1, 'Actress'),
  ('Rochus Gliese', 1, 'Art Direction'),
  ('William Cameron Menzies', 1, 'Art Direction'),
  ('Harry Oliver', 1, 'Art Direction'),
  ('George Bancroft', 2, 'Actor'),
  ('Warner Baxter', 2, 'Actor'),
  ('Chester Morris', 2, 'Actor'),
  ('Paul Muni', 2, 'Actor'),
  ('Lewis Stone', 2, 'Actor'),
  ('Ruth Chatterton', 2, 'Actress'),
  ('Betty Compson', 2, 'Actress'),
  ('Jeanne Eagels', 2, 'Actress'),
  ('Corinne Griffith', 2, 'Actress'),
  ('Bessie Love', 2, 'Actress'),
  ('Mary Pickford', 2, 'Actress'),
  ('Hans Dreier', 2, 'Art Direction'),
  ('Cedric Gibbons', 2, 'Art Direction'),
  ('Mitchell Leisen', 2, 'Art Direction'),
  ('William Cameron Menzies', 2, 'Art Direction'),
  ('Harry Oliver', 2, 'Art Direction'),
  ('George Arliss', 3, 'Actor'),
  ('Wallace Beery', 3, 'Actor'),
  ('Maurice Chevalier', 3, 'Actor'),
  ('Ronald Colman', 3, 'Actor'),
  ('Lawrence Tibbett', 3, 'Actor'),
  ('Nancy Carroll', 3, 'Actress'),
  ('Ruth Chatterton', 3, 'Actress'),
  ('Greta Garbo', 3, 'Actress'),
  ('Norma Shearer', 3, 'Actress'),
  ('Gloria Swanson', 3, 'Actress'),
  ('William Cameron Menzies', 3, 'Art Direction'),
  ('Herman Rosse', 3, 'Art Direction'),
  ('Hans Dreier', 3, 'Art Direction'),
  ('Jack Okey', 3, 'Art Direction');

-- Many to Many: Person and Film
CREATE TABLE
  Person_Film (
    person VARCHAR(255),
    film VARCHAR(255),
    PRIMARY KEY (person, film),
    FOREIGN KEY (person) REFERENCES Person (name),
    FOREIGN KEY (film) REFERENCES Film (title)
  );

INSERT INTO
  Person_Film
VALUES
  ('Richard Barthelmess', 'The Noose'),
  ('Emil Jannings', 'The Last Command'),
  ('Louise Dresser', 'A Ship Comes In'),
  ('Janet Gaynor', '7th Heaven'),
  ('Gloria Swanson', 'Sadie Thompson'),
  ('Rochus Gliese', 'Sunrise'),
  ('William Cameron Menzies', 'The Dove'),
  ('Harry Oliver', '7th Heaven'),
  ('George Bancroft', 'Thunderbolt'),
  ('Warner Baxter', 'In Old Arizona'),
  ('Chester Morris', 'Alibi'),
  ('Paul Muni', 'The Valiant'),
  ('Lewis Stone', 'The Patriot'),
  ('Ruth Chatterton', 'Madame X'),
  ('Betty Compson', 'The Barker'),
  ('Jeanne Eagels', 'The Letter'),
  ('Corinne Griffith', 'The Divine Lady'),
  ('Bessie Love', 'The Broadway Melody'),
  ('Mary Pickford', 'Coquette'),
  ('Hans Dreier', 'The Patriot'),
  ('Cedric Gibbons', 'The Bridge of San Luis Rey'),
  ('Mitchell Leisen', 'Dynamite'),
  ('William Cameron Menzies', 'Alibi'),
  ('Harry Oliver', 'Street Angel'),
  ('George Arliss', 'Disraeli'),
  ('George Arliss', 'The Green Goddess'),
  ('Wallace Beery', 'The Big House'),
  ('Maurice Chevalier', 'The Big Pond'),
  ('Ronald Colman', 'Bulldog Drummond'),
  ('Lawrence Tibbett', 'The Rogue Song'),
  ('Nancy Carroll', 'The Devil''s Holiday'),
  ('Ruth Chatterton', 'Sarah and Son'),
  ('Greta Garbo', 'Anna Christie'),
  ('Norma Shearer', 'The Divorcee'),
  ('Norma Shearer', 'Their Own Desire'),
  ('Gloria Swanson', 'The Trespasser'),
  ('William Cameron Menzies', 'Bulldog Drummond'),
  ('Herman Rosse', 'King of Jazz'),
  ('Hans Dreier', 'The Love Parade'),
  ('Jack Okey', 'Sally'),
  ('Hans Dreier', 'The Vagabond King');

-- Subquery
SELECT
  name,
  film,
  department
FROM
  Winner
WHERE
  ceremony IN (
    SELECT
      ceremony_number
    FROM
      AcademyAwards
    WHERE
      ceremony_year = 1928
  );

-- Aggregation
SELECT
  ceremony,
  COUNT(name) AS total_win
FROM
  Winner
GROUP BY
  ceremony;

-- Insert Queries
INSERT INTO
  AcademyAwards
VALUES
  (1931, 4);

-- Update Queries
UPDATE AcademyAwards
SET
  ceremony_year = 1931
WHERE
  ceremony_number = 2;

-- Queries to analyze data
SELECT
  dp.name,
  dp.count_nominees,
  w.count_win
FROM
  (
    SELECT
      name,
      COUNT(*) AS count_nominees
    FROM
      Department_Person
    WHERE
      department = 'Art Direction'
    GROUP BY
      name
  ) AS dp
  LEFT JOIN (
    SELECT
      name,
      COUNT(*) AS count_win
    FROM
      Winner
    GROUP BY
      name
  ) AS w ON dp.name = w.name
ORDER BY
  dp.count_nominees DESC;