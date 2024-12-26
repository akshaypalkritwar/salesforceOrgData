public class TemperatureConvertor {
//takes Fahrenheit and return celcius
    public static Decimal FahToCelcius(Decimal fh){
        Decimal cs = (fh - 32) * 5/9;
        return cs.setScale(2);//this will show only 2 digits of decimal
    }
}