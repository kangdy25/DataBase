CREATE TABLE accounts(
	account_id BIGINT PRIMARY KEY GENERATED ALWAYS AS IDENTITY,
	account_holder VARCHAR(100) NOT NULL,
	balance DECIMAL(10, 2) NOT NULL	CHECK (balance >= 0)
);

DROP TABLE accounts 

INSERT INTO accounts (account_holder, balance) VALUES 
('Gun', 1000.00),
('Dongyoon', 2000.00);

SELECT * FROM accounts 

BEGIN; -- START TRANSACTION 

UPDATE 
	accounts 
SET balance = balance + 3000
WHERE account_holder = 'Gun';

SELECT * FROM accounts 

UPDATE 
	accounts 
SET balance = balance - 3000
WHERE account_holder = 'Dongyoon';

COMMIT;
