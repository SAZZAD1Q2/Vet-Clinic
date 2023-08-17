/* Populate database with sample data. */

INSERT INTO animals 
    (name, date_of_birth, weight_kg, neutered, escape_attempts)
VALUES
   ('Agumon', '2020-02-03', 10.23, true, 0),
   ('Gabumon', '2018-11-15', 8, true, 2),
   ('Pikachu', '2021-01-07', 15.04, false, 1),
   ('Devimon', '2017-05-12', 11, true, 5);

   INSERT INTO animals (name, date_of_birth, escape_attempts,neutered, weight_kg) VALUES 
  ('Charmandor', '2020-02-08', 0, FALSE, -11),
  ('Plantmon','2021-11-15', 2, TRUE, 5.7),
  ('Squirtle', '1993-04-02', 3, FALSE, -12.13),
  ('Angemon', '2005-06-12', 1, TRUE, -45),
  ('Boarmon', '2005-06-07', 7, TRUE, 20.4),
  ('Blossom', '1998-10-13', 3, TRUE, 17),
  ('Ditto', '2022-05-14', 4, TRUE, 22);