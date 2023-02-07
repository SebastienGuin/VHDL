library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;
use ieee.std_logic_textio.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use std.textio.all;

------------------------------------------------
entity UnitCont_tb is
end UnitCont_tb;
------------------------------------------------
architecture test_UnitCont of UnitCont_tb is

  component UnitCont is
    generic(
        load_file_name : string;
	    N : natural := 16
    );
    port (
        entree : in  std_logic_vector(15 downto 0);
        jmp    : out std_logic;
        clk, nrst : in std_logic;
		  MemRegs_Aout : inout  std_logic_vector(N-1 downto 0)
    );
  end component;

  component PGCounter is
    generic(
          load_file_name : string;
          dta : integer := 8;
          adr : integer := 4
      );
      port (
          addr : in std_logic_vector(adr-1 downto 0);
          jmp : in std_logic;
          clk, nrst : in std_logic;
          inst : out std_logic_vector(dta-1 downto 0)
      );
  end component;

  constant sload_file_name : string := "test.txt";
  constant sN        : natural := 16;
  signal sentree     : std_logic_vector(15 downto 0);
  signal sinjmp        : std_logic := '1';
  signal soutjmp        : std_logic := '0';
  signal sclk        : std_logic := '1';
  signal snrst : std_logic := '0';
  constant sdta : integer := sN;
  constant sadr : integer := sN;
  signal saddr : std_logic_vector(sadr-1 downto 0);
  signal sinst : std_logic_vector(sdta-1 downto 0);
  signal sMemRegs_Aout : std_logic_vector(sN-1 downto 0);

begin
  snrst <= '1';
  sclk <= not(sclk) after 5 ns;

  PGC: PGCounter 
    generic map(
      load_file_name => sload_file_name, dta => sdta, adr => sadr)
    port map ( addr => sMemRegs_Aout, jmp => soutjmp, clk => sclk, nrst => snrst, inst => sinst
  );

  DUT: UnitCont
    generic map(
      load_file_name => sload_file_name,
      N => sN
    )
    port map(
      entree => sinst,
      jmp    => soutjmp,
      clk    => sclk,
      nrst   => snrst,
      MemRegs_Aout => sMemRegs_Aout
  );
end test_UnitCont;





