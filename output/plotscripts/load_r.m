% This is a script to load the positions and density
function [A B C RHO M]=load_r(n,prop)
if(n<=9) p1='0000';
elseif(n<=99) p1='000';
elseif(n<=999) p1='00';
elseif(n<=9999) p1='0';
else p1='';
endif
fname1=strcat('../r',p1,num2str(n),'.out');
A=load(fname1);
fname2=strcat('../',prop,p1,num2str(n),'.out');
B1=load(fname2);
B=B1(:,2);
fname3=strcat('../h',p1,num2str(n),'.out');
C1=load(fname3);
C=C1(:,2);
fname4=strcat('../m',p1,num2str(n),'.out');
M1=load(fname4);
M=M1(:,2);
fname5=strcat('../rho',p1,num2str(n),'.out');
RHO1=load(fname5);
RHO=RHO1(:,2);
endfunction
