@isTest
public class AccountTriggerHandlerTest {
  @isTest
    public static void copybillingaddress()
    {
        List<Account> accList = new List<Account>();
        for(integer i = 1; i < 5; i++)
            {
                Account acc =new Account();
                acc.Name = 'Trigger Address Test'+ i;
       			acc.BillingCity= 'TestCity';
                acc.BillingCountry = 'TestCountry';
                acc.BillingPostalCode = '1234';
                acc.BillingState = 'Test Kerala';
                acc.BillingStreet = 'test';
                acc.CopyBillingAddresstoShipping_Address__c = true;
                accList.add(acc);  
            }
            Test.startTest();
            insert accList;
            Test.StopTest();
            List<Account> checkAccount = [select Id, ShippingCity from account where ID =: accList[0].Id];
            system.debug('checkAccount' + checkAccount);
            System.assertEquals('TestCity',checkAccount[0].ShippingCity);
        

}
}