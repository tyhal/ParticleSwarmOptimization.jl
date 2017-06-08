# The actually useful

function SwarmFlattenFitness(sw::Swarm)
  [p.f for p in sw.p]
end

function SwarmUpdateFitness(sw::Swarm)
  newsw.glfi = minimum(SwarmFlattenFitness(newsw))
  return newsw
end

# Get a reduction of all the swarms fitness
function SwarmsGetTotalFitness(sws::Array{Swarm,1})
  reduce((a,b) -> a + b.g,0,sws)
end

# Get a reduction of all the swarms fitness
function SwarmsGetTotalFitness(fits::Array{Float64,1})
  reduce(+,fits)
end

# Get an array of each swarms fitness
function SwarmsGetFitness(sws::Array{Swarm,1})
  [sw.glfi for sw in sws]
end

function SwarmsGetMaxFitness(sws::Array{Swarm,1})
  maximum(SwarmsGetFitness(sws))
end

# Update this particles fitness with the inputted fitness funct
function ParticleUpdateFitness(fifu::Any,pt::Particle)
  pt.f = fifu(pt)
  return pt
end

# M
# sw.move = (glfi::Float64,swdata::Any,pt::Particle)
function SwarmUpdate(sw::Swarm)
  sw.part = map!(pt -> sw.move(sw.glfi,sw.data,pt), sw.part)
  sw.part = map!(pt -> ParticleUpdateFitness(sw.fifu,pt), sw.part)
  SwarmUpdateFitness(sw)
end

function SwarmsUpdate(sws::Array{Swarm,1},count=1)
  mapSwarms(SwarmUpdate,sws,count)
end
