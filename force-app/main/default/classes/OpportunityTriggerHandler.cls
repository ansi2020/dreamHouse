public class OpportunityTriggerHandler {
    public static void createtask(List<Opportunity> oppList, Map<Id, Opportunity> oldMap){
        List<Task> taskList= new List<Task>();
        for(Opportunity opp : oppList){
    if(opp.StageName!= oldMap.get(opp.Id).StageName){
        Task tsk= new Task();
        tsk.WhatId= opp.Id;
        tsk.Subject='Demo';
        tsk.Priority= 'Normal';
        tsk.Status = 'Not Started';
        tsk.OwnerId = opp.OwnerId;
        taskList.add(tsk);
        
    }
        }
        if(!taskList.isEmpty()){
            insert taskList;
        }
        
        
    }
    
    public static void applyValidation(List<Opportunity> oppList){
        for(Opportunity opp: oppList){
            if(opp.Amount==null){
                //opp.addError('Amount field cannot be null');
                opp.addError(Label.Opp_Amount);
            }
        }
    }
   public static void populateClosedLostReason(List<Opportunity> oppList, Map<Id, Opportunity> oldMap){
        for(Opportunity opp: oppList){
            if(opp.StageName == 'Closed Lost' 
               && opp.StageName != oldMap.get(opp.Id).StageName
               && opp.Closed_Lost_Reason__c	== null){
                opp.addError('Please populate Closed Lost Reason');
            }
        }
    }   
      
    public static void populateClosedLostReasoninsert(List<Opportunity> oppList, Map<Id, Opportunity> oldMap){
        for(Opportunity opp: oppList){
            if(opp.StageName == 'Closed Lost' 
              
               && opp.Closed_Lost_Reason__c	== null){
                opp.addError('Please populate Closed Lost Reason');
            }
        }
    }   
}