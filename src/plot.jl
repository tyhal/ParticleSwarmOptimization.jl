using PlotlyJS
@eval using Distributions

function SwarmSetPlotter(plotter,sw::Swarm)
  sw.plot.updt = plotter
  return sw
end

function SwarmsSetPlotter(plotter,sws::Array{Swarm,1})
  mapSwarms((sw) -> SwarmSetPlotter(plotter,sw),sws)
end

function ParticleUpdatePlotInfo(func::Function,pt::Particle)
  pt.plot = func(pt)
  return pt
end

# Returns a tuple of (Array{Float64,1},Array{Float64,1})
function SwarmFlattenCords(sw::Swarm)
  ([p.plot.x for p in sw.part],[p.plot.y for p in sw.part])
end


# Good place to add general stats to a swarm
function SwarmUpdatePlotInfo(sw::Swarm)
  # Can read data but only change the positioin on the graph
  sw.part = map!(pt -> ParticleUpdatePlotInfo(sw.plot.updt,pt) , sw.part)
  cords = SwarmFlattenCords(sw)
  sw.plot.xmin = minimum(cords[1])
  sw.plot.ymin = minimum(cords[2])
  sw.plot.xmax = maximum(cords[1])
  sw.plot.ymax = maximum(cords[2])
  return sw
end

# Return a graph that looks cool :thumbsup:
# Takes an array of swarms
function SwarmPlot(sws::Array{Swarm,1})
  newsws = mapSwarms(SwarmUpdatePlotInfo,sws)
  layout = Layout(;showlegend=true,
    shapes = [circle(
      x0=swarmlay.plot.xmin,
      y0=swarmlay.plot.ymin,
      x1=swarmlay.plot.xmax,
      y1=swarmlay.plot.ymax;
      opacity=0.1,
      fillcolor=swarmlay.plot.colo,
      line_color=swarmlay.plot.colo) for swarmlay in newsws])
  data = [scatter(;x=SwarmFlattenCords(sw)[1], y=SwarmFlattenCords(sw)[2],mode="markers",name=sw.plot.name,) for sw in newsws]
  return plot(data,layout)
end
