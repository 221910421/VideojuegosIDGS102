//Módulo Colisoinador
//elaborado por: Rubén Dario Hernandez Mendo
//fecha de creación: 18 de noviembre de 2022
//fecha de ultima modificación: 18 de noviembre de 2022
//comentario:
class Colisionador{
  Punto2D pos;
  Punto2D aaesi;  //area activa esquina superior izquierda
  Punto2D aaeid;  //area activa esquina inferior derecha
  int rad;
  boolean active;
  
  Colisionador(Punto2D p,int r,Punto2D esi,Punto2D eid){
    pos=new Punto2D(p);
    rad=r;
    aaesi=new Punto2D(esi);
    aaeid=new Punto2D(eid);
    active=true;
  }
  
  Colisionador(int x,int y,int r,int xi,int yi,int xd,int yd){
    pos=new Punto2D(x,y);
    aaesi=new Punto2D(xi,yi);
    aaeid=new Punto2D(xd,yd);
    rad=r;
    active=true;
  }
  
  void moverCol(int x, int y){
    pos.setX(x);
    pos.setY(y);

  }

  void moverCol(Punto2D p){
    pos.setX(p.getX());
    pos.setY(p.getY());
  }

  boolean isColision(Colisionador cls){
    boolean c=false;
    if (active && inRange(cls)){
      float dx=cls.pos.getX()-pos.getX();
      float dy=cls.pos.getY()-pos.getY();
      float ds=sqrt(dx*dx+dy*dy);
      c=ds<(rad+cls.rad);
    }
  }

  boolean inRange(Colisionador c){
    boolean r=false;
    r=c.active && (aaesi.getX() < c.pos.getX() && aaeid.getX() > c.pos.getX()) && (aaesi.getY() < c.pos.getY() && aaeid.getY() > c.pos.getY());
    return r;
  }
}