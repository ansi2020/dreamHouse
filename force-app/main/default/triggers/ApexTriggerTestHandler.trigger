trigger ApexTriggerTestHandler on Account (before insert,after insert) {
    if(trigger.isInsert){
        if(trigger.isBefore){
          ApexTriggerTest.beforeInsert(Trigger.New);  
        }
    }  

}