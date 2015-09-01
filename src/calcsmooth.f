	subroutine calcsmooth
	include "commonblock"
	integer n_upd,upd_list(nmax)
	logical brk
	double precision h_err(nmax),zeta,h_old,dzeta
	call neighbours
	call calcrho
c	initial guess...
	n_upd=n
	brk=.false.
	do i=1,n_upd
	   upd_list(i)=i
	end do
	do while (brk.eqv..false.)
!	   write(6,*) h(320),nneigh(320)
	   do j=1,n_upd
	      i=upd_list(j)
	      h_old=h(i)
	      zeta=m(i)*(eta/h(i))**dims - rho(i)
	      dzeta=-1.0*dims*rho(i)*omega(i)/h(i)
	      h(i) = h_old - zeta/dzeta
	      h_err(i)=abs(h(i)-h_old)/h_old
	   end do
	   call neighbours
	   call calcrho
	   n_upd=0
	   do i=1,n
	      if(h_err(i).gt.1.0d-3)then
		 n_upd=n_upd+1
		 upd_list(n_upd)=i
	      end if	      
	   end do
	   if(n_upd.lt.1)then
	      brk=.true.
	   end if
!	   	write(6,*) n_upd
	end do
!	do i=1,n+ng
!	   write(32,*) r(1,i),h(i)
!	end do
	call calcp

	return
	end
