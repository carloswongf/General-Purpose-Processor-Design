LIBRARY ieee ;
USE ieee.std_logic_1164.all ;

ENTITY decoder IS
	PORT (w  : IN  STD_LOGIC_VECTOR(3 DOWNTO 0) ;
			En : IN  STD_LOGIC ;
			Y:  OUT STD_LOGIC_VECTOR(0 TO 15))  ;
		
END decoder ;

ARCHITECTURE Behavior OF decoder IS
		SIGNAL Enw  :   STD_LOGIC_VECTOR(4 DOWNTO 0);
BEGIN
	Enw <= En&w;
	WITH Enw SELECT
	Y <=    "0000000000000001" WHEN "10000", 
           "0000000000000010" WHEN "10001", 
           "0000000000000100" WHEN "10010", 
           "0000000000001000" WHEN "10011",
           "0000000000010000" WHEN "10100", 
           "0000000000100000" WHEN "10101", 
           "0000000001000000" WHEN "10110", 
           "0000000010000000" WHEN "10111",
           "0000000100000000" WHEN "11000",	  
           "0000000000000000" WHEN OTHERS;
			
		
END Behavior ;