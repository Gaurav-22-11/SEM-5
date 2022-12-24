from sklearn.svm import SVC
from sklearn.pipeline import Pipeline
from sklearn.preprocessing import *
from sklearn.pipeline import make_pipeline
from sklearn.naive_bayes import MultinomialNB
from sklearn.preprocessing import Binarizer

from sklearn.decomposition import PCA

import pandas as pd
import numpy as np


class SVM:

    def __init__(self, dataset_path):

        self.dataset_path = dataset_path
        data = pd.read_csv(self.dataset_path)

        # X-> Contains the features
        self.X = data.iloc[:, 0:-1]
        # y-> Contains all the targets
        self.y = data.iloc[:, -1]

    def solve(self):
        """
        Build an SVM model and fit on the training data
        The data has already been loaded in from the dataset_path

        Refrain to using SVC only (with any kernel of your choice)

        You are free to use any any pre-processing you wish to use
        Note: Use sklearn Pipeline to add the pre-processing as a step in the model pipeline
        Refrain to using sklearn Pipeline only not any other custom Pipeline if you are adding preprocessing

        Returns:
            Return the model itself or the pipeline(if using preprocessing)
        """

        # TODO
        # svc_pipe=Pipeline([('scalar3', PCA()),('clf', SVC())])   Accuracy: 59.70%

        # svc_pipe=Pipeline(['scalar3',(),('clf', SVC())])

        #make_pipeline(Binarizer(), MultinomialNB())
        #svc_pipe=Pipeline(steps=[('binarizer', Binarizer()), ('multinomialnb', MultinomialNB())])     Accuracy: 50.52%

        #svc_pipe=Pipeline([('scalar3', MinMaxScaler()),('clf', SVC())])   #Accuracy: 87.56%

        svc_pipe=Pipeline([('normalise', RobustScaler()),('SVM',SVC(C=3.5,kernel='rbf',gamma='scale'))])
        svc_pipe.fit(self.X,self.y)
        return svc_pipe
        pass
