public class DataTypes {
	public static void IntegerMethod() {
        integer a;
        a = 50;
        
        long l1 = 2147483648l;
        
        system.debug(a);
        system.debug(l1);
    }
    
     public static void floatMethod(){
        double a = 25.64;
        
        decimal b = 254.76;
        
        system.debug(a);
        system.debug(b);
    }
    
    public static void stringData(){
        string s1 = 'pradeep';
        string s2 = 'reddy';
        string s3 = s1+s2;
        
        system.debug(s3);
    }
    
    public static void DateTimeMethod(){
        Date d1;
        
        d1 = Date.today();    // Current Date
        
        d1 = Date.newInstance(2018,01,01);
        
        system.debug(d1.toStartOfMonth());  //2018-01-01
        system.debug(d1.toStartOfWeek());   //2017-12-31
        
        system.debug(d1 = d1.addDays(5));   //2018-01-06
        system.debug(d1 = d1 + 5); 			//2018-01-11 Same as above
         
        system.debug(d1 = d1.addMonths(4)); //2018-05-11
       	system.debug(d1 = d1.addYears(6)); 	//2024-05-11
        
        /******Time DataType******/
        
        Time t1;
        
        t1 = Time.newInstance(13, 45, 59, 50);  //(hrs, mins, secs, milsecs)
        
        system.debug(t1.addHours(4));
        system.debug(t1.addMinutes(39));
        
        /********DateTime ********/
        
        Datetime dt1 = DateTime.newInstance(2018,05,15, 09, 45, 45);
        system.debug(DateTime.now());   //Current Date & Time
        
    }
    
    public static void BooleanMethod(){
        boolean b = 5>7;
        system.debug(b);
    }
    
    public static void idMethod(){
        ID i = '001D000000K8t53';
        system.debug(i);
    }
    
    public static void blobMethod(){
        string s = 'sjhdvfudsgfuysgfugsufgdhgfusdg';
        Blob b = Blob.valueof(s);
        system.debug(b);
        
        string s1 = b.toString();
        system.debug(s1);
    }
	
    public static void enumMethod(){
        Season s = Season.Winter;  //Season is a enum defined in Season.apxc file
        s = Season.Summer;
        Season s1 = Season.Spring;
        system.debug(s);
    }
    
    public static void sObjectMethod(){
        //********Standard Objects*********
        
        //Create an account sObject
        Account a1 = new Account();
        
        //Create an contact sObject
        
        Contact c1 = new Contact();
        
        // Assign field values to contact sObjects
        
        // through Constructor
        
        Account a2 = new Account(Name = 'Flipkart', NumberOfEmployees = 3000);
        Contact c2 = new Contact(firstname = 'Pradeep', lastname = 'N S', Languages__c = 'Kannada');  // __c = to add custom field
        
        //Using Dot Notation
        
        a2.Name = 'Amazon';
        a2.NumberOfEmployees = 4000;
        
        c2.firstname = 'Mad';
        c2.LastName = 'Max';
        c2.Languages__c = 'Spanish';
        
        
        /*******Generic Method************/
        
        sObject s1 = new Account(Name = 'Disney'); 
        
		sObject s2 = new Contact(lastName = 'Jack');
        
        //Set A Field we have put method
        
        s1.put('NumberOfEmployees', 200);
        s1.put('Name', 'Pradeep');
        
        //Access a field we have get methid
        
        Object objValue = s1.get('NumberOfEmployees');
        Object nameValue = s1.get('Name');
        system.debug(objValue);
        system.debug(nameValue);
        
    }
    
}