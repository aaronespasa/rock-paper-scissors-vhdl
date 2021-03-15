---------------------------------
--ELECTR�NICA DIGITAL
--PR�CTICA 1
---------------------------------

--------------------------------
--Librer�as
-------------------------------
LIBRARY ieee;
USE ieee.std_logic_1164.all;

--------------------------------
--Entidad
-------------------------------
ENTITY RPS IS
        PORT (
				t1: IN      	STD_LOGIC;
				r1: IN      	STD_LOGIC;
				p1: IN			STD_LOGIC;
				t2: IN			STD_LOGIC;
				r2: IN			STD_LOGIC;
				p2: IN			STD_LOGIC;			
				g1: OUT  		STD_LOGIC;
				g2: OUT  		STD_LOGIC
        );
END RPS;

--------------------------------
--Arquitectura 
-------------------------------
ARCHITECTURE BEH OF RPS IS
--Se�ales 
SIGNAL x1, x2, x3, x4: STD_LOGIC;

BEGIN

-- Encoder 1
Encoder1: PROCESS (t1, r1, p1)
	BEGIN
		-- t1 cases
		CASE t1 IS
			WHEN "0" => 	x1 <= '';
			WHEN "1" => 	x2 <= '';
		END CASE;
		
		-- r1 cases
		CASE r1 IS
			WHEN "0" => 	x1 <= '';
			WHEN "1" => 	x2 <= '';
		END CASE;
			
		-- p1 cases
		CASE p1 IS
			WHEN "0" => 	x1 <= '';
			WHEN "1" => 	x2 <= '';
		END CASE;
	END PROCESS;

-- Encoder 2
Encoder2: PROCESS (t2, r2, p2)
	BEGIN
		-- t2 cases
		CASE t2 IS
			WHEN "0" => 	x3 <= '';
			WHEN "1" => 	x4 <= '';
		END CASE;
		
		-- r2 cases
		CASE r2 IS
			WHEN "0" => 	x3 <= '';
			WHEN "1" => 	x4 <= '';
		END CASE;
			
		-- p2 cases
		CASE p2 IS
			WHEN "0" => 	x3 <= '';
			WHEN "1" => 	x4 <= '';
		END CASE;
	END PROCESS;

END BEH;
