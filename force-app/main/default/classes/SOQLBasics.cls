public class SOQLBasics {
	
    public static void myMethod(){
        List<Account> accList = [ SELECT Name, NumberOfEmployees from Account ];
            
            //For loop
            for( integer i=0; i<accList.size(); i++){
                system.debug(accList[i].numberOfEmployees);
            }
        	
        	//For Each loop
        for	(Account a:accList){
            system.debug('account Name: ' +a.Name+ ' Number of Emp '+ a.NumberOfEmployees);
        }
    }
    
    // variable binding for getting dynamic data from user
    
    public static void varBindMethod( string s){
        	
        // List<Contact> contact1 = [ SELECT firstName, lastName, email from Contact where firstName = 'John'];
        
        List<Contact> contact2 = [ SELECT firstName, lastName, email from Contact where firstName = :s];
        
        for( Contact res:contact2){
            system.debug('first Name '+res.firstName + ' Last Name ' + res.lastName + 'Email '+ res.email);
        }
    }
    
    
    // SOQL keywords:   AND, OR, IN,  NOT IN,  
    // IN keyword
    
    public static void InKeywordMethod(){
        // This IN keyword only work with list and sets not map
        //Normal way
    	// List<Contact> contact3 = [ SELECT firstName, lastName, email from Contact where firstName = 'John' OR firstName = 'Tom' OR firstName = 'Rose'];
        
        //IN keyword way in list
        List<String> nameList = new List<String>{'Tim', 'John', 'Rose'};
        List<Contact> contact3 = [ SELECT firstName, lastName, email from Contact where firstName IN :nameList];
        
        for(Contact result:contact3){
            system.debug('First name ' + result.firstName +' Last Name '+ result.lastName + 'email '+ result.email);
        }
    }
    
    
    // NOT keyword
    public static void NotKeywordMethod(){
        
        //NOT keyword way in list
        List<String> nameList = new List<String>{'Tim', 'John', 'Rose'};
        List<Contact> contact4 = [ SELECT firstName, lastName, email from Contact where firstName NOT IN :nameList];
        
        for(Contact result:contact4){
            system.debug('First name ' + result.firstName +' Last Name '+ result.lastName + 'email '+ result.email);
        }
    }
    
    //LIKE keyword
    //LIKE keyword to perform a partial string match.
    public static void LikeKeywordMethod(){
        
        //LIKE keyword way in list
        String searchWord = 'Joh';
        List<Contact> contact5 = [ SELECT firstName, lastName, email from Contact where firstName LIKE :('%'+ searchWord +'%')];
        
        for(Contact result:contact5){
            system.debug('First name ' + result.firstName +' Last Name '+ result.lastName + 'email '+ result.email);
        }
    }
    
    
    //ORDER BY keyword
    //ORDER BY clause is used to sort the results based on condition. Default is ascending(ASC).
    public static void OrderByKeywordMethod(){
        
        //ORDER BY keyword way in list
        List<Contact> contact6 = [ SELECT firstName, lastName, email from Contact ORDER BY lastName DESC];
        
        for(Contact result:contact6){
            system.debug('First name ' + result.firstName +' Last Name '+ result.lastName + 'email '+ result.email);
        }
    }
    
    
    //GROUP BY 
    //AggregateResult is not a keyword in the traditional sense;
    //AggregateResult is a special data type in Apex that is designed to hold the results of such queries. 
    //It's a special data type in Apex that is used to store the results of a query that includes aggregate functions like COUNT, SUM, AVG, etc.
     public static void GroupByKeywordMethod(){
        
        //GROUP BY  keyword way in list
        List<AggregateResult> contact7 = [ SELECT AccountId, COUNT(Id) from Contact GROUP BY AccountId];
        
        for(AggregateResult result:contact7){
            Id accountId = (Id)result.get('AccountId');
            Integer contactCount = (Integer)result.get('expr0');
            
            System.debug('Account ID: ' + accountId + ' Contact Count: ' + contactCount);
        }
    }
    
    // HAVING 
    // The HAVING keyword is used in SOQL to filter the results of a GROUP BY query based on aggregate functions. It is similar to the WHERE clause but is applied after the grouping has been done.
    
        public static void GroupByHavingMethod() {
        // GROUP BY and HAVING keyword in list
        List<AggregateResult> contactResults = [
            SELECT AccountId, COUNT(Id) 
            FROM Contact 
            GROUP BY AccountId
            HAVING COUNT(Id) > 2
        ];
    
        for (AggregateResult result : contactResults) {
            Id accountId = (Id)result.get('AccountId');
            Integer contactCount = (Integer)result.get('expr0');
    
            System.debug('Account ID: ' + accountId + ' Contact Count: ' + contactCount);
            }
        }
	
    
    //LIMIT keyword in a SOQL query in a similar context, you can limit the number of records returned by the query. 
    public static void LimitKeywordMethod(){
        List<Contact> LimitList = [ SELECT firstName, lastName, email from Contact LIMIT 3];
        
        for(Contact result:LimitList){
            system.debug('First name ' + result.firstName +' Last Name '+ result.lastName + 'email '+ result.email);
        }
    }
    
    
    //The FOR UPDATE keyword in a SOQL query is used to lock the queried records to prevent other transactions from modifying them until the current transaction is complete.
    // Its works in real time scenarios
    public static void ForUpdateKeywordMethod() {
        // Query contacts and lock them for update
        List<Contact> lockedContacts = [SELECT Id, FirstName, LastName, Email FROM Contact WHERE LastName = 'Doe' LIMIT 3 FOR UPDATE];

        // Update the contacts (in a real scenario, you might perform other operations)
        for (Contact contact : lockedContacts) {
            contact.FirstName = 'John';
            contact.LastName = 'Smith';
            update contact;
        }

        // Display updated information
        for (Contact updatedContact : lockedContacts) {
            System.debug('Updated Contact: ' + updatedContact.FirstName + ' ' + updatedContact.LastName + ', Email: ' + updatedContact.Email);
        }
    }
    
    
    // ALL ROWS keyword in a SOQL query is primarily used for retrieving archived and deleted records in real-time scenarios. 
    // It's designed to override the default behavior of SOQL queries, which exclude archived and deleted records
    
    public static void AllRowsKeywordMethod() {
        // Query to retrieve all Contacts, including archived and deleted records
        List<Contact> allRowsList = [SELECT FirstName, LastName, Email FROM Contact ALL ROWS];

        // Loop through the results and print information
        for (Contact result : allRowsList) {
            System.debug('First Name: ' + result.FirstName + ' Last Name: ' + result.LastName + ' Email: ' + result.Email);
        }
    }
    
    
    
    
    
    
    
}