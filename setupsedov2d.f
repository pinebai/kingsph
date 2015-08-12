	subroutine setupsedov2d
	include "commonblock"
	integer crn
	real dx,dy,dz,x,y,z,radius
c	set counters and number particles (to go in setup/param 
c	file in due course).
	dims=2
	eta = 0.4
	ntmax = 100
	crn=25  !sqr root of the TOTAL number
	n = crn**dims
c
	do l=1,3
	   rlow(l)=-1.0d0
	   rhigh(l)=1.0d0
	end do
c
	dx = (rhigh(1)-rlow(1))/float(crn)  ! x spacing
	dy = (rhigh(2)-rlow(2))/float(crn)  ! y spacing
	dz = 0.0
	q = 0   ! counter for regular particles
	do i=1,n
c		create some integers in base crn and crn**2
		j=floor(float(i-1)/float(crn))
		x = rlow(1)+0.5*dx + dx*mod(i-1,crn)
		y = rlow(2)+0.5*dy + dy*mod(j,crn)
		z = 0d0
		r(1,i) = x
		r(2,i) = y
		r(3,i) = z
	end do
	do i=1,n
		do l=1,3 
			v(l,i) = 0.0 ! set all velocities to zero
		end do
		m(i) = 5d-3
		gm(i) = 1.4d0
		pc(i) = 0d3
		radius = sqrt(r(1,i)**2+r(2,i)**2+r(3,i)**2)
		if (i.eq.313)then ! hot in the middle
		   u(i) = 2.5d0
		else ! cooler outside
		   u(i) = 2.5d-3
		end if
		h(i) = 1.5*dx	! uniform smoothing length..
        end do
	call bound
	call dump
	write(6,*) n,ng
	return
	end
