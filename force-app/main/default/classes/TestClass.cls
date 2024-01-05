// Test class code

@isTest
public class TestClass{
    @isTest
    public static void myMethod(){
        // Positive case
        TestApexClass myClass = new TestApexClass();
        Integer result = myClass.myMethod(5);
        System.assertEquals(10, result);
        
        //Negative case
        Integer negativeResult = myClass.myMethod(-5);
        System.assertEquals(0, negativeResult);
    }
    
    
    //TestApexClass file is the testing code.
    
    //Execution way
    // In tab open Test and new run
}