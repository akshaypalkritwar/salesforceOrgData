public class opportunityTriggerHandler {
/*When an opportunity is updated to closed won or closed lost then update description with 'Opportunity is 
closed won or closed lost as per the stage*/
    public static void updateDec(List<Opportunity> oppList,Map<Id,Opportunity> oppOldMap){
        List<Opportunity> oppNewList = new List<Opportunity>();
        for(Opportunity opp : oppList){
            Opportunity oppt = new Opportunity();
            oppt.Id = opp.Id;
            if(opp.StageName != oppOldMap.get(opp.id).Stagename){
                if(oppt.StageName == 'Closed Won'){
                    oppt.Description = 'Opportunity is closed Won';
                }
                else if(oppt.StageName == 'Closed Lost'){
                    oppt.Description = 'Opportunity is closed Lost';
                }
            }
            oppNewList.add(oppt);
        }
        if(!oppNewList.isEmpty()){
            update oppNewList;
        }
    }
    /*Upon Opportunity creation if amount is null then throw an error msg saying 'Please populate amount on Opprtunity'*/
    public static void amountUpdatevalidation(List<Opportunity> oppList){
        for(Opportunity opp : oppList){
            if(opp.Amount == null){
                opp.addError('Please populate amount on opportunity');
            }
        }
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
}