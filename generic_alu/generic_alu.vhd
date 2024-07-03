----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 03.07.2024 14:05:51
-- Design Name: 
-- Module Name: alu - Behavioral
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
use IEEE.NUMERIC_STD.ALL;

entity generic_alu is
    Generic (
        n : integer := 8
    );
    Port ( 
        data_in_1 : in STD_LOGIC_VECTOR (n-1 downto 0);
        data_in_2 : in STD_LOGIC_VECTOR (n-1 downto 0);
        op_ula : in STD_LOGIC;
        data_out : out STD_LOGIC_VECTOR (n-1 downto 0);
        ZF : out STD_LOGIC;
        GZ : out STD_LOGIC
    );
end generic_alu;

architecture Behavioral of generic_alu is

    -- Sinais intermediários que entrarão no MUX:

    signal result : std_logic_vector(n-1 downto 0);

    -- Sinais intermediários internos:

    signal zero_flag : std_logic;
    signal greater_than_zero_flag : std_logic;

begin

    -- Seleção da Operação:

    OPERATIONS: process(data_in_1, data_in_2, op_ula)
    begin
        case op_ula is

            -- Adição
            when '0' => result <= std_logic_vector(unsigned(data_in_1) + unsigned(data_in_2));

            -- Subtração
            when '1' => result <= std_logic_vector(unsigned(data_in_1) - unsigned(data_in_2));

            -- Erro
            when others => result <= (others => '0');

        end case;
    end process OPERATIONS;

    -- Calcular as FLAGS:

    FLAGS_PROCESS: process(result, data_in_1, data_in_2, op_ula)
    begin

        if result = (x"00") then
            zero_flag <= '1';
        else
            zero_flag <= '0';
        end if;

        if op_ula = '0' then
            if unsigned(result) < unsigned(data_in_1) or unsigned(result) < unsigned(data_in_2) then
                greater_than_zero_flag <= '0';
            else
                greater_than_zero_flag <= '1';
            end if;
        else
            if unsigned(data_in_1) < unsigned(data_in_2) then
                greater_than_zero_flag <= '0';
            else
                greater_than_zero_flag <= '1';
            end if;
        end if;

    end process FLAGS_PROCESS;

    -- Atribuindo as FLAGS à saída da ALU:

    ZF <= zero_flag;
    GZ <= greater_than_zero_flag;
    data_out <= result;

end Behavioral;
