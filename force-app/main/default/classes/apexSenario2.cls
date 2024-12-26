public class apexSenario2 {
    //Query Opportunities created in this year
    //If the opportunity stage is closed won then update the description as 'Opportunity is closed won',
    //in case fo closed lost update description 'Opportunity is cloded lost' other 'Opprtunity is open.
    public static void oppCreated(){
        List<Opportunity> oppList = new List<Opportunity>();
        oppList = [SELECT Id, Name,StageName FROM Opportunity WHERE CreatedDate = THIS_YEAR];
        if(!oppList.isEmpty()){
            for(Opportunity opp : oppList ){
                if(opp.StageName == 'Closed Won'){
                    opp.Description = ' Opportunity is Closed Won';
                }
                else if(opp.StageName == 'Closed Lost'){
                    opp.Description =' Opportunity is Closed Lost';
                }
                else{
                    opp.Description =' Opportunity is Open';
                }
            }
            update oppList;
        }
        
    }
}