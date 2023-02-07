library ieee;
use ieee.std_logic_1164.all;

entity registre is
  generic(N : natural := 16);
  port(
    D : in std_logic_vector(N-1 downto 0);
    load : in std_logic;
    Q : out std_logic_vector(N-1 downto 0);
    clk, nrst : in std_logic
  );
end registre;

architecture bloc of registre is
begin
  process(clk, nrst)
  begin
    if(nrst='0') then
      Q<=(others => '0');
    else
      if(rising_edge(clk) and clk='1') then
        if(load='1') then
          Q<=D;
        end if;
      end if;
    end if;
  end process;
end bloc;
