setwd('C:/Users/Rimna/Desktop/Social networking/R projects/Norse God tree')
library(igraph)
library(readxl)

Odin_god=read_excel('Odin and Pals.xlsx')

god_nodes=read_excel('God_ID.xlsx')

god_graph=graph_from_data_frame(d=Odin_god,
                                vertices = god_nodes,
                                directed = F)

V(god_graph)
V(god_graph)$name

E(god_graph)
E(god_graph)$weight

#viewing the adjacency matrix 
god_graph[]

layout1=layout.fruchterman.reingold(god_graph)
V(god_graph)$color='yellow'
V(god_graph)[degree(god_graph)>8]$color='red'
V(god_graph)$size=log(strength(god_graph))*12
E(god_graph)$color='blue'
E(god_graph)$width=log(E(god_graph)$weight)+2

plot(god_graph, 
     edge.curved= .25,
     vertex.label.color='black',
     vertex.label.cex= 1.50,
     layout=layout_as_star, 
     main='Star chart of Norse Gods')

plot(god_graph,
     vertex.label.color='black',
     vertex.label.cex= 1.50, 
     main='Network of Norse Gods')
#--------------------------------------------------------
#Calculating the characteristics of the network 
sort(degree(god_graph), decreasing = TRUE)[1:3]
# the God with the highest degree are Odin and Loki with 9 degree
# third is Thor with 8 degree. Odin and Loki are connected to other gods
# they are the most important in the mythes 
edge_density(god_graph)
#the network has a density of 0.73, meaning it is highly density
#the high density may be due to the fact that almost everyone is connected
#to most other node
shortest.paths(god_graph)

#is.bipartite(god_graph)

diameter(god_graph)
# the diameter of the network is 10 which means that the longest 
#shortest path has 10 edges  between nodes

sort(closeness(god_graph),decreasing = T)
# there is little difference in the range of closeness, 
# Hodor has the highest closeness (0.028)
# and Himdal having the lowest (0.017)
sort(betweenness(god_graph), decreasing = T)
# Tyr has the highest betweenness (12.66).
#While, Thor, Vidar amd Himdal have the lowest betweeness (0)

maximal.cliques(god_graph)
# there are five possible maximal cliques. 
# maximal cliques are tightly connected nodes where each node is connected to another

#--------------------------------------------------------------------------
#Centrality calculation on the graph level

centr_degree(god_graph)
# degree-centrality  has a score of 0.26.
#the low score could be due to the lack of connection for some gods
centr_betw(god_graph)
#between-centrality has a score of 0.07
#Surprisely, this is because Odin and Loki are the only gods that are connected to every other gods
centr_clo(god_graph)
#closeness-centrality has a score of 0.45
#However, each god is close to other gods
centr_eigen(god_graph)$centralization
#eigen-centrality has a score of 0.25
#Due to the present of many node with relative high degree, the eigen score is low
# The network has a low graph level scores all tested centrality






