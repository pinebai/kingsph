	subroutine setupsod
	include "commonblock"
c	set time counters and number particles (to go in setup/param 
c	file in due course).
	dims=1
	eta = 1.3
	ntmax = 500
	n = 450
	nsh = 400
	ng = 100
	rlow(1) = 0.0d0
	rhigh(1) = 1.005d0
	rlow(2)=0.0d0
	rhigh(2)=0.0d0
	rlow(3)=0.0d0
	rhigh(3)=0.0d0
c	set up initial particle properties...
c	left state
	do i=1,nsh
		r(1,i) = 1.25d-3*(i-1)+6.25d-4
		r(2,i) = 0.0
		r(3,i) = 0.0
		do l=1,3
			v(l,i) = 0.0
		end do
		m(i) = 0.00125
		gm(i) = 1.4
		pc(i) = 0.0
		u(i) = 1.0/(gm(i)-1.0)
		h(i) = 0.00168
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
		h(i) = 0.01345
        end do
	call bound
	return
	end
