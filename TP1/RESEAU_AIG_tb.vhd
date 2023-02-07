library ieee;
use ieee.std_logic_1164.all;

-------------------------------------------------------------------------------

entity RESEAU_AIG_tb is

end entity RESEAU_AIG_tb;

-------------------------------------------------------------------------------

architecture RESEAU of RESEAU_AIG_tb is

component RESEAU_AIG is 
	port(
		A,B,C,D : in integer;
		E,F,G,H : out integer;
		S : in bit_vector(4 downto 0)
	);
end component  RESEAU_AIG;

      -- component ports
      signal sA, sB, sC, sD : integer;
      signal sE, sF, sG, sH : integer;
      signal sS          : bit_vector(4 downto 0);

BEGIN  -- architecture RESEAU

  -- component instantiation
  DUT: RESEAU_AIG
    port map (
      A => sA,
      B => sB,
      C => sC,
      D => sD,
      E => sE,
      F => sF,
      G => sG,
      H => sH,
      S => sS);


   -- insert signal assignments here
  sS <= "00000","10000" after 10 ns,"10001" after 20 ns,"11111" after 40 ns ;
  sA <= 45, 15 after 10 ns , 11 after 20 ns, 99 after 40 ns ;
  sB <= 78, 12 after 10 ns , 77 after 20 ns, 32 after 40 ns ;
  sC <= 98, 4 after 10 ns , 55 after 20 ns, 89 after 40 ns ;
  sD <= 23, 78 after 10 ns , 48 after 20 ns, 48 after 40 ns ;
 
end architecture RESEAU;

-------------------------------------------------------------------------------

configuration RESEAU_AIG_tb_RESEAU_cfg of RESEAU_AIG_tb is
  for RESEAU
  end for;
end RESEAU_AIG_tb_RESEAU_cfg;

-------------------------------------------------------------------------------
