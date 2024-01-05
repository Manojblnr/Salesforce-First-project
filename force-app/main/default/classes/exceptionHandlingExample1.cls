public class exceptionHandlingExample1 {
	
    // Basic Exception Handling
    
    public static void divideNumbers(Integer numerator, Integer denominator) {
        try {
            // Code that might throw an exception
            Integer result = numerator / denominator;
            System.debug('Result: ' + result);
        } catch (MathException  ex) {
            // Handle division by zero
            System.debug('Error: Division by zero is not allowed');
        } finally {
            // Code that runs regardless of whether an exception occurred
            System.debug('Division operation completed');
        }
    }
    
    /*
    // test 
    // Test Division with a Valid Scenario
    exceptionHandlingExample1.divideNumbers(10, 2);
    
    // Test Division by Zero Scenario
    exceptionHandlingExample1.divideNumbers(5, 0);
	*/
    
    	                    // System defined exception


    //   1. DML Exception
    // Notes:
        // DML Exceptions are exceptions that occur whenever a DML operation fails. This may happen due to many reasons, 
        // the most common one is inserting a record without a required field.
    
        public static void DMLException(){
            try{
                Account a = new Account();
                a.Name = 'DML test'; 
                insert a;
                System.debug('Account record inserted successfully!');
            }catch(DMLException de){
                System.debug('Records cannot be inserted'+ de.getMessage());
            }
        }
        
    
    	// Test the DMLException method
		// exceptionHandlingExample1.DMLException();
	
    
    // 2. List Exception
    //notes:
        // ListException catches any type of run time error with a list. This list can be of any data type such as integer,
        // string, or sObject.

    public static void ListException(){
        try {
            List < String > stringList = new List < String > ();
            stringList.add('Manoj');
            // This list contains only one element, 
            // but we will attempt to access the second element 
            // from this zero-based list. 
            String str1 = stringList[0]; //this will execute fine 
            String str2 = stringList[1]; // Causes a ListException 
        }
        catch (ListException le) {
            System.debug('The following exception has occurred: ' + le.getMessage());
        }
    }
    
    
    
    // 3. NullPointerException
    // NullPointer Exception catches exceptions that occur when we try to reference a null variable. 
    // Use this exception whenever you are referencing a variable that might turn out to be null.

    public static void NullPointerException(){
        try {
        String stringVariable;
        Boolean boolVariable = stringVariable.contains('John '); 
            // Causes a NullPointerException 
        }
        catch (NullPointerException npe) {
            System.debug('The following exception has occurred: ' + npe.getMessage());
        }
    }
    
    
    
    
    // 4. QueryException
    // QueryException catches any run time errors with SOQL queries. QueryException occurs when there is a 
    // problem in SOQL queries such as assigning a query that returns no records or more than one record to a 
    // single sObject variable.

    public static void queryExceptionExample() {
        try {
            // Attempt to query data that might throw a QueryException
            // List<Account> accounts = [SELECT Id, Name FROM Account WHERE InvalidField = 'Test'];  // wrong logic
              List<Account> accounts = [SELECT Id, Name FROM Account WHERE Name = 'Test'];
            System.debug('Query successful. Number of records: ' + accounts.size());
        } catch (QueryException qe) {
            System.debug('Error executing query: ' + qe.getMessage());
        }
    }
	
    
    // 5.    Generic or Custom Exceptions or user defined Exception
    // You can create your own top level Exception classes that can have their own member variables, 
    // methods, constructors, implement interfaces, and so on.
    
    // Example code:
    // where you want to create an Account in Salesforce, but there's a requirement that the Account Name must start 
    // with a certain prefix. If the prefix is not present, you want to throw a custom exception.
	public class PrefixValidationException extends Exception {}
    public static void createAccount(String accountName) {
        try {
            // Check if the Account Name starts with the required prefix
            if (!accountName.startsWith('ABC')) {
                throw new PrefixValidationException('Account Name must start with "ABC".');
            }

            // If the condition is met, create the Account
            Account newAccount = new Account(Name = accountName);
            insert newAccount;

            System.debug('Account created successfully: ' + newAccount.Name);
        } catch (PrefixValidationException e) {
            // Handle the custom exception
            System.debug('Error creating Account: ' + e.getMessage());
        } catch (Exception generalException) {
            // Handle other exceptions (if any)
            System.debug('Unexpected error: ' + generalException.getMessage());
        }
    }


    // Test the createAccount method
    // exceptionHandlingExample1.createAccount('ABC Corp'); // Should succeed

    // Test with a name that doesn't start with 'ABC'
    // exceptionHandlingExample1.createAccount('XYZ Ltd');  // Should throw a PrefixValidationException

}