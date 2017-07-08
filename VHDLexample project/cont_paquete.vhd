--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

package cont_paquete_pkg is

  component CONTADOR
   Port ( RESET : in  STD_LOGIC; -- se define un reset
  			  Q : out  STD_LOGIC_VECTOR (3 downto 0); --se define una salida
			  ENABLE: IN STD_LOGIC;
				cLK_1M: IN std_logic;
				clkcon: out std_logic
			  ); -- se define una variable a elegir
	end component;		  
			  
end  cont_paquete_pkg;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity CONTADOR is

    Port ( RESET : in  STD_LOGIC; -- se define un reset
           Q : out  STD_LOGIC_VECTOR (3 downto 0); 
			  cLK_1M: IN std_logic;
			clkcon: out std_logic;
			  ENABLE: IN STD_LOGIC--se define una salida
			  ); -- se define una variable a elegir
			  
			  
end CONTADOR;

architecture Behavioral of CONTADOR is
signal clkcon1: std_logic;

begin


CONTAD:PROCESS (cLK_1M,RESET) -- el proceso de contador
variable CON: STD_LOGIC_VECTOR (3 DOWNTO 0);
BEGIN	
	iF(RESET='1')THEN-- si se activa reset
		CON:="0000"; -- reseteamos la cuenta
		Q<=CON;-- enviamos a la salida
		elsif(cLK_1M'EVENT AND cLK_1M='1')THEN-- con la señal del divisor
				CON:=CON+1;-- empezamos el conteo ascendente con 0
				Q<=CON;
				if con="0001" then
				clkcon1<=not clkcon1;
				clkcon<=clkcon1;
				elsif con="1000" then
					con:="0000";
				end if;
				
	end if;
END PROCESS CONTAD;




end Behavioral;