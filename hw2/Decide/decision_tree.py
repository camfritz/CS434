import pickle
import collections
import math
import operator

with open("data", "rb") as f:
	L = pickle.load(f)

def entropy(data):
	frequency = collections.Counter([item[-1] for item in data])
	def item_entropy(category):
		ratio = float(category) / len(data)
		return -1 * ratio * math.log(ratio, 2)
	return sum(item_entropy(c) for c in frequency.values())

def best_feature_for_split(data):
	baseline = entropy(data)
	def feature_entropy(f):
		def e(v):
			partitioned_data = [d for d in data if d[f] == v]
			proportion = (float(len(partitioned_data)) / float(len(data)))
			return proportion * entropy(partitioned_data)
		return sum(e(v) for v in set([d[f] for d in data]))
	features = len(data[0]) - 1
	information_gain = [baseline - feature_entropy(f) for f in range(features)]
	best_feature, best_gain = max(enumerate(information_gain), key=operator.itemgetter(1))
	return best_feature

	def potential_leaf_node(data):
		count = collections.Counter([i[-1] for i in data])
		return count.most_common(1)[0]

