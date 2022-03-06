int state = 0; // estados en los que se puede encontrar la app: 0 -> visualización/interacción, 1 -> visualizacion de instrucciones

ObjetoAstronomico sol, tierra, luna, mercurio, venus, marte, jupiter, fobos, deimos;

PImage fondo;

float radioSol = 50;
float radioTierra =  12.756;
float radioMarte = 6.794;

boolean camaraGeneral = true;
UpdateCameraPosition upc = new UpdateCameraPosition();
float inerciaDelantera = 0;
float inerciaTrasera = 0;

//Delante, Detras, Camara-Arriba, Camara-Abajo, Camara-Derrecha, Camara-Izquierda
int[] teclaPulsada = {0, 0, 0, 0, 0, 0};

String cameraModeMessage = "General Mode";

void setup() {
  
  size(1000, 700, P3D);
  noStroke();
  
  
  fondo = loadImage("espacio_exterior.jpg");
  
  sol = new ObjetoAstronomico(0, radioSol, 0, 0.1, loadImage("sol.png"), "Sol");
  
  luna = new ObjetoAstronomico(radioTierra + 3,   3, 0.1417, 1, loadImage("luna.jpg"), "");
  
  fobos = new ObjetoAstronomico(radioMarte + 9.377, 3, 0.07, 1, loadImage("fobos.png"), "");
  deimos = new ObjetoAstronomico(radioMarte + 23.46, 3, 0.05, 1, loadImage("deimos.png"), "");
  
  mercurio = new ObjetoAstronomico(radioSol + 57.91, 4.88, 0.05, 1, loadImage("mercurio.jpg"), "Mercurio");
  venus = new ObjetoAstronomico(radioSol + 108.2, 12.104, 0.025, 1, loadImage("venus.jpg"), "Venus");
  tierra = new ObjetoAstronomico(radioSol + 149.6, radioTierra, 0.01, 1, loadImage("tierra.jpg"), "Tierra");
  marte = new ObjetoAstronomico(radioSol + 227.94, radioMarte, 0.00639, 1, loadImage("marte.jpg"), "Marte");
  jupiter = new ObjetoAstronomico(radioSol + 508.33, 25, 0.000152, 0.5, loadImage("jupiter.jpg"), "Júpiter");
  
  
  sol.addOrbitante(mercurio);
  sol.addOrbitante(venus);
  sol.addOrbitante(tierra);
  sol.addOrbitante(marte);
  sol.addOrbitante(jupiter);
  
  tierra.addOrbitante(luna);
  
  marte.addOrbitante(deimos);
  marte.addOrbitante(fobos);
}

void draw() {
  
  fondo.resize(width, height);
  background(fondo);
  
  // Situamos los objetos en el centro
  translate(width/2, height/2);
  
  switch(state) {
    case 0:   
      if(camaraGeneral) {
        camera(0, 0, 550, 0, 0, 549, 0, 1, 0);
        pushMatrix();
        translate(upc.getOjoX(), upc.getOjoY(), upc.getOjoZ());
        stroke(0);
        box(10);
        popMatrix();
        
      } else {
        camera(upc.getOjoX(), upc.getOjoY(), upc.getOjoZ(), upc.getCentroX(), upc.getCentroY(), upc.getCentroZ(), 0, 1, 0);
        checkMovement();
      }
      
      text("Press H to see the instructions.", -width/2 + width/15  , -height/2 + height/15*2);
      text(cameraModeMessage, -width/2 + width/15 , -height/3);
      noStroke();
      sol.muestra();
      
      break;
    case 1:

      pushMatrix();
      camera();
      translate(0, 0, 0);
      
      fill(225, 225);
      noStroke();
      rect(width/12, height/8, width/12 * 10, height/8 * 6);
      
      fill(255, 0, 0);
      textSize(32);
      textAlign(CENTER);
      text("CONTROLS", width/2, height/5);
      
      textSize(14);
      textAlign(CENTER);
      text("Press C to change between camera modes. There are 2: subjective and general", width/2 , height/5 *1.5);
      text("In the general mode, you will be able to visualize the ship, it will be represented as a white cube.", width/2 , height/5 *1.75);
      text("When you are in the subjective mode, use the next controls to move the ship:", width/2 , height/5 * 2);
      
      text("Move the camera angle using W,A,S,D.", width/2 , height/5 *2.5);
      text("Move forward the ship using the UP arrow.", width/2 , height/5 *2.75);
      text("Move backwards the ship using the DOWN arrow.", width/2 , height/5 *3);
      
      text("To resume the program press H", width/2 , height/8 *6);
      
      popMatrix();
      
      fill(255);
      
      break;
  }

  


}

//Comprobamos que se este pusando alguna tecla
void checkMovement() {
  
  if(teclaPulsada[0] == 1 | inerciaDelantera > 0) {  // Impulso delantero
    upc.moverDelante();  
    inerciaDelantera--;
  }
  
  if(teclaPulsada[1] == 1 | inerciaTrasera > 0) { // Impulso trasero
    upc.moverAtras();
    inerciaTrasera--;
  }
  
  if(teclaPulsada[2] == 1) {  // Camara Arriba
    upc.rotarX(-PI/360);
  }
  
  if(teclaPulsada[3] == 1) {  // Camara Abajo
    upc.rotarX(PI/360);
  }
  
  if(teclaPulsada[4] == 1) {  // Camara Derecha
     upc.rotarY(PI/360);
  }
 
  if(teclaPulsada[5] == 1) {  // Camara Derecha
    upc.rotarY(-PI/360);
  }
}

void keyPressed(){
  
  switch(state) {
    case 0:
      if( key == 'c' || key == 'C' ) {
        camaraGeneral = !camaraGeneral; 
        
        if(cameraModeMessage.equals("General Mode")) {
          cameraModeMessage = "Subjective Mode";
        } else {
          cameraModeMessage = "General Mode";
        }
      
      }

      if( keyCode == UP ) teclaPulsada[0] = 1;
      if( keyCode == DOWN ) teclaPulsada[1] = 1;
      
      if( key == 'w' || key == 'W' ) teclaPulsada[2] = 1;
      if( key == 's' || key == 'S' ) teclaPulsada[3] = 1;
      if( key == 'd' || key == 'D' ) teclaPulsada[4] = 1;
      if( key == 'a' || key == 'A' ) teclaPulsada[5] = 1;
      
      if( key == 'h' || key == 'H' ) state = 1;
      break;
    case 1:
      
      if( key == 'h' || key == 'H' ) state = 0;
      break;
  }
}

void keyReleased(){
  
  switch(state) {
     case 0:
      if( keyCode == UP ){
        teclaPulsada[0] = 0;
        inerciaDelantera = 50;
      }
      
      if( keyCode == DOWN ){
        teclaPulsada[1] = 0;
        inerciaTrasera = 50;
      }
      
      if( key == 'w' || key == 'W' ) teclaPulsada[2] = 0;      
      if( key == 's' || key == 'S' ) teclaPulsada[3] = 0;      
      if( key == 'd' || key == 'D' ) teclaPulsada[4] = 0;    
      if( key == 'a' || key == 'A' ) teclaPulsada[5] = 0;
      
      break;
  }
}
