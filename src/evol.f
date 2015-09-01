	subroutine evol
	include "commonblock"
c
c	put variables in the 0 arrays
	do i=1,n
		do j=1,3
			r0(j,i) = r(j,i)
			v0(j,i) = v(j,i)
		end do
		u0(i) = u(i)
	end do
c	find the derivatives
	call calcddt
c	predictor step
	do i=1,n
		do j=1,3
			v(j,i) = v0(j,i) + 0.5*dt*dvdt(j,i)
			r(j,i) = r0(j,i) + 0.5*dt*v(j,i)
		end do
		u(i) = u0(i) + 0.5*dt*dudt(i)
	end do
c	recalculate rho,p
	call bound
	call calcsmooth
c	find some more derivatives
	call calcddt
c	corrector step
	do i=1,n
		do j=1,3
			v(j,i) = v0(j,i) + 0.5*dt*dvdt(j,i)
			r(j,i) = r0(j,i) + 0.5*dt*v(j,i)
		end do
		u(i) = u0(i) + 0.5*dt*dudt(i)
	end do
c	final step	
	do i=1,n
		do j=1,3
			v(j,i) = 2.0*v(j,i) - v0(j,i)
			r(j,i) = 2.0*r(j,i) - r0(j,i)
		end do
		u(i) = 2.0*u(i) - u0(i)
	end do
c	
	return
	end
