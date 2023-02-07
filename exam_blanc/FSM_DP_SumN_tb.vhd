library ieee;
use ieee.std_logic_textio.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use std.textio.all;
 
entity FSM_DP_SumN_tb is
        
end FSM_DP_SumN_tb;

architecture tst of FSM_DP_SumN_tb is

  component FSM_DP_SumN is
    generic(N: natural := 8);
    port (
        clk : in std_logic;
        rst : in std_logic;
        start :  in std_logic;
        In1 :  inout std_logic_vector(N-1 downto 0);
        In2 :  inout std_logic_vector(N-1 downto 0);
        res :  inout std_logic_vector(N-1 downto 0));
       
  end  component ;

 -- Signaux
    signal sclk : std_logic;
    signal srst : std_logic;
    signal sstart : std_logic;
    constant sN : natural :=8;
    signal sIn1 : std_logic_vector(sN-1 downto 0);
    signal sIn2: std_logic_vector(sN-1 downto 0);
    signal sres : std_logic_vector(sN-1 downto 0);
  
  


  constant T : time := 5 ns;
begin  -- tst
 
 -- component instantiation
 DUT1: component FSM_DP_SumN
  generic map(N => sN)
  port map(
      clk => sclk,
      rst => srst,
      start => sstart,
      In1 => sIn1,
      In2 => sIn2,
      res => sres);



   process 
    begin
        sclk <= '0';
        wait for T/2;
        sclk <= '1';
        wait for T/2;
    end process;
    

    sstart <= '0', '1' after 1 ns;
    sIn1 <= x"0A";
    sIn2 <= x"02";
    srst <=  '1', '0' after 1 ns;

    
      
end tst;
