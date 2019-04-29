void setup() {
	size(800, 800);
	DNA[] population = new DNA[100];
	for(int i = 0; i < population.length; i++) {
		population[i] = new DNA();
	}

	for(DNA d : population) {
		d.fitness();
		print(d.fitness);
		print('\n');
	}
}

void draw() {
	background(255);
}