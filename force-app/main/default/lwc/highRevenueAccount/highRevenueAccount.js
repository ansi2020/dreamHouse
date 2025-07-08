import { LightningElement,wire } from 'lwc';
import getAccountRecords from '@salesforce/apex/AccountController.getAccountRecords'; 
export default class HighRevenueAccountRecords extends LightningElement {

accountsToDisplay= []; //It stores the account records fetched from the Apex method and is used to display the data in the component's HTML.
    
   
@wire(getAccountRecords) //method to fetch the account records


getAccountshandler(response){ //response: Contains the data or error returned from the Apex method.
  //{error:..,data:..}
// case1: {error:undefined ,data:..}
//case2: {error:..,data:undefined}
const {error,data} = response; //error,data : these are two variables are initilized in response
if(error){
//handle error
console.log(error); //error contains any error information if the Apex call fails.
return;
}else{
//handle success
// console.log(data);
this.accountsToDisplay=data; //data contains the returned account records if the Apex call succeeds.
}
}
  

}