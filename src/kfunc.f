	subroutine kfunc(dist,smdist,dims,weight)
	implicit none
c	cubic spline interpolation function
	integer dims
	double precision dist,smdist,weight
	double precision q,sigw(3)
	double precision pi
	parameter (pi = 3.14159265)
	sigw(1)=2.0/3.0
	sigw(2)=10.0/(7.0*pi)
	sigw(3)=1.0/pi
	q = dist/smdist
	if (q .lt. 1.0) then
		weight = 1.0 - (3.0/2.0)*(q)**2.0 + 
     +			(3.0/4.0)*(q)**3
	else if (q .lt. 2.0) then
		weight = 0.25*(2.0-q)**3.0
	else
		weight = 0.0
	end if
	weight = sigw(dims)*weight/smdist
c	gaussian kernel function
c	weight = (1.0/(smdist*sqrt(pi)))*exp(-1.0*rovh**2.0)
	return
	end
