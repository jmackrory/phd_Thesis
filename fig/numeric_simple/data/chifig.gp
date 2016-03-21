#Batch file for use with gnuplot to output scaling for TM algorithms.

#Plot Scaling for 
fname='TM_G3.dat'
#Initial graphs
set term wxt 1
set logscale x
set logscale y
set title 'Ratio of TM to Strong Coupling'
set xlabel 'Chi'
set key left top
#Plot mean with errorbars
plot [0.001:2E3] [5E-4:1] fname u 1:(-$5) w l lw 1.5 t 'Anlt' ,\
fname u 1:($6/1.5):($8/1.5) w yerror lw 1.5 lt rgb 'blue' t 'Num'

  set term pdfcairo color size 10,6
  set output 'TM_atom_wall_chi.pdf'
  replot
 set output

#Plot Energy density for 2walls
fname='TM_2wall_energy_density.dat'
fanlt='TM2anlt.xint.dat'
#Initial graphs
set term wxt 2
unset logscale x
unset logscale y
set title ' TM Renormalized 2body Potential (d=1, chi=3, N=200, Nloops~4x10^5)'
set ylabel 'Potential'
set xlabel 'Position'
set key left bottom
#Plot mean with errorbars
plot fanlt u 1:2 w l t 'Anlt',\
     fname u 1:($2==2 ? $5 : 1/0):($6/1000) w yerrorl t 'P(T)=1/T^3',\
     fname u 1:($2==1 ? $5 : 1/0):($6/1000) w yerrorl t 'P(T)=Exp(-1/T)/T^3'

set term pdfcairo color size 10,6
set output 'TM_2wall_energy_density.pdf'
replot
set output

# set term wxt 2
# fname='TM_2wallb.avg'
# fanlt='TM2anltb.xint.dat'
# #Initial graphs

# unset logscale x
# unset logscale y
# set title ' TM Renormalized 2body Potential (d=2, chi=10, N=200, Nloops=10^6)'
# set ylabel 'Potential'
# set xlabel 'Position'
# set key left bottom
# #Plot mean with errorbars
# plot fanlt u 1:2 w l t 'Anlt',\
#      fname u 1:($2==2 ? $5 : 1/0):($6/1000) w yerrorl t 'P(T)=1/T^3',\
#      fname u 1:($2==1 ? $5 : 1/0):($6/1000) w yerrorl t 'P(T)=Exp(-1/T)/T^3'


set term wxt 3
fname='TM_2wall_sweep.dat'
fanlt='CasimirTM2.anlt.dat'
#Initial graphs

set title ' Total TM Renormalized 2body Energy (d=1, N=200, Nloops=10^6,NT=100,Nx=100)'
set ylabel 'Efficiency'
set xlabel 'chi'
set key left top
set logscale x
set logscale y
#Plot mean with errorbars
n=(4*pi**2)
plot [2E-3:2E3] fname u 1:4 w lp t 'Anlt2',\
     fname u 1:($2==2 ? $5*10/n : 1/0):($6/(n*100)) w yerrorl t 'P(T)=1/T^3',\
     fname u 1:($2==1 ? $5/n : 1/0):($6/(n*1000)) w yerrorl t 'P(T)=Exp(-1/T)/T^3'

   set term pdfcairo color size 10,6
   set output 'TM_2wall_chi.pdf'
   replot
  set output
