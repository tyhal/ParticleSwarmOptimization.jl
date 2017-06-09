module ParticleSwarmOptimization

# package code goes here
include("types.jl")
include("initialisation.jl")
include("helpers.jl")
include("plot.jl")
include("pso.jl")

# Main

function RunPSOs(sws::Array{Swarm,1},count=10)
  display(SwarmsPlot(sws))
  sws = mapSwarms(SwarmUpdate,sws,count)
  display(SwarmsPlot(sws))
  SwarmsGetFitness(sws)
end

function RunPSO(sw::Swarm,count=10)
  sws = Swarm[]
  push!(sws,sw)
  RunPSOs(sws,count)
end

# Extra types
include("swarms/xy.jl")

end # module
