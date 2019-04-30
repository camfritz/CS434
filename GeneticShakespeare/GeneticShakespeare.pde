DNA[] population;

void setup() {
	size(800, 800);
	population = new DNA[100];
	for(int i = 0; i < population.length; i++) {
		population[i] = new DNA();
	}

	// for(DNA d : population) {
	// 	d.fitness();
	// 	print(d.fitness);
	// 	print('\n');
	// }
}

void draw() {
	background(255);
	if(population == null) {
		return;
	}

	for(int i = 0; i < population.length; i++) {
		population[i].fitness();
	}

	//reproduction pool
	ArrayList<DNA> matingPool = new ArrayList<DNA>();
	for(int i = 0; i < population.length; i++) {
		int n = int(population[i].fitness * 100);
		for(int j = 0; j < n; j++) {
			matingPool.add(population[i]);
		}
	}

	//create children from mating pool genes
	int geneIndexA = int(random(matingPool.size()));
	int geneIndexB = int(random(matingPool.size()));

	//ensure uniquely random selection
	while(geneIndexA == geneIndexB) {
		geneIndexB = int(random(matingPool.size()));
	}

	DNA parentA = matingPool.get(geneIndexA);
  DNA parentB = matingPool.get(geneIndexB);

  DNA child = parentA.crossover(parentB);
  child.mutate();

  for(int i = 0; i < child.genes.length; i++) {
  	print((char) child.genes[i]);
  }
  print('\n');

}