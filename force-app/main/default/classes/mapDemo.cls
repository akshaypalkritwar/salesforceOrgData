public class mapDemo {
    
    public static void sobjectdemo(){
        List<Account> acc = new List<Account>();
        Map<Id,Account> accMap = new Map<Id,Account>();
        
       acc = [Select Id,Name,CustomerPriority__c from Account Limit 100];
       accMap.putAll(acc);
        System.debug('Map have : '+acc.size());
    }
    public static void demomapex(){
        Map <String,Decimal> ExMap = new Map <String,Decimal>();
        ExMap.put('Acc',0.6);
        ExMap.put('Accn',0.3);
        ExMap.put('Accd',0.7);
        ExMap.put('Acce',0.7);
        system.debug('Map have = '+ ExMap);
        ExMap.put('Acce',6.9);
        system.debug('Map have = '+ ExMap);
    }
    
}