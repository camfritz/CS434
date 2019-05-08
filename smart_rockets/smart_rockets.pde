int lifetime;
Population population;
int lifeCounter;
float mutationRate;

void setup() {
	size(800, 800);
	lifeCounter = 0;
	lifetime = 500;
	mutationRate = 0.01;
	population = new Population(mutationRate, 150);
}

void draw() {
	background(255);
	fill(0);
	ellipse(width/2, 100, 50, 50);
	if(lifeCounter < lifetime) {
		population.live();
		lifeCounter++;
	}
	else {
		lifeCounter = 0;
		population.fitness();
		population.selection();
		population.reproduction();
	}
}

void keyPressed() {
	// rocket.applyForce(new PVector(5, 0));
}