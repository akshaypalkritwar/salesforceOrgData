public class soqlDemo {
    public static void queryDemo(){
        List<Contact> conList = new List<Contact>();
        Contact con1 = new Contact();
        con1.LastName = 'Joe1' ;
        con1.Title = 'CFO' ;
        insert con1;
        conList.add(con1);
        String fname = 'Pen';
        String title = 'CFO';
        conList = [Select Name,AssistantPhone,Title
                   FROM Contact
                   Where Name =: fname OR Title =: title];
        for(Contact con : conList){
            System.debug(con.Name);
            
            System.debug(con.Title);
        }
    }
    
}