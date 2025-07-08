public class test1 {
    public static void NameInsertion()
    {
        Account acc = new Account();
        acc.Name = 'vs git integration study';
        acc.Phone = '1234';
        insert acc;
        system.debug('Account inserted' + acc);
    }

}