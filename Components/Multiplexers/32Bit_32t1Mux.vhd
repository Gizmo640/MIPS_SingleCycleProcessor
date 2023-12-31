library IEEE;
use IEEE.std_logic_1164.all;


library IEEE;
use IEEE.std_logic_1164.all;
use work.MIPS_types.all;

entity Bit32_32t1Mux is
	port(
			Select_Signal: in STD_LOGIC_VECTOR(4 downto 0);
			Input_In: in STD_LOGIC_ARRAY(0 to 31);
			Output_Out: out STD_LOGIC_VECTOR(31 downto 0));
end Bit32_32t1Mux;

architecture Design of Bit32_32t1Mux is

begin
		Output_Out <=
			Input_In(0) when (Select_Signal = "00000") else
			Input_In(1) when (Select_Signal = "00001") else
			Input_In(2) when (Select_Signal = "00010") else
			Input_In(3) when (Select_Signal = "00011") else
			Input_In(4) when (Select_Signal = "00100") else
			Input_In(5) when (Select_Signal = "00101") else
			Input_In(6) when (Select_Signal = "00110") else
			Input_In(7) when (Select_Signal = "00111") else
			Input_In(8) when (Select_Signal = "01000") else
			Input_In(9) when (Select_Signal = "01001") else
			Input_In(10) when (Select_Signal = "01010") else
			Input_In(11) when (Select_Signal = "01011") else
			Input_In(12) when (Select_Signal = "01100") else
			Input_In(13) when (Select_Signal = "01101") else
			Input_In(14) when (Select_Signal = "01110") else
			Input_In(15) when (Select_Signal = "01111") else
			Input_In(16) when (Select_Signal = "10000") else
			Input_In(17) when (Select_Signal = "10001") else
			Input_In(18) when (Select_Signal = "10010") else
			Input_In(19) when (Select_Signal = "10011") else
			Input_In(20) when (Select_Signal = "10100") else
			Input_In(21) when (Select_Signal = "10101") else
			Input_In(22) when (Select_Signal = "10110") else
			Input_In(23) when (Select_Signal = "10111") else
			Input_In(24) when (Select_Signal = "11000") else
			Input_In(25) when (Select_Signal = "11001") else
			Input_In(26) when (Select_Signal = "11010") else
			Input_In(27) when (Select_Signal = "11011") else
			Input_In(28) when (Select_Signal = "11100") else
			Input_In(29) when (Select_Signal = "11101") else
			Input_In(30) when (Select_Signal = "11110") else
			Input_In(31) when (Select_Signal = "11111") else
			(31 downto 0 => '0');
end Design;