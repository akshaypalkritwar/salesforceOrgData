public class Calculator {
    public static void Addition(){
        Decimal a = 6,b = 9,add;
        add = a + b;
        system.debug('Addition = '+ add);
    }
    public static void Subtraction(){
        Decimal a = 10 ,b = 6,sub;
        sub = a - b;
        system.debug('Subtraction = '+ sub);
    }
    public static void Multiplication(Decimal x,Decimal y){
        Decimal a = x,b = y,mul;
        mul = a * b;
        system.debug('Multiplication = '+ mul);
    }
    public static void Division(Decimal u, Decimal w){
        Decimal a = u,b = w,div;
        div = a / b;
        system.debug('Division = '+ div);
    }

}