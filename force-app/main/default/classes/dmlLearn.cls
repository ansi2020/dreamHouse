public class dmlLearn
{
    public static void dmlInsert()
    {
       LIST<account> acc = new LIST<account>();
        for(integer i=0; i<4;i++)
        {
        Account acc1 = new Account();
        acc1.name = 'account'+i;
        acc1.accountnumber = '1234';
        acc1.phone = '00000';
        acc1.Description = 'Account Created';
        acc.add(acc1);
        }
        /*acc1.name = 'test dmlinsert1';
        acc1.accountnumber = '1234';
        acc1.phone = '987654';
        acc.add(acc1);
        
        
        Account acc2 = new Account();
        acc2.name = 'test dmlinsert2';
        acc2.accountnumber = '1234';
        acc2.phone = '987654';
        acc.add(acc2);
        
        
        Account acc3 = new Account();
        acc3.name = 'test dmlinsert3';
        acc3.accountnumber = '1234';
        acc3.phone = '147852369';
        acc.add(acc3);*/
        
        if(!acc.isempty())
        {
            insert acc;
        }
           }

 
    public static void dmlUpdate()
    {
        List<account> accList = new List<account>();
                Map<Id,Account> accMap = new Map<Id,Account>();
         //accList = [select id,name,accountnumber,phone from account where name like '%test%' and phone = '1234'];
                 accList = [select id,name,accountnumber,phone from account where name like '%test%' and phone = '999'];
        system.debug('accList' + accList);
        for(Account acc : accList )
         { 
                 acc.phone = '0000';
            accMap.put(acc.id ,acc);        
        }
        update accMap.values();
         system.debug('updated records are' + accMap.values());
    }       
    
}