library ieee;
use ieee.std_logic_1164.all;

entity PGCounter is
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
end PGCounter;

architecture archi_memoire of PGCounter is
    signal LoadCount_out : std_logic_vector(adr-1 downto 0);
    signal ROM_out : std_logic_vector(dta-1 downto 0);
    signal zero : std_logic_vector(dta-1 downto 0) := (others => '0');

    component LoadCount is
        generic(N : natural := dta);
        port(
          X : in std_logic_vector(N-1 downto 0);
          S : out std_logic_vector(N-1 downto 0);
          clk, nrst : in std_logic;
          st : in std_logic
        );
    end component LoadCount;

    component MA_RAM is
        generic (
        load_file_name : string;
        dta : integer := 8;
        adr : integer := 4
        );
        port ( address : in std_logic_vector(adr-1 downto 0);
               datain  : in std_logic_vector(dta-1 downto 0);
               wr_ena  : in std_logic ;
               dataout : out std_logic_vector(dta-1 downto 0)
               );
    end component MA_RAM;

 begin
    -- Mise à jour du compteur
    LoadCount_inst: LoadCount
        generic map(N => adr)
        port map (addr, LoadCount_out, clk, nrst, jmp);

    RAM_inst: MA_RAM
        generic map(load_file_name => load_file_name, dta => dta, adr => adr)
        port map ( LoadCount_out, zero , '0', ROM_out);
        
    -- Lecture de la mémoire à l'adresse du compteur
    inst <= ROM_out;
end archi_memoire;
