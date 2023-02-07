library ieee;
use ieee.std_logic_1164.all;

entity inverseur_nbits is
  generic(N : natural := 4);
  port(
    X : in std_logic_vector(N-1 downto 0);
    InverseX : out std_logic_vector(N-1 downto 0)
  );
end inverseur_nbits;


architecture bloc of inverseur_nbits is
  component inverseur is
    port(
      X : in std_logic;
      InverseX : out std_logic
      );
  end component;
begin
  inverse_n_inst : for i in 0 to N-1 generate
    INVERSEUR_N: inverseur port map(X(i), InverseX(i));
  end generate inverse_n_inst;
end bloc;
