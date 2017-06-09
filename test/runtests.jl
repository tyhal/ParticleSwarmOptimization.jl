using ParticleSwarmOptimization
PSO = ParticleSwarmOptimization

using Base.Test

# ## Test Sections
#
# include("test_fitness.jl")
#
# include("test_helper.jl")
#
# include("test_initialisation.jl")
#
# include("test_movement.jl")
#
# include("test_plot.jl")
#
# include("test_types.jl")
#
# ## Misc Test
#
# Check to see if the example use case finds the perfect fitess for every swarm
include("test_scenarios.jl")
ret = scenario1()
@test ret > 12.0
@test ret < 23.0
# @test PSO.getTotalFitness(scenario2()) == 0
# @test PSO.getTotalFitness(scenario3()) == 0
# @test PSO.getTotalFitness(scenario4()) == 0

# include("test_negative.jl")
#
# include("test_stress.jl")

include("test_simple.jl")
