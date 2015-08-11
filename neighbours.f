	subroutine neighbours
	include "commonblock"
	double precision rij(3),mrij
c	this isn't a very efficient way of doing things...
	do i=1,n+ng
		nneigh(i) = 0
		do j=1,n+ng
			do l=1,3
				rij(l) = r(l,i)-r(l,j)
			end do
			mrij = sqrt(rij(1)**2 + rij(2)**2 + rij(3)**2)
			if (mrij.le. 2.1*h(i).or.mrij.le.2.1*h(j))then
				nneigh(i) = nneigh(i) + 1
				neigh_list(i,nneigh(i)) = j
			end if	
		end do
		!write(6,*) nneigh(i)
	end do
	return
	end
