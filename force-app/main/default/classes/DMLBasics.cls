public class DMLBasics {
	
    // Insert bulk records
    public static void insertMethod(){
        List<Account> accList = new List<Account>();

        for(integer i = 1; i<=10; i++){
            Account a = new Account(Name = 'Test ' + i);
            accList.add(a);
        }

    	insert accList;
    }
    
    // Update bulk records
    public static void updateMethod(){
		List<Account> accList = [ Select Name from Account where CreatedDate = TODAY];

        for(Account a:accList){
            a.Name = a.Name + 'updated';
        }
        update accList;
    }
    
     // Upsert bulk records

    public static void upsertMethod(){
		List<Account> accList = [Select Name,NumberOfEmployees from Account where CreatedDate = TODAY];

        //update
        for(Account a:accList){
            a.NumberOfEmployees = 1000;
        }
        
        // insert
        for(integer i=0; i<=10; i++){
            Account a = new Account(Name = 'Upsert Record '+ i);
            accList.add(a);
        }
        upsert accList;
        
        system.debug([Select Name,NumberOfEmployees from Account where CreatedDate = TODAY]);
    }
    
    // Delete bulk records
    public static void deleteMethod(){
        List<Account> accList = [ Select Name,NumberOfEmployees from Account where CreatedDate = TODAY];

        delete accList;
    	system.debug('The Account today created record is deleted');
    }
    
    // UnDelete bulk records
    public static void UndeleteMethod(){
        List<Account> accList = [ Select Name from Account where Name Like 'Upsert Record%' AND isDeleted = true ALL ROWS];

        undelete accList;
    	system.debug('The Account name has value of updated is undeleted');
    }
    
    
    public static void mergeMethod(){
        List < Account > accList = [SELECT Name FROM Account where Name Like 'merge%' order by Name LIMIT 3];
        
        Account a = accList[0];  //merge account one
        Account b = accList[1];  //merge account two 
        Account c = accList[2];  //merge account three

        List < Account > mergeList = new List < Account > ();
        mergeList.add(accList[1]);
        mergeList.add(accList[2]);
        
        // for 2 records
        // merge a b; 
        // system.debug('The Account a and b all the child records are merged');
        
        // for 3 records
        merge a mergeList;
        system.debug('The Account b and c all the child records are merged with Account a');
    }
}