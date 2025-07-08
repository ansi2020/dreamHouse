public with sharing class Accountontroller {
   @AuraEnabled(cacheable=true) //cacheable=true: to use store the data which the apex method returns in the cache

   public static List<Account> getAccountRecords(){ //method to fetch the account records
try {
return [SELECT Id,Name,AnnualRevenue  FROM Account  ORDER BY AnnualRevenue DESC NULLS LAST limit 5]; // order by AnnualRevenue DESC NULLS LAST:
} catch (Exception e) {
throw new AuraHandledException(e.getMessage()); 
}
   }
}