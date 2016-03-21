% wall-wall.mp -- do not edit, generated automatically by thesis_master.tex
input feynmp
require_RCS_revision "1.30";
beginchar(1, 50*2.84526pt#, 30*2.84526pt#, 0);
"feynmf: 1";
LaTeX_unitlength:=2.84526pt;
subgraph (0, 0, w, h);
vinit;
pickup pencircle scaled thin;
vtop (__t0, __t1, __t2, __t3);
vbottom (__b0, __b1, __b2, __b3);
vconnect ("phantom", __t1, __v1);
vconnect ("phantom", __t2, __v3);
vconnect ("phantom", __b1, __v2);
vconnect ("phantom", __b2, __v4);
vfreeze;
vconnect ("photon", __v1, __v3);
vconnect ("photon", __v2, __v4);
vconnect ("fermion,tension=0", __v1, __v2);
vconnect ("fermion,tension=0,left", __v2, __v1);
vconnect ("fermion,tension=0", __v3, __v4);
vconnect ("fermion,tension=0,right", __v4, __v3);
vfreeze;
vdraw;
endsubgraph;
endchar;
% the end.
end.
endinput;
