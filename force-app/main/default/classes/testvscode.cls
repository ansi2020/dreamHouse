public with sharing class testvscode {
    public testvscode() {

    }
    public static void testBscode(){
        account acc=new Account();
        acc.name='vs anil test';
        insert acc;
    System.debug('hello ' +acc);
    }
}