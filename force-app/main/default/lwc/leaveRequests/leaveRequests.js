import { api, LightningElement, wire } from 'lwc';
import getLeaveRequests from '@salesforce/apex/LeaveRequstController.getLeaveRequests';
import { ShowToastEvent } from 'lightning/platformShowToastEvent';
import Id from '@salesforce/user/Id';
import { refreshApex } from '@salesforce/apex';



const COLUMNS = [
	{ label: 'Request Id', fieldName: 'Name', cellAttributes: { class: { fieldName: 'cellClass' } } },
    { label: 'User', fieldName: 'userName', cellAttributes: { class: { fieldName: 'cellClass' } } },
    { label: 'From Date', fieldName: 'From_Date__c', cellAttributes: { class: { fieldName: 'cellClass' } } },
    { label: 'To Date', fieldName: 'To_Date__c', cellAttributes: { class: { fieldName: 'cellClass' } } },
    { label: 'Reason', fieldName: 'Reason__c', cellAttributes: { class: { fieldName: 'cellClass' } } },
    { label: 'Status', fieldName: 'Status__c', cellAttributes: { class: { fieldName: 'cellClass' } } },
    { label: 'Manager Comment', fieldName: 'Manager_Comment__c', cellAttributes: { class: { fieldName: 'cellClass' } } },
{
		type: "button",typeAttributes:{
			label: 'Edit',
			name: 'Edit',
			title: 'Edit',
			value: 'Edit',
			disabled: { fieldName: 'isEditDisabled' }
		}, cellAttributes: {class: { fieldName: 'cellClass' } }
}
];


export default class leaveRequests extends LightningElement{
	
	COLUMNS = COLUMNS;
	
	leavesReqeusts = [];
	leavesReqeustsWireResult;
	showModalPopup = false;
    objectApiName = 'LeaveRequest__c';
    recordId = '';
    currentUserId = Id;
	leaveRequestFrom;
	
	@wire(getLeaveRequests)
	wiredMyLeaves(result){
		
		this.LeaveRequestWireResult = result;
		if(result.date){
			
			this.LeaveRequest = result.data.map( a=> ({
				
				...a,
				userName:a.User__r.Name,
				cellClass: a.Status__c == 'Approved' ? 'slds-theme-success' : a.Status__c == 'Rejected' ? 'slds-theme_warning' : ' ',
				isEditDisabled: a.Status__c != 'Pending'
				
			}));
		
		}
		if(result.error){
		
		console.log( 'Error Occoured while fetching my leaves- ', result.error );

		}
	}

	get noRecordsFound() { 
		return this.LeaveRequest.Length == 0;
	}
	
	newRequestaHandler(){
		this.showModalPopup = true;
		this.recordId = ' ';
	}
	
	popupCloseHandler(){
		this.showModalPopup = false;
	}
	
	rowActionHandler(event){
		this.showModalPopup = true;
		this.recordId = event.detail.row.Id;		
	}
	
	successHandler(event){
		this.showModalPopup = false;
		this.showToast('Data Saved Successfully');
		this.refreshGrid();
	}
	
	@api
	refreshGrid(){
		refreshApex(this.LeaveRequestWireResult);
	}
	
	showToast(message, title = 'success',varient = 'success') { 
		const event = new ShowToastEvent({
            title,
            message,
            variant
        });
		this.dispatchEvent(event);
	}
	
}