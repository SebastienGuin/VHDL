library ieee;
use ieee.std_logic_1164.all;
use ieee.numeric_std.all;

entity FSM_SumN is
    Port ( clk : in  std_logic;
           rst : in  std_logic;
           start : in  std_logic;
           oppo : in  std_logic;
           choix : out  std_logic;
           load : out  std_logic;
           stopp : out  std_logic);
end FSM_SumN;

architecture archi_FSM_SumN of FSM_SumN is
    type FSM_SumN_etat is (Idle, Add, Decre, Outputt);
    signal etat_current, etat_next : FSM_SumN_etat;
 begin
    etat_reg : process(clk, rst)
     begin
        if rst = '1' then
            etat_current <= Idle;
        elsif rising_edge(clk) then
            etat_current <= etat_next;
        end if;
    end process etat_reg;
    
    etat_next_sortie : process(etat_current,start,oppo)
     begin  
        case etat_current is
            when Idle =>
                if (start = '1' and oppo = '1') then 
                    etat_next <= Add;
                    choix <= '0';
                    load <= '1';
                    stopp <= '0';
                elsif (start = '1' and oppo = '0') then
                    etat_next <= Outputt;
                    stopp <= '1';
                elsif start = '0' then 
                    etat_next <= Idle;
                    choix <= '0';
                    load <= '0';
                    stopp <= '0';
                end if; 
            when Add =>
                etat_next <= Decre;
                choix <= '1';
                load <= '1';
                stopp <= '0';
            when Decre =>
                if oppo = '1' then 
                    etat_next <= Add;
                    choix <= '0';
                    load <= '1';
                    stopp <= '0';
                elsif oppo = '0' then
                    etat_next <= Outputt;
                    stopp <= '1';
                end if ;
            when Outputt =>
                if oppo = '1' then
                    etat_next <= Idle;
                    choix <= '0';
                    load <= '0';
                    stopp <= '0';
                else  
                    etat_next <= Outputt;
                    stopp <= '1';
                end if; 
        end case;
    end process etat_next_sortie;
end archi_FSM_SumN;

            