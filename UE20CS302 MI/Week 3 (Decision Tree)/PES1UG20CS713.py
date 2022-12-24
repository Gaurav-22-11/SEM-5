import numpy as np
import pandas as pd
import random
'''Calculate the entropy of the enitre dataset'''
# input:pandas_dataframe
# output:int/float
def get_entropy_of_dataset(df):
    column=df.keys()[-1]
    entropy=0
    values=df[column].unique()
    for value in values:
            probability=df[column].value_counts()[value]/len(df[column])
            entropy += -probability*np.log2(probability)
    return entropy


'''Return avg_info of the attribute provided as parameter'''
# input:pandas_dataframe,str   {i.e the column name ,ex: Temperature in the Play tennis dataset}
# output:int/float
def get_avg_info_of_attribute(df, attribute):
    avg_info = 0
    target = df.keys()[-1]
    
    new_df = df[[attribute,target]]
    new_df.groupby(attribute)
    a = dict(new_df[attribute].value_counts())
    
    for i in a:
            x = new_df.loc[df[attribute]==i]
            sum = 0
            e = 0
            categories = dict(x[target].value_counts())
            for j in categories:
                    sum+= categories.get(j)
                    if categories.get(j) == 0 or categories.get(j)==len(x[target]):
                            e = 0
                    else:
                            probability = categories.get(j)/len(x[target])
                            e += -probability*np.log2(probability)
            avg_info += sum/len(df)*e
                            
    return avg_info


'''Return Information Gain of the attribute provided as parameter'''
# input:pandas_dataframe,str
# output:int/float
def get_information_gain(df, attribute):
    information_gain = 0
    a = get_entropy_of_dataset(df)
    b = get_avg_info_of_attribute(df, attribute)
    information_gain = a - b
    
    return information_gain




#input: pandas_dataframe
#output: ({dict},'str')
def get_selected_attribute(df):
    information_gains={}
    selected_column=' '
    target = df.keys()[-1]
    for i in df.columns:
            if i!=target:
                    gain = get_information_gain(df,i)
                    information_gains[i]=gain
    selected_column = max(information_gains, key=lambda x:information_gains[x])
    return(information_gains,selected_column)
