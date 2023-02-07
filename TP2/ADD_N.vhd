library ieee;
use ieee.std_logic_1164.all;

entity ADD_N is
        generic (N: natural );
	port(
		A, B  : in std_logic_vector (N-1 downto 0);
    S : out std_logic_vector (N-1 downto 0);
		Carry: out std_logic
	);
end ADD_N;

architecture str of ADD_N is
  signal carry_int:std_logic_vector (N downto 0)  := (others => '0') ;
    component ADD is
      port(
             A,B,Cin: in std_logic;
             Cout, S: out std_logic
          );
    end component ADD;
begin
      carry_int(0)<='0';
      ADD_N_inst  :for i in 0 to N-1 generate
        AN: ADD port map(A(i),B(i),carry_int(i),carry_int(i+1),S(i));
      end generate ADD_N_inst;
      Carry<=carry_int(N);
end str;


