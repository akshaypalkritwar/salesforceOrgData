public class dmlUpdateDemo {
    //Displaying existing records and their values
    public static void updateRecord(){
        List<Account> accList = new List<Account>();
        accList = [SELECT Id,Name,Rating FROM Account WHERE Rating = 'Hot'];
        
        if(!accList.isEmpty()){
            for(Account acc : accList){
                acc.Industry = 'Media';
            }
            update accList;
        }
    }   
}