# kingsph

This is my toy SPH code. The heart of it is "based" on this: http://www.arxiv.org/abs/1012.1885 paper by Price, and his Ph.D. thesis.

Different subroutines for initial conditions for:
  * 1d sod;
  * 2d sedov;
  * 3d sedov;
  * 2d something;

Features:
  * Cubic kernel;
  * Leap-frog time integration;
  * Variable smoothing lengths;
  * Box shaped domain;
  * 'Wall' boundary conditions;
  * Some Octave scripts to interpolate results to grid and plot.

Bugs and so on:
  * Why does \Omega\ne 1.0 cause the wrong results?;
  * 1d Sod - requires smoothing of initial conditions;
  * Create some inflow/outflow boundary conditions;
  * It's a bit coordinate affected...
  * Implement w.

![alt text](https://raw.githubusercontent.com/jrcking/kingsph/master/img/tron.jpg  "Sedov explosion particle positions")

![alt text](https://raw.githubusercontent.com/jrcking/kingsph/master/img/tron2.jpg  "Sedov explosion viewed the proper way!")

