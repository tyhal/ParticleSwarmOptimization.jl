function BealesFitness(pt::PSO.Particle)
  x = pt.data.x
  y = pt.data.y
  r1 = ((1.5 - x + (x * y)) ^ 2)
  r2 = ((2.25 - x + (x * (y ^ 2))) ^ 2)
  r3 = ((2.625 - x + (x * (y ^ 3))) ^ 2)
  return r1 + r2 + r3
end
# Test optimum case
particle = PSO.Particle(0,PSO.XYPartData(3,0.5,(1,2)))
@test BealesFitness(particle) == 0
# Test optimizing to optimum case

sw = PSO.XYSwarmCreate(3, 3, 150, 5, BealesFitness)
@test PSO.RunPSO(sw, 1000)[1] < 0.01
