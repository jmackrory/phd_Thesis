% atom-loop.mp -- do not edit, generated automatically by thesis_master.tex
input feynmp
require_RCS_revision "1.30";
beginchar(1, 100*2.84526pt#, 60*2.84526pt#, 0);
"feynmf: 1";
LaTeX_unitlength:=2.84526pt;
subgraph (0, 0, w, h);
vinit;
pickup pencircle scaled thin;
vleft (__i);
vright (__o);
vtop (__t);
vconnect ("plain", __i, __v1);
vconnect ("plain", __v2, __o);
vconnect ("plain,label=$|e\rangle $", __v1, __v2);
vconnect ("photon,left=0.5,tension=.4", __v1, __vt, __v2);
vconnect ("phantom,tension=1", __t, __vt);
vlabel ("$|g\rangle $", __i);
vlabel ("$|g\rangle $", __o);
vlabel ("$\gamma $", __vt);
vfreeze;
vdraw;
endsubgraph;
endchar;
% the end.
end.
endinput;
