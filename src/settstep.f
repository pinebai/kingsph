	subroutine settstep
	include "commonblock"
	double precision vsig,minsf
	double precision vij(3),rij(3),ci,cj
	double precision mvij,mrij,vdotr
	minsf = 1e12
c	loop over all normal cells
	do i=1,n
		ci = sqrt(gm(i)*(p(i)+pc(i))/rho(i))
		c(i) = ci
c		and then over normal cells again
		do k=1,nneigh(i)
			j=neigh_list(i,k)
			do l=1,3
				vij(l) = v(l,i)-v(l,j)
				rij(l) = r(l,i)-r(l,j)
			end do
			mvij = sqrt(vij(1)**2 + vij(2)**2 + vij(3)**2)
			mrij = sqrt(rij(1)**2 + rij(2)**2 + rij(3)**2)
			vdotr = vij(1)*rij(1) + vij(2)*rij(2) + 
     +				vij(3)*rij(3)
			cj = sqrt(gm(j)*(p(j)+pc(j))/rho(j))
			vsig = 0.5*(ci+cj-1.0*vdotr)
			if (abs(h(i)/vsig) .le. minsf) then
				minsf = abs(h(i)/vsig)
			end if
		end do
	end do
	dt = 0.2*minsf
	return
	end
