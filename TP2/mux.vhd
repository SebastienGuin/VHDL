library ieee;
use ieee.std_logic_1164.all;

entity mux is
  generic( N : natural := 4);
  port(
    D0, D1 : in std_logic_vector(N-1 downto 0);
    C : in std_logic;
    Y : out std_logic_vector(N-1 downto 0)
  );
end mux;

architecture bloc of mux is
begin
  Y <= D0 when C='0' else D1;
end bloc;
