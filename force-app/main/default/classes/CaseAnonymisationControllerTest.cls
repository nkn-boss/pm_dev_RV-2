@isTest
private class CaseAnonymisationControllerTest {
    
    @isTest
    static void runFirstJob(){
        
        String cronString='0 0 0 ? * * *';
        String retentionPolicy='T1_T3';
        Test.startTest();
		CaseAnonymisationController.scheduleJob(cronString, retentionPolicy);
        Test.stopTest();
    }
    @isTest
    static void runSecondJob(){
        String cronString='0 0 0 9 * * *';
        
        String retentionPolicy='Test';
        try{
        Test.startTest();
		CaseAnonymisationController.scheduleJob(cronString, retentionPolicy);
        Test.stopTest();
        }
        catch(Exception e){
            
        }
    }


}