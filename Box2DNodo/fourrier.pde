class Fourrier{
  int n;
  float amp[];
  float freq[];
  float fase[];
  
  
  Fourrier(int n_){
    n = n_;
    amp = new float[n_];
    freq = new float[n_];
    fase = new float [n_];
    for(int i = 0; i<n_; i++){
      fase[i] = random(TWO_PI);
      freq[i] = random(0.2,3);
      amp[i] = random(0.2,3); 
    }
  }
  
   float valor(float v_){
     float val = 0;
     for(int i = 0 ;i<n;i++){
       val += sin(v_*freq[i]+fase[i])*amp[i]; 
     }
       
     return val;
   }
   
   float valorEnN(float v_, int n_){
     float val = 0;
     for(int i = 0 ;i<n_;i++){
       val += sin(v_*freq[i]+fase[i])*amp[i]; 
     }
       
     return val;
   }
}
