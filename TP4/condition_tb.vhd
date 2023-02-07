library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

--------------------------------------------------------
entity condition_tb is

end condition_tb;
--------------------------------------------------------

architecture test_condition of condition_tb is

    component condition is
        generic(N : natural := 4);
        port(
            Xin        : in signed(N-1 downto 0);
            lt, eq, gt : in std_logic;
            jmp        : out std_logic
        );
    end component;

    constant sN          : natural := 4;
    signal sXin          : signed(sN-1 downto 0);
    signal slt, seq, sgt : std_logic;
    signal sjmp          : std_logic;

begin

    DUT: condition
        generic map(
            N => sN
        )
        port map(
            Xin => sXin,
            lt  => slt,
            eq  => seq,
            gt  => sgt,
            jmp => sjmp
        );

    -- TESTS :
    sXin <= "0000", "0100" after 40 ns, "1011" after 80 ns, "0000" after 120 ns;
    slt  <= '0', '1' after 20 ns, '0' after 40 ns, '1' after 60 ns, '0' after 80 ns, '1' after 100 ns;
    seq  <= '0', '1' after 10 ns, '0' after 20 ns, '1' after 30 ns, '0' after 40 ns, '1' after 50 ns, '0' after 60 ns, '1' after 70 ns, '0' after 80 ns, '1' after 90 ns, '0' after 100 ns, '1' after 110 ns;
    sgt  <= '0', '1' after 5 ns, '0' after 10 ns, '1' after 15 ns, '0' after 20 ns, '1' after 25 ns, '0' after 30 ns, '1' after 35 ns, '0' after 40 ns, '1' after 45 ns, '0' after 50 ns, '1' after 55 ns, '0' after 60 ns, '1' after 65 ns, '0' after 70 ns, '1' after 75 ns, '0' after 80 ns, '1' after 85 ns, '0' after 90 ns, '1' after 95 ns, '0' after 100 ns, '1' after 105 ns, '0' after 110 ns, '1' after 115 ns;

end test_condition;

