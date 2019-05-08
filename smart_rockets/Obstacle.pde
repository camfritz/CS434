class Obstacle {
	PVector location;
	float w, h;

	boolean contains(PVector v) {
		if (v.x > location.x && v.x < location.x + w && v.y > location.y && v.y < location.y + h) {
    	return true;
    }
    else {
      return false;
    }
	}
}