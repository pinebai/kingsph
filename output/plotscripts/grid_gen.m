% This is a script to create a grid
% all in 2D for now...
function [x y]=grid_gen(A)
rlow(1)=min(A(:,1));
rlow(2)=min(A(:,2));
rhigh(1)=max(A(:,1));
rhigh(2)=max(A(:,2));
np=length(A);
nr=floor(sqrt(np));

for i=1:nr
for j=1:nr
  x(i,j)=rlow(1)+(rhigh(1)-rlow(1))*((i-1)/(nr-1));
  y(i,j)=rlow(2)+(rhigh(2)-rlow(2))*((j-1)/(nr-1));
end
end
endfunction
