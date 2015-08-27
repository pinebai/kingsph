# kingsph

This is my toy SPH code. The heart of it is "based" on this: http://www.arxiv.org/abs/1012.1885 paper by Price, and his Ph.D. thesis.

Different subroutines for initial conditions for:
  * 1d sod;
  * 2d sedov;
  * 3d sedov;
  * 2d something;

Features:
a. Cubic kernel;
b. Leap-frog time integration;
c. Variable smoothing lengths;
d. Box shaped domain;
e. 'Wall' boundary conditions;

Bugs and so on:
a. Why does \Omega\ne 1.0 cause the wrong results?;
b. 1d Sod - requires smoothing of initial conditions;
c. Create some inflow/outflow boundary conditions;
d. Implement w.