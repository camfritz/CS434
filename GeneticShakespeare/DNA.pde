class DNA {
	String target = "great scott!";
	char[] genes = new char[12];
	float fitness;
	float mutationRate = 0.01;

	DNA() {
		for(int i = 0; i < genes.length; i++) {
			genes[i] = (char) random(32, 128);
		}
	}

	public void fitness() {
		int score = 0;
		for(int i = 0; i < genes.length; i++) {
			if(genes[i] == target.charAt(i)) {
				++score;
			}
		}
		fitness = float(score)/target.length();
	}

	public DNA crossover(DNA partner) {
		DNA child = new DNA();

		// int midpoint = int(random(genes.length));

		for(int i = 0; i < genes.length; i++) {
			// if(i > midpoint) {
			// 	child.genes[i] = genes[i];
			// }
			// else {
			// 	child.genes[i] = partner.genes[i];
			// }

			int parentGeneSelection = int(random(0, 2));

			if(parentGeneSelection == 0) {
				child.genes[i] = genes[i];
			}
			else {
				child.genes[i] = partner.genes[i];
			}
		}

		return child;
	}

	public void mutate() {
		for(int i = 0; i < genes.length; i++) {
			if(random(1) < mutationRate) {
				genes[i] = (char) random(32, 128);
			}
		}
	}
}