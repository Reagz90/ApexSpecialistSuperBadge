public with sharing class MaintenanceRequestHelper {
    public static void createRoutineMaintenanceRequest(List<Case> maintenanceRequests) {
        List <Case> newCases = new list <Case>(); 

        for (Case c : maintenanceRequests) {
            if (c.Status == 'Closed'){
                if(c.Type == 'Repair' || c.Type == 'Maintenance Request') {
                    Case newMaintRequest = new Case();
                    newMaintRequest.Status = 'New'; 
                    newMaintRequest.Origin = 'Web';
                    newMaintRequest.Subject = 'Case Created From Trigger';
                    newCases.add(newMaintRequest);
                }
            }
        }
        insert newCases; 
    }
}
