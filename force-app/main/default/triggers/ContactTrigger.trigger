trigger ContactTrigger on Contact (before insert,After insert,After undelete,After delete ) {
    if(trigger.isInsert){
        if(trigger.isBefore){
            ContactTriggerHandler.contactUpdate(trigger.new);
        }
        if(trigger.isAfter){
             ContactTriggerHandler.updateContactCount(trigger.new);
        }
        
    }
    if(trigger.isDelete){
        if(trigger.isAfter){
            ContactTriggerHandler.updateContactCount(trigger.old);
        }
        
    }
    if(trigger.isUndelete){
        if(trigger.isAfter){
            ContactTriggerHandler.updateContactCount(trigger.new);
        }
        
    }
    
}