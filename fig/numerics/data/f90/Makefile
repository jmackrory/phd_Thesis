F90      = gfortran
F90FLAGS = -O3 -fexternal-blas
  F90CFLAGS = -c
  F90LFLAGS = 
  CPP       = gcc
  CPPFLAGS  = -E -P -C

F90_COMPILE  = $(F90) $(F90FLAGS) $(F90CFLAGS)
F90_LOAD     = $(F90) $(F90FLAGS) $(F90LFLAGS)

MAINFILE = casimir
average = casimir_avg

OBJ_avg = casimir_avg.o

#.IGNORE:

.SUFFIXES:
.SUFFIXES: .f90 .o

.f90.o:
	$(F90_COMPILE) $*.f90

all: $(MAINFILE) 

$(MAINFILE): casimir.o $(OBJS)
	$(F90_LOAD) casimir.o $(OBJS) $(LIBRARIES) -o $(MAINFILE)

casimir.o: globals.o random_pl.o timing.o utilities.o  loops.o\
           sort.o param_parser.o Tintegration.o Xintegration.o efficiency.o

loops.o: globals.o random_pl.o output.o 
sort.o: globals.o
efficiency.o: globals.o
Tintegration.o: globals.o sort.o output.o 
Xintegration.o: globals.o Tintegration.o
output.o: globals.o random_pl.o timing.o utilities.o 
param_parser.o: globals.o output.o timing.o utilities.o
random_pl.o: globals.o
utilities.o: globals.o

clean:
	rm -f *.o *.mod *.lst *.d *.ipa *.ipo *.il *.s work.pc*
	rm -f casimir


