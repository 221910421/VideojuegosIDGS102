//Proyecto  
//elaborado por: Miguel Betzay Dominguez Diaz
//fecha de creación: 26 de septiembre de 2022
//fecha de ultima modificación: 3 de octubre de 2022
//comentario: Contiene los procesos iniciales del juego, adicionalmente envia a
//los objetos de control las operaciones de entrada/salida básica

//sección de declaraciones globales
import ddf.minim.*;
//sección de declaraciones globales
final int PNCRG=0;
final int PNINT=1;
final int PNGME=2;
final int PNCFG=3;
final int PNCRD=4;
final int PNINS=5;
final int PNSCR=6;
final int IDESP=0;
final int IDING=1;
final boolean MSCON=true;
final boolean MSCOFF=false;
PFont letra;
PImage imgicon;
PImage imgcoin;
SpriteSet sspbg;
GameControl gc;
Idiomas idi;
ConfigFiles cf;
Bitacora bit;
Minim audio;
AudioPlayer mscintro;
AudioPlayer mscgame;
AudioSample sfxclick;
AudioSample sfxcash;

//sección de módulos principales
void setup(){
  size(800,800);
  frameRate(60);
  surface.setTitle("Creación de Videojuegos 2022");
  imgicon=loadImage("sprites/per/movement/run/per0.png");
  sspbg=new SpriteSet("sprites/scrbg/","scrbg",".jpg",9,6,false,0);
  surface.setIcon(imgicon);
  cf=new ConfigFiles();
  bit=new Bitacora(cf.logact);
  idi=new Idiomas(cf.lang,cf.ns);
  letra=createFont("data/"+cf.fntname,cf.fntstd);
  textFont(letra);
  imgcoin=loadImage("sprites/coin/coin.png");
  gc=new GameControl();
  audio=new Minim(this);
  thread("loadAudio");
}

void draw(){
  gc.display();
}

//el contenido en esta versión de mouseReleased y KeyReleased son temporales, solo
//para ilustrar el funcionamiento básico de los métodos.
void mouseReleased(){
  gc.mouseControl(mouseX,mouseY,mouseButton);  
}

void mouseMoved(){
  gc.mouseControl(mouseX,mouseY);  
}

void keyReleased(){
  
}

void loadAudio(){
  gc.pncrg.msg=18;  //cargando efectos de sonido
  sfxclick=audio.loadSample("sound/sfx/click.mp3");
  sfxclick.setGain(0.9);
  sfxcash=audio.loadSample("sound/sfx/cash.mp3");
  sfxcash.setGain(0.9);
  gc.pncrg.msg=19;  //cargando música
  mscintro=audio.loadFile("sound/music/intro.mp3");
  mscintro.setGain(0.07);
  mscgame=audio.loadFile("sound/music/play.mp3");
  mscgame.setGain(0.07);
  gc.pncrg.msg=20;  //carga terminada
  gc.pncrg.loading=false;  //cambiando pantalla
}

void music(){
  if(!gc.getMusicStatus())
    gc.musicManager(MSCON);
}