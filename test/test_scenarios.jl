function moveToZero(ps::PSO.Particle)
  ps.x = 0;ps.y=0;ps
end

function scenario1()
  sw = PSO.Swarm[]
  push!(sw,PSO.SwarmCreate(0,0,1,1,PSO.MinFitnessFunc))
  PSO.mapSwarms(PSO.SwarmUpdateFitness,
    PSO.mapParticlesInSwarms(moveToZero,sw,1))
  return sw
end
function scenario2()
  sw = PSO.Swarm[]
  push!(sw,PSO.SwarmCreate(0,0,1,1,PSO.MinFitnessFunc))
  PSO.mapSwarms(PSO.SwarmUpdateFitness,
    PSO.mapParticlesInSwarms(moveToZero,sw,1))
  return sw
end
function scenario3()
  sw = PSO.Swarm[]
  push!(sw,PSO.SwarmCreate(0,0,1,1,PSO.MinFitnessFunc))
  PSO.mapSwarms(PSO.SwarmUpdateFitness,
    PSO.mapParticlesInSwarms(moveToZero,sw,1))
  return sw
end
function scenario4()
  sw = PSO.Swarm[]
  push!(sw,PSO.SwarmCreate(0,0,1,1,PSO.MinFitnessFunc))
  PSO.mapSwarms(PSO.SwarmUpdateFitness,
    PSO.mapParticlesInSwarms(moveToZero,sw,1))
  return sw
end
