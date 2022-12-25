def addEdge(adj, v, w):
	adj[v].append(w)
	adj[w].append(v)
	return adj

def greedyColoring(adj, V):
	result = [-1] * V
	result[0]=0
	available = [False] * V
	for u in range(1, V):
		for i in adj[u]:
			if (result[i] != -1):
				available[result[i]] = True
		cr = 0
		while cr < V:
			if (available[cr] == False):
				break
			
			cr += 1
		result[u] = cr
		for i in adj[u]:
			if (result[i] != -1):
				available[result[i]] = False

	for u in range(V):
		print("Vertex", u, " ---> Color", result[u])

if __name__ == '__main__':
	
    g1 = [[] for i in range(30)]
    g1 = addEdge(g1, 0, 1)
    g1 = addEdge(g1, 0, 2)
    g1 = addEdge(g1, 1, 2)
    g1 = addEdge(g1, 1, 3)
    g1 = addEdge(g1, 2, 3)
    g1 = addEdge(g1, 3, 4)
    g1 = addEdge(g1, 4, 5)
    g1 = addEdge(g1, 3, 6)
    g1 = addEdge(g1, 5, 7)
    g1 = addEdge(g1, 6, 8)
    g1 = addEdge(g1, 8, 9)
    g1 = addEdge(g1, 9, 10)
    g1 = addEdge(g1, 10, 11)
    g1 = addEdge(g1, 10, 12)
    g1 = addEdge(g1, 10, 13)
    g1 = addEdge(g1, 11, 14)
    g1 = addEdge(g1, 11, 15)
    g1 = addEdge(g1, 12, 16)
    g1 = addEdge(g1, 12, 13)
    g1 = addEdge(g1, 13, 14)
    g1 = addEdge(g1, 15, 16)
    g1 = addEdge(g1, 16, 17)
    g1 = addEdge(g1, 17, 18)
    g1 = addEdge(g1, 18, 19)
    g1 = addEdge(g1, 17, 20)
    g1 = addEdge(g1, 19, 21)
    g1 = addEdge(g1, 18, 22)
    g1 = addEdge(g1, 20, 23)
    g1 = addEdge(g1, 21, 24)
    g1 = addEdge(g1, 23, 25)
    g1 = addEdge(g1, 24, 25)

    print("Coloring of graph 1 ")
    greedyColoring(g1, 30)
