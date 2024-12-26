/*Query contacts created last week and if mobile phone is not populated on contact then copy 
phone of related account*/
public class apexsenario4 {
    public static void createdContacts(){
        List<Contact> conList = new List<Contact>();
        conList = [SELECT Id,Phone,Account.Phone FROM Contact WHERE CreatedDate = THIS_WEEK];
        if(!conList.isEmpty()){
            for(Contact con : conList){
                if(String.isEmpty(con.Phone)){
                    con.Phone = con.Account.Phone;
                }
            }
            update conList;
        }
    }
}