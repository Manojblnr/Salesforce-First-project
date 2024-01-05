//          Trigger.old context variable

trigger oldContextVariable on Opportunity(before update) {
    // Only available in Update and Delete Triggers 
    for (Opportunity oldOpp: Trigger.old) {
        for (Opportunity newOpp: Trigger.new) {
            if (oldOpp.Id == newOpp.Id && oldOpp.Amount != newOpp.Amount) newOpp.Amount.addError('Amount cannot be changed'); // Trigger Exception 
        }
    }
}