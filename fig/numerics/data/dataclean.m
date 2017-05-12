#Load in data from fortran.
#Output cleaned data for use with postscript routines to make figures.
#

clear all

#eff_const = pi.^4./(90);

#dat = load('TE_2wall_chi.dat');  #needs to have numchi, errchi scaled by eff_const
## dat = load('TE_2wall_chi3b.avg');
## Ntraj = 1E8
##    chi = dat(:,1); 
## 	 anlt = dat(:,4);
##    numchi = dat(:,5);
## 	 errchi = dat(:,6)/sqrt(Ntraj);

##    dlmwrite("TE_2wall_chi_num.dat",[chi,numchi,errchi],"delimiter","\t","precision","%20.10e")
##    dlmwrite("TE_2wall_chi_anlt.dat",[chi, anlt],"delimiter","\t","precision","%20.10e")

## dat = load('TE_atom_chi3b.avg');

## n=1.5;
## chi = dat(:,1); 
## anlt = dat(:,4);
## num = dat(:,5);
## err = dat(:,6)/sqrt(Ntraj);

## dlmwrite("TE_atom_chi_anlt.dat",[chi,anlt],"delimiter","\t","precision","%20.10e")
## dlmwrite("TE_atom_chi_num.dat",[chi,num,err],"delimiter","\t","precision","%20.10e")


#Second version with more trajectories

## #datN = load('TE_atom_N_simple2.avg');
## datN = load('TE_atom_N_fine3.avg');
## Ntraj=1E9;
## N1 = datN(:,1);
## chi = datN(:,2);
## anlt = datN(:,5);
## num = datN(:,6);
## err = datN(:,7)/sqrt(Ntraj);
## for n=0:6
## 		msk = chi==10^(n) & N1>=10;
## 		N = datN(msk,1);
## 		anlt = datN(msk,5);
## 		num = datN(msk,6);
## 		err = datN(msk,7)/sqrt(Ntraj);
## 		fn = strcat(["TE_atom_N_clean3.",num2str(n),".dat"])
## 		dlmwrite(fn,[N,abs(num./anlt-1),err./anlt],"delimiter","\t","precision","%20.10e")
## endfor

## msk = chi>=10^10 & N1>=10;
## N = datN(msk,1);
## anlt = datN(msk,5);
## num = datN(msk,6);
## err = datN(msk,7)/sqrt(Ntraj);
## fn = "TE_atom_N_clean3.inf.dat"
## dlmwrite(fn,[N,abs(num./anlt-1),err./anlt],"delimiter","\t","precision","%20.10e")

## #Two -wall convergence figures.
## datN = load('TE_2wall_N_fine3.avg');
## Ntraj=1E9;
## N1 = datN(:,1);
## chi = datN(:,2);
## anlt = datN(:,5);
## num  = datN(:,6);
## err = datN(:,7)/sqrt(Ntraj);
## for n=0:6
## 		msk = chi==10^(n) & N1>=10;
## 		N = datN(msk,1);
## 		anlt = datN(msk,5);
## 		num = datN(msk,6);
## 		err = datN(msk,7)/sqrt(Ntraj);
## 		fn = strcat(["TE_2wall_N_clean3.",num2str(n),".dat"])
## 		dlmwrite(fn,[N,abs(num./anlt-1),err./anlt],"delimiter","\t","precision","%20.10e")
## endfor

## msk = chi>=10^10 & N1>=10;
## N = datN(msk,1);
## anlt = datN(msk,5);
## num = datN(msk,6);
## err = datN(msk,7)/sqrt(Ntraj);
## fn = "TE_2wall_N_clean3.inf.dat"
## dlmwrite(fn,[N,abs(num./anlt-1),err./anlt],"delimiter","\t","precision","%20.10e")


#Atom interpolated convergence figures.
datN = load('TE_atom_N_interp.avg');
Ntraj=1E9;
N1 = datN(:,1);
chi = datN(:,2);
anlt = datN(:,5);
num  = datN(:,6);
err = datN(:,7)/sqrt(Ntraj);
for n=0:6
		msk = chi==10^(n) & N1>=10;
		N = datN(msk,1);
		anlt = datN(msk,5);
		num = datN(msk,6);
		err = datN(msk,7)/sqrt(Ntraj);
		fn = strcat(["TE_atom_N_interp.",num2str(n),".dat"])
		dlmwrite(fn,[N,abs(num./anlt-1),err./anlt],"delimiter","\t","precision","%20.10e")
endfor

msk = chi>=10^10 & N1>=10;
N = datN(msk,1);
anlt = datN(msk,5);
num = datN(msk,6);
err = datN(msk,7)/sqrt(Ntraj);
fn = "TE_atom_N_interp.inf.dat"
dlmwrite(fn,[N,abs(num./anlt-1),err./anlt],"delimiter","\t","precision","%20.10e")




## ## 2-wall scaling
## datN = load('TE_2wall_N_simple.dat');
## Ntraj = 10^9;
## ns = pi^4/90;

## anlt1=[5.73364E-7, 0.0033138544,0.188249946,0.422368217];

## for n=1:4
## 	msk = chi==100^(n-2) & N1>10;
## 		N = datN(msk,1);
## #		anlt = datN(msk,5);
## 		anlt = anlt1(n);
## 		num = datN(msk,6)/ns^2;
## 		err = datN(msk,7)/sqrt(Ntraj)/ns^2;
## 		 fn = strcat(["TE_2wall_N_clean.",num2str(n),".dat"])
## 		 dlmwrite(fn,[N,abs(num./anlt-1),err./anlt],"delimiter","\t","precision","%20.10e")
## 		ln = log(N);
## 		la  = log(abs(num./anlt-1));
## 		ea  = abs(err./num);
## 		pn = wpolyfit(ln,la,ea,1)
## 		nfit = exp(ln*pn(1)+pn(2));
## 		fn = strcat(["TE_2wall_N_fit.",num2str(n),".dat"])
## 		dlmwrite(fn,[N,exp(ln*pn(1)+pn(2))],"delimiter","\t","precision","%20.10e")
## 		## figure(2)
## 		## loglog(N,abs(num./anlt-1),N,exp(ln*pn(1)+pn(2)))
## 		## title('Relative error for 2wall energy')
## 		## sleep(4)
## endfor


## #Second version with 10^9 trajectories.

## datN = load('TE_2wall_N_simple2.avg');
## ns = pi^4/90;

## anlt1=[5.73364E-7, 0.0033138544,0.188249946,0.422368217];

## for n=1:4
## 	msk = chi==100^(n-2) & N1>10;
## 		N = datN(msk,1);
## 		anlt = anlt1(n);
## 		num = datN(msk,6)/ns^2;
## 		err = datN(msk,7)/sqrt(Ntraj)/ns^2;
## 		 fn = strcat(["TE_2wall_N_clean2.",num2str(n),".dat"])
## 		 dlmwrite(fn,[N,abs(num./anlt-1),err./anlt],"delimiter","\t","precision","%20.10e")
## 		ln = log(N);
## 		la  = log(abs(num./anlt-1));
## 		ea  = abs(err./num);
## 		pn = wpolyfit(ln,la,ea,1)
## 		nfit = exp(ln*pn(1)+pn(2));
## 		fn = strcat(["TE_2wall_N_fit2.",num2str(n),".dat"])
## 		dlmwrite(fn,[N,exp(ln*pn(1)+pn(2))],"delimiter","\t","precision","%20.10e")
## endfor


## N = datN(:,1);
## chi = datN(:,2);
## anlt = abs(datN(:,5));
## num = abs(datN(:,6))/(ns);
## err = datN(:,7)/sqrt(Ntraj)/ns^2;
## dlmwrite("TE_2wall_N_clean.dat",[N,abs(num./anlt-1),err./anlt],"delimiter","\t","precision","%20.10e")
## loglogerr(N,abs(num./anlt-1),err./anlt)

## ln = log(N);
## la  = log(abs(num./anlt-1));
## ea  = abs(err./num);
## pn = wpolyfit(ln,la,ea,1)

## nfit = exp(ln*pn(1)+pn(2));
## dlmwrite("TE_2wall_N_clean.dat",[N,exp(ln*pn(1)+pn(2))],"delimiter","\t","precision","%20.10e")
## figure(2)
## loglog(N,abs(num./anlt-1),N,exp(ln*pn(1)+pn(2)))


