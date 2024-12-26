public class SetDemo {
    
    public static void setExample(){
        Set<Integer> setEx = new Set<Integer>();
        List<Integer> listEx = new List<Integer>();
        setEx.add(45);
        setEx.add(46);
        setEx.add(78);
        listEx.add(99);
        listEx.add(199);
        
        setEx.addAll(listEx);
        system.debug('numbers in set = '+ setEx);
        
        
    }
    
}