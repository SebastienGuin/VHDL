Library ieee;
Use ieee.std_logic_1164.all;

entity SOUS_N is 
    generic(N: natural := 5);
    port(
    A,B : in std_logic_vector(N-1 downto 0);
    S : out std_logic_vector(N-1 downto 0);
    carry : out std_logic);
 end SOUS_N;

architecture bloc of SOUS_N is
    signal carry_int : std_logic_vector(N downto 0);
    component SOUS is port(
        A,B,Cin : in std_logic;
        Cout,S : out std_logic);
    end component SOUS;
    begin
        carry_int(0)<='0';
        sous_n_inst : For i in 0 to N-1 generate
            DIFF : sous port map(A(i),B(i),carry_int(i),carry_int(i+1),S(i));
        end generate;
	
 carry <= carry_int(N);
end bloc;

    
