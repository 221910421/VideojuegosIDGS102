//Módulo PantIntro 
//elaborado por: Miguel Betzay Dominguez Diaz
//fecha de creación: 30 de septiembre de 2022
//fecha de ultima modificación: 3 de octubre de 2022
//comentario: Implementa la clase PantIntro, la cual se encargará de controlar la
//pantalla de introducción del juego.
class PantIntro{
  Boton btncfg;
  Boton btncrd;
  Boton btnscr;
  Boton btngme;
  Boton btnins;
  Boton btnext;
  
  PantIntro(){
    btncfg=new Boton(400,200,200,60,"Config");
    btncrd=new Boton(400,300,200,60,"Créditos");
    btnscr=new Boton(400,400,200,60,"Scores");
    btngme=new Boton(400,500,200,60,"Jugar");
    btnins=new Boton(400,600,200,60,"Guía");
    btnext=new Boton(400,700,200,60,"Salir");
  }
  
  void display(){
    background(color(0,150,0));
    stroke(color(255,255,255));
    textAlign(CENTER,CENTER);
    text("Pantalla de Intro",400,100);
    btncfg.display();
    btncrd.display();
    btnscr.display();
    btngme.display();
    btnins.display();
    btnext.display();
  }
  
  void mouseControl(int x, int y, int b){
    if(btncfg.isClicked(x,y,b))
      gc.setPantAct(PNCFG);
    if(btncrd.isClicked(x,y,b))
      gc.setPantAct(PNCRD);
    if(btnscr.isClicked(x,y,b))
      gc.setPantAct(PNSCR);
    if(btngme.isClicked(x,y,b))
      gc.setPantAct(PNGME);
    if(btnins.isClicked(x,y,b))
      gc.setPantAct(PNINS);
    if(btnext.isClicked(x,y,b))
      exit();
  }
}
