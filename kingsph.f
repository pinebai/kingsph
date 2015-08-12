	program KINGSPH

	include "commonblock"
	integer dmpfrq
	double precision radius
c	set intitial conditions. Call "setupsod" or "setupsedov3d"
	dmpfrq = 1
!	call setupsod
	call setupvort2d
!	call setupsedov2d
!	call setupsedov3d
c	supplementary setup bits...
	call calcsmooth
	call bound
c	just in case we want to find maxval(array)...
	do i=1,n
		propmask(i) = .true.
	end do
	do i=n+1,nmax
		propmask(i) = .false.
	end do
c	---------------------------------------------------------------
c	TIME LOOP
	t = 0.0
	do nt=1,ntmax
		if(mod(nt,dmpfrq).eq.0)then
			call dump
		end if
		call settstep
		call evol
		t = t+dt
		write(6,*) nt,t,dt
		call calcsmooth
		call bound
	end do
C	---------------------------------------------------------------
	stop
	end

