% This is a function to interpolate the density.
% lets just assume m=1 for now!!
function P_xy=interp(A,X,Y,P,H)
np=length(A)
nr=floor(sqrt(np))
for i=1:nr
  for j=1:nr
    P_xy(i,j)=0.0;
    for k=1:np
      rk=sqrt((A(k,1)-X(i,j))**2 + (A(k,2)-Y(i,j)**2));
      if(rk<=2*H(k))
	P_xy(i,j)=P_xy(i,j)+P(k)*kern(rk,H(k));
      endif
      end
  end
end

endfunction
