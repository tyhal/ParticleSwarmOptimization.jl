using ParticleSwarmOptimization
PSO = ParticleSwarmOptimization

function examplePSO()
  # Create an array of swarms
  # TODO Make a range of constructors that can make swarms
  swarms = PSO.Swarm[]

  push!(swarms,PSO.SwarmCreate(2,3,300,0.45,PSO.MinFitnessFunc))
  push!(swarms,PSO.SwarmCreate(6,6,200,0.7,PSO.MinFitnessFunc,"rgb(164, 194, 244)"))
  push!(swarms,PSO.SwarmCreate(4,4,200,1,PSO.MinFitnessFunc,"blue","The Best Swarm"))
  push!(swarms,PSO.SwarmCreate(20,20,500,3,PSO.MinFitnessFunc,"green"))

  # plt = SwarmPlot(swarms)
  # display(plt)
  swarms = PSO.mapSwarms(PSO.SwarmUpdateFitness,swarms)
  display(PSO.SwarmPlot(swarms))
  display(PSO.SwarmPlot(PSO.mapSwarms(PSO.SwarmUpdateFitness,PSO.mapParticlesInSwarms(PSO.ParticleMove,swarms,2))))
  return PSO.getTotalFitness(swarms);
end
