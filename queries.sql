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

/* join table visit */

/* Who was the last animal seen by William Tatcher? */

SELECT animals.name AS animal, MAX(visits.date_of_visit) AS date_of_visit
FROM animals
LEFT JOIN visits ON animals.id = visits.animal_id
LEFT JOIN vets ON vets.id = visits.vet_id
WHERE vets.name = 'William Tatcher'
GROUP BY animals.id, animals.name
ORDER BY date_of_visit DESC
LIMIT 1;

/*How many different animals did Stephanie Mendez see? */
select animals.name as animal, visits.date_of_visit as date_of_visit
from animals
left join visits on animals.id = visits.animal_id
left join vets on vets.id = visits.vet_id
where vets.name = 'Stephanie Mendez';

/*List all vets and their specialties, including vets with no specialties. */

SELECT vets.name as vet_name, species.name as speciality
from vets
left join specializations on vets.id = specializations.vet_id
left join species on specializations.species_id = species.id

/* List all animals that visited Stephanie Mendez between April 1st and August 30th, 2020.*/

SELECT animals.name AS animal, visits.date_of_visit AS date_of_visit
FROM animals
LEFT JOIN visits ON animals.id = visits.animal_id
LEFT JOIN vets ON vets.id = visits.vet_id
WHERE vets.name = 'Stephanie Mendez' 
AND date_of_visit BETWEEN '2020-04-01' AND '2020-08-30';

 /* What animal has the most visits to vets?*/
SELECT animals.name AS animal_name, COUNT(visits.id) AS visit_count
FROM animals
LEFT JOIN visits ON animals.id = visits.animal_id
GROUP BY animals.id, animals.name
ORDER BY visit_count DESC
LIMIT 1;
/*Who was Maisy Smith's first visit? */

SELECT animals.name AS animal, MIN(visits.date_of_visit) AS date_of_visit
FROM animals
LEFT JOIN visits ON animals.id = visits.animal_id
LEFT JOIN vets ON vets.id = visits.vet_id
WHERE vets.name = 'Maisy Smith'
GROUP BY animals.id, animals.name
ORDER BY date_of_visit ASC
LIMIT 1;
/*Details for most recent visit: animal information, vet information, and date of visit. */

SELECT animals.name AS animal, vets.name AS vet_name, visits.date_of_visit AS date_of_visit
FROM animals
LEFT JOIN visits ON animals.id = visits.animal_id
LEFT JOIN vets ON vets.id = visits.vet_id
WHERE animals.name = 'Devimon'
ORDER BY date_of_visit DESC
LIMIT 1;

/*How many visits were with a vet that did not specialize in that animal's species? */
SELECT COUNT(v.id) AS mismatched_specialization_visits
FROM visits v
JOIN vets vt ON v.vet_id = vt.id
JOIN animals a ON v.animal_id = a.id
LEFT JOIN specializations sp ON vt.id = sp.vet_id AND a.species_id = sp.species_id
WHERE sp.id IS NULL;
/* What specialty should Maisy Smith consider getting? Look for the species she gets the most.*/

SELECT species.name AS suggested_specialty, COUNT(*) AS visit_count
FROM visits
JOIN animals ON visits.animal_id = animals.id
JOIN vets ON visits.vet_id = vets.id
JOIN species ON animals.species_id = species.id
WHERE vets.name = 'Maisy Smith'
GROUP BY species.id, species.name
ORDER BY visit_count DESC
LIMIT 1;

-- Calculate the number of visits for the animal with ID 4 and provide query execution details.
EXPLAIN ANALYZE SELECT COUNT(*) FROM visits WHERE animal_id = 4;

-- Retrieve visit records associated with the vet having ID 2 and display query execution details.
EXPLAIN ANALYZE SELECT * FROM visits WHERE vet_id = 2;

-- Fetch owner records with the specified email address ('owner_18327@mail.com') and include query execution details.
EXPLAIN ANALYZE SELECT * FROM owners WHERE email = 'owner_18327@mail.com';

