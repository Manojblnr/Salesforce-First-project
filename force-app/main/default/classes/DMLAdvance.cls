public class DMLAdvance {
    
	// Database class
    public static void databaseClassMethod(){
        List<Account> accList = new List<Account>();

        for(integer i = 1; i<=10; i++){
            Account a = new Account(Name = 'database class ' + i);
            accList.add(a);
        }
        // insert conList; // Throws DML Exception
        Database.insert(accList, false); // Does not throws exception if a record fails
    }
    
    // EmptyRecycleBin
    public static void emptyRecycleBin(){
        List < Account > accList = [SELECT Id FROM Account where isDeleted = true ALL ROWS];
        Database.emptyRecycleBin(accList);
    }
    
    
    // countQuery Method In Database Class
    public static void normalCountMethod(){
        integer AccountRecordCount = [ Select Count() From Account ];
            system.debug('Record count in Account' + AccountRecordCount);
    }

    public static void countQueryMethod(){
        Integer AccountRecordCount = Database.countQuery('Select Count() FROM Account');
        System.debug(AccountRecordCount);
    }
    
    
    // leads
    
    public static void leadsMethod(){
        lead test = [ Select Name from lead where Name = 'lead test' limit 1];
        
        Database.leadConvert lc = new database.leadConvert();
        
        lc.setLeadID(test.id);

        lc.convertedStatus = 'Closed - Converted';
        // select name, id from user :  getting owner id
        lc.ownerID = '0055h00000A8fv6AAB';
        
        Database.leadConvertResult lcr = Database.convertLead(lc);
        
        system.debug('lead is converted to contact, opportunity, account: '+ lcr);
        
    }
    
    
    // result
    public static void databaseResultMethod(){
        List<Account> accList = new List<Account>();
        
        for(integer i = 1; i<=10; i++){
            Account a = new Account(Name = 'result database class ' + i);
            accList.add(a);
            insert accList;
        }
        // insert conList; // Throws DML Exception
        Database.SaveResult[] saveList = Database.insert(accList, false); // Does not throws exception if a record fails
        
        for (Database.SaveResult s: saveList) {
        If(s.isSuccess())
        System.debug('I was successful = '+s.getID());
        else
            {
                System.debug('I Was UnSuccessfull because of following erros.');
                for(Database.error er: s.getErrors())
                {
                    System.debug(er.getStatusCode() + '' + er.getMessage());
                    System.debug('Fields affected by insertion are ' + er.getFields());
                }
            }
    }

    }
}