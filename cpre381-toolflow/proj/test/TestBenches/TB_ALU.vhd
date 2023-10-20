library IEEE;
use IEEE.std_logic_1164.all;

entity TB_ALU is
	generic(HalfCycle_CLK: time := 10 ns);
end TB_ALU;

architecture TB of TB_ALU is
	constant CLK_Cycle: time := HalfCycle_CLK*2;--20ns
	signal CLK: std_logic;
	constant N: INTEGER := 32;

    component ALU is
        port(
            ALU_Op: in STD_LOGIC_VECTOR(3 downto 0); --ALUop
            ShiftAmount : in std_logic_vector(4 downto 0);
            BitsA_In: in STD_LOGIC_VECTOR(31 downto 0); --rs
            BitsB_In: in STD_LOGIC_VECTOR(31 downto 0); --rt
            Bits_Out: out STD_LOGIC_VECTOR(31 downto 0);
            OverFlow_Flag: out STD_LOGIC;
            Zero_Flag: out STD_LOGIC;
            Carry_Flag: out STD_LOGIC);
    end component;

    signal s_ALU_Op: STD_LOGIC_VECTOR(3 downto 0); --ALUop
    signal s_ShiftAmount : std_logic_vector(4 downto 0) := "00000"; --shamt
    signal s_BitsA_In: STD_LOGIC_VECTOR(31 downto 0); --rs
    signal s_BitsB_In: STD_LOGIC_VECTOR(31 downto 0); --rt
    signal s_Bits_Out: STD_LOGIC_VECTOR(31 downto 0);
    signal s_OverFlow_Flag: STD_LOGIC;
    signal s_Zero_Flag: STD_LOGIC;
    signal s_Carry_Flag: STD_LOGIC;

begin
	Clock: process begin
		CLK <= '0';
		wait for HalfCycle_CLK;
		CLK <= '1';
		wait for HalfCycle_CLK;
	end process;

    DUT0: ALU
        port map(
            ALU_Op => s_ALU_Op,
            ShiftAmount => s_ShiftAmount,
            BitsA_In => s_BitsA_In,
            BitsB_In => s_BitsB_In,
            Bits_Out => s_Bits_Out,
            OverFlow_Flag => s_OverFlow_Flag,
            Zero_Flag => s_Zero_Flag,
            Carry_Flag => s_Carry_Flag
        );


	TEST_CASES: process begin
		wait for HalfCycle_CLK/2;


        --DOYLE MAKE SOME TEST CASES
        s_ALU_Op <= "0000";
        BitsA_In <= x"0000000F";
        BitsB_In <= x"000000F0";
		wait for CLK_Cycle;--20ns

        s_ALU_Op <= "0000";
        BitsA_In <= x"00000001";
        BitsB_In <= x"00000000";
		wait for CLK_Cycle;--20ns
        
        s_ALU_Op <= "0000";
        BitsA_In <= x"0000000F";
        BitsB_In <= x"000000F0";
		wait for CLK_Cycle;--20ns

        s_ALU_Op <= "0000";
        BitsA_In <= x"0000000F";
        BitsB_In <= x"000000F0";
		wait for CLK_Cycle;--20ns

        s_ALU_Op <= "0000";
        BitsA_In <= x"0000000F";
        BitsB_In <= x"000000F0";
		wait for CLK_Cycle;--20ns

        s_ALU_Op <= "0000";
        BitsA_In <= x"0000000F";
        BitsB_In <= x"000000F0";
		wait for CLK_Cycle;--20ns

        s_ALU_Op <= "0000";
        BitsA_In <= x"0000000F";
        BitsB_In <= x"000000F0";
		wait for CLK_Cycle;--20ns

        s_ALU_Op <= "0000";
        BitsA_In <= x"0000000F";
        BitsB_In <= x"000000F0";
		wait for CLK_Cycle;--20ns

        s_ALU_Op <= "0000";
        BitsA_In <= x"0000000F";
        BitsB_In <= x"000000F0";
		wait for CLK_Cycle;--20ns
	end process;
end TB;