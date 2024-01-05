//          Trigger.new context variable

trigger newContextVariable on Account(before insert){
    
    // Non bulkified
    Account a = Trigger.new[0];
    a.NumberOfEmployees = 1000;
    
    // bulkified
    /* for(Account acc:Trigger.new){
        acc.NumberOfEmployees = 2000;
    }
    */
}