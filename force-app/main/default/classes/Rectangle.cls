public class Rectangle {
    Decimal Len,bredth;
    public static void area(Decimal l,Decimal b){
        Decimal Len = l,bredth = b;
        Decimal a = Len*bredth;
        system.debug('Area = '+a);
    }
    public static void perimeter(Decimal k,Decimal c){
        Decimal Len = k,bredth = c;
        Decimal p = 2*(Len+bredth);
        system.debug('Area = '+p);
    }

}