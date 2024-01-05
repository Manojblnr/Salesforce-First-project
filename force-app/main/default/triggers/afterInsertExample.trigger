//               after insert trigger

trigger afterInsertExample on Contact(after insert){
    Contact c = Trigger.new[0];
    Account a = new Account();
    a.name = c.lastName + ' & Company';
    
    insert a;
}