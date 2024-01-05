public class test{
    public static void mymethod(){
        Date d1 = date.today();
        system.debug(d1);
        d1 = Date.newInstance(2023,10,14);
        
        system.debug(d1.toStartOfMonth());
        system.debug(d1.toStartOfWeek());
        
        system.debug(d1 = d1.addDays(5));
        system.debug(d1 = d1 + 10);
                     
        system.debug(d1 = d1.addMonths(2));
        system.debug(d1 = d1.addYears(3));
    }
}