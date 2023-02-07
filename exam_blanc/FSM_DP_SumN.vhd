library ieee;
use ieee.std_logic_textio.all;
use ieee.std_logic_1164.all;
use ieee.std_logic_unsigned.all;
use ieee.std_logic_arith.all;
use std.textio.all;
entity FSM_DP_SumN is
  generic(N: natural := 8);
  port (
      clk : in std_logic;
      rst : in std_logic;
      start :  in std_logic;
      In1 :  in std_logic_vector(N-1 downto 0);
      In2 :  in std_logic_vector(N-1 downto 0);
      res :  inout std_logic_vector(N-1 downto 0));
     
end  FSM_DP_SumN ;


architecture beh of FSM_DP_SumN is
	
	-- Création des variables
	signal stop : std_logic;
	signal supp : std_logic;
    signal load : std_logic;
    signal choix : std_logic;
    signal zero : std_logic_vector(N-1 downto 0);
    signal srst :std_logic;
    component FSM_SumN is
        port (
            clk : in std_logic;
            rst : in std_logic;
            start : in std_logic;
            supp : in std_logic;
            choix : out std_logic;
            load : out std_logic;
            stop : out std_logic);
      end  component FSM_SumN ;

      component DP_SumN is
        generic(N: natural := 5);
        port (
            clk : in std_logic;
            rst : in std_logic;
            load : in std_logic;
            In1 :  in std_logic_vector(N-1 downto 0);
            In2 :  in std_logic_vector(N-1 downto 0);
            res :  inout std_logic_vector(N-1 downto 0));
           
      end component DP_SumN ;

    begin

    zero <= (others => '0');
	 
    DUT1 : component FSM_SumN
  port map(
      clk => clk,
      rst => rst,
      start => start,
      supp => supp,
      choix => choix,
      load => load ,
      stop => stop);

      DUT2: component DP_SumN
  generic map(N => N)
  port map(
      clk => choix,
      rst => srst,
      load => load,
      In1 => In1,
      In2 => In2,
      res => res);

      srst <= load xor stop;
      process(start)
        begin
            if ((start'event and start ='1') ) then
                supp <= '1';
            else
                supp <= '0';
            end if;
        end process;

end beh;
