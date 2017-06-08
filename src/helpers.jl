
# Returns a tuple of (Array{Float64,1},Array{Float64,1})
function SwarmFlattenCords(sw::Swarm)
  ([p.x for p in sw.p],[p.y for p in sw.p])
end

function SwarmFlattenFitness(sw::Swarm)
  [p.f for p in sw.p]
end

function mapParticles(func,sw)
  sw.p = map!(func,sw.p)
  return sw
end

function mapSwarms(func,sws)
  map!(func,sws)
end

function mapParticlesInSwarms(func,sws::Array{Swarm,1},count=1)
  if (count < 1)
    return sws
  end
  count -= 1
  return mapParticlesInSwarms(func,map!(sw -> mapParticles(func,sw),sws),count)
end

function SwarmUpdateFitness(sw::Swarm)
  newsw = mapParticles(sw.f,sw)
  newsw.g = minimum(SwarmFlattenFitness(newsw))
  return newsw
end

function getTotalFitness(sws::Array{Swarm,1})
  return reduce((a,b) -> a + b.g,0,sws)
end
