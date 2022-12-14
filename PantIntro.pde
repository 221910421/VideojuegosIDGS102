//Módulo PantIntro 
//elaborado por: Rubén Dario Hernandez Mendo
//fecha de creación: 30 de septiembre de 2022
//fecha de ultima modificación: 7 de noviembre de 2022
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
    btncfg=new Boton(400,200,250,60,0);
    btncrd=new Boton(400,300,250,60,1);
    btnscr=new Boton(400,400,250,60,2);
    btngme=new Boton(400,500,250,60,3);
    btnins=new Boton(400,600,250,60,4);
    btnext=new Boton(400,700,250,60,5);
  }
  
  void display(){
    music();
    if(cf.gmode) background(sspbg.getSprite(0));
    else background(color(0,150,0));
    stroke(color(255,255,255));
    textAlign(CENTER,CENTER);
    text(idi.mensaje(11),400,100);
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
    if(btngme.isClicked(x,y,b)){
      gc.musicManager(MSCOFF);
      gc.setPantAct(PNGME);
    }  
    if(btnins.isClicked(x,y,b))
      gc.setPantAct(PNINS);
    if(btnext.isClicked(x,y,b)){
      bit.cierraBitacora();
      exit();
    }  
  }
  
  void mouseControl(int x,int y){
    if(btncfg.isOver(x,y)) cursor(HAND); else
    if(btncrd.isOver(x,y)) cursor(HAND); else
    if(btnscr.isOver(x,y)) cursor(HAND); else
    if(btngme.isOver(x,y)) cursor(HAND); else
    if(btnins.isOver(x,y)) cursor(HAND); else
    if(btnext.isOver(x,y)) cursor(HAND); else cursor(ARROW);
  }
}
