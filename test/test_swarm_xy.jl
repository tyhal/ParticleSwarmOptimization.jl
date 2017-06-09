using ParticleSwarmOptimization
PSO = ParticleSwarmOptimization
swarms = PSO.Swarm[]
push!(swarms,PSO.XYSwarmCreate(2,3,3,0.45))
push!(swarms,PSO.XYSwarmCreate(2,3,300,0.45))
push!(swarms,PSO.XYSwarmCreate(6,6,200,0.7,"rgb(164, 194, 244)"))
push!(swarms,PSO.XYSwarmCreate(4,4,200,1,"blue","The Best Swarm"))
push!(swarms,PSO.XYSwarmCreate(20,20,500,3,"green"))
PSO.SwarmsGetTotalFitness(PSO.RunPSOs(swarms,5))
