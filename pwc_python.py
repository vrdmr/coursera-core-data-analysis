import numpy as np
import pandas as pd

file='dataset_390_1.txt'
pddat=pd.io.parsers.read_table(file,header=None) # read data into DataFrame

cls=[0]*len(pddat[3]) # classifier index
for i in range(len(pddat[3])):
    if pddat[3][i]<=0.5: # closed upper 
        cls[i]=0
    elif pddat[3][i]<=1.5: # closed upper
        cls[i]=1
    elif pddat[3][i]<=2.0: # closed upper
        cls[i]=2
    else:
        cls[i]=3

dfPWc=pd.DataFrame(cls) # create DataFrame to index

taxon=list(set(list(pddat[4])))
taxon.sort() # I missed this first time through
PWc=list(set(list(dfPWc[0])))
PWc.sort() 

iris_cond = np.zeros((len(taxon),len(PWc))) # create an array to hold the conditional counts

for i in range(len(taxon)):
    for j in range(len(PWc)):
        # DataFrame logical indexing; count number of elements in each logical set
        iris_cond[i,j]=len(list(pddat[(pddat[4]==taxon[i])&(dfPWc[0]==PWc[j])][0]))
