library  ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

-----------------------------------------
entity PGCounter_tb is

end PGCounter_tb;
--------------------------------------

architecture test_PGCounter of PGCounter_tb is
  component PGCounter is
    generic(
          load_file_name : string;
          dta : integer := 8;
          adr : integer := 4
      );
      port (
          addr : in std_logic_vector(adr-1 downto 0);
          jmp : in bit;
          clk, nrst : in std_logic;
          inst : out std_logic_vector(dta-1 downto 0)
      );
  end component PGCounter;

  constant sload_file_name : string :="test.txt";
  constant sdta : integer := 8;
  constant sadr : integer := 4;
  
  signal saddr : std_logic_vector(sadr-1 downto 0);
  signal sjmp : bit;
  signal sclk : std_logic := '1';
  signal snrst : std_logic;
  signal sinst : std_logic_vector(sdta-1 downto 0);

 begin
  DUT:PGCounter
    generic map (
      load_file_name=>sload_file_name,
      dta=>sdta,
      adr=>sadr
      )
    port map(
      addr => saddr,
      jmp => sjmp,
      clk => sclk,
      nrst => snrst,
      inst => sinst
   );

   saddr <= "0000";
   sclk <= not(sclk) after 5 ns;
   sjmp <= '1','0' after 5 ns,'0' after 20 ns,'0' after 30 ns,'1' after 40 ns,'0' after 50 ns,'0' after 60 ns,'0' after 70 ns,'1' after 80 ns,'0' after 90 ns;
   snrst <= '0','1' after 5 ns,'1' after 20 ns,'1' after 30 ns,'1' after 40 ns,'1' after 50 ns,'1' after 60 ns,'0' after 70 ns,'1' after 80 ns;


end test_PGCounter;

