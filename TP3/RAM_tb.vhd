library ieee;
use ieee.std_logic_textio .all;
use ieee.std_logic_1164 .all;
use ieee.std_logic_unsigned .all;
use ieee.std_logic_arith .all;
use std.textio.all;

entity RAM_tb is
end RAM_tb ;

architecture test_RAM of RAM_tb is
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
    end component ;

    constant sload_file_name : string :="test.txt";
    constant sdta : integer := 8;
    constant sadr : integer := 4;
    signal saddress : std_logic_vector(sadr-1 downto 0);
    signal sdatain  : std_logic_vector(sdta-1 downto 0);
    signal swr_ena  : std_logic ;
    signal sdataout : std_logic_vector(sdta-1 downto 0);

    begin
        DUT:MA_RAM
        generic map (
            load_file_name=>sload_file_name,
            dta=>sdta,
            adr=>sadr
        )
        port map(
        address => saddress,
        datain => sdatain,
        wr_ena => swr_ena,
        dataout => sdataout
        );  

        saddress <= "0001" ,"1111" after 10 ns, "0001" after 20 ns, "1111" after 30 ns, "0011" after 40 ns, "0011" after 50 ns;
        sdatain <= "10110011", "11110101" after 10 ns, "00000001" after 20 ns, "00000111" after 30 ns, "00000011" after 40 ns, "00000011" after 50 ns;
        swr_ena <= '1', '1' after 10 ns, '0' after 20 ns, '0' after 30 ns, '0' after 40 ns, '0' after 50 ns;


end test_RAM;
