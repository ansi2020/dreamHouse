trigger ContactTrigger on Contact (after insert, after update) {
    if(Trigger.isAfter && (Trigger.isInsert || Trigger.isUpdate)){
        ContactTriggerHandler.sendEmailNotif(Trigger.new);
    }

}