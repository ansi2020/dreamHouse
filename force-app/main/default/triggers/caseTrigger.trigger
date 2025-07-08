trigger caseTrigger on Case (before insert , before update) 
{
 CaseTriggerHandler.updateContactInfoInCase(Trigger.isBefore, Trigger.isInsert, Trigger.isUpdate, Trigger.new);
}