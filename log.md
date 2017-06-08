- created src LICENSE README.md
- opened julia
  * `;` key to switch to bash
  * Pkg command to handle package management
  * 1 + 1 = 2
- `Pkg.update()`
- `Pkg.generate("particle-swarm-optimization","GPL3")`
  * failed -> Use the PkgDev package instead
- `Pkg.add("PkgDev")`
- `PkgDev.generate("particle-swarm-optimization","GPL3")`
  * failed -> GPL3 is not a known license choice
- `PkgDev.generate("particle-swarm-optimization","GPL-3.0+")`
  * wrong packaging name format
- renamed repo :weary:
- `PkgDev.generate("ParticleSwarmOptimization","GPL-3.0+")`
  * created new empty package :ok_hand:
- Abandon old project workspace move to the one installed in Julia
- It automatically commits initial changes
- Had to overwrite git changes -> fresh history

To get this package installed natively
```
Pkg.clone("git://github.com/tylerhale/ParticalSwarmOptimization.jl.git")
```
