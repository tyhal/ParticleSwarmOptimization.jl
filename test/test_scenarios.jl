function moveToZero(ps::PSO.Particle)
  ps.x = 0;ps.y=0;ps
end

function scenario1()
  # Create an array of swarms
  # TODO Make a range of constructors that can make swarms
  swarms = PSO.Swarm[]

  push!(swarms,PSO.XYSwarmCreate(2,3,3,0.45))
  push!(swarms,PSO.XYSwarmCreate(2,3,300,0.45))
  push!(swarms,PSO.XYSwarmCreate(6,6,200,0.7,"rgb(164, 194, 244)"))
  push!(swarms,PSO.XYSwarmCreate(4,4,200,1,"blue","The Best Swarm"))
  push!(swarms,PSO.XYSwarmCreate(20,20,500,3,"green"))

  PSO.SwarmsGetTotalFitness(PSO.RunPSOs(swarms,5))
end

function scenario2()
  sw = PSO.Swarm[]
  push!(sw,PSO.SwarmCreate(0,0,1,1,PSO.MinFitnessFunc))
  PSO.mapSwarms(PSO.SwarmGetFitness,
    PSO.mapParticlesInSwarms(moveToZero,sw,1))
  return sw
end
function scenario3()
  sw = PSO.Swarm[]
  push!(sw,PSO.SwarmCreate(0,0,1,1,PSO.MinFitnessFunc))
  PSO.mapSwarms(PSO.SwarmGetFitness,
    PSO.mapParticlesInSwarms(moveToZero,sw,1))
  return sw
end
function scenario4()
  sw = PSO.Swarm[]
  push!(sw,PSO.SwarmCreate(0,0,1,1,PSO.MinFitnessFunc))
  PSO.mapSwarms(PSO.SwarmGetFitness,
    PSO.mapParticlesInSwarms(moveToZero,sw,1))
  return sw
end
