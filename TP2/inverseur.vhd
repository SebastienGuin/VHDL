library ieee;
use ieee.std_logic_1164.all;

entity inverseur is
  port(
    X : in std_logic;
    InverseX : out std_logic
  );
end inverseur;

architecture bloc of inverseur is
begin
  InverseX <= '0' when X='1' else '1';
end bloc;

