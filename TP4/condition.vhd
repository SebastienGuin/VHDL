library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;


entity condition is
    generic(N : natural := 4);
    port(
        Xin        : in signed(N-1 downto 0);
        lt, eq, gt : in std_logic;
        jmp        : out std_logic
    );
end condition;

architecture bloc of condition is
    component iszero is
        generic(N : natural := 4);
        port(
            entree : in signed(N-1 downto 0);
            sortie : out std_logic
        );
    end component;
    component isneg is
        generic(N : natural := 4);
        port(
            entree : in signed(N-1 downto 0);
            sortie : out std_logic
        );
    end component;
    signal inter1   : std_logic;
    signal inter2   : std_logic;
    signal res_zero : std_logic;
    signal res_neg  : std_logic;
begin
    iszero_inst: iszero
        generic map(N => N)
        port map(
            entree => Xin,
            sortie => res_zero
        );
    isneg_inst: isneg
        generic map(N => N)
        port map(
            entree => Xin,
            sortie => res_neg
        );
    inter1 <= not(res_zero xor res_neg);
    inter2 <= (eq and res_zero) or (lt and res_neg);
    jmp    <= (inter1 and gt) or inter2;
end bloc;

