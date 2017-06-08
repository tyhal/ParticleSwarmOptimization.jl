using ParticleSwarmOptimization
PSO = ParticleSwarmOptimization

function examplePSO()

  # Create an array of swarms
  # TODO Make a range of constructors that can make swarms
  swarms = PSO.Swarm[]

  push!(swarms,PSO.XYSwarmCreate(2,3,3,0.45))
  push!(swarms,PSO.XYSwarmCreate(2,3,300,0.45))
  push!(swarms,PSO.XYSwarmCreate(6,6,200,0.7,"rgb(164, 194, 244)"))
  push!(swarms,PSO.XYSwarmCreate(4,4,200,1,"blue","The Best Swarm"))
  push!(swarms,PSO.XYSwarmCreate(20,20,500,3,"green"))

  fit = PSO.RunPSOs(swarms,5)
  fit = [24.0]
  PSO.SwarmsGetTotalFitness(fit)
end

swarms = PSO.Swarm[]
push!(swarms,PSO.XYSwarmCreate(2,3,3,0.45))
newsws = PSO.mapSwarms(PSO.SwarmUpdatePlotInfo,swarms)
