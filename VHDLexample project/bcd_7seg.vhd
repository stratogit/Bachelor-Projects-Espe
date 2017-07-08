--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

package bcd_7seg_pkg is
	component bcd_7segmen
	port(
	a: in std_logic_vector(3 downto 0); -- asignamos a como entrada
	seg: out std_logic_vector(6 downto 0)
	);
	end component;
  
end  bcd_7seg_pkg;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity bcd_7segmen is
	port(
	a: in std_logic_vector(3 downto 0); -- asignamos a como entrada
	seg: out std_logic_vector(6 downto 0)
	);


end bcd_7segmen;

architecture Behavioral of bcd_7segmen is
signal aux: std_logic_vector(6 downto 0);	-- seg como salida
begin
			with a select-- hacemos la comparacion de with select para cada cas0
		aux	<=	"1111110" when "0000",--0 
					"0110000" when "0001",--1
					"1101101" when "0010",--2
					"1111001" when "0011",--3
					"0110011" when "0100",--4
					"1011011" when "0101",--5
					"1011111" when "0110",--6
					"1110000" when "0111",--7
					"1111111" when "1000",--8
					"1111011" when "1001",--9
					"1001110" when "1010",--C
					"1001111"  when "1011",--E
					"1000111" when "1100",--F
					"0000110" when "1101",--I
					"0001001"	when "1110",--=
					"1011011"  when "1111",--s
					"0000000" when Others;--otros casos
	
		seg <= not aux;
	
end Behavioral;

