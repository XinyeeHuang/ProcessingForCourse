float r;
float x[][];
float y[][];
float frame;

void setup() {
  size(1000, 1000);
  background(255);
  stroke(0);
  smooth();
  fill(0);
  x = new float[20][20];
  y = new float[20][20];
  r = 30;

  for (int i=0; i<20; i++) {
    for (int j=0; j<20; j++) {
      x[i][j] = -80 -i*50 + j*100;
      y[i][j] = -260 + 50*sqrt(3)*i;
    }
  }
}

void draw() {
  background(255);
  drawCircle();
}

void drawCircle() {
  frame = frameCount % 400;
  for (int i=0; i<20; i++) {
    for (int j=0; j<20; j++) {
      pushMatrix();
      if (frame>=10 && frame<60) {
        if(i%2 == 0){
          translate(frame-10,0);
        }else{
          translate(-frame+10,0);
        }
      } else if (frame>=60 && frame<260) {
        if(i%2 == 0){
          translate(50,0);
        }else{
          translate(-50,0);
        }
      }
      
       if (frame>=110 && frame<160) {
        if((i+j)%2 == 0){
          translate((-frame+110)/2,(frame-110)*cos(radians(30)));
        }else{
          translate((frame-110)/2,(-frame+110)*cos(radians(30)));
        }
      } else if (frame>=160 && frame<260) {
        if((i+j)%2 == 0){
          translate(-50/2,50*cos(radians(30)));
        }else{
          translate(50/2,-50*cos(radians(30)));
        }
      }
      
      if (frame>=210 && frame<260) {
        if((i+2*j)%2 == 0){
          translate((frame-210)/2,(frame-210)*cos(radians(30)));
        }else{
          translate((-frame+210)/2,(-frame+210)*cos(radians(30)));
        }
      }
      
      if (frame>=310 && frame<360) {
        if((i%4 == 1 && j%2 == 1) || (i%4 == 3 && j%2 == 0)){
          translate(50*sin(radians(90f*(frame-310)/50f)),(frame-310)*cos(radians(30))*2*(frame-310)/50f);
        }
        if((i%4 == 2 && j%2 == 1) || (i%4 == 0 && j%2 == 0)){
          translate((frame-310)*(frame-310)/50f,-50*cos(radians(30))*2*sin(radians(90f*(frame-310)/50f)));
        }
        if((i%4 == 2 && j%2 == 0) || (i%4 == 0 && j%2 == 1)){
          translate(-2*(frame-310),20*sin(radians(100f*(frame-310)/50f)));
        }
      }
      
      ellipse(x[i][j],y[i][j],r,r);
      popMatrix();
    }
  }
}
