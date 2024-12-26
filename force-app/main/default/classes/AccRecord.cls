public class AccRecord {
    public static void insertAccountWithOppAndCon(String name,String rating,String active){
        Account acc = new Account();
        acc.Name = name;
        acc.Rating = rating;
        acc.Active__c = active;
        insert acc; //This stmt will insert the record
        
        Contact con = new Contact(LastName = 'Computer');
        con.AccountId = acc.Id; //here accountid is lookup to contact
        insert con;
        
        Opportunity opp = new Opportunity();
        opp.Name = 'Opp 201';
        opp.CloseDate = System.today();
        opp.StageName = 'Prospecting';
        opp.AccountId = acc.Id;
        
        insert opp;
        
    }

}