public class ContactTriggerHandler {
    public static void contactUpdate(List<Contact> conList){
        for(Contact con : conList){
            con.Description = 'Congrats you have succesfully created a record';
            con.Languages__c = 'Japanese';
        }
    }
    /*After Insert : 
    When a contact record is inserted then update 'Total contacts' field on related account. */
    /*After Delete :
    When a contact record is deleted then update 'Total contacts' field on related account. */
    /*After Undelete : 
    When a conatct record is undeleted then update 'Total contact' Field on related account. */
    public static void updateContactCount(List<Contact> conList){
        List<Account> accList = new List<Account>();
        Set<id> accIds = new Set<id>();
        
        for(Contact con : conList){
            if(con.AccountId != null){
                //set of Ids is collecting the conatct ids which are related to some accounts.
                accIds.add(con.AccountId);
            }
        }
        //This below for loop is filteirng acc ids from accIds set. and size of contact assigning to total contact field
        for(Account acc : [SELECT ID,(SELECT ID FROM Contacts) FROM Account WHERE ID IN: accIds]){
            acc.Total_Contacts__c = acc.Contacts.size();
            accList.add(acc);
        }
        if(!accList.isEmpty()){
            update accList;
        }
    }
  
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}