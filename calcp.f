	subroutine calcp
	include "commonblock"
c	use an equation of state to find the pressure
	do i=1,n+ng
c		Tamman EoS, but ideal gas if pc=0,gm=1.4
		p(i) = (gm(i)-1.0)*u(i)*rho(i) - gm(i)*pc(i)
	end do
	return
	end
