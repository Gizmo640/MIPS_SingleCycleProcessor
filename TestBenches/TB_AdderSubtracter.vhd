library IEEE;
use IEEE.std_logic_1164.all;

entity TB_AdderSubtracter is
	generic(HalfCycle_CLK: TIME := 10 ns);
end TB_AdderSubtracter;

architecture TB of TB_AdderSubtracter is
	constant CLK_Cycle: TIME := HalfCycle_CLK*2;--20ns
	signal CLK: std_logic;


	constant N: INTEGER := 3;
	component NBit_AdderSubtracter is
		generic(N: INTEGER);
		port(
			AddSubtract_Signal: in STD_LOGIC;
			Carry_Out: out STD_LOGIC;
			BitsA_In: in STD_LOGIC_VECTOR(N-1 downto 0);
			BitsB_In: in STD_LOGIC_VECTOR(N-1 downto 0);
			Bits_Out: out STD_LOGIC_VECTOR(N-1 downto 0);
			OverFlow_Flag: out STD_LOGIC;
			Zero_Flag: out STD_LOGIC);
	end component;

	signal AddSubtract_Signal, Carry_Out, OverFlow_Flag, Zero_Flag: STD_LOGIC;
	signal BitsA_In, BitsB_In, Bits_Out: std_logic_vector(N-1 downto 0);
begin
	Clock: process begin
		CLK <= '0';
		wait for HalfCycle_CLK;
		CLK <= '1';
		wait for HalfCycle_CLK;
	end process;

	AdderSubtracter: NBit_AdderSubtracter
		generic map (N)
		port map(
			AddSubtract_Signal,
			Carry_Out,
			BitsA_In,
			BitsB_In,
			Bits_Out,
			OverFlow_Flag,
			Zero_Flag);

	TEST_CASES: process begin
		AddSubtract_Signal <= '0';
		BitsA_In <= "000";
		BitsB_In <= "000";
		wait for CLK_Cycle;

		AddSubtract_Signal <= '1';
		BitsA_In <= "000";
		BitsB_In <= "000";
		wait for CLK_Cycle;

		AddSubtract_Signal <= '0';
		BitsA_In <= "001";
		BitsB_In <= "010";
		wait for CLK_Cycle;

		AddSubtract_Signal <= '0';
		BitsA_In <= "010";
		BitsB_In <= "001";
		wait for CLK_Cycle;

		AddSubtract_Signal <= '0';
		BitsA_In <= "10";
		BitsB_In <= "01";
		wait for CLK_Cycle;

	end process;
end TB;
