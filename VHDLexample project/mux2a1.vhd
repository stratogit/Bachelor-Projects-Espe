--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 


--DECLARACION DE PAQUETES
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

package mux2a1_pckg is

component muxhex
    Port (selec: in std_logic;
			 muxen1,muxen2,muxen3,muxen4,muxen5,muxen6: in  STD_LOGIC_VECTOR (6 downto 0);
			 mux : out std_logic_vector (6 downto 0);
			 displ : out std_logic_vector (5 downto 0));
end component;
 
end mux2a1_pckg;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity muxhex is
    Port (selec: in std_logic;
			 muxen1,muxen2,muxen3,muxen4,muxen5,muxen6 : in  STD_LOGIC_VECTOR (6 downto 0);
			 mux : out std_logic_vector (6 downto 0);
			 displ : out std_logic_vector (5 downto 0));
end muxhex;

architecture Behavioral of muxhex is

begin

process(selec)
variable c:integer;
begin
	IF(selec'EVENT AND selec='1') THEN 
		c:=c+1;
		if c=1 then
			mux<=muxen1;
			displ<="111110";
			elsif c=2 then
				mux<=muxen2;
				displ<="111101";
				elsif c=3 then
				mux<=muxen3;
				displ<="111011";
					elsif c=4 then
					mux<=muxen6;
					displ<="110111";
						elsif c=5 then
						mux<=muxen5;
						displ<="101111";
							elsif c=6 then
							mux<=muxen4;
							displ<="011111";
							c:=0;
			end if;
	
	end if;



end process;
	
						
					
end Behavioral;