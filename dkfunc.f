	subroutine dkfunc(dist,smdist,dw)
	implicit none
c	cubic spline interpolation function
	double precision dist,smdist,dw
	double precision q
	double precision pi
	parameter (pi = 3.14159265)
	q = dist/smdist
	if (q .lt. 1.0) then
		dw = -3.0*q + (9.0/4.0)*q**2.0
	else if (q .lt. 2.0) then
		dw = -0.75*(2.0-q)**2.0
	else
		dw = 0.0
	end if
	dw = 2.0*dw/(3.0*smdist**2.0)
c	gaussian kernel function
c	dw = (-2.0*dist/(sqrt(pi)*smdist**3.0))*exp(-1.0*rovh**2.0)
	return
	end
