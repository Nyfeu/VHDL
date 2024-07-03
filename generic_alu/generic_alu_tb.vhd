----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.07.2024 14:18:52
-- Design Name: 
-- Module Name: alu_tb - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
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
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity generic_alu_tb is
    generic (
        n : integer := 8
    );
    Port ( 
        data_in_1_tst : inout STD_LOGIC_VECTOR (n-1 downto 0);
        data_in_2_tst : inout STD_LOGIC_VECTOR (n-1 downto 0);
        op_ula_tst : inout STD_LOGIC;
        data_out_tst : out STD_LOGIC_VECTOR (n-1 downto 0);
        ZF_tst : out STD_LOGIC;
        GZ_tst : out STD_LOGIC
    );
end generic_alu_tb;

architecture Behavioral of generic_alu_tb is

    component generic_alu is
        port (
            data_in_1, data_in_2   : in  std_logic_vector(n-1 downto 0);   -- Dados de entrada
            op_ula                 : in  std_logic;                      -- Sinal de operação
            data_out               : out std_logic_vector(n-1 downto 0);   -- Dados de saída
            ZF                     : out std_logic;                      -- Zero Flag
            GZ                     : out std_logic                       -- Greater than Zero (flag)
        );
    end component generic_alu;

begin

    ALU_inst: generic_alu port map (
        data_in_1 => data_in_1_tst,
        data_in_2 => data_in_2_tst,
        op_ula => op_ula_tst,
        data_out => data_out_tst,
        ZF => ZF_tst,
        GZ => GZ_tst
    );

    process
    begin

        -- Quando op_ula = 0 => soma;
        -- Quando op_ula = 1 => subtrai;

        -- Test 1: Soma, data_in_1 = 0x0A, data_in_2 = 0x05, op_ula = 0
        data_in_1_tst <= x"0A";
        data_in_2_tst <= x"05";
        op_ula_tst <= '0';
        wait for 100 ns;
        -- Esperado: data_out = 0x0F

        -- Test 2: Subtrai, data_in_1 = 0x0A, data_in_2 = 0x05, op_ula = 1
        data_in_1_tst <= x"0A";
        data_in_2_tst <= x"05";
        op_ula_tst <= '1';
        wait for 100 ns;
        -- Esperado: data_out = 0x05

        -- Test 3: Soma, data_in_1 = 0xFF, data_in_2 = 0x01, op_ula = 0
        data_in_1_tst <= x"FF";
        data_in_2_tst <= x"01";
        op_ula_tst <= '0';
        wait for 100 ns;
        -- Esperado: data_out = 0x00 (overflow)

        -- Test 4: Subtrai, data_in_1 = 0x00, data_in_2 = 0x01, op_ula = 1
        data_in_1_tst <= x"00";
        data_in_2_tst <= x"01";
        op_ula_tst <= '1';
        wait for 100 ns;
        -- Esperado: data_out = 0xFF (underflow)

        -- Test 5: Soma, data_in_1 = 0x12, data_in_2 = 0x34, op_ula = 0
        data_in_1_tst <= x"12";
        data_in_2_tst <= x"34";
        op_ula_tst <= '0';
        wait for 100 ns;
        -- Esperado: data_out = 0x46

        -- Test 6: Subtrai, data_in_1 = 0x34, data_in_2 = 0x12, op_ula = 1
        data_in_1_tst <= x"34";
        data_in_2_tst <= x"12";
        op_ula_tst <= '1';
        wait for 100 ns;
        -- Esperado: data_out = 0x22

        wait;

    end process;

end Behavioral;
