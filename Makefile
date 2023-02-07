TOP=RAM_tb
WAVE=$(TOP)_wave.ghw

all: analyze elaborate

analyze:
	#
	# etape d'analyse des entites/architectures
	#
	#ncpack -unlock tp_lib
	ncvhdl -V93 -WORK tp_lib -MESSAGES -NOCOPYRIGHT -LINE ../SRC_xpe2i5a010/TP3/RAM.vhd
	ncvhdl -V93 -WORK tp_lib -MESSAGES -NOCOPYRIGHT -LINE ../SRC_xpe2i5a010/TP3/$(TOP).vhd

elaborate:
	#
	# etape d'elaboration
	#
	ncelab -access rw -messages TP_LIB.$(TOP) -nowarn CUDEFB

run:
	#
	# attention a definir le temps de simulation qu'il vous faut
	#
	ncsim -gui TP_LIB.$(TOP) &

view:
	open /Users/sebastienguin/Applications/gtkwave $(WAVE)

clean:
	rm -f $(WAVE) $(TOP)
	rm -f *.cf *.o *.ghw
