void setup(){
  size(400,400);
  loadPixels();
  //¿que tan cerca o lejos estoy de los valores de la matriz?
  float v = 0.008;
  FloatList foo;
  
  
  foo = new FloatList();
 //valores crudos
  for(int i = 0; i<pixels.length;i++){
    float sat = noise(i%width*v, i/width*v);
    foo.append(sat);
    color c = color(sat*255);
    pixels[i] = color(c);
  }
  //numero de capas
  int nzonas = 20;
  float maximo = foo.max();
  float minimo = foo.min();
  
  //en este arreglo almaceno los colores para cada zona
  color colores[] = new color[nzonas];
  
  for(int i= 0 ; i<nzonas;i++){
    if(i<7){
      colores[i] = color(0,0,180);
    }
    else{
      colores[i] = color(0,(i-3)*15,0);
    }
  }
  
  for(int i = 0; i<foo.size();i++ ){
    //normalizo los valores
    float norm = (foo.get(i)-minimo)/(maximo-minimo);
    int zona = floor(norm*(nzonas-1));
    //asigno el color a la zona
    pixels[i] = colores[zona];
  }
  
  //edge detection simple
  for(int i = 0; i<pixels.length-width;i++ ){ 
    if (pixels[i]!=pixels[i+1]|| pixels[i]!=pixels[i+width] ){
      pixels[i] = color(0);
    }
  }
  updatePixels();
}
