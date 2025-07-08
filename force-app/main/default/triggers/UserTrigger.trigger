trigger UserTrigger on User (after insert) {
  if (Trigger.isAfter && Trigger.isInsert) {
        UserTriggerHandler.handleAfterInsert(Trigger.new);
    }  

}