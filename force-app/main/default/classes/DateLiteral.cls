public class DateLiteral {
	public static void dateLiteralExample() {
        // TODAY
        Date todayDate = Date.today();
        System.debug('Today Date: ' + todayDate);

        // TOMORROW
        Date tomorrowDate = Date.today().addDays(1);
        System.debug('Tomorrow Date: ' + tomorrowDate);

        // YESTERDAY
        Date yesterdayDate = Date.today().addDays(-1);
        System.debug('Yesterday Date: ' + yesterdayDate);

        // LAST N DAYS
        Date lastSevenDays = Date.today().addDays(-7);
        System.debug('Last Seven Days Date: ' + lastSevenDays);

        // NEXT N DAYS
        Date nextTenDays = Date.today().addDays(10);
        System.debug('Next Ten Days Date: ' + nextTenDays);


        // LAST N MONTHS
        Date lastFourMonths = Date.today().addMonths(-4);
        System.debug('Last Four Months Date: ' + lastFourMonths);

        // NEXT N MONTHS
        Date nextFiveMonths = Date.today().addMonths(5);
        System.debug('Next Five Months Date: ' + nextFiveMonths);

        // LAST N YEARS
        Date lastTwoYears = Date.today().addYears(-2);
        System.debug('Last Two Years Date: ' + lastTwoYears);

        // NEXT N YEARS
        Date nextThreeYears = Date.today().addYears(3);
        System.debug('Next Three Years Date: ' + nextThreeYears);
    }
}