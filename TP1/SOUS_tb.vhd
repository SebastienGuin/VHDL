library ieee;
use ieee.std_logic_1164.all;

-------------------------------------------------------------------------------

entity SOUS_tb is

end entity SOUS_tb;

-------------------------------------------------------------------------------

architecture SOUS of SOUS_tb is

component SOUS is
	port(
          A, B, Cin  : in std_logic;
	  Cout, S : out std_logic
	);
end component SOUS;

  -- component ports
  signal sA, sB, sCin : std_logic;
  signal sCout, sS   : std_logic;

begin  -- architecture SOUS

  -- component instantiation
  DUT: SOUS
    port map (
      A    => sA,
      B    => sB,
      Cin  => sCin,
      Cout => sCout,
      S    => sS);

  -- insert signal assignments here
  sA <= '1','0' after 10 ns, '1' after 20 ns, '0' after 30 ns, '0' after 40 ns;
  sB <= '0','1' after 10 ns, '1' after 20 ns, '0' after 30 ns, '0' after 40 ns;
  sCin <= '0';

end architecture SOUS;

-------------------------------------------------------------------------------

configuration SOUS_tb_SOUS_cfg of SOUS_tb is
  for SOUS
  end for;
end SOUS_tb_SOUS_cfg;

-------------------------------------------------------------------------------
