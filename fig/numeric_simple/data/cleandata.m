#Read in data files, scale appropriately, and output x,y, yerr
#columns to file.  Intended to output data for use with PostScript.  

#Read in Data for TM chi efficiency.
#Note Extra fudge factor of 1.5(!)
cd ~/papers/worldline2/fig/data
pwd
TMdat = load('TM_G3.dat');
TMdat(:,2:4)=[];
dlmwrite('TM_atom_wall_eff.clean.dat',[TMdat(:,1),TMdat(:,3:4)/1.5]," ")
dlmwrite('TMeff.dat',[TMdat(:,1),TMdat(:,3)]," ")   
dlmwrite('TM_atom_wall_anlt.clean.dat',[TMdat(:,1),abs(TMdat(:,2))]," ")

#Write out just files for energy density.
TMdat=load('TM_2wall_energy_density.dat');
msk = TMdat(:,2)==1;
dlmwrite('TM_2wall_energy_density_expT.clean.dat',[TMdat(msk,1),TMdat(msk,5),TMdat(msk,6)/1E3]," ")
msk = TMdat(:,2)==2;
dlmwrite('TM_2wall_energy_density_T3.clean.dat',[TMdat(msk,1),TMdat(msk,5),TMdat(msk,6)/1E3]," ")

#Write out TM 2wall chi dependence
TMdat=load('TM_2wall_sweep.dat');
msk = TMdat(:,2)==1;
n = 4*pi^2;
dlmwrite('TM_2wall_eff_anlt.clean.dat',[TMdat(msk,1),TMdat(msk,4)]," ")
dlmwrite('TM_2wall_eff_expT.clean.dat',[TMdat(msk,1),TMdat(msk,5)/n,TMdat(msk,6)/(n*1E3)]," ")
