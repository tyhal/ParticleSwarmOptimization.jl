module ParticleSwarmOptimization

# package code goes here
include("types.jl")
include("initialisation.jl")
include("helpers.jl")
include("plot.jl")
include("pso.jl")

# Main

function RunPSO(sw::Swarm,count=1)
  forSwarm(SwarmUpdate,sw,count).glfi
end

function RunPSOs(sws::Array{Swarm,1},count=1)
  display(SwarmPlot(sws))
  sleep(10)
  # sws = mapSwarms(SwarmUpdate,sws,count)
  # sws = map!(SwarmUpdate,sws)
  # display(SwarmPlot(sws))
  # SwarmsGetFitness(sws)
end

# Extra types
include("swarms/xy.jl")

end # module
