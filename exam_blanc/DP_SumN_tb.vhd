library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

------------------------------------------------
entity DP_SumN_tb is

end DP_SumN_tb;
------------------------------------------------

architecture test_DP_SumN of DP_SumN_tb is
    component DP_SumN is
        generic(N : natural := 16);
        port(
            In1, In2 : in std_logic_vector(N-1 downto 0);
            load1, load2, clk, nrst, Cmux, done : in std_logic;
            sortie: out std_logic_vector(N-1 downto 0) := (others => 'Z')
        );
    end component;

    constant sN : integer := 8;
    signal sIn1   : std_logic_vector(sN-1 downto 0);
    signal sIn2   : std_logic_vector(sN-1 downto 0);
    signal sload1 : std_logic := '0';
    signal sload2 : std_logic := '0';
    signal sclk   : std_logic := '1';
    signal snrst  : std_logic := '1';
    signal sCmux  : std_logic := '0';
    signal sdone  : std_logic := '0';
    signal ssortie: std_logic_vector(sN-1 downto 0);
     
 begin
    -- instantiation de la machine d'état
    DUT : DP_SumN
        generic map (N => sN)
        port map (
            In1 => sIn1,
            In2 => sIn2,
            load1 => sload1,
            load2 => sload2,
            clk => sclk,
            nrst => snrst,
            Cmux => sCmux,
            done => sdone,
            sortie => ssortie
        );

    -- génération de l'horloge

    snrst <= '0', '1' after 1 ns ;
    sclk <= not(sclk) after 5 ns;
    sIn1 <= "00001010";
    sIn2 <= "00000010";
    sload1 <= '1', '0' after 60 ns;
    sload2 <= '1' after 5 ns, '0' after 60 ns;
    sCmux <= '1' after 10 ns;
    sdone <= '1' after 55 ns;

end;
