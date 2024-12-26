public class ListDemo {
    public static void demoCon(String name , String Dept){
        List<Contact> con = new List<Contact>();
        Contact co = new Contact();
        co.LastName = name;
        co.Department = dept;
        con.add(co);
        Contact co1 = new Contact(LastName = 'Pen',Department = 'Laptop');
        con.add(co1);
        insert con;
        system.debug('added content in list = '+ con);
        
        
    }

}