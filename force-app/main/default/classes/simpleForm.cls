public with Sharing class SimpleForm {
    @AuraEnabled(cacheable=true)
	public static List<sObject> formData(String Name, String Phone){
        List<Account> accList = new List<Account>();
        
        Account newAccount = new Account();
        newAccount.Name = Name;
        newAccount.Phone = Phone;
        accList.add(newAccount);
        
        insert accList;
        return accList;
    }

}