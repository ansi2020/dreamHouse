public class AccountUtility {
    public static void viewAnnualRevenue(){
        List<Account> accountsList = [SELECT Id,Name,AnnualRevenue from Account];
        for(Account acc:accountsList) {
            string acctRev = + acc.Name + ':' + acc.AnnualRevenue;
            system.debug('acctRev ' +acctRev);
        }     
    }

}