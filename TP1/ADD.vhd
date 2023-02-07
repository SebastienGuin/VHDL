library ieee;
use ieee.std_logic_1164.all;

entity ADD is
	port(
		A, B, Cin  : in std_logic;
		Cout, S : out std_logic
	);
end ADD;

architecture bloc of ADD is
begin
      S <= A xor B xor Cin;
      Cout <= (A and B) or (A and Cin) or (B and Cin);
end bloc;


