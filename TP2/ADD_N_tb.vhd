-------------------------------------------------------------------------------
-- Title      : Testbench for design "ADD_N"
-- Project    : 
-------------------------------------------------------------------------------
-- File       : ADD_N_tb.vhd
-- Author     :   <xpe2i5a010@cimeld13>
-- Company    : 
-- Created    : 2022-10-28
-- Last update: 2022-10-28
-- Platform   : 
-- Standard   : VHDL'93/02
-------------------------------------------------------------------------------
-- Description: 
-------------------------------------------------------------------------------
-- Copyright (c) 2022 
-------------------------------------------------------------------------------
-- Revisions  :
-- Date        Version  Author  Description
-- 2022-10-28  1.0      xpe2i5a010	Created
-------------------------------------------------------------------------------
library ieee;
use ieee.std_logic_1164.all;
------------------------------------------------------------------------------
entity ADD_N_tb is
end entity ADD_N_tb;
-------------------------------------------------------------------------------
architecture ADD_Nbit of ADD_N_tb is
component ADD_N is
        generic (N: natural:=4);
	port(
		A, B  : in std_logic_vector (N-1 downto 0);
                S : out std_logic_vector (N-1 downto 0);
		Carry: out std_logic
	);
end component;
  -- component generics
  constant sN : natural := 4;

  -- component ports
  signal sA, sB  : std_logic_vector (sN-1 downto 0);
  signal sS     : std_logic_vector (sN-1 downto 0);
  signal sCarry : std_logic;

begin  -- architecture ADD_Nbit

  -- component instantiation
  DUT: ADD_N
    generic map (
      N => sN)
    port map (
      A     => sA,
      B     => sB,
      S     => sS,
      Carry => sCarry);
    -- insert signal assignments here
  sA <= "0110", "1111" after 10 ns, "0100" after 20 ns,"1111" after 30 ns,"1111" after 40 ns,"1111" after 50 ns,"1111" after 60 ns,"1111" after 70 ns;
  sB <= "1001", "0000" after 10 ns, "0011" after 20 ns,"0001" after 30 ns,"0010" after 40 ns,"1011" after 50 ns,"1111" after 60 ns,"1111" after 70 ns;  

end architecture ADD_Nbit;


