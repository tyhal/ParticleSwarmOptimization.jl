# The actually useful

function SwarmFlattenFitness(sw::Swarm)
  [p.fitn for p in sw.part]
end

# Return best
function SwarmGetFittest(sw::Swarm)
  best = sw.part[1]
  for p in sw.part
    if p.fitn < best.fitn
        best = p
    end
  end
  return best
end

function SwarmUpdateFitness(sw::Swarm)
  sw.glpt = SwarmGetFittest(sw)
  sw.glfi = sw.glpt.fitn
  return sw
end

# Get a reduction of all the swarms fitness
function GetAverageFitness(sws::Array{Swarm,1})
  reduce((a,b) -> a + b.g,0,sws) / size(sws.part)[1]
end

# Get a reduction of all the swarms fitness
function GetAverageFitness(fits::Array{Float64,1})
  reduce(+,fits) / size(fits)[1]
end

# Get an array of each swarms fitness
function SwarmsGetFitness(sws::Array{Swarm,1})
  [sw.glfi for sw in sws]
end

function SwarmsGetMinFitness(sws::Array{Swarm,1})
  maximum(SwarmsGetFitness(sws))
end

# Update this particles fitness with the inputted fitness funct
function ParticleUpdateFitness(fifu::Function,pt::Particle)
  pt.fitn = fifu(pt)
  if pt.fitn < pt.befi
    pt.befi = pt.fitn
  end
  return pt
end

# M
# sw.move = (glfi::Float64,swdata::Any,pt::Particle)
function SwarmUpdate(sw::Swarm)
  sw.part = map!(pt -> sw.move(sw.glpt,sw.data,pt), sw.part)
  sw.part = map!(pt -> ParticleUpdateFitness(sw.fifu,pt), sw.part)
  SwarmUpdateFitness(sw)
end

function SwarmsUpdate(sws::Array{Swarm,1},count=1)
  mapSwarms(SwarmUpdate,sws,count)
end

function RunPSOs(sws::Array{Swarm,1},count=10)
  display(SwarmsPlot(sws,"Before"))
  sws = mapSwarms(SwarmUpdate,sws,count)
  display(SwarmsPlot(sws,"After"))
  SwarmsGetFitness(sws)
end

function RunPSO(sw::Swarm,count=10)
  sws = Swarm[]
  push!(sws,sw)
  RunPSOs(sws,count)
end
