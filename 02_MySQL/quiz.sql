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
