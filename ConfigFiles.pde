//Proyecto  
//elaborado por: Miguel Betzay Dominguez Diaz
//fecha de creación: 26 de septiembre de 2022
//fecha de ultima modificación: 10 de octubre de 2022
//comentario: Contiene los archivos de configuración.

class ConfigFiles{
    String file[];
    String save;
    //Se definen los parametros
    int lang; //Idioma actual
    int ns;   //Numero de mensajes del idioma actual

    ConfigFiles(){
        file = loadStrings("config.dat");
        loadConfig();
    }

    void loadConfig(){
        int i;

        for (i = 0; i < file.length; i++){
            if(isData("language",i)) lang = loadData(i);
            if(isData("langstr", i)) ns = loadData(i);
        }
    }

    boolean isData(String s, int d){
        return split(file[d], "=")[0].equals("#"+s);
    }

    int loadData(int d){
        return int(split(file[d], "=")[1]);
    }

    void saveConfig(Idiomas i){
        lang = i.getIdioma();
        save = "";
        addSave("language", lang);
        addSave("langstr", ns);
        file = split(save, ';');
        saveStrings("data/config.dat", file);
    }

    void addSave(String s, int d){
        save = "#"+s+"="+d+";";
    }

}
