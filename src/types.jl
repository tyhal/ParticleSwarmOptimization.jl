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

# Basic swarm object
type Swarm
  m::SwarmMeta
  p::Array{Particle,1} # Particle
  g::Float64 # Best Global
  f # fitness func
end
