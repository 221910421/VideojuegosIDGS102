class Bitacora{
    PrintWriter output;
    boolean active;

    Bitacora(boolean a){
        active = a;
        if(active){
            String s = "data/testing/test ";
            s=s+agregaFechaHora();
            s=s+".log";
            output = createWriter(s);
        }
    } 

    String agregaFechaHora(){
        return ""+month()+"-"+day()+"-"+year()+"-"+" "+hour()+"-"+minute()+"-"+second();        
    }

    void agregaDatosLn(String s){
        if(active){
            output.println(s);
            output.flush();
        }
    }

    void agregaDatos(String s){
        if(active){
            output.print(s);
            output.flush();
        }
    }

    void toggleActive(){
        active = !active;
    }

    void cierraBitacora(){
        if(active){
            String s="Fin de prueba "+agregaFechaHora();
            output.println(s);
            output.flush();
            output.close();
        }
    }
}