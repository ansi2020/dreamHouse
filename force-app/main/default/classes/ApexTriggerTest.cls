public class ApexTriggerTest {
    public static void beforeInsert(List<Account> newList){
        for(Account acc: newList){
            if(acc.Industry!=null && acc.Industry=='Media'){
                acc.Rating='Hot';
            }else{
                acc.Rating='Cold';
            }
        }
    }
    

}