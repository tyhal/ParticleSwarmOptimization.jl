
# # Basic swarm object
# type Swarm
#   plot::SwarmPlotInfo
#   part::Array{Particle,1} # Particle
#   glfi::Float64 # Best Global
#   fifu::Any # fitness func
#   move::Any # move func (glfi::Float64,swdata::Any,pt::Particle)
#   data::Any # data
# end

# Place a swarm at (xa,ya) with (count) many particles using a (dist) distribution.
# name it (name) and the tracking circle will be the color (color)
# (seed) is feed as permanent data for swarm (so it can contain extra metadata)
function SwarmCreate(count,fitness::Function,move::Function,initpop::Function,seed,color="white",name="Swarm")
  g = Float64(Inf)
  p = [Particle(ParticlePlotInfo(),i,Float64(Inf),initpop(seed)) for i in [1:count;]]
  Swarm(SwarmPlotInfo(color,name),p,g,fitness,move,seed)
end
