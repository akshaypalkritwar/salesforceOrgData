import {LightningElement} from 'lwc';

export default class leaveTracker extends LightningElement {

	refreshLeaverequestHandler(event){
	this.refresh.myLeavesComp.refreshGrid();
	}
}