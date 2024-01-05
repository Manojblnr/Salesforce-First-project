@RESTResource(urlmapping='/Lead/')
global class InternalAPI 
{
    @HTTPGet
    global static sObject getRecord()
    {
    	String objName;
        Id i;
        
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        objName = req.headers.get('ObjectName');
        i = req.headers.get('Id');
        
        String str = 'Select Name, Phone from ' + objName + ' Where ID = :i' + ' Limit 1';
        sObject s = Database.query(str);
        return s;
    }
    
	@HTTPPost
    global static sObject creatingLeadRecord()
    {
        String fName, lName, comp;
        String fieldName, fieldValue;
        
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        
        String jsonBody = req.requestBody.toString();
        JSONParser parser = JSON.createParser(jsonBody);
        
        while(parser.nextToken() != Null)
        {
            if(parser.getCurrentToken() != JSONToken.END_OBJECT)
            {
                fieldName = parser.getCurrentName();
                fieldValue = parser.getText();
                
                if(fieldName == 'FirstName')
                {
                    fName = fieldValue;
                }
                else if(fieldName == 'LastName')
                {
                    lName = fieldValue;
                }
                else if(fieldName == 'Company')
                {
                    comp = fieldValue;
                }
            }
        }
        
        Lead l = new Lead(firstName = fName, lastName = lName, company = comp);
        insert l;
        Lead result = [SELECT FirstName, LastName, Company from Lead where Id = :l.Id];
        return result; //Return result;
    }
    
    @HTTPPut
    global static sObject updatingLeadRecord()
    {
        String fName, lName, comp;
        ID Id;
        String fieldName, fieldValue;
        
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        Id = req.headers.get('Id');
        
        String jsonBody = req.requestBody.toString();
        JSONParser parser = JSON.createParser(jsonBody);
        
        while(parser.nextToken() != Null)
        {
            if(parser.getCurrentToken() != JSONToken.END_OBJECT)
            {
                fieldName = parser.getCurrentName();
                fieldValue = parser.getText();
                
                if(fieldName == 'FirstName')
                {
                    fName = fieldValue;
                }
                else if(fieldName == 'LastName')
                {
                    lName = fieldValue;
                }
                else if(fieldName == 'Company')
                {
                    comp = fieldValue;
                }
            }
        }
        
        Lead updateLead = [SELECT FirstName, LastName, Company from Lead where id = :Id];

        updateLead.FirstName = fName;
        updateLead.LastName = lName;
        updateLead.Company = comp;

        update updateLead;
        Lead result = [SELECT FirstName, LastName, Company from Lead where Id = :Id];
        return result; //Return result;
    }   
     
    @HTTPDelete
    global static String deletingLeadRecord()
    {
        ID Id;
        String result;
        
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        Id = req.headers.get('Id');
        
        Lead deleteLead = [SELECT FirstName, LastName, Company from Lead where id = :Id];

        delete deleteLead;
        result = 'Record with Id: ' + Id + ' Is deleted';
        return result; //Return result;
    }   
}