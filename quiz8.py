import numpy as np
import sklearn.cluster as cluster

data = []
with open("dataset_393_1.txt") as inf:
	for line in inf:
		line = line.split()
		templine = []
		if len(line) == 5:
			if line[4] == 'I.setosa':
				templine[0:4] = map(float,line[0:4])
				templine.append(float(0))
			if line[4] == 'I.versicolor':
				templine[0:4] = map(float,line[0:4])
				templine.append(float(1))
			if line[4] == 'I.virginica':
				templine[0:4] = map(float,line[0:4])
				templine.append(float(2))
		data.append(templine)

#data.sort(key=lambda s:(s[4]))

initial_centroids_indices = [0,50,100]

npdata = np.array(data)
nddata = npdata[:,[0,1,2,3]]

meanscaled = nddata - nddata.mean(axis=0)
range = meanscaled.max(axis=0) - meanscaled.min(axis=0)
normalised = meanscaled / range
initial_centroids = normalised[initial_centroids_indices,]

kmeans = cluster.KMeans(n_clusters=3, max_iter=400, precompute_distances=True, tol=0.0001, n_jobs=1, verbose=0,
                    random_state=None, copy_x=True, init=initial_centroids)

clusters = kmeans.fit(normalised)

print clusters.labels_
print clusters.cluster_centers_

'''
-0.2579  0.1781 -0.4463 -0.4264
0.0113 -0.1122  0.0916  0.07754
0.2708  0.0247  0.3226  0.3284

-0.2302 0.1333 -0.4075 -0.4044
0.0256 -0.1193 0.1212 0.1066
0.2674 0.0229 0.3443 0.3649

-0.26413547  0.16045455 -0.40977915 -0.41118687
-0.0161826  -0.11872396  0.06990113  0.06253472
0.30137255  0.01281746  0.32277643  0.33547619

-0.23923342 0.08021318 -0.36078073 -0.34473514
-0.08932462 0.33289216 -0.34394958 -0.32410131
0.13117284 -0.1012037 0.23734127 0.22592593
'''
