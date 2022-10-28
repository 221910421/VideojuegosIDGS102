//Proyecto  
//elaborado por: Miguel Betzay Dominguez Diaz
//fecha de creación: 07 de octubre de 2022
//fecha de ultima modificación: 07 de octubre de 2022
//comentario: Contiene los idiomas del juego

class Idiomas{
  String idiomas[][]; //contiene los mensajes en los dos idiomas
  String file[];      //contiene el archivo de idioma para copia
  int idiact;         //indica el idioma activo
  int nm;             //indica cuántos mensajes hay
 
  Idiomas(int l, int n){
    idiact=l;
    nm=n;
    idiomas=new String[nm][2];
    cargaIdioma(IDESP);
    cargaIdioma(IDING);
  }
  
  void cargaIdioma(int i){
    int n;
    file=loadStrings((i==IDESP)?"esp.lang":"eng.lang");
    for(n=0; n<nm;n++){
      println(idiomas[n][i]=file[n]);
      idiomas[n][i]=split(file[n],'=')[1];
      }
   }
  
  void setIdioma(int i){
    idiact=i;
  }
  
  int getIdioma(){
    return idiact;
  }
  
  String mensaje(int i){
    return idiomas[i][idiact];
  }
}
