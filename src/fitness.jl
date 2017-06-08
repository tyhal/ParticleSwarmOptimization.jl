
# Find zero
function MinFitnessFunc(pt::Particle)
  pt.f = sqrt((abs(pt.y)^2) + (abs(pt.x)^2))
  return pt
end
