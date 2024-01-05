public with sharing class ContactController { // With sharing is for record level security
    @AuraEnabled(cacheable=true)  // AuraEnabled is for if you want to call apex class in lwc, caheable cache the list of objects
    public static List<Contact> getContacts(String accId){
        try {
            return[
                SELECT AccountId, Id, FirstName
                FROM Contact
                WHERE AccountId = :accId
                WITH SECURITY_ENFORCED      //SECURITY_ENFORCED is object and field level security
            ];
        } catch (Exception e) {
            throw new AuraHandledException(e.getMessage());
        }
    }
}