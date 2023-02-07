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
entity inverseur_nbits_tb is
end entity inverseur_nbits_tb;
-------------------------------------------------------------------------------
architecture inverseur_N of inverseur_nbits_tb is
component inverseur_nbits is
  generic(N : natural := 4);
  port(
    X : in std_logic_vector(N-1 downto 0);
    InverseX : out std_logic_vector(N-1 downto 0)
  );
end component;

  -- component generics
  constant sN : natural := 4;

  -- component ports
  signal sX : std_logic_vector(sN-1 downto 0);
  signal sInverseX : std_logic_vector(sN-1 downto 0);

begin  -- architecture ADD_Nbit

  -- component instantiation
  DUT: inverseur_nbits
    generic map (
      N => sN)
    port map (
      X         => sX,
      InverseX  => sInverseX
      );
  
    -- insert signal assignments here
  sX <= "0110", "1111" after 10 ns, "1010" after 20 ns, "1001" after 30 ns, "1010" after 40 ns;
  
end architecture inverseur_N;
