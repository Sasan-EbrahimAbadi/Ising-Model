# Ising-Model
This repository contains codes for simulating 2D &amp; 3D Ising model

One of the simplest and most famous models of an interacting system is the Ising model. The model was originally proposed as a model for ferromagnetism. The model does not exhibit ferromagnetism transions in one dimension. However, the transition occures in two or higher dimensions.

reference: 
[The Ising Model](https://ps.uci.edu/~cyu/p238C/LectureNotes/IsingModel/IsingModel.pdf)

### Method
####  The Metropolis Algorithm
The Metropolis algorithm was implemented as follows:

• An N × N matrix is used to represent a 2-D square lattice; every entry of the matrix represents a
lattice site and has entry ±1, representing the spin of the particle at that site. A random matrix is
initially used so that the initial configuration of spins is randomised.

• For this system we should have N → ∞, meaning very large N, but this is very expensive computationwise. One way to increase the accuracy of the results without increasing the size of the matrix is
to use periodic boundary conditions. This is easily achieved by using modulo operator: taking the
neighbouring sites to be ((i + 1) mod (N), j), etc., instead of ((i + 1), j), etc.

• A lattice site is selected at random and ∆E is calculated. If ∆E ≤ 0, the change is favourable and
the spin is flipped. If ∆E > 0, then the spin is flipped only if exp (−∆E/kBT) > x, where x is a
random number on the interval [0, 1] (i.e. the particle has enough energy to flip its spin). This process
is repeated for every site in the lattice, selecting the sites at random.

• A new matrix is returned, which represents the updated state of the system.

reference: 
[The Metropolis Algorithm](https://www.maths.tcd.ie/~dbennett/js/ising.pdf)
