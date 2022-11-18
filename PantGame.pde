//Módulo PantGame 
//elaborado por: Rubén Dario Hernandez Mendo
//fecha de creación: 30 de septiembre de 2022
//fecha de ultima modificación: 18 de noviembre de 2022
//comentario: Implementa la clase PantGame, la cual controla las acciones del 
//juego.
class PantGame{
  Punto2D bg[];
  Punto2D fg[];
  int fbg[];
  int ffg[];
  SpriteSet ssbg;
  SpriteSet ssfg;
  Personaje per;
  ArrayList <Coin> monedas;
  Coin coin;
  PImage imghud;
  Dado dbg;
  Dado dfg;
  Dado dcoin;
  Reloj rlj;
  boolean dir;
  boolean rst;
  
  PantGame(){
    dbg=new Dado(cf.nbg);
    bg=new Punto2D[cf.nbg];
    fbg=new int[cf.nbg];
    creaP2DArray(bg,fbg,dbg,400,400,800,0);
    dfg=new Dado(cf.nfg);
    fg=new Punto2D[cf.nfg];
    ffg=new int[cf.nfg];
    creaP2DArray(fg,ffg,dfg,100,675,200,0);
    ssbg=new SpriteSet("sprites/bg/","bg",".png",cf.nbg,6,false,0);
    ssfg=new SpriteSet("sprites/fg/","fg",".png",cf.nfg,6,false,0);
    imghud=loadImage("sprites/HUD/hud.png");
    per=new Personaje();
    coin=new Coin(900,700);
    monedas=new ArrayList <Coin>();
    dcoin=new Dado(2);
    iniciaMonedas();
    rlj=new Reloj();
    rlj.iniciaReloj();
    dir=true;
    rst=false;
  }
  
  void iniciaMonedas(){
    Coin c;
    for(int i=0;i<3;i++){
      c=new Coin(900+i*75,(dcoin.tirar()==1)?500:700);
      monedas.add(c);
      println(c);
    }
  }
  
  void display(){
    music();
    if(rst){
      resetGame();
      rst=false;
    }
    planoFondo();
    planoNivel();
    planoFrente();
    planoHUD();
    gameProgress();
  }
  
  void planoFondo(){
    rectMode(CENTER);
    imageMode(CENTER);
    stroke(0);
    fill(128,128,0);
    graficaPlano(bg,ssbg,fbg,800,800,false);
  }
  
  void planoNivel(){
    per.display();
    displayMonedas();
    //coin.display();
  }
  
  void displayMonedas(){
    for(Coin c:monedas)
      c.display();
  }
  
  void planoFrente(){
    rectMode(CENTER);
    imageMode(CENTER);
    stroke(0);
    fill(200,200,0);
    graficaPlano(fg,ssfg,ffg,200,250,true);
  }
  
  void planoHUD(){
    rectMode(CENTER);
    imageMode(CENTER);
    if(cf.gmode){
      tint(255,128);
      image(imghud,400,60);
      noTint();
    }
    else{
      stroke(0);
      fill(220,220,220);
      rect(400,60,800,120);
    }  
    fill(0);
    per.drawLifeBar(150,30);
    per.drawScore(400,30);
    rlj.display(650,60);
  }
  
  void gameProgress(){
    muevePlano(bg,fbg,dbg,cf.bgdx,cf.bgdy,cf.bgli,cf.bgld);  
    muevePlano(fg,ffg,dfg,cf.fgdx,cf.fgdy,cf.fgli,cf.fgld); 
    coin.move();
    revisaColisiones();
    rlj.controlReloj();
    //per.move(((dir)?cf.prdxu:cf.prdxd),((dir)?cf.prdyu:cf.prdyd));
    //if(per.getY()==500 || per.getY()==700) dir=!dir;  
  }
  
  void creaP2DArray(Punto2D p[],int f[],Dado d,int xi,int yi,int dx,int dy){
    for(int i=0;i<p.length;i++){
      p[i]=new Punto2D(xi+i*dx,yi+i*dy);
      f[i]=d.tirar()-1;
    }  
  }
  
  void muevePlano(Punto2D p[],int f[],Dado d,int dx,int dy,int li,int ld){
    for(int i=0;i<p.length;i++){
      p[i].move(dx,dy);
      if(p[i].getX()<li){
        p[i].setX(ld);
        f[i]=d.tirar()-1;
      }  
    }
  }
  
  void graficaPlano(Punto2D p[],SpriteSet s,int f[],int x,int y,boolean t){
    for(int i=0;i<p.length;i++)
      if(cf.gmode){
        if(t && p[i].getX()<=300 && p[i].getY()>=0) tint(255,128);
        image(s.getSprite(f[i]),p[i].getX(),p[i].getY());
        if(t && p[i].getX()<=300 && p[i].getY()>=0) noTint();
      }  
      else
        rect(p[i].getX(),p[i].getY(),x,y);  
  }
  
  void resetGame(){
    rlj.resetReloj();
    rlj.iniciaReloj();
  }
  
  void mouseControl(int x,int y,int b){
    rlj.detenReloj();
    rst=true;
    gc.musicManager(MSCOFF);
    gc.setPantAct(PNINT);
  }
  
  void revisaColisiones(){
    int i=0;
    for(Coin c:monedas){
      if(per.cls.isColision(c.cls)){
        per.incrScore();
        c.toggleActive();
        monedas.remove(monedas.get(i));
        Coin nc=new Coin(900+i*75,dcoin.tirar());
        monedas.add(nc);
      }
      i++;
    }
    /*if(per.cls.isColision(coin.cls)){
      println("Hay colision");
      per.incrScore();
      coin.toggleActive();
      coin=new Coin(900,((dcoin.tirar()==1)?500:700));
    }
    else println("No col");*/
  }
}
