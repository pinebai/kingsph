	subroutine calcrho
	include "commonblock"
	double precision w
	double precision rij(3),mrij
c	for every double precision node
	do i=1,n+ng
		rho(i) = 0.0
c		loop over near neighbours
		do k=1,nneigh(i)
			j=neigh_list(i,k)
			do l=1,3
				rij(l) = r(l,i)-r(l,j)
			end do
			mrij = sqrt(rij(1)**2 + rij(2)**2 + rij(3)**2)
			call kfunc(mrij,h(i),w)
			rho(i) = rho(i) + m(j)*w
		end do
	end do
	return
	end
