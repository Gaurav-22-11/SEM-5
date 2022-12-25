def color_nodes(graph):
  graphs_nodes = sorted(list(graph.keys()), key=lambda x: len(graph[x]), reverse=True)
  color_dict = {}
  for node in graphs_nodes:
    graph_colors = [True] * len(graphs_nodes)
    for adjacent in graph[node]:
      if adjacent in color_dict:
        color = color_dict[adjacent]
        graph_colors[color] = False
    for color, available in enumerate(graph_colors):
      if available:
        color_dict[node] = color
        break
  return color_dict

nodes_alphabets=['a','b','c','d','e','f','g','h','i','j','k','l','m','n','o','p','q','r','s','t','u','v','w','x','y','z']



graph={}
for i in nodes_alphabets:
    graph[i]=[]
for i in nodes_alphabets:
    for j in nodes_alphabets:
        if i!=j:
            graph[i].append(j)
print(graph)
print("Colors : \n",color_nodes(graph))

