library ieee;
use ieee.std_logic_1164.all;
------------------------------------------------------------------------------
entity inverseur_tb is
end entity inverseur_tb;
-------------------------------------------------------------------------------
architecture test_inverseur of inverseur_tb is
component inverseur is
  port(
    X : in std_logic;
    InverseX : out std_logic
  );
end component;

  -- component ports
  signal sX : std_logic;
  signal sInverseX : std_logic;

begin  -- architecture ADD_Nbit
  -- component instantiation
  DUT: inverseur
    port map (
      X    => sX,
      InverseX => sInverseX
      );
  
  -- insert signal assignments here
  sX <= '0', '1' after 10 ns, '0' after 20 ns;

end architecture test_inverseur;
