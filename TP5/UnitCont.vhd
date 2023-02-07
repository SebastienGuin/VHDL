library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity UnitCont is
  generic(
        load_file_name : string;
	N : natural := 16
    );
    port (
        entree : in  std_logic_vector(15 downto 0);
        jmp    : out std_logic;
        clk, nrst : in std_logic;
		MemRegs_Aout : inout  std_logic_vector(N-1 downto 0)
    );
end UnitCont;

architecture archi_UnitCont of UnitCont is

	signal ci  :     std_logic;
    signal sm  :     std_logic;
    signal opc :     std_logic_vector(5 downto 0);
    signal dst :     std_logic_vector(2 downto 0);
    signal cnd :     std_logic_vector(2 downto 0);
    signal W   :     std_logic_vector(15 downto 0);
	signal MemRegs_Dout, MemRegs_FromMem_SA : std_logic_vector(N-1 downto 0);
	signal Mux1_out :  std_logic_vector(N-1 downto 0);
	signal Mux2_out :  std_logic_vector(N-1 downto 0);
	signal convert :  signed(N-1 downto 0);
	signal ALU_out : std_logic_vector(N-1 downto 0);

	component InstDecodeur is
	    port (
		entree : in  std_logic_vector(15 downto 0);
		ci  :    out std_logic;
		sm  :    out std_logic;
		opc :    out std_logic_vector(5 downto 0);
		dst :    out std_logic_vector(2 downto 0);
		cnd :    out std_logic_vector(2 downto 0);
		W   :    out std_logic_vector(15 downto 0)
	    );
	end component;

	component memregs is
	    generic(
		load_file : string;
		size : natural := 4
	    );
	    port(
		a, d                : in std_logic;
		sa		    : in std_logic;
		clk, nrst           : in std_logic;
		Xin                 : in std_logic_vector(size-1 downto 0);
		Aout, Dout, FromMem : out std_logic_vector(size-1 downto 0)
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

	component ALU is
	  generic(N : natural := 4);
	  port(
	    X, Y : in std_logic_vector(N-1 downto 0);
	    zx, zy, nx, ny, f, no : in std_logic;
	    S : out std_logic_vector(N-1 downto 0)
	  );
	end component;

	component condition is
	    generic(N : natural := 4);
	    port(
		Xin        : in signed(N-1 downto 0);
		lt, eq, gt : in std_logic;
		jmp        : out std_logic
	    );
	end component;

begin
    InstDecodeur_inst: InstDecodeur
    	port map(entree, ci, sm, opc, dst, cnd, W);

    Memregs_inst: memregs
    	generic map(load_file => load_file_name, size => N)
    	port map(dst(2), dst(1), dst(0), clk, nrst, Mux2_out, MemRegs_Aout, MemRegs_Dout, MemRegs_FromMem_SA);

    MUX1_inst: mux
    	generic map(N => N)
    	port map(MemRegs_Aout, MemRegs_FromMem_SA, sm, Mux1_out);

   ALU_inst: ALU
    	generic map(N => N)
    	port map(MemRegs_Dout, Mux1_out, opc(5), opc(3), opc(4), opc(2), opc(1), opc(0), ALU_out);

   MUX2_inst: mux
    	generic map(N => N)
    	port map(W,ALU_out, ci, Mux2_out);
   
   convert <= signed(Mux2_out);

   cond_inst: condition
    	generic map(N => N)
    	port map(convert, cnd(2),cnd(1),cnd(0), jmp);
	
end archi_UnitCont;
