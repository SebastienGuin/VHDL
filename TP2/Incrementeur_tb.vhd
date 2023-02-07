
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
------------------------------------------------------------------------------
entity INCREMENT_tb is
end entity INCREMENT_tb;
-------------------------------------------------------------------------------
architecture INCR_TB of INCREMENT_TB is
component INCREMENT is
        generic (N: natural:=4);
	port(
		X  : in std_logic_vector (N-1 downto 0);
		Xplus1: out std_logic_vector(N-1 downto 0)
	);
end component;
  -- component generics
  constant sN : natural := 4;

  -- component ports
  signal sX  :  std_logic_vector (sN-1 downto 0);
  signal sXplus1:  std_logic_vector(sN-1 downto 0);

begin  -- architecture 

  -- component instantiation
  DUT: INCREMENT
    generic map (
      N => sN)
    port map (
      X          => sX,
      Xplus1     => sXplus1
      );

   -- insert signal assignments here

  sX <= "0001", "0011" after 10 ns,"0111" after 20 ns,"1111" after 30 ns,"0011" after 40 ns;
  
end architecture INCR_TB;
