	subroutine dump
	include "commonblock"
	double precision radius,vmag
	character tron*(5)
c	write the outputs to a file... 
	write(tron,'(i5.5)') nt
	tron=adjustl(tron)
	open(unit=9,file="./output/r"//tron//".out")
	open(unit=10,file="./output/rho"//tron//".out")
	open(unit=11,file="./output/v"//tron//".out")
	open(unit=12,file="./output/u"//tron//".out")
	open(unit=13,file="./output/p"//tron//".out")
	open(unit=14,file="./output/h"//tron//".out")
	open(unit=15,file="./output/nneigh"//tron//".out")
	open(unit=16,file="./output/m"//tron//".out")
	do i=1,n!+ng
		radius = sqrt(r(1,i)**2+r(2,i)**2+r(3,i)**2)
		vmag = sqrt(v(1,i)**2+v(2,i)**2+v(3,i)**2)
		write(9,*) r(1,i),r(2,i),r(3,i)
		write(10,*) radius,rho(i)
		write(11,*) radius,vmag
		write(12,*) radius,u(i)
		write(13,*) radius,p(i)	
		write(14,*) radius,h(i)
		write(15,*) radius,nneigh(i)
		write(16,*) radius,m(i)
	end do
	do i=9,16
		close(i)
	end do
	return
	end

