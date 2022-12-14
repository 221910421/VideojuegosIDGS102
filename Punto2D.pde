//Módulo Punto2D
//elaborado por: Rubén Dario Hernandez Mendo
//fecha de creación: 14 de octubre de 2022
//fecha de ultima modificación: 18 de octubre de 2022
//comentario: se implementa una clase para par de coordenadas 2D
class Punto2D{
  int x;
  int y;
  
  Punto2D(int x,int y){
    this.x=x;
    this.y=y;
  }
  
  Punto2D(Punto2D p){
    x=p.getX();
    y=p.getY();
  }
  
  int getX(){
    return x;
  }
  
  int getY(){
    return y;
  }
  
  void setX(int x){
    this.x=x;
  }
  
  void setY(int y){
    this.y=y;
  }
  
  void move(int dx,int dy){
    x+=dx;
    y+=dy;
  }
}
