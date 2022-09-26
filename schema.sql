/* Database schema to keep the structure of entire database. */
CREATE DATABASE vet_clinic;

CREATE TABLE animals (
    id serial PRIMARY key,
    name varchar(100) NOT NULL,
    date_of_birth date NOT NULL,
    escape_attempts int DEFAULT 0,
    neutered BOOLEAN NOT NULL,
    weight_kg NUMERIC(10,2) NOT NULL
);

ALTER TABLE animals ADD species varchar(100);

CREATE TABLE owners (
	id serial PRIMARY KEY,
	full_name varchar(100) NOT NULL,
	age INT
);

CREATE TABLE species (
	id serial PRIMARY KEY,
	name varchar(100) NOT NULL
);

ALTER TABLE animals DROP COLUMN species;

ALTER TABLE animals ADD COLUMN species_id INT, ADD CONSTRAINT f_species_id FOREIGN KEY (species_id) REFERENCES species(id) ON DELETE CASCADE;

ALTER TABLE animals ADD COLUMN owners_id INT, ADD CONSTRAINT f_owners_id FOREIGN KEY (owners_id) REFERENCES owners(id) ON DELETE CASCADE;

CREATE TABLE vets (
	id SERIAL PRIMARY KEY,
	name VARCHAR(100) NOT NULL,
	age INT NOT NULL,
	date_of_graduation DATE NOT NULL
);

CREATE TABLE specializations (
	species_id INT NOT NULL,
	vets_id INT NOT NULL,

	CONSTRAINT f_species FOREIGN KEY(species_id) REFERENCES species(id) ON DELETE CASCADE,

	CONSTRAINT f_vets FOREIGN KEY(vets_id) REFERENCES vets(id),

	PRIMARY KEY(species_id,vets_id)
);

CREATE TABLE visits (
	id INT GENERATED ALWAYS AS IDENTITY,
  vets_id INT NOT NULL,
  animals_id INT NOT NULL,
  date DATE,

  CONSTRAINT f_vets FOREIGN KEY(vets_id) REFERENCES vets(id) ON DELETE CASCADE,

  CONSTRAINT f_animals FOREIGN KEY(animals_id) REFERENCES animals(id) ON DELETE CASCADE,

	PRIMARY KEY(id)
);

ALTER TABLE owners ADD COLUMN email VARCHAR(120);

ALTER TABLE visits RENAME COLUMN date TO date_of_visit;

CREATE TABLE visits(
  id INT GENERATED ALWAYS AS IDENTITY,
  animal_id INT REFERENCES animals(id),
  vet_id INT REFERENCES vets(id),
  date_of_visit DATE,
  PRIMARY KEY(id)
);