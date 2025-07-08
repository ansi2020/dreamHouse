public class CaseTriggerHandler 
 {
  public static Map<String, string> findTheContactNumber(set<id> conIds)
   {
    Map<String, string> contactIdWithContactNumberMap= new Map<String, string>();
       List<Contact> conList = new  List<Contact>();
       conList = [select id,name,phone from contact where id IN:conIds];
       for(contact con: conList )
       {
         contactIdWithContactNumberMap.put(con.id , con.phone);  
       }
       return contactIdWithContactNumberMap; 
   }
     public static void updateContactInfoInCase(boolean isBefore, boolean isInsert ,boolean isUpdate, List<Case> newCases)
     {
         set<id> conIds = new set<id>();
             Map<String, string> contactIdWithContactNumberMap= new Map<String, string>();
             if(isBefore == True)
             {
                 if(isInsert == True || isUpdate == True )
                 {
                     for(Case c : newCases)
                     {
                         conIds.add(c.ContactId);
                         contactIdWithContactNumberMap = findTheContactNumber(conIds);
                         System.debug (' -- contactIdWithContactNumberMap ---- '+contactIdWithContactNumberMap);

                     }
                     for(Case c: newCases)
                     {
                         c.Contact_Info__c = contactIdWithContactNumberMap.get (c.ContactId);
                     }
                 }
             }

     }
 }