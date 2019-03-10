void setup() {
  size(1280, 720, OPENGL);
}

void draw() {
  background(255);
  strokeWeight(2);
  stroke(255,113,113);
  fill(255,113,113,64);
  
  //迭代生成带半径不停变化的圆
  for (int i=0;i<299;i=i+45){
    int vertexCount = int(map(i,0,299,40,100));
   //圆上点的个数随着半径不同而不同
   mPolygon(width/2,height/2,vertexCount,i,i/10);
  }
}

void mPolygon(int x, int y,int numOfVertex, int br, int rOff){
  beginShape();
  for (int i=0;i<numOfVertex;i++){
    float pingPong = sin(radians(millis()/6.0+20*i));
    float r = br+map(pingPong,-1,1,-rOff,rOff);
    vertex(x+cos(radians(i*360/numOfVertex))*r,y+sin(radians(i*360/numOfVertex))*r);
  }
  endShape(CLOSE);
}
