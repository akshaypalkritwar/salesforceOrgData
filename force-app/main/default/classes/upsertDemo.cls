public class upsertDemo {
    public static void upsertRecordDemo(){
        List<Account> accList = new List<Account>();
        accList = [SELECT Id,Name,Rating FROM Account 
                   WHERE Rating = 'Hot'];
        if(!accList.isEmpty()){
            for(Account acc : accList){
                acc.Name = 'Energy';
            }
        }
        
        for(Integer i = 1;i<=1000;i++){
            Account acc = new Account();
            acc.Name ='Test Upsert '+i;
            accList.add(acc);
        }
        if(!accList.isEmpty()){
            upsert accList;
        }
    }
}