% This is a function to load the data from
% kingsph 
function kingsph_load (n)
  clear A
  clear r
  clear rho
  clear p
if(n<=9) p1='0000';
elseif(n<=99) p1='000';
elseif(n<=999) p1='00';
elseif(n<=9999) p1='0';
else p1='';
endif
% just position, density and pressure for now
fname=strcat('r',p1,num2str(n),'.out');r=load(fname);
fname=strcat('rho',p1,num2str(n),'.out');A=load(fname);rho=A(:,2);clear A;
fname=strcat('p',p1,num2str(n),'.out');A=load(fname);p=A(:,2);clear A;
fname=strcat('h',p1,num2str(n),'.out');A=load(fname);h=A(:,2);clear A;
endfunction
