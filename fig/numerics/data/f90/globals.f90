!-----------------------------------------------------------------------
!
!  globals.f90
!
!  $Id: globals.f90,v 1.2 2011/03/21 23:10:12 jmack Exp jmack $
!
!  Defines global parameters for the ssea simulation.  Also contains
!    a subroutine to load input parameters (all of which are global)
!    from the input .param file.
!
!-----------------------------------------------------------------------

module globals

  ! parameters
  integer, parameter :: chlen = 256
  integer, parameter :: wp = selected_real_kind(p=16) ! general precision
  integer, parameter :: rand_pl_wp = wp
  integer, parameter :: rpkg = selected_int_kind(9)
  integer, parameter :: rand_pl_mf = 300           ! pure Mersenne Twister
  character(13), parameter :: ffmt = '(ES20.8E3)'  ! format for floating output
  character(64), parameter :: efmt = '(6ES20.8E3)'
  complex(wp), parameter :: i = (0.0_wp, 1.0_wp)
  real(wp), parameter :: eps = epsilon(1._wp)
  real(wp), parameter    :: pi = 3.141592653589793_wp

  ! control parameters
  character(chlen) :: p_file
  integer :: ierr, stop_time
  logical :: param_trace, time_trace, integral_trace, output_integral_flag
  logical :: sub_integral_trace, inf_integral_trace, T_integral_trace

  ! loop parameters
  integer :: Nperloop, Nperloop_even,Nloops,filep, Ncopy,Nx
  real(wp), dimension(:), allocatable :: loop,w,Tinter,Tloop
  logical :: first_time, int_fail

  ! location and mean shifts
  real(wp) :: x0,d,d0,ds,d1,d2

  !surface parameters
  real(wp) :: chi1, chi2,chi
  integer :: Ninter

  ! numerics
  real(wp) :: int_tol
  integer ::  int_max_iter
  real(wp) :: energy,eff, energy_anlt

  ! random number parameters
  integer(rpkg) :: seed
  integer :: seedparam
  integer(rpkg), dimension(:,:), allocatable :: rand_state

  ! files and related
  character(chlen) :: base_file_tag
  character(chlen) :: data_file, finished_file, loop_file
  character(chlen) :: data_file_base
  integer :: problem_register

contains

subroutine initialize_module_globals()
  character(127), parameter :: RCS_ID = &
    "@(#)$Id: globals.f90,v 1.2 2011/03/21 23:10:12 jmack Exp jmack $"
  write(0,*) trim(RCS_ID)
end subroutine initialize_module_globals

end module globals
