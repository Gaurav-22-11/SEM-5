import numpy as np
from math import *
from decimal import Decimal

class KNN:
    """
    K Nearest Neighbours model
    Args:
        k_neigh: Number of neighbours to take for prediction
        weighted: Boolean flag to indicate if the nieghbours contribution
                  is weighted as an inverse of the distance measure
        p: Parameter of Minkowski distance
    """

    def __init__(self, k_neigh, weighted=False, p=2):

        self.weighted = weighted
        self.k_neigh = k_neigh
        self.p = p

    def fit(self, data, target):
        """
        Fit the model to the training dataset.
        Args:
            data: M x D Matrix( M data points with D attributes each)(float)
            target: Vector of length M (Target class for all the data points as int)
        Returns:
            The object itself
        """

        self.data = data
        self.target = target.astype(np.int64)

        return self

    def find_distance(self, x):
        """
        Find the Minkowski distance to all the points in the train dataset x
        Args:
            x: N x D Matrix (N inputs with D attributes each)(float)
        Returns:
            Distance between each input to every data point in the train dataset
            (N x M) Matrix (N Number of inputs, M number of samples in the train dataset)(float)
        """
        # TODO
        def Minkowski_Distance(self,arr,p,data):
            y=[]
            s=np.shape(data)[1]
            for i in data[:,0:s]:
                m = pow(sum(pow(abs(a-b),p) for a, b in zip(arr, i)),1/p)
                y.append(m)
            return y
            
        sum_list=[]
        for i in x:
            m = self.Minkowski_Distance(i,self.p,self.data)
            sum_list.append(m)
        return sum_list
            
        pass

    def k_neighbours(self, x):
        """
        Find K nearest neighbours of each point in train dataset x
        Note that the point itself is not to be included in the set of k Nearest Neighbours
        Args:
            x: N x D Matrix( N inputs with D attributes each)(float)
        Returns:
            k nearest neighbours as a list of (neigh_dists, idx_of_neigh)
            neigh_dists -> N x k Matrix(float) - Dist of all input points to its k closest neighbours.
            idx_of_neigh -> N x k Matrix(int) - The (row index in the dataset) of the k closest neighbours of each input

            Note that each row of both neigh_dists and idx_of_neigh must be SORTED in increasing order of distance
        """
        # TODO
        length,dist,indx,output=[]
        length=self.find_distance(x)
        for i in length:
            order={}
            for j in i:
                order[j] = i.index(j)
            index=[]
            distance=[]
            distance = np.sort(i)
            distance = distance[0:self.k_neigh]        
            for k in distance:
                index.append(order[k])
            dist.append(distance)
            indx.append(index)
        output.append(dist)
        output.append(indx)
        return output
        pass

    def predict(self, x):
        """
        Predict the target value of the inputs.
        Args:
            x: N x D Matrix( N inputs with D attributes each)(float)
        Returns:
            pred: Vector of length N (Predicted target value for each input)(int)
        """
        # TODO
        nearest_neighb = self.k_neighbours(x)
        a,b=[]
        y= self.target
        n = np.shape(self.data)[1]
        for i in nearest_neighb[1]:
            #a=[]
            for j in i:
                a.append(y[j])
            b.append(max(set(a), key = a.count))
        return b
        pass

    def evaluate(self, x, y):
        """
        Evaluate Model on test data using 
            classification: accuracy metric
        Args:
            x: Test data (N x D) matrix(float)
            y: True target of test data(int)
        Returns:
            accuracy : (float.)
        """
        # TODO
        p = self.predict(x)
        count = 0
        l = len(p)
        for (i,j) in list(zip(p,y)):
            if(i == j):
                count = count+1
        accuracy = (count/l)*100
        return accuracy
        pass
