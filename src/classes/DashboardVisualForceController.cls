public with sharing class DashboardVisualForceController {

    public List<string> GetIdFromCustomSetting { get; set; }
	public List<String> lstAssignToArray {get;set;}

    public list<dashboard> getFillText() {
        return GetTitleFromCustomSettingId();
    }

    public Integer getDashboardListSize() {
    	return GetTitleFromCustomSettingId().size();
    }

	public List<dashboard> GetTitleFromCustomSettingId() {
		List<test40__Dashboard_IDs__c> CSDashboard_IdList = test40__Dashboard_IDs__c.getall().values();
		Set<Id> CSDashboard_IdSet = new Set<Id>();
		for(test40__Dashboard_IDs__c ds : CSDashboard_IdList){
		    CSDashboard_IdSet.add(ds.Name);
		}
		 List<dashboard> dashboardList = [
		        SELECT title
		        	FROM Dashboard 
		        	WHERE Id IN : CSDashboard_IdSet
	        ]; 
		return dashboardList;
	}
}