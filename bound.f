	subroutine bound
	include "commonblock"
	integer nbp
c       firstly, check particles left domain, and put back in
c       something wrong, not bouncy enough!
	do k=1,dims
	   do i=1,n
	      if(r(k,i).lt.rlow(k))then
		 r(k,i)=rlow(k)+(rlow(k)-r(k,i))
		 v(k,i)=-1.0*v(k,i)
	      end if
	      if(r(k,i).gt.rhigh(k))then
		 r(k,i)=rhigh(k)-(r(k,i)-rhigh(k))
		 v(k,i)=-1.0*v(k,i)
	      end if
	   end do
	end do
c       for every particle, see if it is within 3h of the boundary
	nbp = 0
	do k=1,dims  !for each dimension
	   do i=1,n   !loop all particles
	      if(r(k,i)-3.0*h(i).le.rlow(k))then !if near low bound
	         nbp = nbp+1
	         call copyparticle(i,n+nbp)  !copy all
	         v(k,n+nbp)=-1.0*v(k,i)      !correct r and v
	         r(k,n+nbp)=rlow(k)-(r(k,i)-rlow(k))
	      end if
	      if(r(k,i)+3.0*h(i).ge.rhigh(k))then !if near high bound
	         nbp = nbp+1
	         call copyparticle(i,n+nbp)  !copy all
	         v(k,n+nbp)=-1.0*v(k,i)      !correct r and v
	         r(k,n+nbp)=rhigh(k)+(rhigh(k)-r(k,i))
	      end if
	   end do
	end do
	ng = nbp
	return
	end
C       a subroutine to copy info from one particle to another
	subroutine copyparticle(a,b)
	include "commonblock"
	integer a,b
	m(b)=m(a)
	h(b)=h(a)
	u(b)=u(a)
	gm(b)=gm(a)
	pc(b)=pc(a)
	rho(b)=rho(a)
	do l=1,3
           v(l,b)=v(l,a)
	   r(l,b)=r(l,a)
	end do
	return
	end
