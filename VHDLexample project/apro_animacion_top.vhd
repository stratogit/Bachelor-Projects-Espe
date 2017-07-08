----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date:    08:18:15 06/21/2011 
-- Design Name: 
-- Module Name:    cont_display_top - Behavioral 
-- Project Name: 
-- Target Devices: 
-- Tool versions: 
-- Description: 
--
-- Dependencies: 
--
-- Revision: 
-- Revision 0.01 - File Created
-- Additional Comments: 
--
----------------------------------------------------------------------------------
library IEEE;
library proy_animacion_lib;

use IEEE.STD_LOGIC_1164.ALL;
--use IEEE.STD_LOGIC_ARITH.ALL;
use IEEE.STD_LOGIC_UNSIGNED.ALL;
use  proy_animacion_lib.div_frec_pkg.all;
use  proy_animacion_lib.bcd_7seg_pkg.all;
use  proy_animacion_lib.cont_paquete_pkg.all;
use  proy_animacion_lib.animaciones_pkg.all;
use  proy_animacion_lib.mux2a1_pckg.all;
use  proy_animacion_lib.selector_pkg.all;
use proy_animacion_lib.mux_numani_pkg.all;


---- Uncomment the following library declaration if instantiating
---- any Xilinx primitives in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity apro_animacion_top is
    Port ( u_d,clk50,reset,enable : in  STD_LOGIC;
           salida : 	out   STD_LOGIC_VECTOR (6 downto 0);
			  displ:		out	STD_LOGIC_VECTOR (5 downto 0);
			  svel:		in 	std_logic_vector(1 downto 0);
			  sanima:	in 	std_logic_vector(2 downto 0);
			  led2,led:	out 	std_logic_vector(7 downto 0)
			);
end apro_animacion_top;

architecture structural of apro_animacion_top is
signal clk1m :std_logic;
signal clk60 :std_logic;
signal clkcon :std_logic;
signal conta :std_logic_vector(3 downto 0);
signal conta2 :std_logic_vector(3 downto 0);
signal en2 	:std_logic;
signal muxen1,muxen2,muxen3,muxen4,muxen5,muxen6:   STD_LOGIC_VECTOR (6 downto 0);
signal length1: integer ;
constant length2: integer := 8333 ;
SIGNAL selani: std_logic_vector(2 downto 0);
SIGNAL selani1: std_logic_vector(3 downto 0);
SIGNAL muesvel,letra1,letra2,letra3: std_logic_vector(3 downto 0);
signal numani,muxani:  std_logic_vector(3 downto 0);
signal conani:  std_logic_vector(3 downto 0);

begin
U0:seleccion
	port map(sanima	=>sanima,
				svel		=>svel,
				selani	=>selani,
				SELANI1 	=> selani1,
				enable 	=>enable,
				muesvel	=>muesvel,
				salvel	=>length1,
				letra1	=>letra1,
				u_d		=>u_d,
				salsel	=>en2,
				letra2	=>letra2,
				letra3	=>letra3
				);

U1:divisor
	--generic map(limit=>length1 )
	port map(limit=>length1,
				clk		=>	Clk50,
				clk2		=>	Clk1m);
U2:CONTADOR
	port map(clk_1m	=>	clk1m,	
				reset		=>	reset,
				enable	=>	en2,
			   clkcon	=>clkcon,
				q			=>	conta
				);
U3:animacion
	port map(contani	=>conta(2 downto 0),
				led 		=>led,
				SELANI 	=> selani,
				clkcon	=>clkcon,
				led2		=>led2,
				conani	=>conani,
				numani	=>numani,
				enselan	=>en2
				);
--U4:CONTADOR
--port map(clk_1m	=>	clkcon,	
	--		reset		=>	reset,
	--		enable	=>	en2,
		--	q			=>	conta2
		--	);
U5:muxan
port map(  	selec		=>en2,
				selani	=>numani,
				selani1	=>selani1,
				muxani	=>muxani
				);
			
		
U6:bcd_7segmen
	port map(a		=>	muesvel,
				seg	=>	muxen3
				);				
U7:bcd_7segmen
	port map(a		=>	muxani,
				seg	=>	muxen1
				);
U8:bcd_7segmen
	port map(a		=>	conani,
				seg	=>	muxen2
				);
U9:bcd_7segmen
	port map(a		=>	letra1,
				seg	=>	muxen4
				);
U10:bcd_7segmen
	port map(a		=>	letra2,
				seg	=>	muxen5
				);
U11:bcd_7segmen
	port map(a		=>	letra3,
				seg	=>	muxen6
				);



U12:divisor
	--generic map(limit=>length1 )
	port map(limit		=>length2,
				clk		=>	Clk50,
				clk2		=>	Clk60);
U13:muxhex
	port map(selec	=>clk60,
				muxen1	=>muxen1,
				muxen2	=>muxen2,
				muxen3	=>muxen3,
				muxen4	=>muxen4,
				muxen5	=>muxen5,
				muxen6	=>muxen6,
				displ    => displ,
				mux	  	=> salida);

				


end structural;