library  ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-----------------------------------------
entity InstDecodeur_tb is

end InstDecodeur_tb;
--------------------------------------

architecture test_InstDecodeur of InstDecodeur_tb is
  component InstDecodeur is
    port (
      entree : in  std_logic_vector(15 downto 0);
      ci: out std_logic;
      sm : out std_logic;
      opc : out std_logic_vector(5 downto 0);
      dst : out std_logic_vector(2 downto 0);
      cnd : out std_logic_vector(2 downto 0);
      W : out std_logic_vector(15 downto 0)
    );
  end component InstDecodeur;

  signal sentree : std_logic_vector(15 downto 0);
  signal sci: std_logic;
  signal ssm : std_logic;
  signal sopc : std_logic_vector(5 downto 0);
  signal sdst : std_logic_vector(2 downto 0);
  signal scnd : std_logic_vector(2 downto 0);
  signal sW : std_logic_vector(15 downto 0);

  begin
  DUT:InstDecodeur
      port map (
         entree => sentree,
          ci => sci,
          sm => ssm,
          opc => sopc,
          dst => sdst,
          cnd => scnd,
          W => sW
      );

      sentree <= "0100101000101010",  "1010100000000000" after 2 ns,
      "0101010101010100" after 4 ns, "1001110011111111" after 6 ns,
      "1001101001111111" after 8 ns;
end test_InstDecodeur;

