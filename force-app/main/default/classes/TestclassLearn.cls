public class TestclassLearn {
    public static void dmlInsert()
    {
       LIST<account> acc = new LIST<account>();
        for(integer i=0; i<4;i++)
        {
        Account acc1 = new Account();
        acc1.name = 'account'+i;
        acc1.accountnumber = '1234';
        acc1.phone = '987654';
        acc.add(acc1);
        }
          
        if(!acc.isempty())
        {
            insert acc;
        }
           }

}