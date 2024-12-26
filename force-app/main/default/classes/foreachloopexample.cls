public class foreachloopexample {
    public static void showList(){
        List<Account> accList = new List<Account>();
        Set<ID> accS = new Set<ID>();
        Map<ID,Account> mapAcc = new Map<ID,Account>();
        accList = [Select Id FROM Account LIMIT 14];
       //copying values from list to set and map
        if(!accList.isEmpty()){
            for(Account acc : accList){
             //   System.debug('Set of id : '+ acc.Id);
                accS.add(acc.Id);
                mapAcc.put(acc.id,acc);
            }
           // System.debug('set of ids ' +accS);
        }
        //Iteration through the set of account id's
        if(!accS.isEmpty()){
            for(ID accID : accS){
                //System.debug(accID);
            }
        }
        //iterating through map id's
        if(!mapAcc.isEmpty()){
            for(ID mapAccID : mapAcc.keyset()){
                System.debug('Ids from map = ' + mapAccID);
            }
        }
        //iterating through map values
        if(!mapAcc.isEmpty()){
            for(Account mapAccValue : mapAcc.values()){
                System.debug('Values from Map' + mapAccValue);
            }
        }
    }   
}