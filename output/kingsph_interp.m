% this should find neighbours and interp
for i=1:2
   rlow(i)=-1.0
   rhigh(i)=1.0
end
crn = 25
dx=(rhigh(1)-rlow(1))/crn
dy=(rhigh(2)-rlow(2))/crn
for i=1:crn
	for j=1:crn
		x1(i,j)=rlow(1)+0.5*dx+(i-1)*dx;
                y1(i,j)=rlow(2)+0.5*dy+(j-1)*dy;
	end
end
% I've made a grid. Time to find where to look.

