//Módulo PantCreds
//elaborado por: Rubén Dario Hernandez Mendo
//fecha de creación: 3 de octubre de 2022
//fecha de ultima modificación: 7 de noviembre de 2022
//comentario: Implementa la clase PantCreditos, la cual se encargará de operar la 
//pantalla de carga del juego.
class PantCreditos{
  Boton btnret;
  
  PantCreditos(){
    btnret=new Boton(400,400,250,60,15);
  }
  
  void display(){
    if(cf.gmode) background(sspbg.getSprite(4));
    else background(color(150,0,150));
    stroke(color(255,255,255));
    textAlign(CENTER,CENTER);
    text(idi.mensaje(8),400,100);
    btnret.display();
  }
  
  void mouseControl(int x,int y,int b){
    if(btnret.isClicked(x,y,b))
      gc.setPantAct(PNINT);
  }  
}
