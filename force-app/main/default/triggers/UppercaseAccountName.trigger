// syntax
    // trigger TriggerName on ObjectName(trigger_events) {
    // //code-block 
    // }
    
    // Trigger Events
    
    
    //  1. Before Insert
    // In this example, a 'Before Insert' trigger on the Account object ensures that the 
    // Account Name is automatically converted to uppercase for every new record insertion
    
trigger UppercaseAccountName on Account (before insert) {
    // Iterate through the new accounts being inserted
    for (Account newAccount : Trigger.new) {
        // Convert the Account Name to uppercase before insertion
        newAccount.Name = newAccount.Name.toUpperCase();
    }
}