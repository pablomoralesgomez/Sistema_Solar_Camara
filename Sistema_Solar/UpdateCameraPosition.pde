class UpdateCameraPosition {
  
  PVector posicionCentro;
  PVector posicionOjo;
  PVector cambioPosicion;
  
  public UpdateCameraPosition() {
    posicionCentro = new PVector(0, 0, 549);
    posicionOjo = new PVector(0, 0, 550);
    cambioPosicion = new PVector(0, 0, -1);
    
  }
  
  public float getOjoX() {
    return posicionOjo.x;
  }
  
  public float getOjoY() {
    return posicionOjo.y;
  }
  
  public float getOjoZ() {
    return posicionOjo.z;
  }
  
  public float getCentroX() {
    return posicionCentro.x;
  }
  
  public float getCentroY() {
    return posicionCentro.y;
  }
  
  public float getCentroZ() {
    return posicionCentro.z;
  }
  
  public void moverDelante() {
    posicionOjo.add(cambioPosicion);
    posicionCentro.set(posicionOjo);
    posicionCentro.add(cambioPosicion);
  }
  
  public void moverAtras() {
    posicionOjo.sub(cambioPosicion);
    posicionCentro.set(posicionOjo);
    posicionCentro.add(cambioPosicion);
  }
  
  public void rotarX(float angulo) {
    float x = cambioPosicion.x;
    float y = cambioPosicion.y * cos(angulo) - cambioPosicion.z * sin(angulo); 
    float z = cambioPosicion.y * sin(angulo) + cambioPosicion.z * cos(angulo); 
    
    cambioPosicion.set(x, y, z);
    posicionCentro.x = posicionOjo.x + cambioPosicion.x;
    posicionCentro.y = posicionOjo.y + cambioPosicion.y;
    posicionCentro.z = posicionOjo.z + cambioPosicion.z;
  }
  
  public void rotarY(float angulo) {
    float x = cambioPosicion.x * cos(angulo) - cambioPosicion.z * sin(angulo);
    float y = cambioPosicion.y;
    float z = cambioPosicion.x * sin(angulo) + cambioPosicion.z * cos(angulo); 
    
    cambioPosicion.set(x, y, z);
    posicionCentro.x = posicionOjo.x + cambioPosicion.x;
    posicionCentro.y = posicionOjo.y + cambioPosicion.y;
    posicionCentro.z = posicionOjo.z + cambioPosicion.z;
  }
}
