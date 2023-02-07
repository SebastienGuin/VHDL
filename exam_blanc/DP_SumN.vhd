library ieee;
use ieee.std_logic_1164.all;

entity DP_SumN is
  generic(N : natural := 16);
  port(
    In1, In2: in std_logic_vector(N-1 downto 0);
    load1, load2, clk, nrst, Cmux, done : in std_logic;
    sortie: out std_logic_vector(N-1 downto 0) := (others => 'Z')
  );
end DP_SumN;

architecture archi_DP_SumN of DP_SumN is
    signal sig0 : std_logic_vector(N-1 downto 0):= (others => '0');
    signal sous_out : std_logic_vector(N-1 downto 0);
    signal mux_out : std_logic_vector(N-1 downto 0);
    signal registre1_out : std_logic_vector(N-1 downto 0) := (others => '0');
    signal registre1_after_test_out : std_logic_vector(N-1 downto 0);
    signal registre2_out : std_logic_vector(N-1 downto 0):= (others => '0');
    signal add_out : std_logic_vector(N-1 downto 0) := (others => '0');
    signal CarrySousOut : std_logic := '0';
    signal CarryAddOut : std_logic := '0';


    component registre is
        generic(N : natural);
        port(
            D         : in std_logic_vector(N-1 downto 0);
            load      : in std_logic;
            Q         : out std_logic_vector(N-1 downto 0);
            clk, nrst : in std_logic
        );
    end component; 

    component mux is
        generic( N : natural := 4);
        port(
          D0, D1 : in std_logic_vector(N-1 downto 0);
          C : in std_logic;
          Y : out std_logic_vector(N-1 downto 0)
        );
    end component;

    component addnbit is
        generic(
            N:          natural
        );
        port(
            Ain, Bin:   in std_logic_vector(N-1 downto 0);
            S:          out std_logic_vector(N-1 downto 0);
            C:          out std_logic
        );
    end component ;

    component sousnbit is
        generic(
            N:          natural
        );
        port(
            Ain, Bin:   in std_logic_vector(N-1 downto 0);
            S:          out std_logic_vector(N-1 downto 0);
            C:          out std_logic
        );
    end component;

 begin

    mux_inst: mux
        generic map(N => N)
        port map (In1, registre1_out, Cmux, mux_out);

    sous_inst: sousnbit
        generic map(N => N)
        port map(
            Ain => mux_out,
            Bin => In2,
            S => sous_out,
            C => CarrySousOut
        );

    reg_inst1: registre
        generic map(N => N)
        port map(
            D    => sous_out,      --entrée
            load => load1,
            Q    => registre1_out, --sortie
            clk  => clk,
            nrst => nrst
        );

    add_inst: addnbit
        generic map(N => N)
        port map(
            Ain => mux_out,
            Bin => registre2_out,
            S => add_out,
            C => CarryAddOut
        );

    reg_inst2: registre
        generic map(N => N)
        port map(
            D    => add_out,      --entrée
            load => load2,
            Q    => registre2_out, --sortie
            clk  => clk,
            nrst => nrst
        );
    
    sortie <= add_out when done = '1';

end archi_DP_SumN;
