% this is a script to bundle the functions together.
% temporary...
function temp_run(n,prop)

[r rho h]=load_r(n,prop);
[x y]=grid_gen(r);
prop_xy=interp(r,x,y,rho,h);
colormap('hot')
surf(x,y,prop_xy);shading interp;view([0 90])
xlabel('x');ylabel('y');colorbar;
endfunction
