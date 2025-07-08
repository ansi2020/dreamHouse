@isTest 
public class OpportunityTriggerHandlerTest {
/* @isTest   
     private static void createtask(){
         List<Opportunity> oppList = new List<Opportunity>();
         for(Integer i=1;i<=5;i++){
             Opportunity opp =new Opportunity();
             opp.Name='TestOpp'+i;
             opp.StageName = 'Prospecting';
             opp.CloseDate =System.today();
             opp.Amount = 200000;
             oppList.add(opp);
         }
         Test.startTest();
         insert oppList;
         for(Opportunity opp : oppList){
             opp.StageName = 'Value Proposition';
         }
         update oppList;
         List<Task> taskList = [Select Id From Task Where WhatId =: oppList[0].Id];
         System.assertEquals(1, taskList.size());
          
         }*/
  /*  @isTest   
     public static void applyValidationTest(List<Opportunity> oppList, Map<Id, Opportunity> oldMap){
         List<Opportunity> oppList = new List<Opportunity>();
         for(Integer i=1;i<=5;i++){
             Opportunity opp =new Opportunity();
             opp.Name='TestOpp'+i;
             opp.StageName = 'Prospecting';
             opp.CloseDate =System.today();
            // opp.Amount = 200000;
             oppList.add(opp);
         }
         Test.startTest();
          boolean exceptionThrown = false;
         try{
             insert oppList;
         }
        catch(Exception e)
        {
           exceptionThrown = true;
           Boolean ExpectedExceptionThrown = (e.getMessage().contains(Label.Opp_Amount))? true:false;
           System.assertEquals(true, ExpectedexceptionThrown, e.getMessage());
        }
        System.assertEquals(true, exceptionThrown, 'No exception was thrown');
        Test.stopTest();
    }
     }
*/
    @isTest
 public static void populateClosedLostReason(){
         List<Opportunity> oppList = new List<Opportunity>();
         for(Integer i=1;i<=5;i++){
             Opportunity opp = new Opportunity();
             opp.Name='TestOpp'+i;
             opp.StageName = 'closed lost';
             opp.CloseDate =System.today();
             opp.Amount = 200000;
             oppList.add(opp);
         }
         Test.startTest();
       insert oppList;
          //boolean exceptionThrown = false;
      try{
           
         
     for(Opportunity opp : oppList){
         opp.StageName = 'Closed Lost';
     }
      
     update oppList;
      }
        catch(Exception e)
        {
           //exceptionThrown = true;
           Boolean ExpectedExceptionThrown = e.getMessage().contains('Please populate Closed Lost Reason')? true:false;
           System.assertEquals(true, ExpectedexceptionThrown, e.getMessage());
        }
        //System.assertEquals(true, exceptionThrown, 'No exception was thrown');
        Test.stopTest(); 
 }  
    }