library ieee;
use ieee.std_logic_1164.all;

-------------------------------------------

entity ModifIN_tb is

end ModifIN_tb;

-------------------------------------------

architecture test_ModifIN of ModifIN_tb is

  component ModifIN is
    generic(N : natural := 4);
    port(
      X : in std_logic_vector(N-1 downto 0);
      S : out std_logic_vector(N-1 downto 0);
      zero, neg : in bit
    );
  end component;
  
  constant sN : natural := 4;
  signal sX : std_logic_vector(sN-1 downto 0);
  signal sS : std_logic_vector(sN-1 downto 0);
  signal szero, sneg : bit;

begin

  DUT: ModifIN
    generic map(
      N => sN
    )
    port map(
      X    => sX,
      S    => sS,
      zero => szero,
      neg  => sneg
    );

  sX    <= "0101";
  szero <= '0', '1' after 10 ns, '0' after 20 ns, '1' after 30 ns, '0' after 40 ns;
  sneg  <= '0', '0' after 10 ns, '1' after 20 ns, '1' after 30 ns, '0' after 40 ns;

end test_ModifIN;

