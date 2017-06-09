function BukinFitness(pt::PSO.Particle)
  x = pt.data.x
  y = pt.data.y
  return 100 * sqrt(abs(y - (0.01 * (x^2)))) + 0.01 * abs(x + 10)
end
# Test optimum case
particle = PSO.Particle(0,PSO.XYPartData(-10,1,(1,2)))
@test BukinFitness(particle) == 0
# Test optimizing to optimum case
sw = PSO.XYSwarmCreate(-13, 2, 100, 10, BukinFitness)
@test PSO.RunPSO(sw, 10000)[1] < 2
