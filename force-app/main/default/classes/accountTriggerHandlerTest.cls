@isTest
private class accountTriggerHandlerTest {
    @isTest
    static void createOpp(){
        List<Account> accList = new List<Account>();
        for(Integer i = 250;i<=500;i++){
            Account acc = new Account();
            acc.Name = 'test class test '+ i;
            acc.Active__c = 'yes';
            accList.add(acc);
        }
        
        Test.startTest();
        insert accList;
        Test.stopTest();
        
        List<Opportunity> oppList = [SELECT Id,Name FROM Opportunity 
                                     WHERE AccountId =: accList[0].id];
        
        System.assert(oppList != null,'Opportunities did not created');
    }
    @istest
    static void updateRatingAccountTestInsert(){
        List<Account> accList = new List<Account>();
        for(Integer i = 500;i<=750 ;i++){
            Account acc = new Account();
            acc.Name = 'Testttt ' + i;
            acc.Active__c = 'No';
            acc.Industry = 'Media';
            
            accList.add(acc);
        }
        Test.startTest();
        insert accList;
        Test.stopTest();
    }
    @istest
    static void updateRatingAccountTestUpdate(){
        List<Account> accList = new List<Account>();
        for(Integer i = 500;i<=750 ;i++){
            Account acc = new Account();
            acc.Name = 'Testttt ' + i;
            acc.Active__c = 'No';
            acc.Industry = 'Chemical';
            
            accList.add(acc);
        }
        Test.startTest();
        insert accList;
        
        for(Account acc : accList){
            acc.Industry = 'Media';
            accList.add(acc);
        }
        update accList;
        Test.stopTest();
        
        List<Account> updatedAccList = [SELECT Rating FROM Account
                                        WHERE Id =: accList[0].id];
        System.assertEquals('Hot',updatedAccList[0].Rating);
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}