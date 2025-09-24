-- 1. List all dogs with their breed names
SELECT 
  dogs.name,
  breeds.name AS breed_name
FROM dogs
  JOIN breeds using (breed_id)

-- 2. Show all owners and their dogs (if they have any)
select
  owners.name,
  dogs.name AS dog_name
FROM owners 
  JOIN dogs using (owner_id)

-- 3. Display all breeds and the dogs of that breed (if any)
SELECT 
  breeds.name,
  dogs.name AS dog_name
FROM breeds
  JOIN dogs using (breed_id)
ORDER BY breeds.name

-- 4. List all dogs with their pet passport information and owner data (if avaliable)
SELECT
  d.name AS dog_name,
  pp.allergies,
  o.name AS owner_name
FROM dogs d
  JOIN pet_passports pp using (dog_id)
  RIGHT JOIN owners o using (owner_id)

-- 5. Show all tricks and the dogs that know them
SELECT
  tricks.name AS trick,
  dogs.name,
  dog_tricks.date_learned,
  dog_tricks.proficiency
FROM tricks
  JOIN dog_tricks using (trick_id)
  JOIN dogs using (dog_id)

-- 6. Display all dogs that don't know a single trick
SELECT 
  dogs.name,
  dog_tricks.dog_id
FROM dogs
  LEFT JOIN dog_tricks using (dog_id)
WHERE (dog_tricks.dog_id IS NULL)

-- 7. Show all breeds and the count of dogs for each breed
SELECT 
  breeds.name,
  count(*) AS dog_count
FROM breeds
  JOIN dogs using(breed_id)
GROUP BY breeds.name

-- 8. Display all owners with
-- the count of their dogs,
-- the average dog weight and the average dog age.
SELECT 
  owners.name,
  count(dogs.dog_id) AS count_dog,
  AVG(dogs.weight) AS avg_weight,
  AVG(TIMESTAMPDIFF(YEAR, dogs.date_of_birth, CURDATE())) AS avg_ages
FROM owners
  LEFT JOIN dogs using (owner_id)
GROUP BY owners.owner_id

-- 9. Show all tricks and the number
-- of dogs that know each trick
-- ordered by popularity
SELECT
  tricks.name AS tricks_name,
  count(*) AS popularity
FROM tricks
  JOIN dog_tricks using (trick_id)
GROUP BY tricks_name
ORDER BY popularity DESC
  
-- 10. Display all dogs along with
-- the count of tricks they know
SELECT 
  dogs.name AS dog_name,
  count(trick_id) AS known_tricks
FROM dogs
  JOIN dog_tricks using (dog_id)
  JOIN tricks using (trick_id)
GROUP BY dog_id
ORDER BY known_tricks DESC

-- 11. List all owner with their
-- dogs and the tricks their dogs know
SELECT 
  owners.name AS owner_name,
  dogs.name AS own_dogs,
  dog_tricks.proficiency,
  tricks.difficulty
FROM owners
  JOIN dogs using (owner_id)
  JOIN dog_tricks using (dog_id)
  JOIN tricks using (trick_id)
ORDER BY owner_name