global class LeadUpdateBatch implements Database.Batchable<sObject>{

    global Database.QueryLocator start(Database.BatchableContext bc){
        return Database.getQueryLocator([Select AnnualRevenue from Lead]);
    }
    
    global void execute(Database.BatchableContext bc, List<Lead> lList){
        for(Lead l:lList){
            l.annualRevenue = 2000000; 
        }
        
        update lList;
    }
    
    global void finish(Database.BatchableContext bc){
        // To send an email using code, use below 
        
        Messaging.SingleEmailMessage mail = new Messaging.SingleEmailMessage();
        
        String[] toAddresses = new String[]{'manojraize@gmail.com'};
            
        mail.setToAddresses(toAddresses);
        
        mail.setSubject('Batch job is completed');
        
        mail.setPlainTextBody('The batch you started is successfully completed');
        
        Messaging.sendEmail(new Messaging.SingleEmailMessage[]{mail});
    }
    
    
    //Execution code
    // LeadUpdateBatch lub = new LeadUpdateBatch();
    // Database.executeBatch(lub);
    // Database.executeBatch(lub, 200); => 200 is batch record
    
}