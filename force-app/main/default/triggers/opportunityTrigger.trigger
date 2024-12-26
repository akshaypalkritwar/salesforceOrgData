trigger opportunityTrigger on Opportunity (before insert,after update) {
    if(trigger.isInsert){
        if(trigger.isBefore){
                opportunityTriggerHandler.amountUpdatevalidation(trigger.new);
        }
    }
    if(trigger.isUpdate){
        if(trigger.isAfter){
            if(!preventRecurrsion.preRec){
                preventRecurrsion.preRec = true;
                opportunityTriggerHandler.updateDec(trigger.new,trigger.oldMap);
            }
            
        }
    }

}