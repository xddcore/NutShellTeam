-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.1 (64-bit)
-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity process_element_mul_5ns_6ns_10_3_1_Mul_DSP_0 is
port (
    clk: in std_logic;
    ce: in std_logic;
    a: in std_logic_vector(5 - 1 downto 0);
    b: in std_logic_vector(6 - 1 downto 0);
    p: out std_logic_vector(10 - 1 downto 0));

    attribute use_dsp : string;
    attribute use_dsp of process_element_mul_5ns_6ns_10_3_1_Mul_DSP_0 : entity is "yes";

end entity;

architecture behav of process_element_mul_5ns_6ns_10_3_1_Mul_DSP_0 is
    signal tmp_product : std_logic_vector(10 - 1 downto 0);
    signal a_i : std_logic_vector(5 - 1 downto 0);
    signal b_i : std_logic_vector(6 - 1 downto 0);
    signal p_tmp : std_logic_vector(10 - 1 downto 0);
    signal a_reg0 : std_logic_vector(5 - 1 downto 0);
    signal b_reg0 : std_logic_vector(6 - 1 downto 0);

    signal buff0 : std_logic_vector(10 - 1 downto 0);
begin
    a_i <= a;
    b_i <= b;
    p <= p_tmp;

    p_tmp <= buff0;
    tmp_product <= std_logic_vector(resize(unsigned(a_reg0) * unsigned(b_reg0), 10));

    process(clk)
    begin
        if (clk'event and clk = '1') then
            if (ce = '1') then
                a_reg0 <= a_i;
                b_reg0 <= b_i;
                buff0 <= tmp_product;
            end if;
        end if;
    end process;
end architecture;
Library IEEE;
use IEEE.std_logic_1164.all;

entity process_element_mul_5ns_6ns_10_3_1 is
    generic (
        ID : INTEGER;
        NUM_STAGE : INTEGER;
        din0_WIDTH : INTEGER;
        din1_WIDTH : INTEGER;
        dout_WIDTH : INTEGER);
    port (
        clk : IN STD_LOGIC;
        reset : IN STD_LOGIC;
        ce : IN STD_LOGIC;
        din0 : IN STD_LOGIC_VECTOR(din0_WIDTH - 1 DOWNTO 0);
        din1 : IN STD_LOGIC_VECTOR(din1_WIDTH - 1 DOWNTO 0);
        dout : OUT STD_LOGIC_VECTOR(dout_WIDTH - 1 DOWNTO 0));
end entity;

architecture arch of process_element_mul_5ns_6ns_10_3_1 is
    component process_element_mul_5ns_6ns_10_3_1_Mul_DSP_0 is
        port (
            clk : IN STD_LOGIC;
            ce : IN STD_LOGIC;
            a : IN STD_LOGIC_VECTOR;
            b : IN STD_LOGIC_VECTOR;
            p : OUT STD_LOGIC_VECTOR);
    end component;



begin
    process_element_mul_5ns_6ns_10_3_1_Mul_DSP_0_U :  component process_element_mul_5ns_6ns_10_3_1_Mul_DSP_0
    port map (
        clk => clk,
        ce => ce,
        a => din0,
        b => din1,
        p => dout);

end architecture;


