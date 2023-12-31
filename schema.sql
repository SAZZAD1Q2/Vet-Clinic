/* Database schema to keep the structure of entire database. */


CREATE TABLE animals (
    ID INT PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    name VARCHAR(100) NOT NULL,
    date_of_birth DATE,
    escape_attempts INT,
    neutered BOOLEAN,
    weight_kg DECIMAL(10, 2)
);

ALTER TABLE animals
ADD COLUMN species VARCHAR(100);

CREATE TABLE owners (
    ID INT PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    full_name VARCHAR(100) NOT NULL,
    age INT
);

CREATE TABLE species (
    ID INT PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    name VARCHAR(100) NOT NULL
);

ALTER TABLE animals
DROP COLUMN species;

ALTER TABLE animals 
    ADD COLUMN species_id INT,
    ADD CONSTRAINT fk_species
        FOREIGN KEY (species_id) REFERENCES species(id);
		
		ALTER TABLE animals 
    ADD COLUMN owner_id INT,
    ADD CONSTRAINT fk_owners
        FOREIGN KEY (owner_id) REFERENCES owners(id);  


/* join table visit  3 tables created */

CREATE TABLE vets (
    ID INT PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    name VARCHAR(100) NOT NULL,
    age INT NOT NULL,
    date_of_graduation DATE
);        

CREATE TABLE specializations (
    ID INT PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    vet_id INT NOT NULL,
    species_id INT NOT NULL
);

CREATE TABLE visits (
    ID INT PRIMARY KEY GENERATED BY DEFAULT AS IDENTITY,
    vet_id INT NOT NULL,
    animal_id INT NOT NULL,
    date_of_visit DATE
);

-- Add an email column to your owners table
ALTER TABLE owners ADD COLUMN email VARCHAR(120);

-- create index to decrease the execution time this two to be added by ...
CREATE INDEX visits_index ON visits (animal_id DESC);


-- create index to improve the execution time
CREATE INDEX owners_index ON owners (email ASC);