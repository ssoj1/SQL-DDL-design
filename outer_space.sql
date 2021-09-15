
CREATE TABLE stars (
    star PRIMARY KEY, 
    temp_k INT NOT NULL
);

CREATE TABLE planets (
    planet TEXT PRIMARY KEY,
    orbital_period_in_years FLOAT, 
    star INT REFERENCES stars
);

CREATE TABLE moons (
    moon TEXT PRIMARY KEY, 
    planet TEXT REFERENCES planets NOT NULL 
);

SELECT planet, star, COUNT(moon) AS moon_count
FROM planets
JOIN stars
    USING star
LEFT JOIN moons
    using planet
GROUP BY planet, star
ORDER BY planet ASC;

-- BELOW NEEDS TO BE REFACTORED FOR NEW NAMING STRUCTURE  

INSERT INTO stars
    (name, temp_kelvin)
VALUES
    ('The Sun', 5800), 
    ('Proxima Centauri', 3042),
    ('Gliese 876', 3192);

INSERT INTO planets 
    (name, orbital_period_in_years, star_id)
VALUES
    ('Earth', 1.00, 1), 
    ('Mars', 1.882, 1), 
    ('Venus', 0.62, 1), 
    ('Proxima Centauri b', 0.03, 2), 
    ('Gliese 876 b', 0.236, 3);

INSERT INTO moons 
    (name, planet_name)
VALUES
    ('The Moon', 'Earth'), 
    ('Phobos, Deinmos', 'Mars');

INSERT INTO moons 
    (name, planet_name)
VALUES
    ('Deinmos', 'Mars');

UPDATE moons
    SET name = 'Phobos'
    WHERE id = 2;
