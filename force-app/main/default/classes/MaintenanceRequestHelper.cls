public with sharing class MaintenanceRequestHelper {
    
    public static void createRoutineMaintenanceRequest(List<Case> maintenanceRequests) {
        List <Case> newCases = new list <Case>(); 
        Set<Id> oldCaseIds = new Set<Id>();

        for (Case c : maintenanceRequests) {
            if (c.Status == 'Closed'){
                if(c.Type == 'Repair' || c.Type == 'Maintenance Request') {
                    Case newMaintRequest = new Case();
                    newMaintRequest.Status = 'New'; 
                    newMaintRequest.Origin = 'Web';
                    newMaintRequest.Subject = 'Case Created From Trigger';
                    newMaintRequest.Type = 'Routine Maintenance';
                    newMaintRequest.Date_Reported__c = date.today();
                    newMaintRequest.AccountId = c.AccountId;
                    newMaintRequest.ContactId = c.ContactId;
                    newMaintRequest.Vehicle__c = c.Vehicle__c;  
                    newCases.add(newMaintRequest);
                    oldCaseIds.add(c.Id);
                }
            }
        }
        if (newCases.size() > 0) {
            insert newCases; 
            createRelatedEMIs(newCases);
        }               
    }

    private static void createRelatedEMIs(List <Case> newMaintenanceRequests) {

    }
}
