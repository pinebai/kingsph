	subroutine setupsedov2d
	include "commonblock"
	integer crn,q,qg
	real dx,dy,dz,x,y,z,radius
c	set counters and number particles (to go in setup/param 
c	file in due course).
	dims=2
	ntmax = 120
	crn=50  !cube root of the TOTAL number
	n = (crn-5)**dims  !we need 2.5 particles each side for bcs
	ng = crn**dims - n
c
	dx = 2.0/float(crn-5)  ! x spacing
	dy = 2.0/float(crn-5)  ! y spacing
	dz = 0.0
	q = 0   ! counter for regular particles
	qg = 0  ! counter for ghost particles
	do i=1,n+ng
c		create some integers in base crn and crn**2
		j=floor(float(i-1)/float(crn))
		x = -1d0*(1d0 + 2.5d0*dx) + dx*mod(i-1,crn)
		y = -1d0*(1d0 + 2.5d0*dy) + dy*mod(j,crn)
		z = 0d0
		if (abs(x).le.1.0.and.abs(y).le.1.0.and.
     +			abs(z).le.1.0)then ! regular particles
			q = q+1
			r(1,q) = x
			r(2,q) = y
			r(3,q) = z
		else ! ghost particles for bcs
			qg = qg+1
			r(1,n+qg) = x
			r(2,n+qg) = y
			r(3,n+qg) = z
		end if	
	end do
	do i=1,n+ng
		do l=1,3 
			v(l,i) = 0.0 ! set all velocities to zero
		end do
		m(i) = 5d-2
		gm(i) = 1.4d0
		pc(i) = 0d3
		radius = sqrt(r(1,i)**2+r(2,i)**2+r(3,i)**2)
		if (radius.le.0.1)then  ! hot in the middle
			u(i) = (1d0+pc(i)*gm(i))/((gm(i)-1d0)*1d0)
		else ! cooler outside
			u(i) = (1d-3+pc(i)*gm(i))/((gm(i)-1d0)*1d0)
		end if
		h(i) = 1.15*dx ! uniform smoothing length..
	end do
	write(6,*) n,ng,q,qg  ! print out numbers to check setup
	if(n.ne.q.or.ng.ne.qg)then
		write(6,*) "something wrong in setup. fix it!"
	end if
	return
	end
