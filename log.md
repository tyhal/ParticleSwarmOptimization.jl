# Project log

## Package Creation

- created [src](src) [LICENSE](LICENSE) [README.md](README.md)
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

## Splitting Project into sections

- Initial files to organise
  * [fitness.jl](src/fitness.jl) Basic fitness functions
  * [helpers.jl](src/helpers.jl) Helper functions for various needs
  * [initialisation.jl](src/initialisation.jl) Creation of swarms
  * [movement.jl](src/movement.jl) Logic for moving particles
  * [plot.jl](src/plot.jl) Displaying the swarm state
  * [types.jl](src/types.jl) for all types needed
- Plan to use folders if these need further breaking up
- In julia:
  * Ran `Pkg.build("ParticleSwarmOptimization")`
  * Ran `Pkg.add("ParticleSwarmOptimization")`
  * Ran `using ParticleSwarmOptimization` ERROR
- Module PlotlyJS not found in current path.
- Run `Pkg.add("PlotlyJS")`segfault :confused:
- Exit julia and retry
- Run `Pkg.update()` ParticleSwarmOptimization: skipping update (dirty)...
- ... Some errors later ...
- Rebuilt
  * Rmath
- Ran tests which passed
- Needed to install Electron for graphing
  * `Blink.AtomShell.install()`
- Graphing works but now need to put `ParticleSwarmOptimization.` for every method externally used
- Solution was to add an alias lines
  * `PSO = ParticleSwarmOptimization`
- Tests and simple use case now work :thumbsup:
- `julia> Pkg.build("ParticleSwarmOptimization");Pkg.test("ParticleSwarmOptimization")`

## Running an example use case

- From the project root directory we can run [example.jl](src/example.jl)
```
$ julia
> # we can print the usecase file
> for ln in eachline(open("test/test_usecase.jl")) print("$ln") end
> # We can then load the example
> include("test/test_usecase.jl")
> # We can then run it
> examplePSO()
> # this will bring up a plot of before and after of a PSO run
> exit()
```

## Getting some more serious testing

- Added some test files to expand on
  * `include("test_fitness.jl")`
  * `include("test_helper.jl")`
  * `include("test_initialisation.jl")`
  * `include("test_movement.jl")`
  * `include("test_negative.jl")`
  * `include("test_plot.jl")`
  * `include("test_scenarios.jl")`
  * `include("test_stress.jl")`
  * `include("test_types.jl")`

## Debugging
 - It is painful to debug julia code
 - Very verbose

---
To get this package installed natively
```
Pkg.clone("git://github.com/tylerhale/ParticleSwarmOptimization.jl.git")
```
