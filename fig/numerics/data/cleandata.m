#Read in data files, scale appropriately, and output x,y, yerr
#columns to file.  Intended to output data for use with PostScript.  

#Read in Data for TM chi efficiency.
#Note Extra fudge factor of 1.5(!)

TMdat = load('TM_atom_test3.dat');
N=1E9;
dlmwrite('TM_atom_wall_eff.clean.dat',[TMdat(:,1),TMdat(:,7),TMdat(:,8)/sqrt(N)],"  ")
dlmwrite('TM_atom_wall_anlt.clean.dat',[TMdat(:,1),abs(TMdat(:,6))],"  ")

TMdat = load('TM_2wall_N200.dat');
N=4.4E8;
dlmwrite('TM_2wall_eff.clean.dat',[TMdat(:,1),TMdat(:,5),TMdat(:,6)/sqrt(N)],"  ")
dlmwrite('TM_2wall_anlt.clean.dat',[TMdat(:,1),abs(TMdat(:,4))],"  ")

## pwd
## TMdat = load('TM_G3.dat');
## TMdat(:,2:4)=[];
## dlmwrite('TM_atom_wall_eff.clean.dat',[TMdat(:,1),TMdat(:,3:4)/1.5]," ")
## dlmwrite('TMeff.dat',[TMdat(:,1),TMdat(:,3)]," ")   
## dlmwrite('TM_atom_wall_anlt.clean.dat',[TMdat(:,1),abs(TMdat(:,2))]," ")

## #Write out just files for energy density.
## TMdat=load('TM_2wall_energy_density.dat');
## msk = TMdat(:,2)==1;
## dlmwrite('TM_2wall_energy_density_expT.clean.dat',[TMdat(msk,1),TMdat(msk,5),TMdat(msk,6)/1E3]," ")
## msk = TMdat(:,2)==2;
## dlmwrite('TM_2wall_energy_density_T3.clean.dat',[TMdat(msk,1),TMdat(msk,5),TMdat(msk,6)/1E3]," ")


## function y = stats(x)

## y = [mean(x); std(x)/sqrt(length(x))];

## endfunction

## dat = load('TM_2wall_sweep.tot');
## chi = 4.^((1:10)-5);
## for n=1:10;
## 	 m1 = dat(:,1)==chi(n) & dat(:,2)==1;
## 	 sum(m1);
## 	 anlt(n) = dat(2*n,4);
## 	 num(n,:) = stats(dat(m1,5));
## endfor
## n = 4*pi^2;
## num = num/n;
## dlmwrite('TM_2wall_eff_anlt.clean.dat',[chi',anlt']," ")
## dlmwrite('TM_2wall_eff_expT.clean.dat',[chi',num(:,1),num(:,2)]," ")



## ## #Write out TM 2wall chi dependence
## ## TMdat=load('TM_2wall_sweep.dat');
## ## msk = TMdat(:,2)==1;
## ## n = 4*pi^2;
## ## dlmwrite('TM_2wall_eff_anlt.clean.dat',[TMdat(msk,1),TMdat(msk,4)]," ")
## ## dlmwrite('TM_2wall_eff_expT.clean.dat',[TMdat(msk,1),TMdat(msk,5)/n,TMdat(msk,6)/(n*1E3)]," ")

## #Output variance.  
## Ndat=load('TM_scalingN3.dat');
## msk = Ndat(:,2)==1;
## dlmwrite('TM_scalingN_var.TM.dat',[Ndat(msk,1),Ndat(msk,9)]," ")
## msk = Ndat(:,2)==2;
## dlmwrite('TM_scalingN_var.gauss.dat',[Ndat(msk,1),Ndat(msk,9)]," ")
## msk = Ndat(:,2)==3;
## dlmwrite('TM_scalingN_var.TMBD.dat',[Ndat(msk,1),Ndat(msk,9)]," ")
## msk = Ndat(:,2)==4;
## dlmwrite('TM_scalingN_var.gaussBD.dat',[Ndat(msk,1),Ndat(msk,9)]," ")

## #Output execution time





