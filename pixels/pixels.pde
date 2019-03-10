int c;
void setup() {
  size(200, 300);
  background(255);
  frameRate(1);
}
void draw() {
  for (int i = 0; i<width; i+=10) {
    for (int j=0; j<height; j+=10) {
      c= int(random(255));
      fill(c);
      noStroke();
      rect(i, j, 10, 10);
    }
  }
}
