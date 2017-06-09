using ParticleSwarmOptimization
PSO = ParticleSwarmOptimization

using Base.Test

## Unit

include("unit/types.jl")
include("unit/initialisation.jl")
include("unit/pso.jl")
include("unit/plot.jl")
include("unit/helpers.jl")

## Problems

include("problems/AckleysFunction.jl")
include("problems/BoothsFunction.jl")
include("problems/BukinsFunction.jl")
include("problems/SchafferFunction.jl")
include("problems/SphereFunction.jl")
