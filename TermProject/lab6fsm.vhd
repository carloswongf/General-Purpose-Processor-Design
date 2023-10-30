library ieee;
use ieee.std_logic_1164.all;
entity lab6fsm is
    port(    clk                : in std_logic;
            data_in            : in std_logic;
            reset                : in std_logic;
            student_id        : out std_logic_vector(3 downto 0);
            current_state     : out std_logic_vector(3 downto 0));
end lab6fsm;
architecture fsm of lab6fsm is
-- build an enumerated type with 9 states for the state machine 
--(9 states for parsing 9 digits of student id) 
type state_type is (s0, s1, s2, s3, s4, s5, s6, s7, s8);
-- register to hold the current state
signal yfsm : state_type;
begin
    process (clk, reset)
    begin
        IF    reset = '1' THEN
            yfsm <= s0;
        elsif (clk'EVENT AND CLK = '1') THEN
            CASE yfsm IS
            when s0=>
                IF (data_in = '0') then
                    yfsm <= s0;
                ELSE 
                    yfsm <= s1;
                END IF;
            when s1=>
                IF (data_in = '0') THEN
                    yfsm <= s1;
                ELSE 
                    yfsm <= s2;
                END IF;
            when s2=>
                IF (data_in ='0') THEN
                    yfsm <= s2;
                ELSE 
                    yfsm <= s3;
                END IF;
            when s3=>
                IF (data_in = '0') THEN
                    yfsm <= s3;
                ELSE
                    yfsm <= s4;
                END IF;
            when s4=>
                IF (data_in = '0') THEN
                    yfsm <= s4;
                ELSE 
                    yfsm <= s5;
                END IF;
            when s5=>
                IF (data_in ='0') THEN
                    yfsm <= s5;
                ELSE 
                    yfsm <= s6;
                END IF;
            when s6=>
                IF (data_in ='0') THEN
                    yfsm <= s6;
                ELSE 
                    yfsm <= s7;
                END IF;
            when s7=>
                IF (data_in ='0') THEN
                    yfsm <= s7;
                ELSE 
                    yfsm <= s8;
               END IF;
            when s8=>
                IF (data_in ='0') THEN
                    yfsm <= s8;
                ELSE 
                    yfsm <= s0;
                END IF;
            END CASE;
        END IF;
    END process;
    -- implement the moore or mealy logic here
    process (yfsm) -- data_in if reqd only
    begin 
        case yfsm is
            when s0=>
                student_id <= "0101";
            when s1=>
                student_id <= "0000";
            when s2=>
                student_id <= "0001";
            when s3=>
                student_id <= "0001";
            when s4=>
                student_id <= "0001";
            when s5=>
                student_id <= "0101";
            when s6=>
                student_id <= "0011";
            when s7=>
                student_id <= "0101";
            when s8=>
                student_id <= "0010";
        END CASE; 
   END process;

	process (yfsm, data_in)
		begin
			case yfsm is
				when s0 =>
					if data_in = '1' then
						current_state <= "0000";
					else
						current_state <= "0101";
					end if;
				
				when s1 =>
					if data_in = '1' then
						current_state <= "0000";
					else
						current_state <= "0000";
					end if;
					
				when s2 =>
					if data_in = '1' then
						current_state <= "0001";
					else
						current_state <= "0000";
					end if;
					
				when s3 =>
					if data_in = '1' then
						current_state <= "0001";
					else
						current_state <= "0001";
					end if;
					
				when s4 =>
					if data_in = '1' then
						current_state <= "0001";
					else
						current_state <= "0001";
					end if;
					
				when s5 =>
					if data_in = '1' then
						current_state <= "0101";
					else
						current_state <= "0001";
					end if;
					
				when s6 =>
					if data_in = '1' then
						current_state <= "0011";
					else
						current_state <= "0101";
					end if;
					
				when s7 =>
					if data_in = '1' then
						current_state <= "0101";
					else
						current_state <= "0011";
					end if;
				
				when s8 =>
					if data_in = '1' then
						current_state <= "0010";
					else
						current_state <= "0101";
					end if;
				
			end case;
	end process;
    END fsm;
