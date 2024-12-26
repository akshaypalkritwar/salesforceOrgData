public class apexSenario3 {
    //Query accounts created this year. populate 'total contacts' field on account by 
    //conting number of contacts associated with Account
    //if no contact then populate 0
    public static void accountCreated(){
        List<Account> accList = new List<Account>();
        accList = [SELECT Id,Total_Contacts__c, (SELECT Id FROM Contacts) FROM Account WHERE CreatedDate = THIS_YEAR];
        if(!accList.isEmpty()){
            for(Account acc : accList){
                acc.Total_Contacts__c = acc.Contacts.size();
            }
        }    
        update accList;    
    }
    
}