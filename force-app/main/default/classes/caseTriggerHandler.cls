public class caseTriggerHandler {
    //When a created on any account put the latest case number on the account in the 'Latest case number' field
    public static void createCase(List<Case> caseList){
        List<Account> accList = new List<Account>();
        for(Case cs : caseList){
            if(cs.AccountId != null){
                Account acc = new Account();
                acc.id = cs.AccountId;
                acc.Latest_Case_Number__c = cs.CaseNumber;
                accList.add(acc);
            }
        }
        if(!accList.isEmpty()){
            update accList;
        }
    }
}