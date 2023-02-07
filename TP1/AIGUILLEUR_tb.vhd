
library ieee;
use ieee.std_logic_1164.all;

-------------------------------------------------------------------------------

entity AIGUILLEUR_tb is

end entity AIGUILLEUR_tb;

-------------------------------------------------------------------------------

architecture tst of AIGUILLEUR_tb is
  
component AIGUILLEUR is 
	port(
		Ain,Bin : in integer;
		Aout,Bout: out integer;
		C: in bit
	);
end component;

  -- component ports
  signal sAin, sBin   : integer;
  signal sAout, sBout : integer;
  signal sC          : bit;


begin  -- architecture tst

  -- component instantiation
  DUT: AIGUILLEUR
    port map (
      Ain  => sAin,
      Bin  => sBin,
      Aout => sAout,
      Bout => sBout,
      C    => sC);


     -- insert signal assignments here
  sAin <= 8, 12 after 10 ns, 88 after 40 ns;
  sBin <= 98, 120 after 15 ns, 188 after 60 ns;
  sc <= '1', '0' after 10 ns, '1' after 100 ns;
  

end architecture tst;

