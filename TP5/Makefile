TOP=UnitCont_tb
WAVE=$(TOP)_wave.ghw

all: analyze elaborate

analyze:
	#
	# etape d'analyse des entites/architectures
	#
	ghdl -a --work=TP_LIB --ieee=synopsys -fexplicit ../TP1/ADD.vhd
	ghdl -a --work=TP_LIB --ieee=synopsys -fexplicit ../TP1/exo1_1.vhd
	ghdl -a --work=TP_LIB --ieee=synopsys -fexplicit ../TP1/exo1_2.vhd
	ghdl -a --work=TP_LIB --ieee=synopsys -fexplicit ../TP1/exo3_SOUS.vhd
	ghdl -a --work=TP_LIB --ieee=synopsys -fexplicit ../TP2/ADD_N.vhd
	ghdl -a --work=TP_LIB --ieee=synopsys -fexplicit ../TP2/Incrementeur.vhd
	ghdl -a --work=TP_LIB --ieee=synopsys -fexplicit ../TP2/inverseur.vhd
	ghdl -a --work=TP_LIB --ieee=synopsys -fexplicit ../TP2/inverseur_nbits.vhd
	ghdl -a --work=TP_LIB --ieee=synopsys -fexplicit ../TP2/mux.vhd
	ghdl -a --work=TP_LIB --ieee=synopsys -fexplicit ../TP2/registre.vhd
	ghdl -a --work=TP_LIB --ieee=synopsys -fexplicit ../TP3/ALU.vhd
	ghdl -a --work=TP_LIB --ieee=synopsys -fexplicit ../TP3/LoadCount.vhd
	ghdl -a --work=TP_LIB --ieee=synopsys -fexplicit ../TP3/ModifIN.vhd
	ghdl -a --work=TP_LIB --ieee=synopsys -fexplicit ../TP3/RAM.vhd
	ghdl -a --work=TP_LIB --ieee=synopsys -fexplicit ../TP4/condition.vhd
	ghdl -a --work=TP_LIB --ieee=synopsys -fexplicit ../TP4/InstDecodeur.vhd
	ghdl -a --work=TP_LIB --ieee=synopsys -fexplicit ../TP4/isneg.vhd
	ghdl -a --work=TP_LIB --ieee=synopsys -fexplicit ../TP4/iszero.vhd
	ghdl -a --work=TP_LIB --ieee=synopsys -fexplicit ../TP4/memregs.vhd
	ghdl -a --work=TP_LIB --ieee=synopsys -fexplicit ../TP4/PGCounter.vhd
	ghdl -a --work=TP_LIB --ieee=synopsys -fexplicit ./UnitCont.vhd
	ghdl -a --work=TP_LIB --ieee=synopsys -fexplicit ./$(TOP).vhd

elaborate:
	#
	# etape d'elaboration
	#
	ghdl -e --work=TP_LIB --ieee=synopsys -fexplicit $(TOP) # elabore le modele

run:
	#
	# attention a definir le temps de simulation qu'il vous faut
	#
	ghdl -r --work=TP_LIB --ieee=synopsys -fexplicit  $(TOP) --wave=$(WAVE) --stop-time=1ms

view:
	gtkwave $(WAVE)

clean:
	rm -f $(WAVE) $(TOP)
	rm -f *.cf *.o *.ghw
