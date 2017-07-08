--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 


--DECLARACION DE PAQUETES
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

package mux_numani_pkg is

component muxan
    Port (selec: in std_logic;
			selani: in  STD_LOGIC_VECTOR (3 downto 0);
			 selani1 : in  STD_LOGIC_VECTOR (3 downto 0);
			 muxani : out std_logic_vector (3 downto 0)
			 );
end component;
 
end mux_numani_pkg;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity muxan is
    Port (selec: in std_logic;
			 selani: in  STD_LOGIC_VECTOR (3 downto 0);
			 selani1 : in  STD_LOGIC_VECTOR (3 downto 0);
			 muxani : out std_logic_vector (3 downto 0)
			 );
end muxan;

architecture Behavioral of muxan is



begin

with selec select
	muxani	<=  selani1 when '1',
					 selani	when others;


	
						
					
end Behavioral;