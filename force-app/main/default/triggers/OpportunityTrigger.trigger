trigger OpportunityTrigger on Opportunity (before insert,after insert,before update,after update) {
    if(Trigger.isInsert){

           if(Trigger.isBefore)
            {
                //OpportunityTriggerHandler.UpdateDescBasedOnStage(Trigger.New,null);
               // OpportunityTriggerHandler.applyValidation(Trigger.New);
         OpportunityTriggerHandler.populateClosedLostReasoninsert(Trigger.New ,Trigger.oldMap);

            }
        /*else if(Trigger.isAfter){
                OpportunityTriggerHandler.populateLatestOppAmnt(Trigger.New);
            }*/
 
        }
   if(Trigger.isUpdate){
        if(Trigger.isBefore){
            //OpportunityTriggerHandler.UpdateDescBasedOnStage(Trigger.New,Trigger.OldMap);  
            OpportunityTriggerHandler.populateClosedLostReason(Trigger.New ,Trigger.oldMap);

        }
   }
/*else if(Trigger.isAfter){
            OpportunityTriggerHandler.createTask(Trigger.New,Trigger.oldMap);
            
        } */
    }