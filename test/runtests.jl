using ParticleSwarmOptimization
PSO = ParticleSwarmOptimization

using Base.Test

## Test Sections

include("test_fitness.jl")

include("test_helper.jl")

include("test_initialisation.jl")

include("test_movement.jl")

include("test_plot.jl")

include("test_types.jl")
# ParticlePlotInfo
ppi = PSO.ParticlePlotInfo(1,2)
@test typeof(ppi) == ParticleSwarmOptimization.ParticlePlotInfo
@test ppi.x == 1
@test ppi.y == 2
# Particle
ppi.x += 5
prt = PSO.Particle(ppi,1,67.0,String("Hello"))
@test typeof(prt) == ParticleSwarmOptimization.Particle
@test prt.plot.x == 6
@test prt.indx == 1
@test prt.fitn == 67.0
@test prt.data == "Hello"

# type SwarmsPlotInfo
#   colo::String # Swarm Color
#   name::String # Name of Swarm :3
#   xmin::Float64
#   ymin::Float64
#   xmax::Float64
#   ymax::Float64
#   updt::Function # Update for particles
#   SwarmsPlotInfo(c::String,n::String) = new(c,n,0,0,0,0,(p::Particle) -> ParticlePlotInfo(p.indx,p.fitn))
# end
#
# # Basic swarm object
# type Swarm
#   plot::SwarmsPlotInfo
#   part::Array{Particle,1} # Particle
#   glfi::Float64 # Best Global
#   fifu::Function # fitness func
#   move::Function # move func (glfi::Float64,swdata::Any,pt::Particle)
#   data::Any # data
# end


## Misc Test

# Check to see if the example use case finds the perfect fitess for every swarm
include("test_scenarios.jl")
ret = scenario1()
@test ret > 12.0
@test ret < 23.0
# @test PSO.getTotalFitness(scenario2()) == 0
# @test PSO.getTotalFitness(scenario3()) == 0
# @test PSO.getTotalFitness(scenario4()) == 0

include("test_negative.jl")

include("test_stress.jl")
@test size(stress1().part)[1] == 1000

include("test_simple.jl")

## Swarm Extension tests

include("test_swarm_xy.jl")
