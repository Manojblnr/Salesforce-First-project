public class aggregateFunction {
	public static void aggregateFunctions(){
        AggregateResult arg1 = [SELECT MAX(Amount), SUM(Amount), MIN(Amount) from Opportunity];
        system.debug(arg1);
        
        //Count
        Integer i = [SELECT COUNT() from Opportunity]; //will return number of oppurtunities.
        system.debug(i);
        
        AggregateResult arg2 = [SELECT COUNT(ID) from Opportunity]; //result will be same as above
        system.debug(arg2);
        
        AggregateResult arg3 = [SELECT COUNT(Amount) from Opportunity]; // will return number of oppurtunities, result will not include where amount is NULL
        system.debug(arg3);
        
        //Average
        AggregateResult arg4 = [SELECT AVG(Amount) from Opportunity]; //will return the avg amount.
        system.debug(arg4);
        
        //COUNT_DISTINCT
        AggregateResult arg5 = [SELECT COUNT_DISTINCT(Type) from Account];
        system.debug(arg5);
        
        integer res = (integer)arg5.get('expr0');  //the way to get the values from key in aggregateResult
        
    }
}