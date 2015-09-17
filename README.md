# kingsph

This is my toy SPH code. It contains nothing novel, and is based on what I've read in the major papers on the subject.

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
  * Isometric grid of starting particles (for 2d Sedov)

Bugs and so on:
  * Why does \Omega\ne 1.0 cause the wrong results?;
  * 1d Sod - requires smoothing of initial conditions;
  * Create some inflow/outflow boundary conditions;
  * Implement w.
  * Isometric grid doesn't prevent "grid" like errors appearing. Something to do with particles being allowed to coallesce? Artificial viscosity fix somehow?

![alt text](https://raw.githubusercontent.com/jrcking/kingsph/master/img/tron.jpg  "Sedov explosion particle positions")

![alt text](https://raw.githubusercontent.com/jrcking/kingsph/master/img/tron2.jpg  "Sedov explosion viewed the proper way!")

