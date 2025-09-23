-- CROSS JOIN 
SELECT * FROM dogs CROSS JOIN owners;

-- INNER JOIN 
SELECT 
  dogs.name as dog_name,
  owners.name as owner_name,
  breeds.name as breed_name
FROM dogs 
  INNER JOIN owners ON dogs.owner_id = owners.owner_id
  -- INNER JOIN with USING
  INNER JOIN breeds USING (breed_id)

-- OUTER JOIN 

-- LEFT OUTER JOIN, RIGHT OUTER JOIN
SELECT 
  dogs.name as dog_name,
  owners.name as owner_name
FROM dogs 
  LEFT OUTER JOIN owners ON dogs.owner_id = owners.owner_id  
  RIGHT OUTER JOIN owners ON dogs.owner_id = owners.owner_id