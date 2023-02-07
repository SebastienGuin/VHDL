library  ieee;
use ieee.std_logic_1164.all;

entity AIGUILLEUR is 
	port(
		Ain,Bin : in integer;
		Aout,Bout: out integer;
		C: in std_logic
	);
end AIGUILLEUR;

architecture CHOIX of AIGUILLEUR is
begin
	Aout<= Ain when C='0' else Bin;
	Bout<= Bin when C='0' else Ain;
end CHOIX;
