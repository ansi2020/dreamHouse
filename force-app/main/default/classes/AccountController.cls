public with sharing class AccountController {
  public  void createRelatedOpp(List<Account> accList)
    {
      //testing git
      //for learning
      List<Opportunity> oppList = new List<Opportunity>();

        for(Account acc : accList)
        {
           Opportunity opp = new Opportunity();
            opp.Name = 'TriggerOppvs code' + acc.Name;
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
}