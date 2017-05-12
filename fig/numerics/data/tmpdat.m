clear all

N=20;
xmax = 2;
x = linspace(-xmax,xmax,N);

y = 10.^x;

z = 1-0.9*exp(-sqrt(y));
errz = abs(randn(1,N)).*0.8.*z;
dlmwrite('tmp.dat',[y',z',errz']," ")
