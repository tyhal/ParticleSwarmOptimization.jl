
# Info for a single plot
type ParticlePlotInfo
  x::Float64
  y::Float64
  ParticlePlotInfo(x=0,y=0) = new(x,y)
end

# A population element
type Particle
  plot::ParticlePlotInfo
  indx::Integer # Id in array
  fitn::Float64 # Fitness
  befi::Float64 # Best Fitness
  data::Any # Data
  beda::Any # Best Data
  Particle(indx::Integer,data::Any) = new(ParticlePlotInfo(),indx,Float64(0),Float64(0),data,data)
end

# Generic plotting object to render the Swarm on a scatterplot
type SwarmsPlotInfo
  colo::String # Swarm Color
  name::String # Name of Swarm :3
  xmin::Float64
  ymin::Float64
  xmax::Float64
  ymax::Float64
  updt::Function # Update for particles
  SwarmsPlotInfo(c::String,n::String) = new(c,n,0,0,0,0,(p::Particle) -> ParticlePlotInfo(p.indx,p.fitn))
end

# Basic swarm object holds functions and state to create any swarm you need
type Swarm
  plot::SwarmsPlotInfo
  part::Array{Particle,1} # Particle
  glfi::Float64 # Best Global
  glpt::Particle
  fifu::Function # fitness func
  move::Function # move func (glfi::Float64,swdata::Any,pt::Particle)
  data::Any # data
end
