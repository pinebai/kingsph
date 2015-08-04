	subroutine calcddt
	include "commonblock"
	double precision dw,avij,vij(3),rij(3),mvij,mrij,vdotr
	double precision ci,cj,rhoij,cij,aav,bav,hij
	double precision vsig,phiij
c
	double precision dwi,dwj
	aav = -1.0
	bav = 2.0
c	for every normally evolving particle
	do i=1,n
		dudt(i) = 0.0 !initialise t-derivs to zero
		do l=1,3
			dvdt(l,i) = 0.0
		end do
c		loop over neighbours
		do k=1,nneigh(i)
			j=neigh_list(i,k)
c			some average properties
			hij = 0.5*(h(i)+h(j)) 
			cij = 0.5*(c(i)+c(j))
			rhoij = 0.5*(rho(i)+rho(j))
			do l=1,3
				rij(l) = r(l,i)-r(l,j)
				vij(l) = v(l,i)-v(l,j)
			end do
			mvij = sqrt(vij(1)**2 + vij(2)**2 + vij(3)**2)
			mrij = sqrt(rij(1)**2 + rij(2)**2 + rij(3)**2)
			vdotr = vij(1)*rij(1) + vij(2)*rij(2) + 
     +				vij(3)*rij(3)
c			find vsig and the artificial viscosity terms
			if (vdotr.le.0.0) then
				vsig = 0.5*(c(i)+c(j)-1.0*vdotr)
			else 
				vsig = 0.0
			end if
			phiij = hij*vdotr/(mrij**2+0.01*hij*2)
			avij = (aav*cij*phiij + bav*phiij**2.0)/rhoij
			avij = 1d-2*avij ! change artificial viscosity
c			find the gradient of the kernel function
			call dkfunc(mrij,hij,dims,dw)
c			augment the forces and rate of change of energy
			do l=1,3
				dvdt(l,i) = dvdt(l,i) - m(j)*
     +				((p(i)/rho(i)**2.0) + 
     +				(p(j)/rho(j)**2.0) + avij)*
     +				(rij(l)/max(mrij,1e-6))*dw
			end do
			dudt(i) = dudt(i) + (p(i)/rho(i)**2.0)*m(j)*
     +				vdotr*dw/max(mrij,1e-6)
		end do
	end do
	return
	end
