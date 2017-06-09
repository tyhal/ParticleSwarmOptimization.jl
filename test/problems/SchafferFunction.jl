function SchafferFitness(pt::PSO.Particle)
  x = pt.data.x
  y = pt.data.y
  r1 = sin(abs((x^2) - (y^2)))
  r2 = 0.5(1 + cos(2r1)) - 0.5 # cos^2(r1)
  r3 = (1 + 0.001 * ((x^2) + (y^2))) ^ 2
  return 0.5 + (r2 / r3)
end
# Test optimum case ( 0.292579 )
particle = PSO.Particle(0,PSO.XYPartData(0,1.25313,(1,2)))
fitness = SchafferFitness(particle)
@test fitness < 0.293
@test fitness > 0.292
# Test optimizing to optimum case
sw = PSO.XYSwarmCreate(50, 50, 100, 1, SchafferFitness)
fitness = PSO.RunPSO(sw, 1000)[1]
@test fitness < 0.293 + 0.01
@test fitness > 0.292 - 0.01
