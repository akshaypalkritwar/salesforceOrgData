public class accountTriggerHandler {
    // Write a trigger on Account, when an account is inserted, automatically 
    // account website should populate as 'login.salesforce.com'    
    public static void updateBillingAdd(List<Account> accList){
        for(Account acc : accList){            
            acc.Website = 'login.salesforce.com';
            acc.Description = acc.Website + 'is your website';
        }
    }
    //Upon Account Creation or Updation if Account Industry is not null
    // and having value as 'Media' then populate Rating as Hot. 
    public static void updateRatingAccount(List<Account> accList,Map<Id,Account> accOldMap){
        for(Account acc : acclist){
            if((accOldMap == null && acc.Industry != null && acc.Industry == 'Media') ||
               (accOldMap != null &&acc.Industry == accOldMap.get(acc.id).Industry && acc.Industry == 'Media')){
                   acc.Rating = 'Hot';
               }
        }    
    }
    //create related Opportunity when account is created
    public static void createOpp(List<Account> accList){
        List<Opportunity> oppList = new List<Opportunity>();
        for(Account acc : accList){
            Opportunity opp = new Opportunity();
            opp.Name = acc.Name;
            opp.StageName = 'Qualification';
            opp.CloseDate = System.Today();
            opp.AccountId = acc.Id;
            opp.Amount = 10000;
            oppList.add(opp);
        }
        Database.SaveResult[] srList= DataBase.insert (oppList, false);
        for(Integer i=0;i<srList.size(); i++){
            if(!srList[i].isSuccess()) {
                String errors='';
                for (DataBase.Error err: srList[i].getErrors() ) {
                    errors=errors+err.getMessage();
                }
                accList[i].addError(errors);
            }
        }
        
    }
    //Create related contact when an account is created
    public static void createCon(List<Account> accList){
        List<Contact> conList = new List<Contact>();
        for(Account acc : accList){
            Contact con = new Contact();
            con.AccountId = acc.Id;
            con.LastName = acc.Name;
            conList.add(con);
        }
        if(!conList.isEmpty()){
            insert conList;
        }   
    }
    //If account phone is updated then put update msg in description
    public static void accPhoneUpdate(List<Account> accList, Map<Id, Account> accOldMap){
        for(Account acc : accList){
            if(acc.Phone != accOldMap.get(acc.Id).Phone){
                acc.Description = 'Phone is updated with new value '+acc.Phone+' Where old value was ' 
                    +accOldMap.get(acc.Id).Phone;
            }
        }        
    }
    //After Update
    //If Account phone is updated then populate phone number on all related contacts.
    // Using Map
    //Using Parent-Child SOQL
    
    public static void phonePopulateOnContact(List<Account> accList , Map<Id,Account> accOldMap){
        List<Contact> conList = new List<Contact>();
        Map<Id,Account> accMap = new Map<Id,Account>();
        
        for(Account acc : accList){
            //Map will store only those accounts whose phone is updated
            if(acc.Phone != accOldMap.get(acc.Id).Phone){
                accMap.put(acc.Id, acc);
            }
        }
        for(Contact con : [SELECT Id,HomePhone,AccountId FROM Contact 
                           WHERE AccountId IN: accMap.keySet()]){
                               if(accMap.containsKey(con.AccountId)){
                                   con.HomePhone = accMap.get(con.AccountId).Phone;
                                   conList.add(con);
                               }
                           }
        if(!conList.isEmpty()){
            update conList;
        }
    }
    //Before Delete : Account record cannot be deleted if active is Yes
    //User custom lable to show error msg
    //apply a check that only admin profile user can delete an account.
    public static void preventDelete(List<Account> accList){
        //here we have picked id of system admin using below query
        Profile p = [Select Id from Profile WHERE Name = 'System Administrator'];
        
        for(Account acc : accList){
            //in if block 1st condition is checking if user is not equal to admin
            if(UserInfo.getProfileId() !=p.Id || acc.Active__c == 'Yes'){
                //Normal Method -->acc.addError('you cannot delete this record as active field is Yes');
                /*Using custom lable-->*/acc.addError(Label.Prevent_Account_Deletion);
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}