function BoothsFitness(pt::PSO.Particle)
  x = pt.data.x
  y = pt.data.y
  return ((x + (2y) - 7) ^ 2)+ ((2x + y - 5) ^ 2)
end
# Test optimum case
particle = PSO.Particle(0,PSO.XYPartData(1,3,(1,2)))
@test BoothsFitness(particle) == 0

# Test optimizing to optimum case
sw = PSO.XYSwarmCreate(5, 5, 100, 10, BoothsFitness)
@test PSO.RunPSO(sw, 1000)[1] < 2
