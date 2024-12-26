trigger caseTrigger on Case (after insert) {
    If(trigger.isAfter){
        caseTriggerHandler.createCase(trigger.new);
    }
    

}