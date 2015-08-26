% script to do the kernel calculations...
function w=kern(A,B)
  q=A/B;
  if(q<1.0)
    w=1.0-(3.0/2.0)*q**2.0 + (3.0/4.0)*q**3.0;
  else if(q<2)
	 w=0.25*(2.0-q)**3.0;
       else
	 w=0.0;
       endif
  endif
  w=w*10.0/(7.0*pi);
  w=w/B;
endfunction
