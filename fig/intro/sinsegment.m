clear all

N = 100;

d = 1;

a = 0.15;

xmax = 1.5;

#Left, Middle, Right
xL = linspace(-xmax,-d/2,N);
xM = linspace(-d/2,d/2,N);
xR = linspace(d/2,xmax,N);

xtot = [xL';xM';xR'];

s1 = a*cos(pi*xtot);
s2 = a*sin(2*pi*xtot)+1;
s3 = a*cos(3*pi*xtot)+2;

snaL = a*sin(0.5*pi*(xL+d/2))-.5;
snaR = a*sin(0.5*pi*(xR-d/2))-.5;

s2aL = a*sin(1.5*pi*(xL+d/2))+.5;
s2aR = a*sin(1.5*pi*(xR-d/2))+.5;

s3aL = a*sin(2.5*pi*(xL+d/2))+1.5;
s3aR = a*sin(2.5*pi*(xR-d/2))+1.5;

## plot(xtot,s1,xtot,s2,xtot,s3)
## hold on
## plot(xL,s2aL,xR,s2aR,xL,s3aL, xR,s3aR,xL,snaL, xR, snaR)
## plot(-d/2*[1,1],[-1,1])
## plot(d/2*[1,1],[-1,1])
## hold off

figure(1)
plot(xtot,s1,xtot,s2)
hold on
plot(xL,s2aL,xR,s2aR,xL,snaL, xR, snaR,xL,s3aL, xR, s3aR)
plot(-d/2*[1,1],[-1,2])
plot(d/2*[1,1],[-1,2])
hold off

#negative
dlmwrite('sinnL.dat',[xL',snaL'],' ')
dlmwrite('sinnR.dat',[xR',snaR'],' ')

#first positive
dlmwrite('sin2aL.dat',[xL',s2aL'],' ')
dlmwrite('sin2aR.dat',[xR',s2aR'],' ')

#first positive
dlmwrite('sin3aL.dat',[xL',s3aL'],' ')
dlmwrite('sin3aR.dat',[xR',s3aR'],' ')

#first complete
dlmwrite('sin1.dat',[xtot,s1],' ')
dlmwrite('sin2.dat',[xtot,s2],' ')
