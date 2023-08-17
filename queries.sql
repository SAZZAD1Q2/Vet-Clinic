/* Populate database with sample data. */

SELECT animals.name as animal_name 
    FROM animals
    JOIN owners on animals.owner_id = owners.id
    WHERE owners.full_name = 'Melody Pond';
	
	
	SELECT animals.name as animal_name, species.name as type 
    FROM animals
    JOIN species on animals.species_id = species.id
    WHERE species.name = 'Pokemon';
	
	
	SELECT owners.full_name AS owner_name, animals.name AS animal_name
FROM owners
LEFT JOIN animals ON owners.id = animals.owner_id
ORDER BY owners.full_name;

SELECT s.name AS species_name, COUNT(a.id) AS animal_count
FROM species s
LEFT JOIN animals a ON s.id = a.species_id
GROUP BY s.name
ORDER BY s.name;


SELECT animals.name as animal_name,species.name as type, owners.full_name as owner_id
FROM animals
inner join species on animals.species_id = species.id
inner join owners on animals.owner_id = owners.id
where species.name = 'Digimon' and owners.full_name = 'Jennifer Orwell'


SELECT animals.name as animal_name
FROM animals
inner join owners on animals.owner_id = owners.id
where owners.full_name = 'Dean Winchester' and animals.escape_attempts < 1;


SELECT owners.full_name AS owner_name, COUNT(animals.id) AS animal_count
FROM owners
LEFT JOIN animals ON owners.id = animals.owner_id
GROUP BY owners.full_name
ORDER BY animal_count DESC
LIMIT 1;