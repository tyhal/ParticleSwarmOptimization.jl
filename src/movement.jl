
# Move each particle in a given swarm in a random direction
function ParticleMove(pt::Particle)
  pt.x += pt.v[1]
  pt.y += pt.v[2]
  return pt
end
