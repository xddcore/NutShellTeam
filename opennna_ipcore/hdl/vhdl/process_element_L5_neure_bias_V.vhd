-- ==============================================================
-- Vitis HLS - High-Level Synthesis from C, C++ and OpenCL v2020.1 (64-bit)
-- Copyright 1986-2020 Xilinx, Inc. All Rights Reserved.
-- ==============================================================
library ieee; 
use ieee.std_logic_1164.all; 
use ieee.std_logic_unsigned.all;

entity process_element_L5_neure_bias_V_rom is 
    generic(
             DWIDTH     : integer := 4; 
             AWIDTH     : integer := 6; 
             MEM_SIZE    : integer := 64
    ); 
    port (
          addr0      : in std_logic_vector(AWIDTH-1 downto 0); 
          ce0       : in std_logic; 
          q0         : out std_logic_vector(DWIDTH-1 downto 0);
          clk       : in std_logic
    ); 
end entity; 


architecture rtl of process_element_L5_neure_bias_V_rom is 

signal addr0_tmp : std_logic_vector(AWIDTH-1 downto 0); 
type mem_array is array (0 to MEM_SIZE-1) of std_logic_vector (DWIDTH-1 downto 0); 
signal mem : mem_array := (
    0 to 1=> "0000", 2 => "0010", 3 to 6=> "0000", 7 => "1110", 8 => "0100", 
    9 => "0001", 10 => "0000", 11 => "0001", 12 => "0010", 13 => "1111", 
    14 => "0011", 15 => "0001", 16 => "0000", 17 => "0010", 18 => "0001", 
    19 => "0100", 20 => "0101", 21 => "0001", 22 to 23=> "0000", 24 => "0001", 
    25 => "1110", 26 to 27=> "0001", 28 to 30=> "0000", 31 => "0010", 32 => "1111", 
    33 => "0000", 34 to 35=> "0001", 36 => "1101", 37 to 39=> "0010", 40 => "1111", 
    41 => "0000", 42 => "1110", 43 => "0010", 44 => "1110", 45 => "0010", 
    46 => "0000", 47 to 48=> "0100", 49 => "1110", 50 => "0011", 51 => "1111", 
    52 => "0000", 53 => "1111", 54 => "0000", 55 => "0001", 56 => "0100", 
    57 => "0010", 58 => "0000", 59 => "0011", 60 => "0000", 61 => "0010", 
    62 => "0110", 63 => "0000" );

attribute syn_rom_style : string;
attribute syn_rom_style of mem : signal is "select_rom";
attribute ROM_STYLE : string;
attribute ROM_STYLE of mem : signal is "distributed";

begin 


memory_access_guard_0: process (addr0) 
begin
      addr0_tmp <= addr0;
--synthesis translate_off
      if (CONV_INTEGER(addr0) > mem_size-1) then
           addr0_tmp <= (others => '0');
      else 
           addr0_tmp <= addr0;
      end if;
--synthesis translate_on
end process;

p_rom_access: process (clk)  
begin 
    if (clk'event and clk = '1') then
        if (ce0 = '1') then 
            q0 <= mem(CONV_INTEGER(addr0_tmp)); 
        end if;
    end if;
end process;

end rtl;

Library IEEE;
use IEEE.std_logic_1164.all;

entity process_element_L5_neure_bias_V is
    generic (
        DataWidth : INTEGER := 4;
        AddressRange : INTEGER := 64;
        AddressWidth : INTEGER := 6);
    port (
        reset : IN STD_LOGIC;
        clk : IN STD_LOGIC;
        address0 : IN STD_LOGIC_VECTOR(AddressWidth - 1 DOWNTO 0);
        ce0 : IN STD_LOGIC;
        q0 : OUT STD_LOGIC_VECTOR(DataWidth - 1 DOWNTO 0));
end entity;

architecture arch of process_element_L5_neure_bias_V is
    component process_element_L5_neure_bias_V_rom is
        port (
            clk : IN STD_LOGIC;
            addr0 : IN STD_LOGIC_VECTOR;
            ce0 : IN STD_LOGIC;
            q0 : OUT STD_LOGIC_VECTOR);
    end component;



begin
    process_element_L5_neure_bias_V_rom_U :  component process_element_L5_neure_bias_V_rom
    port map (
        clk => clk,
        addr0 => address0,
        ce0 => ce0,
        q0 => q0);

end architecture;


