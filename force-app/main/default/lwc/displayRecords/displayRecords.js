import { LightningElement, wire } from 'lwc';
import { ShowToastEvent } from "lightning/platformShowToastEvent";

import getAccounts from '@salesforce/apex/AccountsController.fetchAccounts';

export default class DisplayAccounts extends LightningElement {

    showSpinner;

    searchKey;

    accounts;

    constructor() {

        super();
        console.log( 'constructor' );
        this.initializePage();
    }

    initializePage() {

        this.showSpinner = false;
    }
    
    handleChange( event ) {

        let value = event.target.value;
        this.searchKey = value;
        this.accounts = undefined;
            
        if( !value ) {
            return;
        }

        if( value.length < 3 ) {
            return;
        }

        console.log( 'before invoking apex' );
        this.showSpinner = true;
        getAccounts( { searchKey : value } ).then( result => {
            
            this.showSpinner = false;

            let response = JSON.parse( result );
            console.log( 'response', response );

            if( !response.isSuccess ) {
                this.showToastMessage( 'error', 'Error!', response.message );
                return;
            }

            this.accounts = response.listOfAccounts;
        });

        console.log( 'handleChange-end' );
    }

    showToastMessage( variant, title, message ) {

        let toastEvt = new ShowToastEvent({
            title: title,
            message: message,
            variant: variant,
        });

        this.dispatchEvent( toastEvt );
    }
}