library ieee;
use ieee.std_logic_1164.all;

entity sousnbit is
    generic(
        N:          natural
    );
    port(
        Ain, Bin:   in std_logic_vector(N-1 downto 0);
        S:          out std_logic_vector(N-1 downto 0);
        C:          out std_logic
    );
end;

architecture impl of sousnbit is
    signal Carries: std_logic_vector(N downto 0) := (others => '0');
    component sous1bit is
        port
        (
            Ain, Bin, Cin:  in std_logic;
            Cout, S:        out std_logic
        );
    end component;
begin
    Carries(0) <= '0';
    SOUSN_inst: for I in 0 to N-1 generate
        ADD: sous1bit port map(
            Ain(I),
            Bin(I),
            Carries(I),
            Carries(I+1),
            S(I)
        );
    end generate;

    C <= Carries(N);
end;