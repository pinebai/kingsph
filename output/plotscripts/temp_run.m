% this is a script to bundle the functions together.
% temporary...
function temp_run(n,PROP)

[r prop h rho m]=load_r(n,PROP);
[x y]=grid_gen(r);
pp=m.*prop./rho;
prop_xy=interp(r,x,y,pp,h);
colormap('hot')
surf(x,y,prop_xy);shading interp;view([0 90])
xlabel('x');ylabel('y');title(PROP);colorbar;
endfunction
