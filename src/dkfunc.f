	subroutine dkfunc(dist,smdist,dims,dw)
	implicit none
c	cubic spline interpolation function
	integer dims
	double precision dist,smdist,dw
	double precision q,sigw(3)
	double precision pi
	parameter (pi = 3.14159265)
	sigw(1)=2.0/3.0
	sigw(2)=10.0/(7.0*pi)
	sigw(3)=1.0/pi
	q = dist/smdist
	if (q .lt. 1.0) then
		dw = -3.0*q + (9.0/4.0)*q**2.0
	else if (q .lt. 2.0) then
		dw = -0.75*(2.0-q)**2.0
	else
		dw = 0.0
	end if
C	returns dw/dr. If dw/dh is needed, multiply by (-r/h) outside
	dw = sigw(dims)*dw/(smdist**2.0)
c	gaussian kernel function
c	dw = (-2.0*dist/(sqrt(pi)*smdist**3.0))*exp(-1.0*rovh**2.0)
	return
	end
