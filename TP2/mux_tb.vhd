library ieee;
use ieee.std_logic_1164.all;
------------------------------------------------------------------------------
entity mux_tb is
end entity mux_tb;
-------------------------------------------------------------------------------
architecture test_mux of mux_tb is
component mux is
  generic( N : natural := 4);
  port(
    D0, D1 : in std_logic_vector(N-1 downto 0);
    C : in bit;
    Y : out std_logic_vector(N-1 downto 0)
  );
end component;

  -- component generics
  constant sN : natural := 4;
  -- component ports
  signal sD0, sD1  : std_logic_vector (sN-1 downto 0);
  signal sY        : std_logic_vector (sN-1 downto 0);
  signal sC        : bit;

begin  -- architecture ADD_Nbit
  -- component instantiation
  DUT: mux
    generic map (
      N => sN)
    port map (
      D0    => sD0,
      D1    => sD1,
      C     => sC,
      Y     => sY
      );
  -- insert signal assignments here
  sD0 <= "0011";
  sD1 <= "1100";
  sC  <= '0', '1' after 10 ns, '0' after 20 ns;

end architecture test_mux;
