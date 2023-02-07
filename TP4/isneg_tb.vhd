library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--------------------------------------------------------
entity isneg_tb is

end isneg_tb;
--------------------------------------------------------

architecture test_isneg of isneg_tb is
    component isneg is
        generic(N : natural := 4);
        port(
            entree : in signed(N-1 downto 0);
            sortie : out std_logic
        );
    end component;

    constant sN    : natural := 4;
    signal sentree : signed(sN-1 downto 0);
    signal ssortie : std_logic;
begin
    DUT: isneg
        generic map(
            N => sN
        )
        port map(
            entree  => sentree,
            sortie => ssortie
        );
    -- Tests
    sentree <= "0001", "0010" after 10 ns, "0000" after 20 ns, "1011" after 30 ns, "0000" after 40 ns;
end test_isneg;
