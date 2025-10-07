-- Procedure
CREATE PROCEDURE set_zero_revenue() AS 
$$
	UPDATE movies SET revenue = NULL WHERE revenue = 0;
$$
LANGUAGE SQL;

CALL set_zero_revenue();

-- Procedure with return value
CREATE PROCEDURE hello_world_p(IN name TEXT, OUT greeting TEXT) AS
$$
	BEGIN
		greeting = 'Hello ' || name;
	END
$$
LANGUAGE plpgsql;

CALL hello_world_p('dongyoon', NULL)

-- PL/pgSQL
CREATE PROCEDURE hello_world_i(IN name TEXT, IN lang TEXT, OUT greeting TEXT) AS
$$
DECLARE 
	spanish_hello TEXT := 'hola';	
	italian_hello TEXT := 'ciao';	
	korean_hello TEXT := '안냥';
BEGIN 
	IF lang = 'korean' THEN
		greeting := korean_hello || ' ' || name || '!!';
	ELSIF lang = 'italian' THEN
		greeting := italian_hello || ' ' || name || '!!';
	ELSIF lang = 'spanish' THEN
		greeting := spanish_hello || ' ' || name || '!!';
	ELSE
		greeting := 'hello ' || name || '!!';
	END IF;
END;
$$
LANGUAGE plpgsql;
 
CALL hello_world_i('Dongyoon', 'japanese', NULL)

-- Lock
BEGIN;
	SELECT 
		balance 
	FROM accounts a 
	WHERE account_holder = 'Dongyoon';
	FOR UPDATE 
	-- FOR SHARE 
COMMIT;