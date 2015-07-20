@isTest
private class DashboardVisualForceControllerTest {
	
	@isTest static void test_method_one() {
		test40__Dashboard_IDs__c setting = new test40__Dashboard_IDs__c();
		DashboardVisualForceController testController = new test40.DashboardVisualForceController();
		setting.name='test';
		testController.getFillText();
        System.assertEquals(0,testController.getDashboardListSize());
	}
}