//Proyecto  
//elaborado por: Miguel Betzay Dominguez Diaz
//fecha de creación: 07 de octubre de 2022
//fecha de ultima modificación: 07 de octubre de 2022
//comentario: Contiene los idiomas del juego

class Idiomas{
    string idiomas[][];
    int idiact;
    int nm;

    Idiomas(int l, int n){
        idiact = l;
        nm = n;
        idiomas = new string[nm][2];
        cargaIdioma(IDESP);
        cargaIdioma(IDING);
    }

    void cargaIdioma(int i){
        int n;
        file=loadStrings((i == IDESP)?"esp.lang":"eng.lang");
        for(n=0; n<nm;n++)
            idomas[n][i] = split(file[n], '=')[1];
    }

    int setIdiomas(int i){
        idiact = i;
    }

    int getIdiona(){
        return idiact;
    }

    String mensaje(int i){
        return idiomas[i][idiact];
    }
}