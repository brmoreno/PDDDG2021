import processing.sound.*;
SoundFile sample;

void setup() {
  size(800, 400);
  sample = new SoundFile(this, "vibraphon.aiff");
  
  float foo[] = new float[sample.frames()];
  sample.read(foo);
  println(sample.frames());
  for(int i  = 0; i<foo.length;i++){
    line(i*width/foo.length,height/2,i*width/foo.length,height/2+foo[i]*width/2);
  }
  
  for(int i = 0 ; i<10; i++){
    int varal= floor(random(sample.frames()));
    print(varal + " ");
    println(foo[varal]);
  }  
}
