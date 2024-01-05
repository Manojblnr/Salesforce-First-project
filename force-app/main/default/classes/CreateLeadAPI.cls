// API Basics

@RestResource(urlMapping='/LeadCreate	/')
global class CreateLeadAPI {
    
    @HttpPost
    global static String creatingLeadRecord() {
        String fName, lName, comp;
        
        // Get the incoming REST request and response
        RestRequest req = RestContext.request;
        RestResponse res = RestContext.response;
        
        // Extract the request body (assuming it contains data in string format)
        String requestBody = req.requestBody.toString();
        System.debug('Body is: ' + requestBody);
        
        // Perform operations on the received data (not implemented in this example)
        
        // Return a response (in this case, a simple 'hey' string)
        return 'hey';
    }
}