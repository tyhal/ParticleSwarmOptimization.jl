
# function SwarmCreate(count,fitness::Function,move::Function,initpop::Function,seed::Any,color="white",name="Swarm")
#   p = [Particle(ParticlePlotInfo(),i,Float64(0),Float64(0),initpop(seed),initpop(seed)) for i in [1:count;]]
#   Swarm(SwarmsPlotInfo(color,name),p,p[1].fitn,p[1],fitness,move,seed)
# end
ret = PSO.RunPSO(PSO.SwarmCreate(5,pt -> pt.data, (g,d,p) -> p, x -> Float64(x), 1))
@test PSO.GetAverageFitness(ret) == 1
