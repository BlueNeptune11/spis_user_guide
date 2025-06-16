Top level SPIS-UI architecture

The top-level architecture of the SPIS code base (SPIS-NUM) is briefly sketched here. Its representation as a diagram is given in the next section.

The top-level classes are contained in spis.Top.Xxx packages and are the following:

- The top level object is a simulation (Simulation parent class and derived classes), of which all versions are contained in spis.Top.Simulation package:

- Constructor: it requests the volume and surface meshes (usually provided by SPIS framework, or read from a file when SPIS-NUM is run as a standalone code, see Java for NUM.html).

 Major methods:

- integrate: compute time integration

- a few pre-determined methods to return results (see simulation abstract class interface)

- Major fields: it basically contains a Spacecraft and a Plasma object (imposed from GenericSimulation level, the class derived from Simulation parent class)

This top-most level object is normally called by SPIS framework. It can yet be called by the main program of SPIS-NUM when it is executed as a standalone code for debugging (see spis.Top.Top package below).

 

- A first object of lower-level is a spacecraft (SC parent class and derived classes), all contained in spis.Top.SC package:

- Major methods:

- integrate: compute time integration of spacecraft potentials

- computeInteraction: compute plasma-material interactions on the spacecraft (secondary emission, photo-emission, induced conductivity…)

- Major fields: it basically contains spacecraft Circuit, SurfMesh and surface fields (SurfField) describing the spacecraft state (potential, etc.).

 

A second object of lower-level is a plasma (plasma parent class and derived classes), all contained in spis.Top.plasma package:

Major methods:

- integrate: compute plasma dynamics

- Major fields: it basically contains the volume mesh, electric (and magnetic) fields and particle populations. Different ways of defining populations are offered in different plasma types (HybridPlasma1 or FlexiblePlasma)

 

Other classes of lower level are grouped in lower level packages (only the major ones are mentionned):

- packages spis.Vol.Mesh, spis.Vol.Field and spis.Vol.Distrib: volume meshes, fields (values on a volume mesh) and distributions (particle population, which can be Monte Carlo (PIC: Particle-In-Cell) or fluid).

- packages spis.Surf.Mesh, spis. Surf.Field and spis. Surf.Distrib: quite similar for surfaces (spacecraft or external boundary)

- package spis.Surf.InteractModel: plasma-material interaction models (still to be completed)

- packages spis.Circ.*: spacecraft circuit data

- packages spis.Monitor.*: monitoring objects (for now simple data storage for post-processing)

- package spis.Solver.Poisson: Poisson equation solver

- packages spis.Util.*: utilities, with in particular particle lists in spis.Util.List

-package spis.Top.Default: default objects and values (particle types, materials, sampling parameters…) some of them being indeed global control parameters (only “verbose” flags for now)

- package spis.Top.Top: mostly contains the "main" program to run SPIS-NUM as a standalone code to debug it within Eclipse (a menu, see Java for NUM.html)

 

As can be seen on the previous classes, it was generally chosen to place derived classes in the same package as the parent-class. The packages have all the same hierarchical level (spis + 2 levels): spis.Xxx.Yyy.