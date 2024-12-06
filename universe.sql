CREATE TABLE galaxy (
    galaxy_id SERIAL NOT NULL,
    star_id INTEGER  NOT NULL,
    name VARCHAR(20) UNIQUE NOT NULL,
    area INTEGER,
    volume INTEGER,
    age NUMERIC,
    material TEXT,
    has_life BOOLEAN,
    has_water BOOLEAN
);

CREATE TABLE star (
    star_id SERIAL NOT NULL,
    galaxy_id INTEGER NOT NULL,
    planet_id INTEGER NOT NULL,
    name VARCHAR(20) UNIQUE NOT NULL,
    area INTEGER,
    volume INTEGER,
    age NUMERIC,
    material TEXT,
    has_life BOOLEAN,
    has_water BOOLEAN
);

CREATE TABLE planet (
    planet_id SERIAL NOT NULL,
    star_id INTEGER  NOT NULL,
    moon_id INTEGER  NOT NULL,
    name VARCHAR(20) UNIQUE NOT NULL,
    area INTEGER,
    volume INTEGER,
    age NUMERIC,
    material TEXT,
    has_life BOOLEAN,
    has_water BOOLEAN
);

CREATE TABLE moon (
    moon_id SERIAL NOT NULL,
    planet_id INTEGER NOT NULL,
    name VARCHAR(20) UNIQUE NOT NULL,
    area INTEGER,
    volume INTEGER,
    age NUMERIC,
    material TEXT,
    has_life BOOLEAN,
    has_water BOOLEAN
);

CREATE TABLE more_info (
    more_info_id SERIAL NOT NULL,
    object_id INTEGER,
    name VARCHAR(20) UNIQUE NOT NULL,
    description TEXT
);


ALTER TABLE galaxy    ADD PRIMARY KEY (galaxy_id);
ALTER TABLE star      ADD PRIMARY KEY (star_id);
ALTER TABLE planet    ADD PRIMARY KEY (planet_id);
ALTER TABLE moon      ADD PRIMARY KEY (moon_id);
ALTER TABLE more_info ADD PRIMARY KEY (more_info_id);

ALTER TABLE galaxy ADD FOREIGN KEY (star_id)   REFERENCES star   (star_id);
ALTER TABLE star   ADD FOREIGN KEY (galaxy_id) REFERENCES galaxy (galaxy_id);
ALTER TABLE star   ADD FOREIGN KEY (planet_id) REFERENCES planet (planet_id);
ALTER TABLE planet ADD FOREIGN KEY (star_id)   REFERENCES star   (star_id);
ALTER TABLE planet ADD FOREIGN KEY (moon_id)   REFERENCES moon   (moon_id);
ALTER TABLE moon   ADD FOREIGN KEY (planet_id) REFERENCES planet (planet_id);