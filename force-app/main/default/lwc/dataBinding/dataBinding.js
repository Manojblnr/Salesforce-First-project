import { LightningElement } from 'lwc';

export default class DataBinding extends LightningElement {
    greeting = 'Manoj';

    handleChange(event){
        this.greeting = event.target.value;
    }

    // //fetch data using query selector 

    // handleChange(event){
    //     this.greeting = this.template.querySelector("lightning-input").value;
    // }
}