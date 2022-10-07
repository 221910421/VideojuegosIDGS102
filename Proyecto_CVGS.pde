//Proyecto  
//elaborado por: Miguel Betzay Dominguez Diaz
//fecha de creación: 26 de septiembre de 2022
//fecha de ultima modificación: 3 de octubre de 2022
//comentario: Contiene los procesos iniciales del juego, adicionalmente envia a
//los objetos de control las operaciones de entrada/salida básica

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
GameControl gc;
Idiomas idi;

//sección de módulos principales
void setup(){
  size(800,800);
  frameRate(60);
  surface.setTitle("Creación de Videojuegos 2022");
  idi = Idiomas(IDESP, 13);
  gc=new GameControl();
}

void draw(){
  gc.display();
}

//el contenido en esta versión de mouseReleased y KeyReleased son temporales, solo
//para ilustrar el funcionamiento básico de los métodos.
void mouseReleased(){
  /*if(mouseButton==LEFT)
    gc.nextPant();
  if(mouseButton==RIGHT)
    gc.prevPant();*/
  gc.mouseControl(mouseX,mouseY,mouseButton);  
}

void keyReleased(){
  /*if(keyCode==LEFT || key=='a' || key=='A')
    gc.nextPant();
  if(keyCode==RIGHT || key=='d' || key=='D')
    gc.prevPant();*/
  gc.keyControl();  
}
