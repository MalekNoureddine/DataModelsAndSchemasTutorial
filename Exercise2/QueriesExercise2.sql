--Queries Exercise2

-- 1\Retrieve the List of All Films
SELECT * FROM FILMS;

-- 2\Retrieve Films with a Duration > 180 Minutes
SELECT * FROM FILM WHERE DURATION > 180;

-- 3\List All Film Genres
SELECT DISTINCT GENRE FROM FILM;

-- 4\Count the Number of Films per Genre
SELECT GENRE, COUNT(*) AS FilmCount
FROM FILM
GROUP BY GENRE;

-- 5\Find the Title(s) and Year(s) of the Longest Film(s)
SELECT TITLE, YEAR
FROM FILM
WHERE DURATION = (SELECT MAX(DURATION) FROM FILM);

-- 6\Directors Who Acted in Their Own Films
SELECT P.FIRSTNAME, P.LASTNAME
FROM PERSON P
JOIN FILM F ON P.NUMP = F.DIRECTOR
JOIN DISTRIBUTION D ON F.NUMF = D.NUMF AND D.NUMA = P.NUMP;

-- 7\Total Salary of Actors in "Sleepless in Seattle"
SELECT SUM(SALARY) AS TotalSalary
FROM DISTRIBUTION D
JOIN FILM F ON D.NUMF = F.NUMF
WHERE F.TITLE = 'Sleepless in Seattle';

-- 8\Total Salary of Actors for Each Spielberg Film
SELECT F.TITLE, F.YEAR, SUM(D.SALARY) AS TotalSalary
FROM FILM F
JOIN DISTRIBUTION D ON F.NUMF = D.NUMF
WHERE F.DIRECTOR = (SELECT NUMP FROM PERSON WHERE LASTNAME = 'Spielberg')
GROUP BY F.TITLE, F.YEAR;

