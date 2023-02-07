-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
------------------------------------------------------------------------------
entity registre_tb is
end entity registre_tb;
-------------------------------------------------------------------------------
architecture test_registre of registre_tb is
component registre is
  generic(N : natural := 16);
  port(
    D : in std_logic_vector(N-1 downto 0);
    load : in bit;
    Q : out std_logic_vector(N-1 downto 0);
    clk, nrst : in std_logic
  );
end component;

  -- component generics
  constant sN : natural := 16;

  -- component ports
  signal sD : std_logic_vector(sN-1 downto 0);
  signal sload : bit;
  signal sQ : std_logic_vector(sN-1 downto 0);
  signal sclk, snrst : std_logic;

begin  -- architecture ADD_Nbit

  -- component instantiation
  DUT: registre
    generic map (
      N => sN)
    port map (
      D    => sD,
      load => sload,
      Q    => sQ,
      clk  => sclk,
      nrst => snrst
    );
  
-- insert signal assignments here
sD    <= "0100111000100011";
sload <= '0', '1' after 10 ns, '1' after 20 ns, '1' after 30 ns, '1' after 40 ns, '1' after 50 ns;
snrst <= '1', '1' after 10 ns, '1' after 20 ns, '1' after 30 ns, '0' after 40 ns, '0' after 50 ns;
sclk  <= '1', '1' after 10 ns, '0' after 20 ns, '1' after 30 ns, '1' after 40 ns, '1' after 50 ns;

end architecture test_registre;
