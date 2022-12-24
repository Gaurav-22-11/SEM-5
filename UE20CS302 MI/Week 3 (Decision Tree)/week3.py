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
        p=df[column].value_counts()[value]/len(df[column])
        entropy+= -p*np.log2(p)
    return entropy


'''Return avg_info of the attribute provided as parameter'''
# input:pandas_dataframe,str   {i.e the column name ,ex: Temperature in the Play tennis dataset}
# output:int/float
def get_avg_info_of_attribute(df, attribute):
    avg_info=0
    target=df.keys()[-1]
    df_attribute=df[[attribute, target]]
    df_attribute.groupby(attribute)
    a=dict(df_attribute[attribute].value_counts())
    for i in a:
        x=df_attribute.loc[df[attribute]==i]
        sum=0
        e=0
        category=dict(x[target].value_counts())
        for j in category:
            sum+=category.get(j)
            if category.get(j)==0 or category.get(j)==len(x[target]):
                e=0
            else:
                p=category.get(j)/len(x[target])
                e+= -p*np.log2(p)
        avg_info += sum/len(df)*e
    return avg_info


'''Return Information Gain of the attribute provided as parameter'''
# input:pandas_dataframe,str
# output:int/float
def get_information_gain(df, attribute):
    information_gain=0
    e=get_entropy_of_dataset(df)
    i=get_avg_info_of_attribute(df, attribute)
    information_gain = e-i

    return information_gain




#input: pandas_dataframe
#output: ({dict},'str')
def get_selected_attribute(df):
    '''
    Return a tuple with the first element as a dictionary which has IG of all columns 
    and the second element as a string with the name of the column selected

    example : ({'A':0.123,'B':0.768,'C':1.23} , 'C')
    '''
    information_gains={}
    selected_column=''
    target=df.keys()[-1]
    for i in df.columns:
        if i!=target:
            gain=get_information_gain(df,i)
            information_gains[i]=gain
    selected_column=max(information_gains, key=lambda x:information_gains[x])
    return(information_gains, selected_column)
    
