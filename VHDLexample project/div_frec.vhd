--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

package div_frec_pkg is

  component divisor 
  --GENERIC (limit:integer);
		--Definimos la constante para la division de frecuencia
		Port (limit: in integer; 
				CLK : in  STD_LOGIC;-- Definimos el reloj
				CLK2: out  STD_LOGIC-- definimos la salida del divisor
			);
	end component;
  
  

end div_frec_pkg;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;


entity divisor is
--generic(limit:integer);--Definimos la constante para la division de frecuencia
    Port ( 
				limit: in integer; 
			 CLK : in  STD_LOGIC;-- Definimos el reloj
			  CLK2: out  STD_LOGIC-- definimos la salida del divisor
			  );
end divisor;

architecture Behavioral of divisor is
SIGNAL RELOJ_1m: STD_LOGIC ;-- creamos una señal que le vamos a usar internamente
-- creamos una variable que vamos a utilizar dentro del proceso
begin
Divisor:PROCESS (CLK)--creamos el proceso
VARIABLE CO: INTEGER ;
BEGIN
	IF(CLK'EVENT AND CLK='1') THEN -- si existe cambio de flanco 
		CO:=CO+1; -- contamos en la variable c
		IF(CO=LIMIT) THEN -- si el contador llega al limite
			CO:=0;-- le renicializamos al contador
			RELOJ_1m<=NOT RELOJ_1m;-- le negamos a la señal reloj
			CLK2<=RELOJ_1m;
		END IF;
	END IF;
	--sa<=RELOJ_1m;-- la señal del divisor sale con el valor de reloj 1m
END PROCESS Divisor;

end Behavioral;


