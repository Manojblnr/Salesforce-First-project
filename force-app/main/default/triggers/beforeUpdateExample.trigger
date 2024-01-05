//         Before update trigger

trigger beforeUpdateExample on Account(before update){
    // Trigger Logic
    Account a = Trigger.new[0];
    
    a.Name = a.Name + ' Limited';
}