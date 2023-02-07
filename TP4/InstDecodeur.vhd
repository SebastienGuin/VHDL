library IEEE;
use IEEE.std_logic_1164.all;

entity InstDecodeur is
    port (
        entree : in  std_logic_vector(15 downto 0);
        ci  :    out std_logic;
        sm  :    out std_logic;
        opc :    out std_logic_vector(5 downto 0);
        dst :    out std_logic_vector(2 downto 0);
        cnd :    out std_logic_vector(2 downto 0);
        W   :    out std_logic_vector(15 downto 0)
    );
end InstDecodeur;

architecture archi of InstDecodeur is
begin
    process(entree)
    begin
        if entree(15) = '0' then
            W <= entree;
	    ci <= '0';
            sm <= '0';
            opc <= "000000";
            dst <= "000";
            cnd <= "000";
            dst(2) <= '1';
        else
            ci <= entree(15);
            sm <= entree(12);
            opc <= entree(11 downto 6);
            dst <= entree(5 downto 3);
            cnd <= entree(2 downto 0);

        end if;
    end process;
end archi;
