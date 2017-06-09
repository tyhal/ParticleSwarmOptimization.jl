function XYFitnessFunc(pt::PSO.Particle)
  1/(sqrt((abs(pt.data.y)^2) + (abs(pt.data.x)^2))+1)
end

function scenario1()
  # Create an array of swarms
  # TODO Make a range of constructors that can make swarms
  swarms = PSO.Swarm[]

  push!(swarms,PSO.XYSwarmCreate(2,3,3,0.45,XYFitnessFunc))
  push!(swarms,PSO.XYSwarmCreate(2,3,300,0.45,XYFitnessFunc))
  push!(swarms,PSO.XYSwarmCreate(6,6,200,0.7,XYFitnessFunc,"rgb(164, 194, 244)"))
  push!(swarms,PSO.XYSwarmCreate(4,4,200,1,XYFitnessFunc,"blue","The Best Swarm"))
  push!(swarms,PSO.XYSwarmCreate(20,20,500,3,XYFitnessFunc,"green"))

  PSO.GetAverageFitness(PSO.RunPSOs(swarms,5))
end

ret = scenario1()
@test ret >= 0.0
@test ret <= 1.0
