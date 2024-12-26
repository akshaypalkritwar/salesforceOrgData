trigger accountTrigger on Account (before insert,before update,after insert,after update,before delete) {
    if(trigger.isInsert){
        if(trigger.isBefore){
            accountTriggerHandler.updateBillingAdd(trigger.new);
            accountTriggerHandler.updateRatingAccount(trigger.new,null);
            //   accountTriggerHandler.ratingUpdate(trigger.new,trigger.oldMap);
            
        }
        else if(trigger.isAfter){
            accountTriggerHandler.createOpp(trigger.new);
            accountTriggerHandler.createCon(trigger.new);
        }
    }
    if(trigger.isUpdate){
        if(trigger.isBefore){
            accountTriggerHandler.accPhoneUpdate(trigger.new,trigger.oldMap);
            accountTriggerHandler.updateRatingAccount(trigger.new,trigger.oldMap);    
        } else if(trigger.isAfter){
            accountTriggerHandler.phonePopulateOnContact(trigger.new,trigger.oldMap);
        }   
    }
    if(trigger.isDelete){
        if(trigger.isBefore){
            accountTriggerHandler.preventDelete(trigger.old);
        }
    }
}