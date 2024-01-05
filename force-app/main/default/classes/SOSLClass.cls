public class SOSLClass {
    // in Apex 
	// FIND 'What' IN [What Type] Returning [Where];
	
	//In query editor
    //FIND {What} In [What Type] Returning [Where];
    public static void myMethod(){
        //SOSL in Apex needs to have the entities/objects specified 
        List<List<sObject>> l1 = [Find 'washington' Returning Account, Contact];
        system.debug('l1-->' + l1);
        //Return specified fields
        List<List<sObject>>  l2 = [Find 'washington' Returning Account(Name, NumberOfEmployees), Contact(Name, Phone)];
        system.debug('l2-->' + l2);
        
        List<Account> accList = l2[0];
        List<Contact> conList = l2[1];
        
        for(Account a:accList)
        {
            system.debug('name ' + a.name);
            system.debug('noe ' + a.NumberOfEmployees);
        }
        for(Contact c:conList)
        {
            system.debug('name ' + c.Name);
            system.debug('phone  ' + c.Phone);
        }
        
    }
    public static void searchGroup(){
        //ALL Fields
        List<List<sObject>> l0 = [Find 'Test' IN ALL FIELDS RETURNING Account, Contact];
        List<Account> accList0 = l0[0];
        List<Contact> conList0 = l0[1];
        system.debug(accList0);
        system.debug(conList0);
        	
        //Name Fieldse
        List<List<sObject>> l3 = [Find 'univ*' IN NAME FIELDS RETURNING Account(Name, BillingCountry), Contact(firstName, lastName)];
        List<Account> accList = l3[0];
        system.debug(accList[0].name); //University of Arizona
        
        //Email fields
        List<List<sObject>> l4 = [Find '*com' IN EMAIL FIELDS RETURNING Contact(firstName, lastName, Email)];
        List<Contact> conList = l4[0];
        for(Contact a:conList)
        {
        	system.debug(a.firstname);   
            system.debug(a.lastname);
            system.debug(a.email);
        }
        
        //Phone Fields
        List<List<sObject>> l5 = [Find '(512) 757-6000' IN PHONE FIELDS RETURNING Contact(firstName, lastName, Email)];
        system.debug(l5);

        //SideBar fields --> used to search the data in the sidebars of the page
        List<List<sObject>> l6 = [Find '(512) 757-6000' IN SIDEBAR FIELDS RETURNING Contact(firstName, lastName, Email)];
        system.debug(l6);
    }
    
    public static void wildCard(){
        system.debug('wildcard');
        /*****
        WildCard in SOSL --> A wildcard is a keyboard character such as an asterisk (*) or a question mark (?) 
        					that is used to represent one or more characters when you are searching for records.

		List<List<sObject>> results = [FIND 'Univ*'....];
        List<List<sObject>> results = [FIND ’Jo?n'....];
        List<List<sObject>> results = [FIND 'Univ*' IN NAME FIELDS .....];
		*****/
        
        //CLAUSES
        //Where Clause
        List<List<sObject>> l1 = [Find 'univ*' IN NAME FIELDS RETURNING Account(Name, BillingCountry where createdDate < TODAY), Contact(firstName, lastName)];
        system.debug(l1[0]);
        //NOTE: While using any clause, you must include a field list with at least one specific field.
        
        //OrderBy Clause
        List<List<sObject>> l2 = [Find 'univ*' IN NAME FIELDS RETURNING Account(Name, BillingCountry where createdDate < TODAY ORDER BY Name ASC), Contact(firstName, lastName)];
        system.debug(l2[0]);
        
        //Limit Clause
        List<List<sObject>> l3 = [Find 'Test' RETURNING Account(Name, BillingCountry where createdDate < TODAY ORDER BY Name ASC LIMIT 50)];
        system.debug(l3[0]);
        
    }
    
}