/**
 * @Project : Primark
 * @Author  : Devendra Villa
 * @Date    : 07/08/2023
 * @description : To invoke the batch class which anonymises the cases after specific timelines.
 */
public with sharing class CaseAnonymisationController {
  
  /**
      * @description  : To invoke batch class
      * @author       : Devendra Villa
      * @param         String cronString, String retentionPolicy
      * @return       : null
      **/
 
  
  @AuraEnabled
  public static Boolean scheduleJob(String cronString, String retentionPolicy) {
    
    try {
      String cronJobName='Scheduled Retention Job '+retentionPolicy;
      
      AnonymisationScheduler scheduler = new AnonymisationScheduler(retentionPolicy);
      System.schedule(cronJobName, cronString, scheduler);
      return true;
    } catch (Exception e) {
      System.debug(e.getMessage());
      return false;
    }

  

  }
}