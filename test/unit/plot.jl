#
# function SwarmSetPlotter(plotter,sw::Swarm)
#   sw.plot.updt = plotter
#   return sw
# end
#
# function SwarmsSetPlotter(plotter,sws::Array{Swarm,1})
#   mapSwarms((sw) -> SwarmSetPlotter(plotter,sw),sws)
# end
#
# function ParticleUpdatePlotInfo(func::Function,pt::Particle)
#   pt.plot = func(pt)
#   return pt
# end

swarms = PSO.Swarm[]
swarm = PSO.XYSwarmCreate(15,15,7,0.45,XYFitnessFunc)

@test size(PSO.SwarmFlattenCords(swarm)[1])[1] == 7

@test swarm.part[1].plot.x == 0;
swarm = PSO.SwarmUpdatePlotInfo(swarm)
@test swarm.part[1].plot.x != 0;

push!(swarms,swarm)

@test typeof(PSO.SwarmsPlot(swarms)) == PlotlyJS.SyncPlot{PlotlyJS.ElectronDisplay}
