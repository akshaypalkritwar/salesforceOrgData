public class apexSenarioDemo {
    //showing number of contact records related to Account
    public static void relatedContacts(){
        List<Account> accList = new List<Account>();
        accList = [SELECT Id,Name, ( SELECT Id FROM Contacts) FROM Account WHERE Phone!=null];
        
        if(!accList.isEmpty()){
            for(Account acc:accList){
                System.debug(acc.Name+' has '+acc.Contacts.size()+' contacts related');
            }
        }
        
    }
    
}