//Proyecto  
//elaborado por: Miguel Betzay Dominguez Diaz
//fecha de creación: 26 de septiembre de 2022
//fecha de ultima modificación: 3 de octubre de 2022
//comentario: Implementa la clase para controlar puntos 2D

class Punto2D{
    int x;
    int y;

    Punto2D(int x, int y){
        this.x = x=x;
        this.y = y=y;

    }

    int getX(){
        return x;
    }

    int getY(){
        return y;
    }

    void setX(int x){
        this.x = x;
    }

    void setY(int y){
        this.y = y;
    }

    void move(int dx, int dy){
        x = x + dx;
        y = y + dy;
    }
}
