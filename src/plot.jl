using PlotlyJS
@eval using Distributions

# Good place to add general stats to a swarm
function SwarmMetadataUpdateMinMax(sw::Swarm)
  cords = SwarmFlattenCords(sw)
  sw.m.xmin = minimum(cords[1])
  sw.m.ymin = minimum(cords[2])
  sw.m.xmax = maximum(cords[1])
  sw.m.ymax = maximum(cords[2])
  return sw
end

# Return a graph that looks cool :thumbs_up:
# Takes an arrray of swarms
function SwarmPlot(sws::Array{Swarm,1})
  newsws = mapSwarms(SwarmMetadataUpdateMinMax,sws)
  layout = Layout(;showlegend=true,
    shapes = [circle(
      x0=swarmlay.m.xmin,
      y0=swarmlay.m.ymin,
      x1=swarmlay.m.xmax,
      y1=swarmlay.m.ymax;
      opacity=0.1,
      fillcolor=swarmlay.m.c,
      line_color=swarmlay.m.c) for swarmlay in newsws])
  data = [scatter(;x=SwarmFlattenCords(sw)[1], y=SwarmFlattenCords(sw)[2],mode="markers",name=sw.m.n,) for sw in newsws]

  return plot(data,layout)
end
