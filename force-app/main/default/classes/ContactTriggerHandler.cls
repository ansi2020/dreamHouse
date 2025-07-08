public class ContactTriggerHandler {
     public static void sendEmailNotif(List<Contact> contList){

    List<Messaging.Email> emailList = new List<Messaging.Email>(); 

        for(Contact cont : contList){

            if(cont.Email != null){
                Messaging.SingleEmailMessage emailMsg = new Messaging.SingleEmailMessage();
                String[] toAddress = new String[]{cont.Email};
                emailMsg.setToAddresses(toAddress);
                String emailSub = 'Welcome '+ cont.FirstName;
                emailMsg.setSubject(emailSub);
                String displayName = 'Arjun';
                emailMsg.setSenderDisplayName(displayName);

                String content = 'Hi '+ cont.FirstName + ',<br/><br/>'+
                    'Welcome to Salesforce Ecosystem! <br/><br/>'+
                    'Begin your Salesforce Admin And Developer Journey with Arjun <br/><br/>'+
                    'Happy Learning!!! <br/><br/>'+
                    'Thank You! <br/><br/>';

                emailMsg.setHtmlBody(content);
                emailList.add(emailMsg);
            }
        }
        Messaging.sendEmail(emailList);
    }

}