	subroutine calcrho
	include "commonblock"
	double precision w,dw
	double precision rij(3),mrij,hij
c	for every double precision node
	do i=1,n+ng
		rho(i) = 0.0
c		loop over near neighbours
		do k=1,nneigh(i)
			j=neigh_list(i,k)
			do l=1,3
				rij(l) = r(l,i)-r(l,j)
			end do
			hij = 0.5*(h(i)+h(j))
			mrij = sqrt(rij(1)**2 + rij(2)**2 + rij(3)**2)
			call kfunc(mrij,hij,dims,w)
			rho(i) = rho(i) + m(j)*w
     	        end do
		omega(i)=0.0
		do k=1,nneigh(i)
			j=neigh_list(i,k)
			do l=1,3
				rij(l) = r(l,i)-r(l,j)
			end do
			mrij= sqrt(rij(1)**2 + rij(2)**2 + rij(3)**2)
			call dkfunc(mrij,h(i),dims,dw)
			omega(i) = omega(i)-m(j)*dw*mrij/(dims*rho(i))
		end do
		omega(i)=omega(i)+1.0d0
!       why does this give "WRONG" results??!
	!	omega(i)=1.0d0
	end do
	return
	end
