import numpy as np
import sklearn.cluster as cluster

data = [[5.1, 3.5, 1.4, 0.1], [5.4, 3.7, 1.5, 0.2], [5.4, 3.4, 1.7, 0.2], [4.8, 3.1, 1.6, 0.2], [5.0, 3.5, 1.3, 0.3],
        [7.0, 3.2, 4.7, 1.4], [5.0, 2.0, 3.5, 1.0], [5.9, 3.2, 4.8, 1.8], [5.5, 2.4, 3.8, 1.1], [5.5, 2.6, 4.4, 1.2],
        [6.3, 3.3, 6.0, 2.5], [6.5, 3.2, 5.1, 2.0], [6.9, 3.2, 5.7, 2.3], [7.4, 2.8, 6.1, 1.9], [6.7, 3.1, 5.6, 2.4]]

initial_centroids_indices = [0,5,10]

#nddata = np.ndarray(np.array(data).shape, buffer=np.array(data))
nddata = np.array(data)

meanscaled = nddata - nddata.mean(axis=0)
range = meanscaled.max(axis=0) - meanscaled.min(axis=0)
normalised = meanscaled / range

initial_centroids = normalised[initial_centroids_indices,]

kmeans = cluster.KMeans(n_clusters=3, max_iter=10, precompute_distances=False, tol=0.000001, n_jobs=1, verbose=0,
                    random_state=None, copy_x=True, init=initial_centroids)

clusters = kmeans.fit(normalised)

clusters.labels_
clusters.cluster_centers_



'''


Standardize your Iris data by subtracting the feature means and dividing by feature ranges. Write or take a code for k-means and apply it to the standardized data. The number of clusters k is three and the initial centers are 1st, 51st and 101st objects (under the assumption that index counting starts from one). Output new centroids c1, c2, c3 of the clusters. Every centroid is a tuple of four numbers.

Do not separate numbers by commas or semicolons. For every correct centroid c1, c2, c3 you get 0.66 out of 2.0. After the soft deadlines these scores are halved. All problems allow to make a default error of 0.001 in all decimal answers unless otherwise stated. It is enough to use 4 digits after the point. Test dataset below consists of every tenth entity from original Iris dataset. 1st, 6th and 11th objects were chosen as initial centers (under the assumption that index counting starts from one).


Sample Input:

5.1	3.5	1.4	0.1	I.setosa
5.4	3.7	1.5	0.2	I.setosa
5.4	3.4	1.7	0.2	I.setosa
4.8	3.1	1.6	0.2	I.setosa
5.0	3.5	1.3	0.3	I.setosa
7.0	3.2	4.7	1.4	I.versicolor
5.0	2.0	3.5	1.0	I.versicolor
5.9	3.2	4.8	1.8	I.versicolor
5.5	2.4	3.8	1.1	I.versicolor
5.5	2.6	4.4	1.2	I.versicolor
6.3	3.3	6.0	2.5	I.virginica
6.5	3.2	5.1	2.0	I.virginica
6.9	3.2	5.7	2.3	I.virginica
7.4	2.8	6.1	1.9	I.virginica
6.7	3.1	5.6	2.4	I.virginica

Sample Output:

-0.2898 0.2118 -0.4820 -0.4334
-0.2154 -0.4392 0.0186 -0.0583
0.2993 0.03698 0.3365 0.3345

'''
