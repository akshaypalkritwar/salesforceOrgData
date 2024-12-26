public class DMLDemo {
    //Insert only one record & fetch id after insertion of record
    public static void insertOneDemo(){
        Account acc = new Account();
        acc.Name = 'Test 101';
        acc.Active__c = 'No';
        insert acc;
        System.debug('Account Id ' + acc.Id);
    }
    //Insert records in bulk using list
    public static void insertBulkDemo(){
        List<Account> accList = new List<Account>();
        Account acc1 = new Account();
        acc1.Name = 'Test 201';
        acc1.Active__c = 'Yes';
        accList.add(acc1);
        
        Account acc2 = new Account();
        acc2.Name = 'Test 301';
        acc2.Active__c = 'No';
        accList.add(acc2);
        
        insert accList;
    }
    //Insert reated records. First Insert Account then Contact
    public static void insertReleatedRecordDemo(){
        List<Account> accList1 = new List<Account>();
        List<Contact> conList = new List<Contact>();
        Account acc3 = new Account();
        acc3.Name = 'Test 203';
        acc3.Active__c = 'Yes';
        accList1.add(acc3);
        Account acc4 = new Account();
        acc4.Name = 'Test 305';
        acc4.Active__c = 'No';
        accList1.add(acc4);
        
        insert accList1;
        Contact con = new Contact();
        con.LastName = acc3.Name;
        con.AccountId = acc3.Id;
        conList.add(con);
        Contact con1 = new Contact();
        con1.LastName = acc4.Name;
        con1.AccountId = acc4.Id;
        conList.add(con1);
        insert conList;
    }
    //adding more than 2 records
    public static void insertMorerRecords(){
        List<Account> accn = new List<Account>();
        
        for(Integer i=1; i<=200;i++){
            Account accnt = new Account();
            accnt.Name = 'test DML' + i;
            accnt.Active__c = 'Yes';
            accn.add(accnt);
        }
        insert accn;
        System.debug(accn.size());
    }
 
}