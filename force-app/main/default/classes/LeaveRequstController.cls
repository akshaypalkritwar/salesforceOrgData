public with sharing class LeaveRequstController {
    @AuraEnabled(cacheable=true)
    public static List<Leave_Request__c> getMyLeaves(){
        try {
            List<Leave_Request__c> myLeaves=new List<Leave_Request__c>();
            myLeaves=[SELECT Id,Name,From_Date__c,To_Date__c,Reason__c,Status__c,Manager_Comments__c FROM Leave_Request__c WHERE User__c=:UserInfo.getUserId() ORDER BY CreatedDate DESC];
            return myLeaves;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }

    @AuraEnabled(cacheable=true)
    public static List<Leave_Request__c> getLeaveRequests(){
        try {
            List<Leave_Request__c> myLeaves=new List<Leave_Request__c>();
            myLeaves=[SELECT Id,Name,From_Date__c,To_Date__c,Reason__c,Status__c,Manager_Comments__c,User__r.ManagerId,User__r.Name FROM Leave_Request__c
            WHERE User__r.ManagerId=:UserInfo.getUserId() ORDER BY CreatedDate DESC];
            return myLeaves;
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}