public class AccountTriggerHandler {
    public static void createRelatedOpp(List<Account> accList)
    {
      List<Opportunity> oppList = new List<Opportunity>();

        for(Account acc : accList)
        {
           Opportunity opp = new Opportunity();
            opp.Name = 'TriggerOpp' + acc.Name;
            opp.StageName = 'Prospecting';
            opp.CloseDate = system.today();
            opp.AccountId = acc.Id;
            oppList.add(opp);
        }
        if(!oppList.isEmpty())
        {
            insert oppList;
        }
        
    }
    public static void copyShippingAddress(List<Account>accList)
    {
        for(Account acc :accList )
        {
            if(acc.CopyBillingAddresstoShipping_Address__c)
            {
                acc.ShippingCity = acc.BillingCity;
                acc.ShippingCountry = acc.BillingCountry;
                acc.ShippingPostalCode = acc.BillingPostalCode;
                acc.ShippingState = acc.BillingState;
                acc.ShippingStreet =acc.BillingStreet;
                      
            }
          
        }
    }
public static void  OpportunityStage(List<Account>accList,Map<Id,Account> oldMap)
{
  List<Opportunity> oppList=new List<Opportunity>();
  Set<Id> idSet= new Set<Id>();
    for(Account acc:accList)
    {
      if(acc.Active__c == 'NO' && acc.Active__c != oldMap.get(acc.Id).Active__c) 
      {
        idSet.add(acc.Id);
      }
    } 
    for(Account a :[SELECT Id, Active__c,(SELECT Id,StageName FROM Opportunities) FROM Account WHERE ID IN : idSet])
    {
     if(a.Opportunities != null)
     {
       for(Opportunity opp:a.Opportunities) 
       {
         if(opp.StageName != 'ClosedWon' && opp.StageName != 'Closed Lost')
         {
           opp.StageName='Closed Lost';
           oppList.add(opp);

}

}

}

}

     if(oppList.size( ) > 0)
      {
       update oppList;

      }

}
}