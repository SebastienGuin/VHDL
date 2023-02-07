library ieee;
use ieee.std_logic_textio.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use std.textio.all;


entity memregs is
    generic(
	    load_file : string;
        size : natural := 4
    );
    port(
        a, d                : in std_logic;
        sa		            : in std_logic;
	    clk, nrst           : in std_logic;
        Xin                 : in std_logic_vector(size-1 downto 0);
        Aout, Dout, FromMem : out std_logic_vector(size-1 downto 0)
    );
end memregs;


architecture bloc of memregs is
    --constant load_file : string := "test.txt";
    signal adresse     : std_logic_vector(size-1 downto 0);
    signal valeur      : std_logic_vector(size-1 downto 0);
    component registre is
        generic(N : natural);
        port(
            D         : in std_logic_vector(N-1 downto 0);
            load      : in std_logic;
            Q         : out std_logic_vector(N-1 downto 0);
            clk, nrst : in std_logic
        );
    end component;
    component MA_RAM is 
        generic(
            load_file_name : string;
            dta : integer := 8;
            adr : integer := 4
        );
        port( 
            address : in std_logic_vector(adr-1 downto 0);
            datain  : in std_logic_vector(dta-1 downto 0);
            wr_ena  : in std_logic;
            dataout : out std_logic_vector(dta-1 downto 0)
        );
    end component;
begin
    reg_inst1: registre
        generic map(N => size)
        port map(
            D    => Xin,     --entrée
            load => a,
            Q    => adresse, --sortie
            clk  => clk,
            nrst => nrst
        );
    Aout <= adresse;
    reg_inst2: registre
        generic map(N => size)
        port map(
            D    => Xin,    --entrée
            load => d,
            Q    => valeur, --sortie
            clk  => clk,
            nrst => nrst
        );
    Dout <= valeur;
    ram_inst: MA_RAM
        generic map(
            load_file_name  => load_file,
            dta             => size,
            adr             => size
        )
        port map(
            address => adresse,
            datain  => valeur,
            wr_ena  => sa,
            dataout => FromMem
        );
end bloc;

