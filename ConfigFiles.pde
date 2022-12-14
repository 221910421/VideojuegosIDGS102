//Módulo ConfigFiles 
//elaborado por: Rubén Dario Hernandez Mendo
//fecha de creación: 10 de octubre de 2022
//fecha de ultima modificación: 14 de noviembre de 2022
//comentario: Define la clase ConfigFiles, la cual permite configurar ciertas
//características del juego para que sean cargadas durante el arranque
class ConfigFiles{
  String file[];
  String save;
  //parámetros a guardar
  int lang;       //idioma activo
  int ns;         //número de mensajes de idiomas
  int bgdx;       //velocidad horizontal del fondo
  int bgdy;       //velocidad vertical del fondo
  int fgdx;       //velocidad horizontal del frente
  int fgdy;       //velocidad vertical del frente
  int prdxu;      //velocidad horizontal de ascenso del personaje
  int prdyu;      //velocidad vertical de ascenso del personaje
  int prdxd;      //velocidad horizontal de descenso del personaje
  int prdyd;      //velocidad vertical de descenso del personaje
  int nbg;        //número de imágenes de fondo distintas
  int nfg;        //número de imágenes de frente distintas
  int bgli;       //limite izquierdo para el fondo
  int bgld;       //limite derecho para el fondo
  int fgli;       //limite izquierdo para el frente
  int fgld;       //limite derecho para el frente
  int nprc;       //numero de sprites del personaje, correr
  int prfc;       //numero de frames que dura un sprite para correr
  int fntstd;     //tamaño estándar de texto
  int fntbig;     //tamaño de texto grande
  String fntname; //nombre de la tipografía a usar
  boolean logact; //estado de la bitácora
  boolean gmode;  //modo gráfico: true=sprites false=figuras
  int hpmax;      //puntos máximos de vida del personaje
  int hphit;      //daño recibido por golpe al personaje
  int hprcv;      //salud recuperada por item curativo
  int spdcn;      //velocidad horizontal de las monedas
  
  ConfigFiles(){
    file=loadStrings("config.dat");
    loadConfig();
  }
  
  void loadConfig(){
    int i;
    for(i=0;i<file.length;i++){
      if(isData("language",i)) lang=loadData(i);
      if(isData("langstr",i))  ns=loadData(i);
      if(isData("bgdx",i))     bgdx=loadData(i);
      if(isData("bgdy",i))     bgdy=loadData(i);
      if(isData("fgdx",i))     fgdx=loadData(i);
      if(isData("fgdy",i))     fgdy=loadData(i);
      if(isData("prdxu",i))    prdxu=loadData(i);
      if(isData("prdyu",i))    prdyu=loadData(i);
      if(isData("prdxd",i))    prdxd=loadData(i);
      if(isData("prdyd",i))    prdyd=loadData(i);
      if(isData("gmode",i))    gmode=loadBoolData(i);
      if(isData("nbg",i))      nbg=loadData(i);
      if(isData("nfg",i))      nfg=loadData(i);
      if(isData("bgli",i))     bgli=loadData(i);
      if(isData("bgld",i))     bgld=loadData(i);
      if(isData("fgli",i))     fgli=loadData(i);
      if(isData("fgld",i))     fgld=loadData(i);
      if(isData("nprc",i))     nprc=loadData(i);
      if(isData("prfc",i))     prfc=loadData(i);
      if(isData("fntstd",i))   fntstd=loadData(i);
      if(isData("fntbig",i))   fntbig=loadData(i);
      if(isData("fntname",i))  fntname=loadStrData(i);
      if(isData("logact",i))   logact=loadBoolData(i);
      if(isData("hpmax",i))    hpmax=loadData(i);
      if(isData("hphit",i))    hphit=loadData(i);
      if(isData("hprcv",i))    hprcv=loadData(i);
      if(isData("spdcn",i))    spdcn=loadData(i);
    }
  }
  
  boolean isData(String s, int d){
    return split(file[d],'=')[0].equals("#"+s);
  }
  
  int loadData(int d){
    return int(split(file[d],'=')[1]);
  }
  
  boolean loadBoolData(int d){
    return split(file[d],'=')[1].equals("ON");
  }
  
  String loadStrData(int d){
    return split(file[d],'=')[1];
  }
  
  void saveConfig(Idiomas i){
    lang=i.getIdioma();
    save="";
    addSave("language",lang);
    addSave("langstr",ns);
    addSave("bgdx",bgdx);
    addSave("bgdy",bgdy);
    addSave("fgdx",fgdx);
    addSave("fgdy",fgdy);
    addSave("prdxu",prdxu);
    addSave("prdyu",prdyu);
    addSave("prdxd",prdxd);
    addSave("prdyd",prdyd);
    addSave("gmode",gmode);
    addSave("nbg",nbg);
    addSave("nfg",nfg);
    addSave("bgli",bgli);
    addSave("bgld",bgld);
    addSave("fgli",fgli);
    addSave("fgld",fgld);
    addSave("nprc",nprc);
    addSave("prfc",prfc);
    addSave("fntname",fntname);
    addSave("fntstd",fntstd);
    addSave("fntbig",fntbig);
    addSave("logact",logact);
    addSave("hpmax",hpmax);
    addSave("hphit",hphit);
    addSave("hprcv",hprcv);
    addSave("spdcn",spdcn);
    file=split(save,';');
    saveStrings("data/config.dat",file);
  }
  
  void addSave(String s,int d){
    save=save+"#"+s+"="+d+";";
  }
  
  void addSave(String s,boolean d){
    save=save+"#"+s+"="+((d)?"ON":"OFF")+";";
  }
  
  void addSave(String s,String d){
    save=save+"#"+s+"="+d+";";
  }
}
