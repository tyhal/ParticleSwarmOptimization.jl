
type XYPartData
  x::Float64
  y::Float64
  vect::Tuple{Float64,Float64}
end

type XYSeedData
  x::Float64
  y::Float64
  d::Float64 # Distribution
end

# Return a ParticlePlotInfo
# Assumes Standard XY data
function XYPlot(prt::Particle)
  print("HEllo")
  print(prt.data.x)
  ParticlePlotInfo(prt.data.x,prt.data.y)
end

function XYUpdateVelocity()
end

# Apply the movement vector
function XYMove(glfi::Float64,swdata::Any,pt::Particle)
  pt.data.x += pt.data.vect[1]
  pt.data.y += pt.data.vect[2]
  return plot
end

# Simple fitness = distance from (0,0)
function XYFitnessFunc(pt::Particle)
  sqrt((abs(pt.y)^2) + (abs(pt.x)^2))
end

function XYParticleInit(xyd::XYSeedData)
  XYPartData(
    rand(Normal(xyd.x, xyd.d)),
    rand(Normal(xyd.y, xyd.d)),
    (rand(Normal()),rand(Normal())))
end

# Place a swarm at (xa,ya) with (count) many particles using a (dist) distribution.
# name it (name) and the tracking circle will be the color (color)
function XYSwarmCreate(x,y,count,dist,color="white",name="XY Swarm",fitness=XYFitnessFunc)
  move = XYMove
  initpop = XYParticleInit
  seed = XYSeedData(x,y,dist)
  SwarmCreate(count,fitness,move,initpop,seed,color,name)
end
