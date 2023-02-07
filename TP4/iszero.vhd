library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity iszero is
    generic(N : natural := 4);
    port(
        entree : in signed(N-1 downto 0);
        sortie : out std_logic
    );
end iszero;


architecture bloc of iszero is
    signal zero : signed(N-1 downto 0) := (others => '0');
begin
    process(entree)
    begin
        if entree = zero then
            sortie <= '1';
        else
            sortie <= '0';
        end if;
    end process;
end bloc;
