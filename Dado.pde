class Dado{
    int nc;//numero caras
    int t; //ultima tirada

    Dado(int n){
        nc=n;
    }

    int tirar(){
        t=int(random(1,nc+1));//numero aleatorio entre 1 y 6 o numero de caras
        return t;
    }
}