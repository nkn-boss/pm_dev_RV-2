/**
 * @Project : Primark
 * @Author  : Devendra Villa
 * @Date    : 04/08/2023
 * @description :  scheduler class to invoke batch class
 */
global with sharing class AnonymisationScheduler implements Schedulable, Database.AllowsCallouts {
    public String retentionPolicy;
    public  AnonymisationScheduler(String retentionPolicy){
        retentionPolicy=this.retentionPolicy;
    }
    global void execute(SchedulableContext context) {
      
        AnonymisationBatchClass batchJob = new AnonymisationBatchClass(retentionPolicy);
         Id batchJobId = Database.executeBatch(batchJob,200);      
        
    }
  }