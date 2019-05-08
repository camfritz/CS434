DNA[] population;
int totalGenerations = 0;
float averageFitness;
char[] bestPhrase;

void setup() {
	size(800, 800);
	population = new DNA[1000];
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
	int currentBestFitness = 0;
	averageFitness = 0;
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

for(int i = 0; i < population.length; i++) {
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

  population[i] = child;
  child.fitness();
  averageFitness += child.fitness;

  if(child.fitness > currentBestFitness) {
  	bestPhrase = child.genes;
  }
}

++totalGenerations;
averageFitness = averageFitness / population.length;
textSize(25);
fill(0, 0, 0);
text("Total Generations: " + totalGenerations, 100, 100);
text("Average Fitness: " + String.format("%.2f", averageFitness), 100, 150);
text("Total Population Size: " + population.length, 100, 200);
text("Mutation Rate: " + int(population[0].mutationRate * 100) + "%", 100, 250);
text("Best Phrase: " + new String(bestPhrase), 100, 300);

  // for(int i = 0; i < population.length; i++) {
  // 	for(int j = 0; j < population[i].genes.length; j++) {
  // 		print((char) population[i].genes[j]);
 	//  }
 	// 	print('\n');
  // }

}