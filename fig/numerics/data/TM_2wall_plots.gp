# #Batch file for use with gnuplot to output scaling for TM algorithms.
# fname='TM_2wall.avg'
# fanlt='TM2anlt.xint.dat'
# #Initial graphs
# set term wxt 1
# unset logscale x
# unset logscale y
# set title ' TM Renormalized 2body Potential (d=1, chi=3, N=200, Nloops~4x10^5)'
# set ylabel 'Potential'
# set xlabel 'Position'
# set key left bottom
# #Plot mean with errorbars
# plot fanlt u 1:2 w l t 'Anlt',\
#      fname u 1:($2==2 ? $5 : 1/0):($6/1000) w yerrorl t 'P(T)=1/T^3',\
#      fname u 1:($2==1 ? $5 : 1/0):($6/1000) w yerrorl t 'P(T)=Exp(-1/T)/T^3'

#  # set term pdfcairo color size 10,6
#  # set output 'TM_2wall_x.pdf'
#  # replot
#  # set output

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

# set term wxt 3
# fname='TM_2wall_xintb.dat'
# fanlt='CasimirTM2.anlt.dat'
# #Initial graphs

# unset logscale x
# unset logscale y
# set title ' TM Renormalized 2body Potential (d=2, N=200, Nloops=10^4,NT=100,Nx=100)'
# set ylabel 'Energy'
# set xlabel 'chi'
# set key left top
# set logscale x
# set logscale y
# #Plot mean with errorbars
# plot fanlt u 1:2 w l t 'Anlt',\
#      fname u 1:($2==2 ? $4/5 : 1/0):($5/1000) w yerrorl t 'P(T)=1/T^3',\
#      fname u 1:($2==1 ? $4/5 : 1/0):($5/1000) w yerrorl t 'P(T)=Exp(-1/T)/T^3'


set term wxt 4
fname='TM_2wall_sweep.pre.avg'
fanlt='CasimirTM2.anlt.dat'
#Initial graphs

unset logscale x
unset logscale y
set title ' TM Renormalized 2body Potential (d=1, N=200, Nloops=10^6,NT=100,Nx=100)'
set ylabel 'Efficiency'
set xlabel 'chi'
set key left top
set logscale x
set logscale y
#Plot mean with errorbars
n=240/pi**2
plot fanlt u 1:2 w l t 'Anlt1',\
     fname u 1:($2==1 ? $4/(2*pi) : 1/0) w lp t 'Anlt2',\
     fname u 1:($2==1 ? $5/(360/pi**2) : 1/0):($6/(n*1000)) w yerrorl t 'P(T)=Exp(-1/T)/T^3'
#     fname u 1:($2==2 ? $5/(n**2) : 1/0):($6/(n*1000)) w yerrorl t 'P(T)=1/T^3',\


