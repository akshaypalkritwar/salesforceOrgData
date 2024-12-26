public class loopDemo {
    public static void evennum(Integer n){
        for(Integer i=1; i<=n;i++){
            if(Math.mod(i,2) == 0){
                system.debug(i);
            }
        }
    }
    public static void oddnum(Integer n){
        for(Integer i=0;i<=n;i++){
            if(Math.mod(i,2)!=0){
                System.debug(i);
            }
        }
    }
     
    public static void foreachloop(){
        List<Account> accList = new List<Account>();
        accList = [Select Name from Account LIMIT 15];
        for(Account acc : accList){
            System.debug('loop have : ' + acc);
        }
    }
    public static void sumOfNaturalNums(Integer n){
        Integer i, sum = 0;
        for(i=0;i<=n;i++){
            sum = sum + i; 
        }
        System.debug('Sum : '+ sum);
    }

}