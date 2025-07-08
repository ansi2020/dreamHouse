@isTest
public class createTestClassforLearning {
    @isTest
    private static void insertAccount()
    {
       List <Account> accList=new List <Account>();
        for(Integer i=0;i<4;i++)
        {
            Account acc = new Account();
            acc.name =  'Name Test'+i;
            acc.accountnumber = 'Test 1234';
        	acc.phone = 'Test 987654';
            accList.add(acc);   
        }
        insert accList;
        TestclassLearn.dmlInsert();
    }

}