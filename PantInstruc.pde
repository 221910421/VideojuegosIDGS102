//Módulo PantInstruc
//elaborado por: Rubén Dario Hernandez Mendo
//fecha de creación: 3 de octubre de 2022
//fecha de ultima modificación: 7 de octubre de 2022
//comentario: Implementa la clase PantInstruc, la cual se encargará de operar la 
//pantalla de carga del juego.
class PantInstruc{
  PantInstruc(){}
  
  void display(){
    background(color(0,150,150));
    stroke(color(255,255,255));
    textAlign(CENTER,CENTER);
    text(idi.mensaje(10),400,400);
  }
}
