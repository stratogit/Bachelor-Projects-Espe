--	Package File Template
--
--	Purpose: This package defines supplemental types, subtypes, 
--		 constants, and functions 


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

package animaciones_pkg is

  component animacion
   Port (  contani:  	in  STD_LOGIC_VECTOR (2 downto 0); 
				led2: 	out  std_logic_vector (7 downto 0);
				 selani: in Std_logic_vector(2 downto 0);
				 numani: out std_logic_vector(3 downto 0);
				 clkcon: in std_logic;	
				 enselan:in std_logic;
				 conani: out std_logic_vector(3 downto 0);
			  led: 	out std_logic_vector (7 downto 0) );-- se define una variable a elegir
	end component;		  
			  
end  animaciones_pkg;


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;

---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity animacion is

    Port ( 
           contani:  	in  STD_LOGIC_VECTOR (2 downto 0); 
			  selani: in Std_logic_vector(2 downto 0);
			  numani: out std_logic_vector(3 downto 0);
			  led2: 	out  std_logic_vector (7 downto 0);
			  clkcon: in std_logic;	
			  enselan:in std_logic;
			  conani: out std_logic_vector(3 downto 0);
			  led: 	out  std_logic_vector (7 downto 0) ); -- se define una variable a elegir
			  
			  
end animacion;

architecture Behavioral of animacion is
signal led3: std_logic_vector(7 downto 0);
signal selec:std_logic_vector(2 downto 0);
signal selec2:std_logic_vector(2 downto 0);
--signal clkcon1,clkcon:std_logic;
begin


selec  <=	selani when enselan='1' else
				selec2 when enselan='0';


seleccion: process(contani)
variable CON: STD_LOGIC_VECTOR (3 DOWNTO 0);
begin
	case selec is
		when "000" => ------------AANIMACION 1
				if contani="000" then
				led3 <= "00000001";
				elsif contani="001" then
					led3 <= "00000011";
					elsif contani="010" then
						led3 <= "00000111";
						elsif contani="011" then
							led3 <= "00001111";
							elsif contani="100" then
							led3 <= "00011111";
								elsif contani="101" then
								led3 <= "00111111";
									elsif contani="110" then
									led3 <= "01111111";
										elsif contani="111" then
										led3 <= "11111111";
									
										
									
				end if;
				
   			led<=led3;
				led2<=led3;
				numani<="0000";
						
		when "001" =>	------ ANIMACION 2
	--	clkcon<=not clkcon1;
			if contani="000" then
				led3 <= "10000000";
				elsif contani="001" then
					led3 <= "11000000";
					elsif contani="010" then
						led3 <= "11100000";
						elsif contani="011" then
							led3 <= "11110000";
							elsif contani="100" then
							led3 <= "11111000";
								elsif contani="101" then
								led3 <= "11111100";
									elsif contani="110" then
									led3 <= "11111110";
										elsif contani="111" then
										led3 <= "11111111";
								--		clkcon<=not clkcon;
									
										
									
				end if;
				
				led<=led3;
				led2<=led3;
				numani<="0001";
			
			
		when "010" =>	------ANIMACION 3
	--	clkcon<=not clkcon1;
			if contani="000" then
				led3 <= "00000001";
				elsif contani="001" then
					led3 <= "00000010";
					elsif contani="010" then
						led3 <= "00000100";
						elsif contani="011" then
							led3 <= "00001000";
							elsif contani="100" then
							led3 <= "00010000";
								elsif contani="101" then
								led3 <= "00100000";
									elsif contani="110" then
									led3 <= "01000000";
										elsif contani="111" then
										led3 <= "10000000";
							--			clkcon<=not clkcon;
									
										
				end if;
			
				led<=led3;
				led2<=led3;
				numani<="0010";
			
		when "011" =>	------ANIMACION 4
	--	clkcon<=not clkcon1;
			if contani="000" then
				led3 <= "10000001";
				elsif contani="001" then
					led3 <= "01000010";
					elsif contani="010" then
						led3 <= "00100100";
						elsif contani="011" then
							led3 <= "00011000";
							elsif contani="100" then
							led3 <= "00011000";
								elsif contani="101" then
								led3 <= "00100100";
									elsif contani="110" then
									led3 <= "01000010";
										elsif contani="111" then
										led3 <= "10000001";
							--			clkcon<=not clkcon;
										
				end if;
				led<=led3;
				led2<=led3;
				numani<="0011";
					
		when "100" =>	----ANIMACION 5
	--	clkcon<=not clkcon1;
			if contani="000" then
				led3 <= "00000001";
				elsif contani="001" then
					led3 <= "00000011";
					elsif contani="010" then
						led3 <= "00000111";
						elsif contani="011" then
							led3 <= "00001111";
							elsif contani="100" then
							led3 <= "00011111";
								elsif contani="101" then
								led3 <= "00111111";
									elsif contani="110" then
									led3 <= "01111111";
										elsif contani="111" then
										led3 <= "11111111";
							
										
				end if;
				
				led<=led3;
				led2<=not led3;
				numani<="0100";

		when "101" => -- WHEN OTHERS
		
			if contani="000" then
				led3 <= "00000001";
				elsif contani="001" then
					led3 <= "00001000";
					elsif contani="010" then
						led3 <= "00000010";
						elsif contani="011" then
							led3 <= "00010000";
							elsif contani="100" then
							led3 <= "00000100";
								elsif contani="101" then
								led3 <= "00100000";
									elsif contani="110" then
									led3 <= "00001000";
										elsif contani="111" then
										led3 <= "01000000";
						--				clkcon<=not clkcon;

										
										
				end if;
				
				led<=led3;
				led2<=led3;
				numani<="0101";
				
			when "110" => -- WHEN OTHERS
		
			if contani="000" then
				led3 <= "10000000";
				elsif contani="001" then
					led3 <= "01000000";
					elsif contani="010" then
						led3 <= "00100000";
						elsif contani="011" then
							led3 <= "00010000";
							elsif contani="100" then
							led3 <= "00001000";
								elsif contani="101" then
								led3 <= "00000100";
									elsif contani="110" then
									led3 <= "00000010";
										elsif contani="111" then
										led3 <= "00000001";
					
										
										
				end if;
				
				led<=led3;
				led2<=led3;
				numani<="0110";	
			
				
			when others => -- WHEN OTHERS
		
			if contani="000" then
				led3 <= "10100000";
				elsif contani="001" then
					led3 <= "01010000";
					elsif contani="010" then
						led3 <= "00101000";
						elsif contani="011" then
							led3 <= "00010100";
							elsif contani="100" then
							led3 <= "00001010";
								elsif contani="101" then
								led3 <= "00000101";
									elsif contani="110" then
									led3 <= "10000010";
										elsif contani="111" then
										led3 <= "01000001";
					
										
										
				end if;
				
				led<=led3;
				led2<=led3;
				numani<="0111";

	end case;

--clkcon<=not clkcon1;
--case contani is
--		when"111"=>
--		con:=con+1;
--		if con="0001" then
--			con:="0000";
--		end if;
		
--		conani<=con;
	--	when others =>
	--	con:=con;
--	end case;



--clkcon<=not clkcon1;	
end process;
				
  
--with contani select
--	led3 <= "00000001" when "000",


--			 "00000011" when "001",
--			 "00000111" when "010",
--			 "00001111" when "011",
	--		 "00011111" when "100",
	--		 "00111111" when "101",
	--		 "01111111" when "110",
	--		 "11111111" when "111",
	--		 "00000001" when others;
	--led2<=led3;
	--led<=led3;
	
contarefec: process(clkcon)		
variable c:std_logic_vector(3 downto 0);		
begin
		IF(CLKcon'EVENT AND CLKcon='1')  THEN
		c:=c+1;
	
		  if c="1010" then
			c:="0000";
			selec2<=selec2+1;
			if selec2="111"then
			selec2<="000";
			end if;
			
		--	clkcon<=not clkcon1;
		end if;
		--	conani<=c;
		end if;
	conani<=c;
end process;				
				
end Behavioral;