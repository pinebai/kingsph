	subroutine setupvort2d
	include "commonblock"
	integer crn,q,qg,nbound
	real dx,dy,dz,x,y,z,radius,rcomp_max
c	set counters and number particles (to go in setup/param 
c	file in due course).
	ntmax = 200
	crn=60  !sqr root of the TOTAL number
	nbound=10
	n = (crn-nbound)**2  !we need 2.5 particles each side for bcs
	ng = crn**2 - n
c
	dx = 2.0/float(crn-nbound)  ! x spacing
	dy = 2.0/float(crn-nbound)  ! y spacing
	dz = 0.0  ! z spacing
	q = 0   ! counter for regular particles
	qg = 0  ! counter for ghost particles
	do i=1,n+ng
c		create some integers in base crn and crn**2
		j=floor(float(i-1)/float(crn))
		k=floor(float(i-1)/(float(crn)*float(crn)))
		x = -1d0*(1d0 + 2.5d0*dx) + dx*mod(i-1,crn)
		y = -1d0*(1d0 + 2.5d0*dy) + dy*mod(j,crn)
		z = 0d0
		radius = sqrt(x**2+y**2+z**2)
		rcomp_max=max(abs(x),abs(y),abs(z))
		if (rcomp_max.le.1.0)then ! regular particles
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
	write(6,*) n,ng,q,qg  ! print out numbers to check setup
	if(n.ne.q.or.ng.ne.qg)then
		write(6,*) "something wrong in setup. fix it!"
		n=q
		ng=qg
	end if
	do i=1,n+ng
		do l=1,3 
			v(l,i) = 0.0 ! set all velocities to zero
		end do
		m(i) = 5d-2
		gm(i) = 1.4d0
		pc(i) = 0d0
		u(i) = (1d0+pc(i)*gm(i))/((gm(i)-1d0)*1d0)
		radius = sqrt(r(1,i)**2+r(2,i)**2+r(3,i)**2)
		rcomp_max=max(abs(r(1,i)),abs(r(2,i)),abs(r(3,i)))
		if (radius.le.0.1)then  ! middle
			v(1,i) = (rand(0)-0.5d0)*2d0
			v(2,i) = (rand(0)-0.5d0)*2d0
			v(3,i) = 0d0
		else !			outer
			v(1,i) = (rand(0)-0.5d0)*2d0
			v(2,i) = (rand(0)-0.5d0)*2d0
			v(3,i) = 0d0
		end if		
		if (i.gt.n)then  !ghost
			v(1,i) = 0d0
			v(2,i) = 0d0
			v(3,i) = 0d0
			m(i)=5e-1 !massive boundary particles!!
		end if
		h(i) = 1.15*dx ! uniform smoothing length..
	end do
	return
	end
