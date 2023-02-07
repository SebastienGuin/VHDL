library ieee;
use ieee.std_logic_1164.all;

-------------------------------------------------------------------------------

entity ADD_tb is

end entity ADD_tb;

-------------------------------------------------------------------------------

architecture add of ADD_tb is

component  ADD is
	port(
		A, B, Cin  : in std_logic;
		Cout, S : out std_logic
	);
end component ADD;

  -- component ports
  signal sA, sB, sCin : std_logic;
  signal sCout, sS   : std_logic;

begin  -- architecture add

  -- component instantiation
  DUT: ADD
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
  
end architecture add;

-------------------------------------------------------------------------------

configuration ADD_tb_add_cfg of ADD_tb is
  for add
  end for;
end ADD_tb_add_cfg;

-------------------------------------------------------------------------------
