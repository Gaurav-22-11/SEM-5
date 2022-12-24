"""
You can create any other helper funtions.
Do not modify the given functions
"""
import queue
import copy
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
    #TODO
    n = len(cost)                                               
    explored_set = [0 for i in range(n)]                             
    pq = queue.PriorityQueue()             
    pq.put((heuristic[start_point], ([start_point], start_point, 0 , goals)))
    while(pq.qsize() != 0):

        total_cost_current, node_list = pq.get()
        path2node = node_list[0]
        node = node_list[1]
        node_cost = node_list[2]

       
        if explored_set[node] == 0:
            explored_set[node] = 1

            
            if node in goals:
                return path2node

            
            for nextnode in range(1, n):
                
                if cost[node][nextnode] > 0 and explored_set[nextnode] == 0:

                    total_cost_till_node = node_cost + cost[node][nextnode]
                    total_cost_current = total_cost_till_node + heuristic[nextnode]

                    path2nextnode= copy.deepcopy(path2node)
                    path2nextnode.append(nextnode)
                    pq.put((total_cost_current, (path2nextnode, nextnode, total_cost_till_node)))
    return path()


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
    #TODO
    n = len(cost)                                  
    explored_set = [0 for i in range(n)]           
    stack = queue.LifoQueue() 
    stack.put((start_point, [start_point]))
    while(stack.qsize() != 0):
        node, dfspath2node = stack.get()
        if explored_set[node] == 0:
            explored_set[node] = 1
            if node in goals:
                return dfspath2node
            for nextnode in range(n-1, 0, -1):
                if cost[node][nextnode] > 0:
                    if explored_set[nextnode] == 0:
                        dfspath2nextnode = copy.deepcopy(dfspath2node)
                        dfspath2nextnode.append(nextnode)
                        stack.put((nextnode,dfspath2nextnode))

    #return path()
    return path
