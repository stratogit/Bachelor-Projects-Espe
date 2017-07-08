--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 


--DECLARACION DE PAQUETES
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

package selector_pkg is

component seleccion
   -- GENERIC (limit:integer:= 1999999);
	  Port (svel: in STD_LOGIC_VECTOR (1 downto 0);
			 sanima: in  STD_LOGIC_VECTOR (2 downto 0);
			 selani1 : out std_logic_vector (3 downto 0);
			 selani : out std_logic_vector (2 downto 0);
			  muesvel: out std_logic_vector (3 downto 0);
			   letra1,letra2,letra3:out std_logic_vector (3 downto 0);
				 ENABLE: IN STD_LOGIC;
				 u_d: IN STD_LOGIC;
				 salsel:out std_logic;
			 salvel: out integer);
end component;
 
end selector_pkg;

library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

entity seleccion is
    
	  Port (svel: in STD_LOGIC_VECTOR (1 downto 0);
			 sanima: in  STD_LOGIC_VECTOR (2 downto 0);
			 selani1 : out std_logic_vector (3 downto 0);
			 selani : out std_logic_vector (2 downto 0);
			 muesvel: out std_logic_vector (3 downto 0);
			 letra1,letra2,letra3:out std_logic_vector (3 downto 0);
			 salsel:out std_logic;
			 ENABLE: IN STD_LOGIC;
		    u_d: IN STD_LOGIC;
			 salvel: out integer);
end seleccion;

architecture Behavioral of seleccion is
signal selani2 : std_logic_vector (3 downto 0);

signal limit:integer;
begin
limit<=200000;
	with svel select
		salvel 	<=  	limit*4 	when "00",
							limit*2 	when "01",
							limit 	when "10",
							limit		when others;
							
		with svel select
		muesvel	<=  	"0001" 	when "00",
							"0010" 	when "01",
							"0011"	when "10",
							"0011" 	when others;
		
		
		with enable select
		letra1	 <=	"1010" when '0',
							"1101" when others;
		
		with enable select
		letra2	 <=	"1011" when '0',
							"1011" when others;
		
		with enable select
		letra3	 <=	"1100" when '0',
							"1110" when others;
							
		
		selani1	 <=	"0"+sanima when enable='0' else
							"0"+sanima when enable='1' ;
		
			
		selani		<=		sanima when u_d='0' else
							   sanima when u_d='1';
		
		
		
	--	with selani2 select
	--	letra1	 <=	"1101" when "0000",
	--						"1010" when others;
		
	--	with selani2 select
	--	letra2	 <=	"1011" when "0000",
	--						"1111" when others;
		
	--	with selani2 select
	--	letra3	 <=	"1110"  when "0000",
	--						"1111" when others;		
	--
		salsel<=u_d;
		
	
	
		 	
		
							
		
		  
	
					
					
end Behavioral;