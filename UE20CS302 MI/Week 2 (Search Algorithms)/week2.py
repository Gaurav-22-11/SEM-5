import queue
import copy
import numpy as np
"""
You can create any other helper funtions.
Do not modify the given functions
"""
def A_star_Traversal(cost, heuristic, start_point, goals):
    """
    Perform A* Traversal and find the optimal path 
    Args:
        cost: cost matrix (list of floats/int)
        heuristic: heuristics for A* (list of floats/int)
        start_point: Staring node (int)
        goals: Goal states (list of ints)
    Returns:
        path: path to goal state obtained from A*(list of ints)
    """
    path = []
    # TODO
    n=len(cost)
    explored_set=[0 for i in range(n)]
    pq=queue.PriorityQueue()
    pq.put((heuristic[start_point],([start_point],start_point,0,goals)))

    while(pq.qsize()!=0):
        estimated_cost_total,node_list=pq.get()
        path2node=node_list[0]
        node=node_list[1]
        nodecost=node_list[2]
        
        if explored_set[node]==0:
            explored_set[node] =1
            if node in goals:
                return path2node

            for nextnode in range(1,n):
                if cost[node][nextnode]>0 and explored_set[nextnode] == 0:
                    cost_to_reach_node = nodecost + cost[node][nextnode]
                    total_cost = cost_to_reach_node + heuristic[nextnode]

                    path2nextnode=copy.deepcopy(path2node)
                    path2nextnode.append(nextnode)
                    pq.put((estimated_cost_total,(path2nextnode,nextnode,cost_to_reach_node)))    
    return path


def DFS_Traversal(cost, start_point, goals):
    """
    Perform DFS Traversal and find the optimal path 
        cost: cost matrix (list of floats/int)
        start_point: Staring node (int)
        goals: Goal states (list of ints)
    Returns:
        path: path to goal state obtained from DFS(list of ints)
    """
    path = []
    # TODO
    n=len(cost)
    visited= [0 for i in range(n)]
    stack=queue.LifoQueue()

    stack.put((start_point,[start_point]))
    while(stack.qsize!=0):
        vertex,dfs_path2vertex=stack.get()
        if visited[vertex]==0:
            visited[vertex]=1
        if vertex in goals:
            return dfs_path2vertex
        for nextvertex in range(n-1,0,-1):
            if cost[vertex][nextvertex] >0:
                if[visited][nextvertex] == 0:
                    dfs_path2nextvertex= copy.deepcopy(dfs_path2vertex)
                    dfs_path2nextvertex.append(nextvertex)
                    stack.put((nextvertex,dfs_path2nextvertex))
    return path
