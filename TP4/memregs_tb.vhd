library ieee;
use ieee.std_logic_textio.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use std.textio.all;

----------------------------------------------------------
entity memregs_tb is

end memregs_tb;
----------------------------------------------------------

architecture test_memregs of memregs_tb is

    component memregs is
        generic(
            size : natural := 4
        );
        port(
            a, d                : in bit;
            sa		        : in std_logic;
	    clk, nrst           : in std_logic;
            Xin                 : in std_logic_vector(size-1 downto 0);
            Aout, Dout, FromMem : out std_logic_vector(size-1 downto 0)
        );
    end component;

    constant ssize : natural := 4;
    signal ssa, sd         : bit;
    signal sssa            : std_logic;
    signal sXin            : std_logic_vector(ssize-1 downto 0);
    signal sAout           : std_logic_vector(ssize-1 downto 0);
    signal sDout, sFromMem : std_logic_vector(ssize-1 downto 0);
    signal sclk            : std_logic := '0';
    signal snrst           : std_logic := '0';

begin

    DUT: memregs
        generic map(
            size  => ssize
        )
        port map(
            a       => ssa,
            d       => sd,
            sa      => sssa,
            Xin     => sXin,
            Aout    => sAout,
            Dout    => sDout,
            FromMem => sFromMem,
            clk     => sclk,
            nrst    => snrst
        );

    -- TESTS
    sclk  <= not(sclk) after 5 ns;
    snrst <= '1' after 5 ns;
    sXin  <= "0000", "0001" after 15 ns, "0101" after 25 ns, "0000" after 35 ns, "0010" after 55 ns, "1111" after 65 ns, "0000" after 75 ns;
    ssa   <= '0', '1' after 15 ns, '0' after 25 ns, '1' after 55 ns, '0' after 65 ns;
    sd    <= '0', '1' after 25 ns, '0' after 35 ns, '1' after 65 ns, '0' after 75 ns;
    sssa  <= '0', '1' after 35 ns, '0' after 45 ns, '1' after 75 ns, '0' after 85 ns;

end test_memregs;

