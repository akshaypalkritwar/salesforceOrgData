import { LightningElement } from "lwc";
export default class DisplayField extends LightningElement {
    
    greeting = 'World';

    constructor() {

        super();
    }

    changeHandler(event){
        
        console.log( 'event.target.value', event.target.value );
        this.greeting = event.target.value;
    }
}