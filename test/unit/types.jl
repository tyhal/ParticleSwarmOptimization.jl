
# ParticlePlotInfo
ppi = PSO.ParticlePlotInfo(1,2)
@test typeof(ppi) == ParticleSwarmOptimization.ParticlePlotInfo
@test ppi.x == 1
@test ppi.y == 2

# Particle
prt = PSO.Particle(1,String("Hello"))
@test typeof(prt) == ParticleSwarmOptimization.Particle
@test prt.plot.x == 0
@test prt.indx == 1
@test prt.fitn == 0.0
@test prt.befi == 0.0
@test prt.data == "Hello"
@test prt.beda == "Hello"

spi = PSO.SwarmsPlotInfo("white","name")
@test spi.colo == "white"
@test spi.name == "name"

sw = PSO.Swarm(spi,[prt],64.0,prt,x -> x,x -> x,"Hello")
@test sw.part[1].indx == 1
@test sw.part[1].data == "Hello"
