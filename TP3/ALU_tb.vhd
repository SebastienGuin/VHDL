library  ieee;
use ieee.std_logic_1164.all;

-----------------------------------------
entity ALU_tb is

end ALU_tb;
--------------------------------------

architecture test_ALU of ALU_tb is

  component ALU is
   generic(N : natural := 4);
   port(
    X, Y : in std_logic_vector(N-1 downto 0);
    zx, zy, nx, ny, f, no : in bit;
    S : out std_logic_vector(N-1 downto 0)
   ); 
  end component;

  constant sN : natural :=4;
  signal sX : std_logic_vector(sN-1 downto 0);
  signal sY : std_logic_vector(sN-1 downto 0);
  signal szx, szy, snx, sny, sf, sno : bit;
  signal sS : std_logic_vector(sN-1 downto 0);

 begin
  DUT:ALU
    generic map (N=>sN)
    port map(
      X => sX,
      Y => sY,
      zx => szx,
      zy => szy,
      nx => snx,
      ny => sny,
      f => sf,
      no => sno,
      S => sS
   );

  sX  <= "0010";
  sY  <= "0011";
  szx <= '1','1' after 10 ns, '1' after 20 ns,'0' after 30 ns, '1' after 40 ns,
         '0' after 50 ns, '1' after 60 ns,'0' after 70 ns, '1' after 80 ns,'0' after 90 ns,
         '1' after 100 ns, '0' after 110 ns, '0' after 120 ns,'1' after 130 ns,
         '0' after 140 ns, '0' after 150 ns, '0' after 160 ns,'0' after 170 ns,'1' after 180 ns;

  snx <= '0','1' after 10 ns, '1' after 20 ns,'0' after 30 ns, '1' after 40 ns,
         '0' after 50 ns, '1' after 60 ns ,
         '0' after 70 ns, '1' after 80 ns,'1' after 90 ns,
         '1' after 100 ns, '0' after 110 ns, '0' after 120 ns,'1' after 130 ns,
         '1' after 140 ns, '0' after 150 ns, '0' after 160 ns,'1' after 170 ns,'1' after 180 ns;

  szy <= '1','1' after 10 ns, '1' after 20 ns,'1' after 30 ns, '0' after 40 ns,
         '1' after 50 ns, '0' after 60 ns,
         '1' after 70 ns, '0' after 80 ns,'1' after 90 ns,
         '0' after 100 ns, '0' after 110 ns, '1' after 120 ns,'0' after 130 ns,
         '0' after 140 ns, '0' after 150 ns, '0' after 160 ns,'0' after 170 ns,'1' after 180 ns;

  sny <= '0','1' after 10 ns, '0' after 20 ns,'1' after 30 ns, '0' after 40 ns,
         '1' after 50 ns, '0' after 60 ns,
         '1' after 70 ns, '0' after 80 ns,'1' after 90 ns,
         '1' after 100 ns, '0' after 110 ns, '1' after 120 ns,'0' after 130 ns,
         '0' after 140 ns, '1' after 150 ns, '0' after 160 ns,'1' after 170 ns,'1' after 180 ns;

  sf  <= '1','1' after 10 ns, '1' after 20 ns,'0' after 30 ns, '0' after 40 ns,
         '0' after 50 ns, '0' after 60 ns,
         '1' after 70 ns, '1' after 80 ns,'1' after 90 ns,
         '1' after 100 ns, '1' after 110 ns, '1' after 120 ns,'1' after 130 ns,
         '1' after 140 ns, '1' after 150 ns, '0' after 160 ns,'0' after 170 ns,'1' after 180 ns;

  sno <= '0','1' after 10 ns, '0' after 20 ns,'0' after 30 ns, '0' after 40 ns,
         '1' after 50 ns, '1' after 60 ns,
         '1' after 70 ns, '1' after 80 ns,'1' after 90 ns,
         '1' after 100 ns, '0' after 110 ns, '0' after 120 ns,'0' after 130 ns,
         '1' after 140 ns, '1' after 150 ns, '0' after 160 ns,'1' after 170 ns,'1' after 180 ns;
  
end test_ALU;

