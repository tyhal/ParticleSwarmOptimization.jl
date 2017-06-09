function AckleysFitness(pt::PSO.Particle)
  sum1 = (pt.data.x^2) + (pt.data.y^2)
  sum2 = cos(2 * pi * pt.data.x) + cos(2 * pi * pt.data.y)
  return -20 * exp(-0.2 * sqrt(sum1 / 2)) - exp(sum2 / 2) + exp(1) + 20
end
# Test optimum case
particle = PSO.Particle(0,PSO.XYPartData(0,0,(1,2)))
@test AckleysFitness(particle) == 0

# Test optimizing to optimum case
sw = PSO.XYSwarmCreate(3, 3, 1000, 1, AckleysFitness)
@test PSO.RunPSO(sw, 10000)[1] < 0.01
