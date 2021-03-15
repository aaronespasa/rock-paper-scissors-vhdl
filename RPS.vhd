---------------------------------
--ELECTRÓNICA DIGITAL
--PRÁCTICA 1
---------------------------------

--------------------------------
--Librerías
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
--Señales 
SIGNAL x1, x2, x3, x4: STD_LOGIC;

BEGIN

-- Encoder 1
Encoder1: PROCESS (t1, r1, p1)
	BEGIN
		IF p1 = '0' AND r1 = '0' AND t1 = '0' THEN
			x1 <= '0';
			x2 <= '0';
		ELSIF p1 = '0' AND r1 = '0' AND t1 = '1' THEN
			x1 <= '1';
			x2 <= '1';
		ELSIF p1 = '0' and r1 = '1' and t1 = '0' THEN
			x1 <= '1';
			x2 <= '0';
		ELSIF p1 = '0' AND r1 = '1' AND t1 = '1' THEN
			x1 <= '0';
			x2 <= '0';
		ELSIF p1 = '1' AND r1 = '0' AND t1 = '0' THEN
			x1 <= '0';
			x2 <= '1';
		ELSIF p1 = '1' AND r1 = '0' AND t1 = '1' THEN
			x1 <= '0';
			x2 <= '0';
		ELSIF p1 = '1' AND r1 = '1' AND t1 = '0' THEN
			x1 <= '0';
			x2 <= '0';
		ELSIF p1 = '1' AND r1 = '1' AND t1 = '1' THEN
			x1 <= '0';
			x2 <= '0';
		END IF;
	END PROCESS;

-- Encoder 2
Encoder2: PROCESS (t2, r2, p2)
	BEGIN
		IF p2 = '0' AND r2 = '0' AND t2 = '0' THEN
			x3 <= '0';
			x4 <= '0';
		ELSIF p2 = '0' AND r2 = '0' AND t2 = '1' THEN
			x3 <= '1';
			x4 <= '1';
		ELSIF p2 = '0' and r2 = '1' and t2 = '0' THEN
			x3 <= '1';
			x4 <= '0';
		ELSIF p2 = '0' AND r2 = '1' AND t2 = '1' THEN
			x3 <= '0';
			x4 <= '0';
		ELSIF p2 = '1' AND r2 = '0' AND t2 = '0' THEN
			x3 <= '0';
			x4 <= '1';
		ELSIF p2 = '1' AND r2 = '0' AND t2 = '1' THEN
			x3 <= '0';
			x4 <= '0';
		ELSIF p2 = '1' AND r2 = '1' AND t2 = '0' THEN
			x3 <= '0';
			x4 <= '0';
		ELSE
			x3 <= '0';
			x4 <= '0';
		END IF;
	END PROCESS;

OutcomeLogic: PROCESS (x1, x2, x3, x4)
	BEGIN

		IF x1 = '0' AND x2 = '0' AND x3 = '0' AND x4 = '0' THEN
			-- None of the players play
			g1 <= '0';
			g2 <= '0';
		ELSIF x1 = '0' AND x2 = '0' AND x3 = '0' AND x4 = '1' THEN
			-- Player 1 doesn't play -> Player 2 wins
			g1 <= '0';
			g2 <= '1';
		ELSIF x1 = '0' AND x2 = '0' AND x3 = '1' AND x4 = '0' THEN
			-- Player 1 doesn't play -> Player 2 wins
			g1 <= '0';
			g2 <= '1';
		ELSIF x1 = '0' AND x2 = '0' AND x3 = '1' AND x4 = '1' THEN
			-- Player 1 doesn't play -> Player 2 wins
			g1 <= '0';
			g2 <= '1';	
		ELSIF x1 = '0' AND x2 = '1' AND x3 = '0' AND x4 = '0' THEN
			-- Player 2 doesn't play -> Player 1 wins
			g1 <= '1';
			g2 <= '0';
		ELSIF x1 = '0' AND x2 = '1' AND x3 = '0' AND x4 = '1' THEN
			-- Paper vs Paper -> Tied
			g1 <= '1';
			g2 <= '1';
		ELSIF x1 = '0' AND x2 = '1' AND x3 = '1' AND x4 = '0' THEN
			-- Paper vs Rock -> Player 1 wins
			g1 <= '1';
			g2 <= '0';
		ELSIF x1 = '0' AND x2 = '1' AND x3 = '1' AND x4 = '1' THEN
			-- Paper vs Scissors -> Player 2 wins
			g1 <= '0';
			g2 <= '1';
		ELSIF x1 = '1' AND x2 = '0' AND x3 = '0' AND x4 = '0' THEN
			-- Player 2 doesn't play -> Player 1 wins
			g1 <= '1';
			g2 <= '0';
		ELSIF x1 = '1' AND x2 = '0' AND x3 = '0' AND x4 = '1' THEN
			-- Rock vs Paper -> Player 2 wins
			g1 <= '0';
			g2 <= '1';
		ELSIF x1 = '1' AND x2 = '0' AND x3 = '1' AND x4 = '0' THEN
			--	Rock vs Rock -> Tie (both win)
			g1 <= '1';
			g2 <= '1';
		ELSIF x1 = '1' AND x2 = '0' AND x3 = '1' AND x4 = '1' THEN
			-- Rock vs Scissors -> Player 1 wins
			g1 <= '1';
			g2 <= '0';
		ELSIF x1 = '1' AND x2 = '1' AND x3 = '0' AND x4 = '0' THEN
			-- Player 2 doesn´t play -> Player 1 wins	
			g1 <= '1';
			g2 <= '0';
		ELSIF x1 = '1' AND x2 = '1' AND x3 = '0' AND x4 = '1' THEN
			-- Scissors vs Paper -> Player 1 wins
			g1 <= '1';
			g2 <= '0';
		ELSIF x1 = '1' AND x2 = '1' AND x3 = '1' AND x4 = '0' THEN
			-- Scissors vs Rock -> Player 2 wins
			g1 <= '0';
			g2 <= '1';
		ELSE
			-- Scissors vs Scissors -> Tied
			g1 <= '1';
			g2 <= '1';
		END IF;
	END PROCESS;

END BEH;
