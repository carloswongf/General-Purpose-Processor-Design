LIBRARY ieee;
USE ieee.std_logic_1164.all;

ENTITY latch2 IS
	PORT (A					:	IN STD_LOGIC_VECTOR(7 DOWNTO 0);
			Resetm,CLock 	: 	IN STD_LOGIC;
			Q					: OUT STD_LOGIC_VECTOR(7 DOWNTO 0));
			
END latch2;

ARCHITECTURE Behavior OF latch1 Is
BEGIN 
	PROCESS (Resetn, Clock)
	BEGIN
		IF Resetm = '0' THEM
			Q <= "00000000";
		ELSIF Clock'EVENT AND Clock = '1' THEN
			Q <= A;
		END IF;
	END PROCESS;
END Behavior;

		
			
