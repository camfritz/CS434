from sklearn.datasets import load_iris
import pandas as pd
iris_dataset = load_iris()

# print("Keys: \n{}".format(iris_dataset.keys()))

# print(iris_dataset['DESCR'][:100] + "\n")

# print("Type of data: {}".format(type(iris_dataset['data'])))

# print("Shape of data: {}".format(iris_dataset['data'].shape))

# print("Some rows: {}".format(iris_dataset['data'][:5]))

# print("Target:\n{}".format(iris_dataset['target']))

from sklearn.model_selection import train_test_split

training_data, testing_data, training_labels, testing_labels = train_test_split(iris_dataset['data'], iris_dataset['target'])

print(len(training_data))
print(testing_data.shape)

iris_dataframe = pd.DataFrame(training_data, columns=iris_dataset.feature_names)

from sklearn.neighbors import KNeighborsClassifier

knn = KNeighborsClassifier(n_neighbors = 1)

knn.fit(training_data, training_labels)
import numpy as np

mystery_iris = np.array([[5, 2.9, 1, 0.2]])

print(mystery_iris.shape)

prediction = knn.predict(mystery_iris)
print(iris_dataset['target_names'][prediction])

test_predictions = knn.predict(testing_data)
print(test_predictions)

print("Score: {:.2f}".format(np.mean(testing_labels == test_predictions)))

print(knn.score(testing_data, testing_labels))