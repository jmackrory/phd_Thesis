# Calculate Casimir TM energy with TM loops.  

clear all

dat = load('TEatomconv.dat')

Nperloop= dat(:,3); 
Nloops = dat(:,4);
anlt = dat(:,5);
num = dat(:,6);
numerr = dat(:,7);

per = ((num-anlt)./anlt);
numerr = abs(numerr./anlt);

  dlmwrite("TEatomconv1pb.dat",[Nperloop(Nloops==1000),per(Nloops==1000)],"delimiter","\t","precision","%20.10e")
  dlmwrite("TEatomconv2pb.dat",[Nperloop(Nloops==10000),per(Nloops==10000)],"delimiter","\t","precision","%20.10e")
  dlmwrite("TEatomconv3pb.dat",[Nperloop(Nloops==100000),per(Nloops==100000)],"delimiter","\t","precision","%20.10e")
  dlmwrite("TEatomconv4pb.dat",[Nperloop(Nloops==1000000),per(Nloops==1000000)],"delimiter","\t","precision","%20.10e")

  dlmwrite("TEatomconv1lb.dat",[Nloops(Nperloop==50),per(Nperloop==50)],"delimiter","\t","precision","%20.10e")
  dlmwrite("TEatomconv2lb.dat",[Nloops(Nperloop==500),per(Nperloop==500)],"delimiter","\t","precision","%20.10e")
  dlmwrite("TEatomconv3lb.dat",[Nloops(Nperloop==5000),per(Nperloop==5000)],"delimiter","\t","precision","%20.10e")
  dlmwrite("TEatomconv4lb.dat",[Nloops(Nperloop==50000),per(Nperloop==50000)],"delimiter","\t","precision","%20.10e")



figure(1)
loglog(Nperloop(Nloops==10^3),per(Nloops==10^3),'x-', ...
 Nperloop(Nloops==10^4),per(Nloops==10^4),'x-', ...
 Nperloop(Nloops==10^5),per(Nloops==10^5),'x-', ...
 Nperloop(Nloops==10^6),per(Nloops==10^6),'x-')
xlabel('Number of points per loop')
ylabel('Percentage error |Num - Anlt|/Anlt')
title('Percentage error for atom at chi=1, d=1')

legend(['Np=10^3'; 'Np=10^4'; 'Np=10^5'; 'Np=10^6'])

figure(2)
loglog(Nloops(Nperloop==5*10^1),per(Nperloop==50),'x-', ...
 Nloops(Nperloop==5*10^2),per(Nperloop==500),'x-', ...
 Nloops(Nperloop==5*10^3),per(Nperloop==5*10^3),'x-', ...
 Nloops(Nperloop==5*10^4),per(Nperloop==5*10^4),'x-')
xlabel('Number of loops')
ylabel('Percentage error |Num - Anlt|/Anlt')
title('Percentage error for atom at chi=1, d=1')


legend(['Nl=50'; 'Nl=500'; 'Nl=5000'; 'Nl=50000'])



%body % body %body


%body

dat = load('TEbodyconv.dat');

Nperloop= dat(:,3); 
Nloops = dat(:,4);
anlt = dat(:,5);
num = dat(:,6);
numerr = dat(:,7);

per = ((num-anlt)./anlt);
numerr = abs(numerr)./anlt;

  dlmwrite("TEbodyconv1pb.dat",[Nperloop(Nloops==1000),per(Nloops==1000)],"delimiter","\t","precision","%20.10e")
  dlmwrite("TEbodyconv2pb.dat",[Nperloop(Nloops==2000),per(Nloops==2000)],"delimiter","\t","precision","%20.10e")
  dlmwrite("TEbodyconv3pb.dat",[Nperloop(Nloops==4000),per(Nloops==4000)],"delimiter","\t","precision","%20.10e")
  dlmwrite("TEbodyconv4pb.dat",[Nperloop(Nloops==8000),per(Nloops==8000)],"delimiter","\t","precision","%20.10e")
  dlmwrite("TEbodyconv5pb.dat",[Nperloop(Nloops==16000),per(Nloops==16000)],"delimiter","\t","precision","%20.10e")

  dlmwrite("TEbodyconv1lb.dat",[Nloops(Nperloop==50),per(Nperloop==50)],"delimiter","\t","precision","%20.10e")
  dlmwrite("TEbodyconv2lb.dat",[Nloops(Nperloop==100),per(Nperloop==100)],"delimiter","\t","precision","%20.10e")
  dlmwrite("TEbodyconv3lb.dat",[Nloops(Nperloop==200),per(Nperloop==200)],"delimiter","\t","precision","%20.10e")
  dlmwrite("TEbodyconv4lb.dat",[Nloops(Nperloop==400),per(Nperloop==400)],"delimiter","\t","precision","%20.10e")
  dlmwrite("TEbodyconv5lb.dat",[Nloops(Nperloop==800),per(Nperloop==800)],"delimiter","\t","precision"
,"%20.10e")


figure(3)
loglog(Nperloop(Nloops==1000),per(Nloops==1000),'x-', ...
 Nperloop(Nloops==2000),per(Nloops==2000),'x-', ...
 Nperloop(Nloops==4000),per(Nloops==4000),'x-', ...
 Nperloop(Nloops==8000),per(Nloops==8000),'x-',...
 Nperloop(Nloops==16000),per(Nloops==16000),'x-')
xlabel('Number of points per loop')
ylabel('Percentage error |Num - Anlt|/Anlt')
title('Percentage error for body at chi=1, d=1')

legend(['Nl=1000'; 'Nl=2000'; 'Nl=4000'; 'Nl=8000';'Nl=16000'])

figure(4)
loglog(Nloops(Nperloop==50),per(Nperloop==50),'x-', ...
 Nloops(Nperloop==100),per(Nperloop==100),'x-', ...
 Nloops(Nperloop==200),per(Nperloop==200),'x-', ...
 Nloops(Nperloop==400),per(Nperloop==400),'x-', ...
 Nloops(Nperloop==800),per(Nperloop==800),'x-')
xlabel('Number of loops')
ylabel('Percentage error |Num - Anlt|/Anlt')
title('Percentage error for body at chi=1, d=1')


legend(['Np=50'; 'Np=100'; 'Np=200'; 'Np=400';'Np=800'])
