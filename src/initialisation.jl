
# # Basic swarm object
# type Swarm
#   plot::SwarmsPlotInfo
#   part::Array{Particle,1} # Particle
#   glfi::Float64 # Best Global
#   fifu::Any # fitness func
#   move::Any # move func (glfi::Float64,swdata::Any,pt::Particle)
#   data::Any # data
# end
# type Particle
#   plot::ParticlePlotInfo
#   indx::Integer # Id in array
#   fitn::Float64 # Fitness
#   befi::Float64 # Best Fitness
#   data::Any
# end

#Move(glfi::Float64,swdata::Any,pt::Particle) return Particle
#fitness(pt::Particle) return Float64
function SwarmCreate(count,fitness::Function,move::Function,initpop::Function,seed::Any,color="white",name="Swarm")
  p = [Particle(i,initpop(seed)) for i in [1:count;]]
  Swarm(SwarmsPlotInfo(color,name),p,p[1].fitn,p[1],fitness,move,seed)
end
