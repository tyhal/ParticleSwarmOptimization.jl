module ParticleSwarmOptimization

# package code goes here
include("types.jl")
include("initialisation.jl")
include("helpers.jl")
include("plot.jl")
include("pso.jl")

# Main

function RunPSO(sw::Swarm,count=10)
  forSwarm(SwarmUpdate,sw,count).glfi
end

function RunPSOs(sws::Array{Swarm,1},count=10)
  display(SwarmPlot(sws))
  sws = mapSwarms(SwarmUpdate,sws,count)
  display(SwarmPlot(sws))
  SwarmsGetFitness(sws)
end

# Extra types
include("swarms/xy.jl")

end # module
