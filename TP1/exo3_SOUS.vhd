library ieee;
use ieee.std_logic_1164.all;

entity SOUS is
	port(
          A, B, Cin  : in std_logic;
		Cout, S : out std_logic
	);
end SOUS;

architecture bloc of SOUS is
begin
      S <= A xor B xor Cin;
      Cout <= ((not A) and B) or ((not A) and Cin) or (B and Cin);
end bloc;


