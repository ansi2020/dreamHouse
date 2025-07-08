trigger AccountTrigger on Account (after update, before insert, after insert)
{
    If (Trigger.isInsert){
        if(Trigger.isBefore){            
               AccountTriggerHandler.copyShippingAddress(Trigger.new);
        }        
    }
    If (Trigger.isInsert){
        if(Trigger.isAfter){            
               AccountTriggerHandler.createRelatedOpp(Trigger.new);
        }        
    }
    
	
       if(Trigger.isUpdate)
    {
		if(Trigger.isAfter)
        {
			AccountTriggerHandler.OpportunityStage(Trigger.New,Trigger.oldMap);
		}

	}

}