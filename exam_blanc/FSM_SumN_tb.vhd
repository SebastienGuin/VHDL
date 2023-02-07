library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

------------------------------------------------
entity FSM_SumN_tb is

end FSM_SumN_tb;
------------------------------------------------

architecture test_FSM_SumN of FSM_SumN_tb is
    component FSM_SumN is
        port ( 
           clk : in  std_logic;
           rst : in  std_logic;
           start : in  std_logic;
           oppo : in  std_logic;
           choix : out  std_logic;
           load : out  std_logic;
           stopp : out  std_logic
        );
    end component;

    signal sclk : std_logic := '1';
    signal srst : std_logic;
    signal schoix : std_logic := '0';
    signal sload : std_logic:= '0';
    signal sstop : std_logic:= '0';
    signal soppo : std_logic;
    signal sstart : std_logic;
begin
    -- instantiation de la machine d'état
    DUT : FSM_SumN
        port map (clk => sclk, rst => srst, start => sstart, oppo => soppo , choix => schoix, load => sload, stopp => sstop);

    -- génération de l'horloge
    srst <= '1', '0' after 0.1 ns , '1' after 25 ns , '0' after 29 ns;
    sclk <= not(sclk) after 2.5 ns;
    soppo <= '1', '0' after 5 ns, '1' after 10 ns, '1' after 15 ns, '0' after 20 ns, '0' after 25 ns, '1' after 30 ns;
    sstart <= '1', '1' after 5 ns, '1' after 10 ns, '0' after 15 ns, '1' after 20 ns, '0' after 25 ns, '1' after 30 ns;

end;
