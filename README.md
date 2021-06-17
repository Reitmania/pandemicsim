# Agent-based Pandemic Simulation with Godot

This simulation was inspired by [this project](https://github.com/mani144/Covid19-Simulation-Godot).

I decided to implement a 3D agent-based simulation of pandemic scenarios in the Godot game engine. This simulation could be used for a microscopical approach to analyze COVID-19. 

- green colored agent: 
- red colored: infected, can infect other agents
- blue colored: cured
- black colored: dead

One can vary the number of agents, the ratio of infections and of course the environment. 

My idea is to add a second collision shape to each agent, which is bigger than the agent itself. So you can create some kind of a region in which the infection might have an effect (e. g. 1.5 meters).

![Alt text](screenshot.png?raw=true "Screenshot")

Feel free to fork and adjust things!
