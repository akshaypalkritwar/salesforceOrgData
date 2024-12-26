@isTest
public class TemperatureConvertorTest {
    @isTest
    static void testWarmTemp(){
        Decimal celsius = TemperatureConvertor.FahToCelcius(70);
        System.assertEquals(21.11,celsius);
    }
    @isTest
    static void testFreezingPoint(){
        Decimal celsius = TemperatureConvertor.FahToCelcius(32);
        System.assertEquals(0,celsius);
    }
    @isTest
    static void testBoilingPointTemp(){
        Decimal celsius = TemperatureConvertor.FahToCelcius(212);
        System.assertEquals(100,celsius,'Boiling point temperature is not expected');
    }
    @isTest
    static void testNegativeTemp(){
        Decimal celsius = TemperatureConvertor.FahToCelcius(-10);
        System.assertEquals(-23.33,celsius);
    }
}