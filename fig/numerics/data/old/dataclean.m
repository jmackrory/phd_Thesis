#Load in data from fortran.
#Output cleaned data for use with postscript routines to make figures.
#

clear all

  # eff_const = pi.^2./(720);

  # dat = load('TEtest.dat');

  # chi = dat(:,1); 
  # numchi = dat(:,5);
	# errchi = dat(:,6);

  # dlmwrite("TEbodychi_num.dat",[chi,numchi/eff_const,errchi/eff_const],"delimiter","\t","precision","%20.10e")

	# anlt = load('TEanlt.dat');
  # dlmwrite("TEbodychi_anlt.dat",[anlt(:,1),-anlt(:,3)/eff_const],"delimiter","\t","precision","%20.10e")


#distance dependent graphs

  # dat = load('TEbodyd.dat');
  # d   = dat(:,2); 
  # numd = dat(:,6);
	# errd = dat(:,7);

  # dlmwrite("TEbodyd_num.dat",[d,numd/eff_const,errd/eff_const],"delimiter","\t","precision","%20.10e")

  # dlmwrite("TEbodyd_anlt.dat",[d,-anlt(anlt(:,1)==1,3)./eff_const./d.^3],"delimiter","\t","precision","%20.10e")


# dat = load('TEatomchi.dat');

# chi = dat(:,1); 
# d = dat(:,2);
# anlt = dat(:,5);
# num = dat(:,6);
# err = dat(:,7);

# dlmwrite("TEatomchi_anlt.dat",[chi,anlt],"delimiter","\t","precision","%20.10e")
# dlmwrite("TEatomchi_num.dat",[chi,num,err],"delimiter","\t","precision","%20.10e")


# Convergence figures 
#Convergence as function of number of loops
#datL = load('TEatomL2.dat');
#datL(1,:)=[];
#L = datL(:,1);
#anlt = datL(:,2);
#num = datL(:,3);
#err = datL(:,4);
#fit linear relation - use power law
#ln = log(L);
#la  = log(abs(num./anlt-1));
#ea  = abs(err./num);

#pn = wpolyfit(ln,la,1)
#nfit = exp(ln*pn(1)+pn(2));
#dlmwrite("TEatomL_fit.dat",[L,exp(ln*pn(1)+pn(2))],"delimiter","\t","precision","%20.10e")

#figure(1)
#loglog(L,abs(num./anlt-1),L,exp(ln*pn(1)+pn(2)))
#dlmwrite("TEatomL_clean.dat",[L,abs(num./anlt-1),err./anlt],"delimiter","\t","precision","%20.10e")


## #Convergence as function of loop size (Old version with deterministic integrals)
## datN = load('TE_atom_N.dat');
## N = datN(:,3);
## anlt = datN(:,5);
## num = datN(:,6);
## err = datN(:,7);

## dlmwrite("TEatomN_clean_old.dat",[N,abs(num./anlt-1),err./anlt],"delimiter","\t","precision","%20.10e")

## ln = log(N);
## la  = log(abs(num./anlt-1));
## ea  = abs(err./num);
## pn = wpolyfit(ln,la,ea,1)

## nfit = exp(ln*pn(1)+pn(2));
## dlmwrite("TEatomN_fit_old.dat",[N,exp(ln*pn(1)+pn(2))],"delimiter","\t","precision","%20.10e")
## figure(2)
## loglog(N,abs(num./anlt-1),N,exp(ln*pn(1)+pn(2)))

## datN = load('TEbodyN.dat');
## N = datN(:,3);
## anlt = abs(datN(:,4));
## num = abs(datN(:,5));
## err = datN(:,6);
## dlmwrite("TEbodyN_clean_old.dat",[N,abs(num./anlt-1),err./anlt],"delimiter","\t","precision","%20.10e")
## loglogerr(N,abs(num./anlt-1),err./anlt)

## ln = log(N);
## la  = log(abs(num./anlt-1));
## ea  = abs(err./num);
## pn = wpolyfit(ln,la,ea,1)

## nfit = exp(ln*pn(1)+pn(2));
## dlmwrite("TEbodyN_fit_old.dat",[N,exp(ln*pn(1)+pn(2))],"delimiter","\t","precision","%20.10e")
## figure(2)
## loglog(N,abs(num./anlt-1),N,exp(ln*pn(1)+pn(2)))


#Convergence as function of loop size
#Accidently scaled wrong way in code by ns, need to undo, and fix issue by squaring.
datN = load('TE_atom_N_simple.dat');
Ntraj=1E8;
N1 = datN(:,1);
chi = datN(:,2);
anlt = datN(:,5);
num = datN(:,6);
err = datN(:,7)/sqrt(Ntraj);

for n=1:4
		msk = chi==100^(n-2) & N1>10;
		N = datN(msk,1);
		anlt = datN(msk,5);
		num = datN(msk,6);
		err = datN(msk,7)/sqrt(Ntraj);
#		fn = strcat(["TE_atom_N_clean.",num2str(n),".dat"])
#		dlmwrite(fn,[N,abs(num./anlt-1),err./anlt],"delimiter","\t","precision","%20.10e")
		ln = log(N);
		la  = log(abs(num./anlt-1));
		ea  = abs(err./num);
		pn = wpolyfit(ln,la,ea,1)
		nfit = exp(ln*pn(1)+pn(2));
		## fn = strcat(["TE_atom_N_fit.",num2str(n),".dat"])
		## dlmwrite(fn,[N,exp(ln*pn(1)+pn(2))],"delimiter","\t","precision","%20.10e")
		figure(1)
		loglog(N,abs(num./anlt-1),N,exp(ln*pn(1)+pn(2)))
		title('Relative error for 1wall energy')
		sleep(4)
endfor



## 2-wall scaling
datN = load('TE_2wall_N_simple.dat');
ns = pi^4/90;


for n=1:4
		msk = chi==100^(n-2) & N1>10;
		N = datN(msk,1);
		anlt = datN(msk,5);
		num = datN(msk,6)/ns^2;
		err = datN(msk,7)/sqrt(Ntraj)/ns^2;
		## fn = strcat(["TE_2wall_N_clean.",num2str(n),".dat"])
		## dlmwrite(fn,[N,abs(num./anlt-1),err./anlt],"delimiter","\t","precision","%20.10e")
		ln = log(N);
		la  = log(abs(num./anlt-1));
		ea  = abs(err./num);
		pn = wpolyfit(ln,la,ea,1)
		nfit = exp(ln*pn(1)+pn(2));
		## fn = strcat(["TE_2wall_N_fit.",num2str(n),".dat"])
		## dlmwrite(fn,[N,exp(ln*pn(1)+pn(2))],"delimiter","\t","precision","%20.10e")
		figure(2)
		loglog(N,abs(num./anlt-1),N,exp(ln*pn(1)+pn(2)))
		title('Relative error for 2wall energy')
		sleep(4)
endfor


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


