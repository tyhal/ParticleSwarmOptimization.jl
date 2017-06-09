swarm = PSO.XYSwarmCreate(2,3,7,0.45,XYFitnessFunc)

# function mapParticles(func::Function,sw::Swarm)

function dataHello(x)
  x.data = "Hello"
  return x
end

@test typeof(swarm.part[1].data) == PSO.XYPartData
sw = PSO.mapParticles(dataHello,swarm)
@test sw.part[1].data == "Hello"

# function mapSwarms(func::Function,sws::Array{Swarm,1},count::Int64=1)
function addToGlob(x,i)
  x.glfi += i
  return x
end

swarms = PSO.Swarm[]
swarm = PSO.XYSwarmCreate(2,3,7,0.45,XYFitnessFunc)
swarm = PSO.SwarmUpdatePlotInfo(swarm)
push!(swarms,swarm)
push!(swarms,swarm)
@test swarms[1].glfi == 0
@test swarms[2].glfi == 0
sws = PSO.mapSwarms(x -> addToGlob(x,1.2),swarms,1)
@test sws[1].glfi == 2.4
@test sws[2].glfi == 2.4

# function forSwarm(func::Function,sw::Swarm,count::Int64=1)

sw = PSO.forSwarm(x -> addToGlob(x,1.6),swarm,2)
@test sw.glfi == 5.6

# function mapParticlesInSwarms(func::Function,sws::Array{Swarm,1},count=1)

swarms = PSO.Swarm[]
swarm = PSO.XYSwarmCreate(2,3,7,0.45,XYFitnessFunc)
swarm = PSO.SwarmUpdatePlotInfo(swarm)
push!(swarms,swarm)
push!(swarms,swarm)
@test typeof(swarms[2].part[7].data) == PSO.XYPartData
sw = PSO.mapParticlesInSwarms(dataHello,swarms)
@test typeof(swarms[2].part[7].data) != PSO.XYPartData
@test swarms[2].part[7].data == "Hello"
