% This is a function to load the particle position data from
% kingsph and plot it in 3d. It's only a few lines.
function kingsph_pp_2d (n)
clear A
if(n<=9) p1='r0000';
elseif(n<=99) p1='r000';
elseif(n<=999) p1='r00';
elseif(n<=9999) p1='r0';
else p1='r';
endif
fname=strcat(p1,num2str(n),'.out');
A=load(fname);
plot(A(:,1),A(:,2),'k.')
axis([-1 1 -1 1])
endfunction



