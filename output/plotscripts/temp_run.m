% this is a script to bundle the functions together.
% temporary...

[r rho h]=load_r(1,'rho');
[x y]=grid_gen(r);
prop_xy=interp(r,x,y,rho,h);
