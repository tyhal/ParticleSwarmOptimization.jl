function SphereFitness(pt::PSO.Particle)
  x = pt.data.x
  y = pt.data.y
  return (x^2) + (y^2)
end
# Test optimum case ( 0.292579 )
particle = PSO.Particle(0,PSO.XYPartData(0,0,(1,2)))
@test SphereFitness(particle) == 0
# Test optimizing to optimum case
sw = PSO.XYSwarmCreate(-2, 2, 10, 1, SphereFitness)
@test PSO.RunPSO(sw, 1000)[1] < 0.01
