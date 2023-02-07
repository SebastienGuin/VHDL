library  ieee;
library tp_lib;
use ieee.std_logic_1164.all;


entity LoadCount_tb is

end LoadCount_tb;


architecture test_LoadCount of LoadCount_tb is

  component LoadCount is 
    generic(N : natural := 4);
    port(
      X : in std_logic_vector(N-1 downto 0);
      S : out std_logic_vector(N-1 downto 0);
      clk, nrst : in std_logic;
      st : in bit
    );
  end component;

  constant sN : natural := 4;
  signal sX : std_logic_vector(sN-1 downto 0);
  signal sS : std_logic_vector(sN-1 downto 0);
  signal sclk, snrst : std_logic;
  signal sst :bit;

begin

  DUT:LoadCount
    generic map(
      N => sN
    )
    port map(
      X=>sX,
      S=>sS,
      clk=>sclk,
      nrst=>snrst,
      st=>sst
    );

  sX <= "0101";
  sst <= '1', '1' after 10 ns, '0' after 20 ns ;
  sclk <= '0', '1' after 10 ns, '0' after 20 ns, '1' after 30 ns, '0' after 40 ns ,'1' after 50 ns,'0' after 60 ns,'1' after 70 ns;
  snrst <= '1', '1' after 10 ns, '1' after 20 ns, '1' after 30 ns, '1' after 40 ns ,'1' after 50 ns,'0' after 60 ns,'0' after 70 ns;

end test_LoadCount;


configuration choix1 of LoadCount_tb is
  for test_LoadCount
    for DUT:LoadCount
      use entity tp_lib.LoadCount(bloc);
    end for;
  end for;
end choix1;


configuration choix2 of LoadCount_tb is
  for test_LoadCount
    for DUT:LoadCount
      use entity tp_lib.LoadCount(bloc_process);
    end for;
  end for;
end choix2;
