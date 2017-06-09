
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
  ParticlePlotInfo(prt.data.x,prt.data.y)
end


# A population element
# type Particle
#   plot::ParticlePlotInfo
#   indx::Integer # Id in array
#   fitn::Float64 # Fitness
#   befi::Float64 # Best Fitness
#   data::Any # Data
#   beda::Any # Best Data
# end
function veloc(gBest::Float64,lBest::Float64,currP::Float64,currV::Float64)
  w=0.5       # constant inertia weight (how much to weigh the previous velocity)
  c1=1        # cognative constant
  c2=2        # social constant
  r1=rand()
  r2=rand()
  vel_cognitive=c1*r1*(lBest-currP)
  vel_social=c2*r2*(gBest-currP)
  return w*currV+vel_cognitive+vel_social
end


function XYUpdateVelocity(glpt::Particle,swdata::Any,pt::Particle)
  gx = glpt.data.x
  bx = pt.beda.x
  gy = glpt.data.x
  by = pt.beda.x
  vx = veloc(gx,bx,pt.data.x,pt.data.vect[1])
  vy = veloc(gy,by,pt.data.y,pt.data.vect[2])
  pt.data.vect = (vx,vy);
  return pt
end

# Apply the movement vector
function XYMove(glpt::Particle,swdata::Any,pt::Particle)
  pt = XYUpdateVelocity(glpt,swdata,pt)
  pt.data.x += pt.data.vect[1]
  pt.data.y += pt.data.vect[2]
  return pt
end

function XYParticleInit(xyd::XYSeedData)
  XYPartData(
    rand(Normal(xyd.x, xyd.d)),
    rand(Normal(xyd.y, xyd.d)),
    (rand(Normal()),rand(Normal())))
end

# Place a swarm at (xa,ya) with (count) many particles using a (dist) distribution.
# name it (name) and the tracking circle will be the color (color)
function XYSwarmCreate(x,y,count,dist,fitness::Function,color="white",name="XY Swarm")
  move = XYMove
  initpop = XYParticleInit
  seed = XYSeedData(x,y,dist)
  SwarmSetPlotter(XYPlot,SwarmCreate(count,fitness,move,initpop,seed,color,name))
end
