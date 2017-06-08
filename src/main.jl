using PlotlyJS
@eval using Distributions

type Particle
  id::Integer # Id in array
  x::Float64
  y::Float64
  f::Float64 # Fitness
  v::Tuple{Float64,Float64}
end

type SwarmMeta
  c::String # Swarm Color
  n::String # Name of Swarm :3
  xmin::Float64
  ymin::Float64
  xmax::Float64
  ymax::Float64
  SwarmMeta(c::String,n::String) = new(c,n,0,0,0,0)
end

type Swarm
  m::SwarmMeta
  p::Array{Particle,1} # Particle
  g::Float64 # Best Global
  f # fitness func
end

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

# Find zero
function MinFitnessFunc(pt::Particle)
  pt.f = sqrt((abs(pt.y)^2) + (abs(pt.x)^2))
  return pt
end

# Returns a tuple of (Array{Float64,1},Array{Float64,1})
function SwarmFlattenCords(sw::Swarm)
  ([p.x for p in sw.p],[p.y for p in sw.p])
end

function SwarmFlattenFitness(sw::Swarm)
  [p.f for p in sw.p]
end

# Good place to add general stats to a swarm
function SwarmUpdateMetadata(sw::Swarm)
  cords = SwarmFlattenCords(sw)
  sw.m.xmin = minimum(cords[1])
  sw.m.ymin = minimum(cords[2])
  sw.m.xmax = maximum(cords[1])
  sw.m.ymax = maximum(cords[2])
  return sw
end

# Return a graph that looks cool :thumbs_up:
# Takes an arrray of swarms
function SwarmPlot(sws::Array{Swarm,1})
  newsws = mapSwarms(SwarmUpdateMetadata,sws)
  layout = Layout(;showlegend=true,
    shapes = [circle(
      x0=swarmlay.m.xmin,
      y0=swarmlay.m.ymin,
      x1=swarmlay.m.xmax,
      y1=swarmlay.m.ymax;
      opacity=0.1,
      fillcolor=swarmlay.m.c,
      line_color=swarmlay.m.c) for swarmlay in newsws])
  data = [scatter(;x=SwarmFlattenCords(sw)[1], y=SwarmFlattenCords(sw)[2],mode="markers",name=sw.m.n,) for sw in newsws]

  return plot(data,layout)
end

# Move each particle in a given swarm in a random direction
function ParticleMove(pt::Particle)
  pt.x += pt.v[1]
  pt.y += pt.v[2]
  return pt
end

function mapParticles(func,sw)
  sw.p = map!(func,sw.p)
  return sw
end

function mapSwarms(func,sws)
  map!(func,sws)
end

function mapParticlesInSwarms(func,sws::Array{Swarm,1},count=1)
  if (count < 1)
    return sws
  end
  count -= 1
  return mapParticlesInSwarms(func,map!(sw -> mapParticles(func,sw),sws),count)
end

function SwarmUpdateFitness(sw::Swarm)
  newsw = mapParticles(sw.f,sw)
  newsw.g = minimum(SwarmFlattenFitness(newsw))
  return newsw
end

# for each particle i = 1, ..., S do
#   Initialize the particle's position with a uniformly distributed random vector: xi ~ U(blo, bup)
#   Initialize the particle's best known position to its initial position: pi ← xi
#   if f(pi) < f(g) then
#       update the swarm's best known  position: g ← pi
#   Initialize the particle's velocity: vi ~ U(-|bup-blo|, |bup-blo|)

# while a termination criterion is not met do:
#   for each particle i = 1, ..., S do
#      for each dimension d = 1, ..., n do
#         Pick random numbers: rp, rg ~ U(0,1)
#         Update the particle's velocity: vi,d ← ω vi,d + φp rp (pi,d-xi,d) + φg rg (gd-xi,d)
#      Update the particle's position: xi ← xi + vi
#      if f(xi) < f(pi) then
#         Update the particle's best known position: pi ← xi
#         if f(pi) < f(g) then
#            Update the swarm's best known position: g ← pi

# For each particle
# {
#     Initialize particle
# }
#
# Do until maximum iterations or minimum error criteria
# {
#     For each particle
#     {
#         Calculate Data fitness value
#         If the fitness value is better than pBest
#         {
#             Set pBest = current fitness value
#         }
#         If pBest is better than gBest
#         {
#             Set gBest = pBest
#         }
#     }
#
#     For each particle
#     {
#         Calculate particle Velocity
#         Use gBest and Velocity to update particle Data
#     }

# Create an array of swarms
swarms = Swarm[]

push!(swarms,SwarmCreate(2,3,300,0.45,MinFitnessFunc))
push!(swarms,SwarmCreate(6,6,200,0.7,MinFitnessFunc,"rgb(164, 194, 244)"))
push!(swarms,SwarmCreate(4,4,200,1,MinFitnessFunc,"blue","The Best Swarm"))
push!(swarms,SwarmCreate(20,20,500,3,MinFitnessFunc,"green"))

# plt = SwarmPlot(swarms)
# display(plt)
swarms = mapSwarms(SwarmUpdateFitness,swarms)
display(SwarmPlot(swarms))
sleep(5)
display(SwarmPlot(mapSwarms(SwarmUpdateFitness,mapParticlesInSwarms(ParticleMove,swarms,2))))

## Heatmap
# using Plots
# plotlyjs()
# xs = [string("x",i) for i = 1:10]
# ys = [string("y",i) for i = 1:4]
# z = float((1:4) * (1:10)')
# heatmap(xs,ys,z,aspect_ratio=1)
