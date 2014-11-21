import scipy.spatial.distance as scid
import numpy as np
import sklearn.cluster as cluster
import sys

l = [[50,1,0],
[75,1,0],
[80,1,0],
[60,0,1],
[55,0,1],
[40,0,1],
[35,0,1],
[50,0,1]]

data = np.array(l)
nddata = data
mn = nddata - nddata.mean(axis=0)
r = mn.max(axis=0) - mn.min(axis=0)
nor =  mn / r

fardist = sys.float_info.min
i1 = 0
i2 = 0
dist = 0

for i in range(len(nor)):
	for j in range(len(nor)):
		if i != j:
			print i,j
			dist = scid.euclidean(nor[i],nor[j])
			if dist > fardist:
				print "**", dist, "--" , fardist, i,j
				fardist = dist
				i1 = i
				i2 = j

print i1,i2

initial_centroids = nor[[i1,i2],:]

print initial_centroids

kmeans = cluster.KMeans(n_clusters=2, max_iter=400, precompute_distances=False, tol=0.0001, n_jobs=1, verbose=0, random_state=None, copy_x=True, init=initial_centroids)

print kmeans

clusters = kmeans.fit(nor)

print clusters.labels_
print clusters.cluster_centers_

