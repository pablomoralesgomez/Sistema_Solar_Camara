
class ObjetoAstronomico {
  
  float distancia;
  float radio;
  
  ArrayList<ObjetoAstronomico> objetosAstronomicos;
  
  PVector orientacion;
  
  float traslAng;
  float traslAcc;
  
  float rotAcc;
  float rotAng;
  
  PShape esfera;
  
  String texto;
  
  /**
  * d = distancia con respecto del astro entorno al que gira
  * r = radio del objeto astronomico
  * traslAcc_ = velocidad a la que varía el ángulo de traslacion
  * rotAcc_ = velocidad a la que varía el ángulo de rotación
  * textura = textura del objeto astronomico
  * texto = nombre del cuerpo celeste
  */
  ObjetoAstronomico(float d, float r, float  traslAcc_, float rotAcc_, PImage textura, String texto_) {
    distancia = d;
    radio = r;
    
    orientacion = new PVector(1, 0, 0);
    orientacion.mult(distancia);
    
    traslAcc = traslAcc_;
    traslAng = random(360);
    
    rotAng = 0;
    rotAcc = rotAcc_;
    
    esfera = createShape(SPHERE, radio); 
    esfera.setTexture(textura);
    
    texto = texto_;
  }
  
  void ajustaAngulo() {
    rotAng += rotAcc;
    if(rotAng >= 360) rotAng = 0;
    traslAng += traslAcc;
    if(traslAng >= 360) traslAng = 0;
  }
  
  void muestra() {
   
    PVector vectorPerpendicular = new PVector(0, 0, 1);
    PVector vectorRotacion = orientacion.cross(vectorPerpendicular);
    
    pushMatrix();
    
    // Movimiento rotacion
    rotateY(radians(rotAng));
    
    // Movimiento de traslación
    rotate(traslAng, vectorRotacion.x, vectorRotacion.y, vectorRotacion.z);
    text(texto, orientacion.x - (texto.length()*3), orientacion.y - (radio+1) , orientacion.z);
    translate(orientacion.x, orientacion.y, orientacion.z);
    
    shape(esfera);
    
    if(objetosAstronomicos != null) {
      for(ObjetoAstronomico objAstr : objetosAstronomicos) {
        objAstr.muestra();
      }
    }
    
   
    
    popMatrix();
    
    ajustaAngulo();
    
  }
  
  void addOrbitante(ObjetoAstronomico objAstr) {
    if(objetosAstronomicos == null) {
      objetosAstronomicos = new ArrayList<ObjetoAstronomico>();
    }
    
    objetosAstronomicos.add(objAstr);
  }
  
}
