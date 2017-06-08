using ParticleSwarmOptimization
PSO = ParticleSwarmOptimization

using Base.Test

# Check to see if the example use case finds the perfect fitess for every swarm
include("test_usecase.jl")
ret = examplePSO()
@test ret > 18.0
@test ret < 25.0

# include("test_scenarios.jl")
# @test PSO.getTotalFitness() == 0
#
# include()
