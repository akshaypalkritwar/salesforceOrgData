public class deleteDMLDemo {

    Public static void deleteRecordsDMLDemo(){
        List<Account> accList  = new List<Account>();
        accList = [Select Id,Name FROM Account
                  WHERE Name Like 'Test ups %'];
        
        if(!accList.isEmpty()){
            delete accList;
        }
    }
}