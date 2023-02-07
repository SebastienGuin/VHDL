library  ieee;
use ieee.std_logic_1164.all;

entity RESEAU_AIG is 
	port(
		A,B,C,D : in integer;
		E,F,G,H : out integer;
		S : in std_logic_vector(4 downto 0)
	);
end RESEAU_AIG;

architecture RESEAU of RESEAU_AIG is
	signal s1,s2,s3,s4,s5,s6:integer;
	component AIGUILLEUR is
		port(
			Ain,Bin : in integer;
			Aout,Bout : out integer;
			C : in std_logic
		);
	end component AIGUILLEUR;
begin
	AIG1: AIGUILLEUR port map(Ain=>A,Bin=>B,C=>S(0),Aout=>s1,Bout=>s2);
	AIG2: AIGUILLEUR port map(Ain=>C,Bin=>D,C=>S(1),Aout=>s3,Bout=>s4);
	AIG3: AIGUILLEUR port map(Ain=>s2,Bin=>s3,C=>S(2),Aout=>s5,Bout=>s6);
	AIG4: AIGUILLEUR port map(Ain=>s1,Bin=>s5,C=>S(3),Aout=>E,Bout=>F);
	AIG5: AIGUILLEUR port map(Ain=>s6,Bin=>s4,C=>S(4),Aout=>G,Bout=>H);
end RESEAU;
