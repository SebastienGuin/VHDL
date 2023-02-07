library ieee;
use ieee.std_logic_1164.all;

entity INCREMENT is
        generic (N: natural:=4);
	port(
		X  : in std_logic_vector (N-1 downto 0);
		Xplus1: out std_logic_vector(N-1 downto 0)
	);
end INCREMENT;

architecture incr of INCREMENT is
   signal tmp:std_logic_vector (N-1 downto 1):= (others => '0');
   signal tmp1:std_logic_vector (N-1 downto 0);
    component ADD_N is
        generic (N: natural:=4);
	port(
		A, B  : in std_logic_vector (N-1 downto 0);
                S : out std_logic_vector (N-1 downto 0);
		Carry: out std_logic
	);
    end component ADD_N;
    
  
begin
      tmp1<= tmp & '1';
      INCR_inst: ADD_N
         generic map ( N => N)
         port map ( A => X, B => tmp1, S => Xplus1, Carry => open );
end incr;


