DROP TABLE IF EXISTS gastronomies;
DROP TABLE IF EXISTS cities;
DROP TABLE IF EXISTS countries;

CREATE TABLE countries (
id SERIAL PRIMARY KEY,
name VARCHAR(255),
travelled BOOLEAN
);

CREATE TABLE cities (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  travelled BOOLEAN,
  country_id INT REFERENCES countries(id) on delete cascade

);

CREATE TABLE gastronomies (
  id SERIAL PRIMARY KEY,
  name VARCHAR(255),
  address VARCHAR(255),
  food VARCHAR(255),
  alcohol VARCHAR(255),
  city_id INT REFERENCES cities(id) on delete cascade
);
