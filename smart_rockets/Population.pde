class Population {

	float mutationRate;
	Rocket[] population;
	ArrayList<Rocket> matingPool = new ArrayList<Rocket>();
	int generations;

	Population(float mutationR, int size) {
		population = new Rocket[size];
		mutationRate = mutationR;
		for(int i = 0; i < size; i++) {
			population[i] = new Rocket(new PVector(width/2, 700));
		}
	}

	void fitness() {
		for(int i = 0; i < population.length; i++) {
			population[i].fitness();
		}
	}

	void selection() {
		matingPool = new ArrayList<Rocket>();
		for(int i = 0; i < population.length; i++) {
			int n = int(population[i].fitness * 1000);
			if(n == 0) {
				n = 1;
			}
			for(int j = 0; j < n; j++) {
				matingPool.add(population[i]);
			}
		}
	}

	void reproduction() {
		for(int i = 0; i < population.length; i++) {
			int a = int(random(matingPool.size()));
			int b = int(random(matingPool.size()));
			while(a == b) {
				b = int(random(matingPool.size()));
			}

			Rocket partnerA = matingPool.get(a);
			Rocket partnerB = matingPool.get(b);

			Rocket child = partnerA.crossover(partnerB);
			population[i] = child;
		}
	}

	void live() {
		for(int i = 0; i < population.length; i++) {
			population[i].run();
		}
	}

}