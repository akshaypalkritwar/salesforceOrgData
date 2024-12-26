public class deleteContacts {
    public static void deleteContacts(){
        List<Contact> conList = new List<Contact>();
        conList = [Select Id,Name FROM Contact WHERE Name LIKE 'wat%'];
        if(!conList.isEmpty()){
            delete conList;
        }
        
    }
}