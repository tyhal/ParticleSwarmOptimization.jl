type ParticlePlotInfo
  x::Float64
  y::Float64
  ParticlePlotInfo(x=0,y=0) = new(x,y)
end

type Particle
  plot::ParticlePlotInfo
  indx::Integer # Id in array
  fitn::Float64 # Fitness
  data::Any
end

type SwarmPlotInfo
  colo::String # Swarm Color
  name::String # Name of Swarm :3
  xmin::Float64
  ymin::Float64
  xmax::Float64
  ymax::Float64
  updt::Function # Update for particles
  SwarmPlotInfo(c::String,n::String) = new(c,n,0,0,0,0,(p::Particle) -> ParticlePlotInfo(p.indx,p.fitn))
end

# Basic swarm object
type Swarm
  plot::SwarmPlotInfo
  part::Array{Particle,1} # Particle
  glfi::Float64 # Best Global
  fifu::Function # fitness func
  move::Function # move func (glfi::Float64,swdata::Any,pt::Particle)
  data::Any # data
end
