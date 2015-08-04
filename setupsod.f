	subroutine setupsod
	include "commonblock"
c	set time counters and number particles (to go in setup/param 
c	file in due course).
	dims=1
	ntmax = 90
	n = 450
	nsh = 400
	ng = 100
	rbl = 0.0
	rbr = 1.005
c	set up initial particle properties...
c	left state
	do i=1,nsh
		r(1,i) = 0.000625 + 0.00125*(i-1)
		r(2,i) = 0.0
		r(3,i) = 0.0
		do l=1,3
			v(l,i) = 0.0
		end do
		m(i) = 0.00125
		gm(i) = 1.4
		pc(i) = 0.0
		u(i) = 1.0/(gm(i)-1.0)
		h(i) = 0.008
	end do
c	right state
	do i=nsh+1,n
		r(1,i) = 0.5 + 0.01*(i-nsh)
		r(2,i) = 0.0
		r(3,i) = 0.0
		do l=1,3
			v(l,i) = 0.0
		end do
		m(i) = 0.00125
		gm(i) = 1.4
		pc(i) = 0.0
		u(i) = (0.1/0.125)/(gm(i)-1.0)
		h(i) = 0.008
	end do
c	left state ghost nodes for boundary
	do i=n+1,n+ng/2
		j=i-n
		r(1,i) = -0.000625 - 0.00125*(j-1)
		r(2,i) = 0.0
		r(3,i) = 0.0
		do l=1,3
			v(l,i) = 0.0
		end do
		rho(i) = 1.0
		p(i) = 1.0
		m(i) = 0.00125
		gm(i) = 1.4
		pc(i) = 0.0
		u(i) = 1.0/(gm(i)-1.0)
		h(i) = 0.008
	end do
c	right state ghost nodes for boundary
	do i=n+ng/2 + 1,n+ng
		j=i-(n+ng/2)
		r(1,i) = 1.0 + 0.01*j
		r(2,i) = 0.0
		r(3,i) = 0.0
		do l=1,3
			v(l,i) = 0.0
		end do
		rho(i) = 0.125
		p(i) = 0.1
		m(i) = 0.00125
		gm(i) = 1.4
		pc(i) = 0.0
		u(i) = 1.0/(gm(i)-1.0)
		h(i) = 0.008
	end do
	return
	end
