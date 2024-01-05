/* public class calculateClass {
    // method that calculates sum
    public static void calculateSum() {
        Integer i = 5;
        Double j = 6;
        // variables i and j passed to sumMethod as parameters
        Double k = sumMethod(i, j);
        // this will output the sum of i and j which is 11
        System.debug(k);
    }
    // another method that does the actual calculation
    public static Double sumMethod(Integer a, Double b) {
    	 // add the values
        Double c = a + b;
        // return variable c which is a sum of a and b
        return c;
    }
}
*/

public class calculateClass {
    
    public static void calculateSum(){
        Integer i = 5;
        integer j = 6;
        
        Integer ans = sumMethod(i, j);
        system.debug(ans);
    }
    public static integer sumMethod(integer a, integer b){
        integer c = a + b;
        
        return c;
    }
}