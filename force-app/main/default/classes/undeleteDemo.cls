public class undeleteDemo {
    public static void undeleteDMLDemo(){
        List<Account> accList = new List<Account>();
        accList = [SELECT Id,Name,Rating From Account
                   WHERE Name Like 'Test Upsert %' ALL ROWS];
        if(accList.size() > 0){
            undelete accList;
        }
    }
}