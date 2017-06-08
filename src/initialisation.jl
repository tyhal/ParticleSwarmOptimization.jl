
# Place a swarm at (xa,ya) with (count) many particles using a (dist) distribution.
# name it (name) and the tracking circle will be the color (color)
function SwarmCreate(xa,ya,count,dist,fitness,color="white",name="Swarm")
  g = Float64(Inf)
  p = [Particle(i,
    rand(Normal(xa, dist)),
    rand(Normal(ya, dist)),
    Float64(Inf),
    (rand(Normal()),rand(Normal()))) for i in [1:count;]]
  Swarm(SwarmMeta(color,name),p,g,fitness)
end
